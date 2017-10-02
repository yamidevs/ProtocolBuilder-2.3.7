using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace InMemory.ProtocolBuilder
{
    public class EnumsEngine
    {
        string path;
        string[] lines;
        int i;
        public  string name = string.Empty;
        StringBuilder content = new StringBuilder();
        public EnumsEngine(string path)
        {
            this.path = path;
            i = 0;
            lines = File.ReadAllLines(path);
        }

        public void parseEnum()
        {
            while (Regex.Match(lines[i], @"public class (.*)").Success == false)
            {
                i++;
            }

            name = Regex.Match(lines[i], @"public class (.*)").Groups[1].Value.Trim();
            content.AppendLine($"namespace InMemory.Protocol.Enums");
            content.AppendLine("{");
            content.AppendLine($"public enum {name}");
            content.AppendLine("{");
            while (Regex.Match(lines[i], $@"public function {name}()").Success == false)
            {
                lines[i] = lines[i].Trim();
                var pattern = Regex.Match(lines[i], @"public static const (.*):(.*) = (.*);");
                if(pattern.Success)
                {
                    content.AppendLine($"{pattern.Groups[1].Value} = {pattern.Groups[3].Value},");
                }
                i++;
            }
            if (content[content.Length - 1] == ',')
                content.Length = content.Length - 1;

            content.AppendLine("}");
            content.AppendLine("}");
            var newpath = "generated/" + GetNewPath(path);
            this.CreateDirectory(newpath);
            File.WriteAllText(newpath, content.ToString());


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
    }
}
