using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace InMemory.Protocol.IO.Interfaces
{
    public interface IDataReader 
    {
        int Position { get; }

        int BytesAvailable { get; }

        short ReadShort();

        int ReadInt();

        long ReadLong();

        ushort ReadUShort();

        uint ReadUInt();

        ulong ReadULong();

        byte ReadByte();

        sbyte ReadSByte();

        byte[] ReadBytes(int n);

        bool ReadBoolean();

        char ReadChar();

        double ReadDouble();

        float ReadFloat();

        string ReadUTF();

        string ReadUTFBytes(ushort len);

        void Seek(int offset, SeekOrigin seekOrigin);

        void SkipBytes(int n);
    }
}
