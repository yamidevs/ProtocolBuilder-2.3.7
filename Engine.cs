using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Linq;
using System.Threading;

namespace InMemory.ProtocolBuilder
{
    public class Engine
    {

        public string path
        {
            get;set;
        }
        public string name
        {
            get;
            set;
        }

        public string extends
        {
            get;
            set;
        }
        private Dictionary<string, string> types = new Dictionary<string, string>()
        {
            {"String","string" },
            {"Number","double" },
            {"Boolean","bool" },
            {"UTF","string" },
            {"UnsignedInt","uint" },
            {"Version","Types.Version" },
            {"UnsignedShort","UShort" },
            {"UnsignedByte","Byte" }

        };
        private Dictionary<string, string> replace = new Dictionary<string, string>()
        {
            { "length","Count" },
            {"getTypeId()","TypeId" }
        };
        private Dictionary<string, string> io = new Dictionary<string, string>()
        {
            {"UnsignedInt","UInt" },
            {"UnsignedShort","UShort" },
            {"UnsignedByte","Byte" }

        };
        private List<string> wrong = new List<string>()
        {
            "object","base"
        };
        //constructor
        private List<ConstructorParams> paramsConstructor = new List<ConstructorParams>();
        private List<string> paramsBase = new List<string>();
        private Dictionary<string, string> contentConstructor = new Dictionary<string, string>();
        //fields
        private List<Field> fields = new List<Field>();
        //serialize
        private List<string> serializeContent = new List<string>();
        //deserialize
        private List<string> deserializeContent = new List<string>();
        StringBuilder content = new StringBuilder();
        private int i = 0;
        private string[] lines;
        private string type;
        public bool done
        {
            get;set;
        }

        public Engine(string path , string type)
        {
            this.path = path;
            this.type = type;
            done = false;
        }
        public bool ParseBase()
        {
            i = 0;
            lines = File.ReadAllLines(path);
            while (Regex.Match(lines[i], @"public class (.*)").Success == false)
            {
                i++;
            }
            if (Regex.Match(lines[i], @"public class (.*) extends (.*) implements (.*)").Success)
            {

                name = Regex.Match(lines[i], @"public class (.*) extends (.*) implements (.*)").Groups[1].Value;
                extends = Regex.Match(lines[i], @"public class (.*) extends (.*) implements (.*)").Groups[2].Value;
                if (extends == "NetworkMessage")
                    extends = string.Empty;
            }
            else
            {
                name = Regex.Match(lines[i], @"public class (.*) implements (.*)").Groups[1].Value;
                extends = string.Empty;

            }

            i++;

            if(extends == string.Empty)
            {
                return true;
            }else
            {
                if(Program.cache.Any(x => x.Key == extends))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
        }
        public void ParseContent()
        {
            
            this.ParseFields();
            while(Regex.Match(lines[i],$"public function init{name}(.*)").Success == false)
            {
                i++;
            }
            this.ParseConstructor();
            this.ParseSerializer();
            this.ParseDeserialize();
            //write in files
            this.WriteBase();
            this.WriteFields();
            this.WriteConstructor();
            this.WriteSerializer();
            this.WriteDeserialize();

            this.WriteEnd();
            var newpath = "generated/" + GetNewPath(path);
            this.CreateDirectory(newpath);
            File.WriteAllText(newpath, content.ToString());
            done = true;
        }

        public void ParseFields()
        {
            //parse protocoid
            while(Regex.Match(lines[i], $"public static const protocolId:uint = (.*);").Success == false)
            {
                i++;
            }
            var protocolid = Regex.Match(lines[i], $"public static const protocolId:(.*) = (.*);");
            fields.Add(new Field
            {
                name = "Id",
                type = string.Concat((extends == string.Empty ? "const " : "new const "), protocolid.Groups[1].Value),
                isVector = false,
                isAbstract = true,
                value = protocolid.Groups[2].Value
            });

            //parse other fields
            while (Regex.Match(lines[i],$"public function {name}.*").Success == false)
            {
               var r1 =  Regex.Match(lines[i], @"public var (.*):(.*) = (.*)");
                if(r1.Success == false)
                     r1 = Regex.Match(lines[i], @"public var (.*):(.*);");
                if (r1.Success)
                {
                    var vector = Regex.Match(r1.Groups[2].Value, @"Vector.<(.*)>");
                    if(vector.Success)
                    {
                        fields.Add(new Field
                        {
                            name = r1.Groups[1].Value,
                            type = vector.Groups[1].Value,
                            isVector = true,
                            isAbstract = false,
                            value = string.Empty
                        });
                    }
                    else
                    {
                        fields.Add(new Field
                        {
                            name = r1.Groups[1].Value,
                            type = r1.Groups[2].Value,
                            isVector = false,
                            isAbstract = false,
                            value = string.Empty


                        });
                    }
                    
                }
                i++;
            }
        }

        public void ParseConstructor()
        {
            var @params = Regex.Match(lines[i], $@"public function init{name}\((.*)\)(.*)");
            foreach(var result in @params.Groups[1].Value.Split(','))
            {
                var p = Regex.Match(result, "(.*):(.*) = (.*)");
                var vector = Regex.Match(p.Groups[2].Value,@"Vector.<(.*)>");
                if(vector.Success)
                {
                    paramsConstructor.Add(new ConstructorParams
                    {
                        name = p.Groups[1].Value.Replace(" ",string.Empty),
                        isVector = true,
                        type = vector.Groups[1].Value.Replace(" ", string.Empty),

                    });

                }
                else
                {
                    paramsConstructor.Add(new ConstructorParams
                    {
                        name = p.Groups[1].Value.Replace(" ", string.Empty),
                        isVector = false,
                        type = p.Groups[2].Value.Replace(" ", string.Empty),
                    });
                }
            }
            while(!lines[i].Contains("}") && !lines[i].Contains("_isInitialized"))
            {
                var p = Regex.Match(lines[i], "this.(.*) = (.*);");
                if(p.Success)
                {
            
                    if (paramsConstructor.Any( x => x.name == p.Groups[2].Value))
                    {
                        var param = paramsConstructor.First(x => x.name == p.Groups[2].Value);
                        param.name = p.Groups[1].Value;
                        contentConstructor.Add(p.Groups[1].Value, p.Groups[1].Value);
                    }else
                    {
                        contentConstructor.Add(p.Groups[1].Value, p.Groups[2].Value);

                    }

                }else
                {
                    if(extends != string.Empty)
                    {
                        var r = Regex.Match(lines[i], $@"init{extends}\((.*)\);");
                        if(r.Success)
                        {
                            var result = r.Groups[1].Value.Split(',');
                            for (var z = 0; z < result.Length; z++)
                            {
                                var find = paramsConstructor.Find(x => x.name == result[z]);

                                var @base = Program.cache.First(x => x.Key == extends);
                                find.name = @base.Value.paramsConstructor[z].name;
                                paramsBase.Add(find.name);


                            }
                        }

                    }
                }
                i++;
            }

   
         
        }

        public void ParseSerializer()
        {
            while(Regex.Match(lines[i],$@"public function serializeAs_{name}\((.*)\)(.*)").Success == false)
            {
                i++;
            }
            i++;
            Queue<string> delmt = new Queue<string>();
            delmt.Enqueue("{");
            i++;
            while (delmt.Count > 0)
            {
                if (lines[i].Replace(" ", string.Empty) == "{")
                {
                    delmt.Enqueue("{");
                }
                else if (lines[i].Replace(" ", string.Empty) == "}")
                {
                    delmt.Dequeue();
                }
                if (delmt.Count > 0)
                {
                    lines[i] = lines[i].Trim();
                    var r = Regex.Match(lines[i], $@"param1.write(.*)\(\(this.(.*) as (.*)");
                    if (r.Success)
                    {
                        var cast = TrueForm(types, r.Groups[1].Value);
                        var name = isWrongName(r.Groups[2].Value);
                        serializeContent.Add($"writer.Write{r.Groups[1].Value}(({cast.ToLower()})this.{name}.TypeId);");
                    }
                    else
                    {
                        var r1 = Regex.Match(lines[i], @"param1.write(.*)\(this.(.*)\);");
                        if (r1.Success)
                        {

                            var cast = TrueForm(types, r1.Groups[1].Value);
                            var writer = TrueForm(io, r1.Groups[1].Value);
                            var var = isWrongName(ReplaceForm(replace, r1.Groups[2].Value));
                            serializeContent.Add($"writer.Write{writer}(({cast.ToLower()})this.{var});");

                        }
                        else
                        {
                            var r2 = Regex.Match(lines[i], @"throw new Error(.*)");
                            if (r2.Success)
                            {
                                serializeContent.Add($"throw new Exception{r2.Groups[1].Value}");
                            }
                            else
                            {
                                var r3 = Regex.Match(lines[i], @"var (.*):(.*) = (.*);");
                                if (r3.Success)
                                {
                                    serializeContent.Add($"var {r3.Groups[1].Value} = {r3.Groups[3].Value};");
                                }
                                else
                                {
                                    var r4 = Regex.Match(lines[i], $"super.serializeAs_{extends}(.*)");
                                    if (r4.Success)
                                    {
                                        serializeContent.Add("base.Serialize(writer);");
                                    }
                                    else
                                    {

                                        var r5 = Regex.Match(lines[i], @"while\((.*) < (.*)\)");
                                        if (r5.Success)
                                        {
                                            serializeContent.Add(ReplaceForm(replace, $"while({r5.Groups[1].Value} < {isWrongName(r5.Groups[2].Value)})"));
                                        }
                                        else
                                        {

                                            var r7 = Regex.Match(lines[i], $@"\(this.(.*) as (.*)");
                                            if (r7.Success)
                                            {
                                                var name = isWrongName(r7.Groups[1].Value);

                                                serializeContent.Add($"this.{name}.Serialize(writer);");
                                            }
                                            else
                                            {

                                                var r6 = Regex.Match(lines[i], $@"this.(.*).serializeAs_(.*)");
                                                if (r6.Success)
                                                {
                                                    var name = isWrongName(r6.Groups[1].Value);

                                                    serializeContent.Add($"this.{name}.Serialize(writer);");
                                                }
                                                else
                                                {
                                                    var r8 = Regex.Match(lines[i], $@"this.(.*).serialize(.*)");
                                                    if(r8.Success)
                                                    {
                                                        var name = isWrongName(r8.Groups[1].Value);
                                                        serializeContent.Add($@"this.{name}.Serialize(writer);");
                                                    }
                                                    else
                                                    {
                                                        var r9 = Regex.Match(lines[i], $@"param1.write(.*)\((.*)\);");
                                                        if(r9.Success)
                                                        {
                                                            var cast = TrueForm(types, r9.Groups[1].Value);
                                                            var writer = TrueForm(io, r9.Groups[1].Value);
                                                            var var = isWrongName(ReplaceForm(replace, r9.Groups[2].Value));
                                                            serializeContent.Add($"writer.Write{writer}(({cast.ToLower()}){var});");
                                                        }
                                                        else
                                                        {
                                                            var r10 = Regex.Match(lines[i], @"BooleanByteWrapper.setFlag\((.*),(.*),(.*)\);");
                                                            if(r10.Success)
                                                            {
                                                                serializeContent.Add($"{r10.Groups[1].Value} =  BooleanByteWrapper.SetFlag({r10.Groups[1].Value},{r10.Groups[2].Value},{r10.Groups[3].Value});");
                                                            }
                                                            else
                                                            {
                                                                serializeContent.Add(lines[i]);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                           
                                        }
                                    }
                                }
                            }
                        }
                    }


                }
                

                i++;
            }
        }

        public void ParseDeserialize()
        {
            while (Regex.Match(lines[i], $@"public function deserializeAs_{name}\((.*)\)(.*)").Success == false)
            {
                i++;
            }
            i++;
            Queue<string> delmt = new Queue<string>();
            delmt.Enqueue("{");
            i++;
            Dictionary<string, string> vartype = new Dictionary<string, string>();
            while (delmt.Count > 0)
            {
                if (lines[i].Replace(" ", string.Empty) == "{")
                {
                    delmt.Enqueue("{");
                }
                else if (lines[i].Replace(" ", string.Empty) == "}")
                {
                    delmt.Dequeue();
                }

                if (delmt.Count > 0)
                {
                    lines[i] = lines[i].Trim();
                    // var r = Regex.Match(lines[i], @"var (.*):uint = param1.readUnsignedShort();");
                    var r = Regex.Match(lines[i], @"var (.*):(.*) = (.*);");
                    if (r.Success)
                    {
                        var r2 = Regex.Match(r.Groups[3].Value,@"param1.read(.*)\(\)");
                        if(r2.Success)
                        {
                            deserializeContent.Add($"{r.Groups[2].Value} {isWrongName(r.Groups[1].Value)} = reader.Read{TrueForm(io,r2.Groups[1].Value)}();");

                        }
                        else
                        {
                            vartype.Add(isWrongName(r.Groups[1].Value), r.Groups[2].Value);
                            deserializeContent.Add($"{r.Groups[2].Value} {r.Groups[1].Value} = {r.Groups[3].Value};");
                        }
                    }else
                    {
                        var r1 = Regex.Match(lines[i], @"throw new Error(.*)");
                        if (r1.Success)
                        {
                            deserializeContent.Add($"throw new Exception{r1.Groups[1].Value}");
                        }else
                        {
                            var r2 = Regex.Match(lines[i], @"(.*).deserialize\(param1\);");
                            if(r2.Success)
                            {
                                if(r2.Groups[1].Value == "super")
                                {
                                    deserializeContent.Add($"base.Deserialize(reader);");
                                }
                                else
                                {
                                    
                                    deserializeContent.Add($"{isWrongName(r2.Groups[1].Value)}.Deserialize(reader);");
                                }

                            }
                            else
                            {
                                var r3 = Regex.Match(lines[i],@"this.(.*) = param1.read(.*)\(\);");
                                if(r3.Success)
                                {
                                    var writer = TrueForm(io, r3.Groups[2].Value);
                                    var name = isWrongName(r3.Groups[1].Value);
                                    if(fields.Any(x => x.name == r3.Groups[1].Value))
                                    {
                                        var cast = TrueForm(types, fields.First(x => x.name == r3.Groups[1].Value).type);

                                        deserializeContent.Add($"this.{name} = ({cast.ToLower()})reader.Read{writer}();");
                                    }else
                                    {
                                        deserializeContent.Add($"this.{name} = reader.Read{writer}();");

                                    }


                                }
                                else
                                {
                                    var r4 = Regex.Match(lines[i], @"(.*).push\((.*)\);");
                                    if(r4.Success)
                                    {
                                        deserializeContent.Add($"{isWrongName(r4.Groups[1].Value)}.Add({r4.Groups[2].Value});");
                                    }
                                    else
                                    {

                                        var r5 = Regex.Match(lines[i], @"(.*) = ProtocolTypeManager.getInstance\((.*),(.*)\);");
                                        if(r5.Success)
                                        {
                                            deserializeContent.Add($"{r5.Groups[1].Value} = ProtocolTypeManager.GetInstance<{r5.Groups[2].Value}>({r5.Groups[3].Value});");

                                        }
                                        else
                                        {
                                            var r6 = Regex.Match(lines[i], @"(.*) = BooleanByteWrapper.getFlag\((.*),(.*)\);");
                                            if(r6.Success)
                                            {
                                                deserializeContent.Add($"{r6.Groups[1].Value} = BooleanByteWrapper.GetFlag((byte){r6.Groups[2].Value},{r6.Groups[3].Value});");
                                            }else
                                            {
                                                var r7 = Regex.Match(lines[i], @"(.*) = (.*).read(.*)\(\);");
                                                if(r7.Success)
                                                {
                                                    var writer = TrueForm(io, r7.Groups[3].Value);
                                                    var name = isWrongName(r7.Groups[1].Value);
                                                    if(vartype.ContainsKey(name))
                                                    {
                                                        deserializeContent.Add($"{name} = ({vartype[name]})reader.Read{writer}();");
                                                    }
                                                    else
                                                    {
                                                        deserializeContent.Add($"{name} = reader.Read{writer}();");
                                                    }

                                                }
                                                else
                                                {
                                                    var r8 = Regex.Match(lines[i], "this.(.*) = new (.*);");
                                                    if(r8.Success)
                                                    {
                                                        deserializeContent.Add($"this.{isWrongName(r8.Groups[1].Value)} = new {r8.Groups[2].Value};");

                                                    }
                                                    else
                                                    {
                                                        deserializeContent.Add(lines[i]);
                                                    }
                                                }
                                            }
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
                i++;
            }
        }
            
        public void WriteFields()
        {
             
            if(type == "Messages")
            {
                content.AppendLine("public override uint Id");
                content.AppendLine("{");
                content.Append("get { return ");
                content.AppendLine($"{fields.First(x => x.name == "Id").value}");
                content.AppendLine(";}");
                content.AppendLine("}");
                fields.Remove(fields.First(x => x.name == "Id"));
            }
            

            foreach (var field in fields)
            {
                if (types.ContainsKey(field.type))
                    field.type = types[field.type];

                field.name = isWrongName(field.name);

                if (field.isVector == true)
                    content.AppendLine($"public List<{field.type}> {field.name};");
                else
                {
                    if (field.value == string.Empty)
                    {
                        content.AppendLine($"public {field.type} {field.name};");
                    }
                    else
                    {
                        content.AppendLine($"public {field.type} {field.name} = {field.value};");
                    }
                }
            }

            if(type == "Types")
            {
                if (extends == string.Empty)
                    content.AppendLine("public virtual uint TypeId");
                else
                    content.AppendLine("public override uint TypeId");

                content.AppendLine("{");
                content.AppendLine("get { return Id; }");
                content.AppendLine("}");
            }
            

        }

        public void WriteConstructor()
        {
            //default construct
            if(name == "Item")
            {
                Console.WriteLine(paramsConstructor.Count);
                
            }
            if(paramsConstructor.Count(x => x.name != string.Empty) > 0)
            {
                content.AppendLine($"public {name}()");
                content.AppendLine("{");
                content.AppendLine("}");
            }
            

            content.Append($"public {name}(");
            //params
            foreach (var result in paramsConstructor)
            {
                var type = result.type;
                if (types.ContainsKey(result.type))
                    type = types[result.type];
                if (result.isVector == false)
                    content.Append($"{type} {isWrongName(result.name)},");
                else
                    content.Append($"List<{type}> {isWrongName(result.name)},");

            }

            if (content[content.Length - 1] == ',')
                content.Length -= 1;
            //if has base
            if (extends != string.Empty)
            {
                content.Append(") : base(");
                foreach (var result in paramsBase)
                {
                    content.Append($"{result},");
                }
                if (content[content.Length - 1] == ',')
                    content.Length--;
                content.Append(")");


            }
            else
            {
                content.AppendLine(")");
            }
            //content
            content.AppendLine("{");
            foreach (var result in contentConstructor)
            {
                content.AppendLine($"this.{isWrongName(result.Key)} = {isWrongName(result.Value)};");
            }
            content.AppendLine("}");

        }

        public void WriteSerializer()
        {
            content.Append("public");
            if(type == "Messages")
            {
                content.Append(" override ");
            }else if(type == "Types")
            {
                if(extends == string.Empty)
                {
                    content.Append(" virtual ");

                }
                else
                {
                    content.Append(" override ");
                }
            }
            content.AppendLine("void Serialize(IDataWriter writer)");

            content.AppendLine("{");
            foreach(var result in serializeContent)
            {
                
                content.AppendLine(result);
            }
            content.AppendLine("}");

        }

        public void WriteDeserialize()
        {
            content.Append("public");
            if (type == "Messages")
            {
                content.Append(" override ");
            }
            else if (type == "Types")
            {
                if (extends == string.Empty)
                {
                    content.Append(" virtual ");

                }
                else
                {
                    content.Append(" override ");
                }
            }
            content.AppendLine("void Deserialize(IDataReader reader)");
            content.AppendLine("{");
            foreach (var result in deserializeContent)
            {
                //this.fightTeams[_loc2_].Deserialize(reader);
                var pattern = Regex.Match(result, @"(.*)\[(.*)\](.*)");
                if(pattern.Success)
                {
                    content.AppendLine($"{pattern.Groups[1].Value}[(int){pattern.Groups[2].Value}]{pattern.Groups[3].Value}");

                }
                else
                {
                    content.AppendLine(result);
                }
            }
            content.AppendLine("}");

        }
        public void WriteBase()
        {
            content.AppendLine("using System;");
            content.AppendLine("using System.IO;");
            content.AppendLine("using System.Collections;");
            content.AppendLine("using System.Collections.Generic;");
            content.AppendLine("using InMemory.Protocol.IO.Interfaces;");
            content.AppendLine("using InMemory.Protocol.IO;");
            content.AppendLine("using InMemory.Protocol.Enums;");

            if (type == "Messages")
                content.AppendLine("using InMemory.Protocol.Types;");

            content.AppendLine($"namespace InMemory.Protocol.{type}");
            content.AppendLine("{");
            content.Append($"public class {name}");
            if (extends != string.Empty)
                content.Append($" : {extends}");
            else
            {
                if(type == "Messages")
                {
                    content.Append(" : Message");
                }
            }

            content.Append("\n");
            content.AppendLine("{");



        }

        public void WriteEnd()
        {
            content.AppendLine("}");
            content.AppendLine("}");

        }
        public string GetNewPath(string path)
        {
            return Path.ChangeExtension(path, ".cs").ToString();
        }
        public void CreateDirectory(string path)
        {
            string[] tab = path.Split('\\');
            StringBuilder CheckPath = new StringBuilder();
            for (var i = 0; i < tab.Length - 1; i++)
            {
                CheckPath.Append(tab[i]);
                CheckPath.Append("\\");

                if (!Directory.Exists(CheckPath.ToString()))
                {
                    Directory.CreateDirectory(CheckPath.ToString());
                }
            }
            CheckPath.Clear();
        }

        public string isWrongName(string name)
        {
            if(name.Contains('.'))
            {
                var st = name.Split('.');
                var str = string.Empty;
                foreach(var result in st)
                {
                    if (wrong.Any(x => x == result))
                    {
                        str += $"{string.Concat("@", result)}.";
                    }
                    else
                    {
                        str += $"{result}.";
                    }
                }
                str = str.Remove(str.Length - 1);
                return str;
            }else
            {
                if (wrong.Any(x => x == name))
                {
                    return string.Concat("@", name);
                }
                else
                {
                    return name;
                }
            }
            
        }

       
        public  string TrueForm(Dictionary<string, string> dico,string str)
        {
            if(dico.ContainsKey(str))
            {
                return dico[str];
            }
            return str;
        }

        public string ReplaceForm(Dictionary<string,string> dico, string str)
        {
            foreach(var result in dico)
            {
                if(str.Contains(result.Key))
                {
                    str = str.Replace(result.Key, result.Value);
                }
            }

            return str;

        }

 


    }
}
