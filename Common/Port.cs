using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest
{
    public class Port
    {
        public ROM Rom
        {
            set => Memory.Access.LoadProgramInMemory(value.ProgramRom, value.PRGCount);
        }

    }
}
