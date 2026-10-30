import java.nio.file.*;
import java.util.*;
import java.util.regex.*;
import java.util.jar.*;
import java.io.*;
import org.apache.maven.artifact.versioning.*;

// Static Forge metadata audit; does not launch Minecraft or load mod classes.
class CheckDependencyRanges {
  record Mod(String id, String version, String source, boolean embedded) {}
  record Dep(String id, String range, String source, boolean mandatory) {}
  static Map<String,Mod> mods = new TreeMap<>();
  static List<Dep> deps = new ArrayList<>();
  static List<String> issues = new ArrayList<>();
  static String value(String text,String key) {
    var m=Pattern.compile("(?m)^\\s*"+Pattern.quote(key)+"\\s*=\\s*[\"']([^\"'\\r\\n]+)[\"']").matcher(text);
    return m.find()?m.group(1):"";
  }
  static void read(byte[] bytes,String source,boolean embedded) throws Exception {
    Map<String,byte[]> entries=new HashMap<>();
    try(var z=new java.util.zip.ZipInputStream(new ByteArrayInputStream(bytes))) {
      for(var e=z.getNextEntry();e!=null;e=z.getNextEntry()) {
        String n=e.getName();
        if(n.equals("META-INF/mods.toml")||n.equals("META-INF/MANIFEST.MF")||n.endsWith(".jar")) entries.put(n,z.readAllBytes());
      }
    }
    String manifestVersion="";
    if(entries.containsKey("META-INF/MANIFEST.MF")) {
      var a=new Manifest(new ByteArrayInputStream(entries.get("META-INF/MANIFEST.MF"))).getMainAttributes();
      manifestVersion=Objects.toString(a.getValue("Implementation-Version"),"");
    }
    String toml=new String(entries.getOrDefault("META-INF/mods.toml",new byte[0]),java.nio.charset.StandardCharsets.UTF_8);
    Set<String> owners=new HashSet<>();
    var own=Pattern.compile("(?ms)^\\s*\\[\\[mods\\]\\](.*?)(?=^\\s*\\[|\\z)").matcher(toml);
    while(own.find())owners.add(value(own.group(1),"modId"));
    var tables=Pattern.compile("(?ms)^\\s*\\[\\[(mods|dependencies\\.[^\\]]+)\\]\\](.*?)(?=^\\s*\\[|\\z)").matcher(toml);
    while(tables.find()) {
      String body=tables.group(2),id=value(body,"modId");
      if(id.isEmpty())continue;
      if(tables.group(1).equals("mods")) {
        String v=value(body,"version").replace("${file.jarVersion}",manifestVersion);
        var old=mods.get(id);
        if(old!=null&&!embedded&&!old.embedded) issues.add("DUPLICATE "+id+": "+old.source+" / "+source);
        if(old==null||(!embedded&&old.embedded)||(embedded&&old.embedded&&new ComparableVersion(v).compareTo(new ComparableVersion(old.version))>0)) mods.put(id,new Mod(id,v,source,embedded));
      } else if(owners.contains(tables.group(1).substring("dependencies.".length()))) deps.add(new Dep(id,value(body,"versionRange"),source,Pattern.compile("mandatory\\s*=\\s*true").matcher(body).find()));
    }
    for(var e:entries.entrySet()) if(e.getKey().endsWith(".jar")) read(e.getValue(),source+"!"+e.getKey(),true);
  }
  public static void main(String[] args)throws Exception {
    Path root=Path.of(args[0]);
    mods.put("minecraft",new Mod("minecraft","1.20.1","loader",false));
    mods.put("forge",new Mod("forge","47.4.28","loader",false));
    try(var pins=Files.list(root.resolve("pack/mods"))) {
      for(Path pin:pins.filter(p->p.toString().endsWith(".pw.toml")).toList()) {
        String name=value(Files.readString(pin),"filename");
        read(Files.readAllBytes(root.resolve(".tools/verified-jars").resolve(name)),name,false);
      }
    }
    int checked=0;
    for(var d:deps) {
      var m=mods.get(d.id);
      if(m==null){if(d.mandatory)issues.add("MISSING "+d.id+" "+d.range+" required by "+d.source);continue;}
      if(m.version.isEmpty()||m.version.contains("${")){issues.add("UNRESOLVED VERSION "+d.id+" in "+m.source);continue;}
      if(d.range.isEmpty())continue;
      var range=VersionRange.createFromVersionSpec(d.range);
      if(range.hasRestrictions()&&!range.containsVersion(new DefaultArtifactVersion(m.version))) issues.add("RANGE "+d.id+" installed="+m.version+" needs="+d.range+" by "+d.source);
      checked++;
    }
    var result=new ArrayList<String>();
    result.add("Static Maven range audit: "+checked+" mandatory/present-optional declarations checked; "+mods.size()+" mod IDs.");
    result.addAll(new LinkedHashSet<>(issues));
    result.add("Absent optional dependencies are allowed. This does not test mixins, undeclared incompatibilities, or gameplay.");
    Files.write(root.resolve("dist/dependency-ranges.txt"),result);
    result.forEach(System.out::println);
    if(!issues.isEmpty())System.exit(1);
  }
}
