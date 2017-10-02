using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace InMemory.Protocol.Types
{
    public class ProtocolTypeManager
    {
        private static readonly Dictionary<uint, Func<object>> Types = new Dictionary<uint, Func<object>>();

        public static void Initialize()
        {
            Assembly asm = typeof(ProtocolTypeManager).GetTypeInfo().Assembly;

            foreach (Type type in asm.GetTypes())
            {
                FieldInfo field = type.GetField("Id");

                if (field != null)
                {
                    uint id = (uint)field.GetValue(type);
                    Expression body = Expression.New(type);
                    var cmp = Expression.Lambda<Func<object>>(body).Compile();

                    Types.Add((ushort)id, cmp);
                }
            }
        }

        public static T GetInstance<T>(uint id) where T : class
        {

            if (!Types.ContainsKey(id))
            {
                throw new Exception("type dosen't existe");
            }else
            {

                var instance = Types[id]() as T;
                return instance;              
            }
        }

    }
}

