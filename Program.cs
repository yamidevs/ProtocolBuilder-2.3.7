using System;
using System.Collections.Generic;

namespace InMemory.ProtocolBuilder
{
    public class Program
    {
        public static Dictionary<string, Engine> cache = new Dictionary<string, Engine>();
        public static Queue<Engine> after = new Queue<Engine>();
        public static List<string> types = new List<string>
        {
           // "Types",
          //"Messages",
          "Enums"
        };
        static void Main(string[] args)
        {



            foreach(var result in  types)
            {
                Console.WriteLine("START : "+result);
                if(result == "Messages" || result =="Types")
                    ParseFile(result);
                else
                {
                    var files = System.IO.Directory.GetFiles(result, "*.as", System.IO.SearchOption.AllDirectories);
                    foreach (var m in files)
                    {
                        Console.WriteLine(m);
                        var enums = new EnumsEngine(m);
                        enums.parseEnum();
                    }
                }

                Console.WriteLine("FINISH");

            }

            Console.ReadLine();
        }

        public static void ParseFile(string type)
        {
            var files = System.IO.Directory.GetFiles(type, "*.as", System.IO.SearchOption.AllDirectories);
            foreach (var m in files)
            {
                var Engine = new Engine(m,type);
                if (Engine.ParseBase())
                {
                    Engine.ParseContent();
                    cache.Add(Engine.name, Engine);
                }
                else
                {
                    after.Enqueue(Engine);
                }
            }

            while (after.Count > 0)
            {
                var result = after.Dequeue();
                if (result.ParseBase())
                {
                    result.ParseContent();
                    cache.Add(result.name, result);
                }
                else
                {
                    after.Enqueue(result);
                }

            }
        }
    }
}
