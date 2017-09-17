using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest.Attributes
{
    public class Opcode : Attribute
    {
        public byte[] Opcodes;

        public Opcode(params byte[] opcodes)
        {
            this.Opcodes = opcodes;
        }
    }
}
