using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest
{
    public class PPU
    {
        private static PPU _Access;

        public static PPU Access
        {
            get
            {
                if (_Access is null)
                    _Access = new PPU();
                return _Access;
            }
        }

        private uint[] _Pixels;
    }
}
