using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace Ernest.Extensions
{
    public static class BitArrayExtension
    {
        public static byte ConvertToByte(this BitArray bits)
        {
            byte b = 0xFF;
            for (int i = 0; i < 8; i++)
            {
                if (!bits.Get(i))
                    b &= (byte)~(1 << i);
            }
            return b;
        }
    }
}
