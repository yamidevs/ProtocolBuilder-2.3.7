using System;
using System.Collections.Generic;
using System.Text;

namespace InMemory.ProtocolBuilder
{
    public class Field
    {
        public string name
        {
            get;set;
        }
        public string type
        {
            get;set;
        }

        public bool isVector
        {
            get;set;
        }

        public bool isAbstract
        {
            get;set;
        }

        public string value
        {
            get;set;
        }
    }
}
