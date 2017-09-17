﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest
{
    public class Memory
    {
        private static Memory _Access;

        public static Memory Access
        {
            get
            {
                if (_Access is null)
                    _Access = new Memory();
                return _Access;
            }
        }

        private byte[] _RAM;

        public byte this[uint address]
        {
            get => MmioRead(address);
            set => MmioWrite(address, value);
        }

        public void LoadProgramInMemory(byte[] programRom, int programPagesCount)
        {
            _RAM = new byte[0x10000];
            if (programPagesCount == 1)
            {
                Array.Copy(programRom, 0, _RAM, 0x8000, 0x4000);
                Array.Copy(programRom, 0, _RAM, 0xC000, 0x4000);
            }
            else if(programPagesCount == 2)
            {
                Array.Copy(programRom, 0, _RAM, 0x8000, 0x8000);
            }
        }

        private byte MmioRead(uint address)
        {
            switch(address)
            {
                case uint addr when (addr >= 0 && addr <= 0x2001 || addr >= 0x2003 && addr <= 0x10000) :
                    return _RAM[addr];
                case uint addr when (addr == 0x2002) :
                    //TODO Read PPU status
                    return default(byte);
                default :
                    return default(byte);          
            }
        }

        public ushort MmioReadShort(uint address)
        {
            return (ushort)(MmioRead(address) | (MmioRead(address + 1) << 8));
        }

        private void MmioWrite(uint address, byte value)
        {
            switch (address)
            {
                case uint addr when (addr >= 0 && addr <= 0x1999 || addr >= 0x2003 && addr <= 0x10000):
                    _RAM[addr] = value;
                    break;
                case uint addr when (addr == 0x2000 || addr == 0x2007):
                    _RAM[addr] = value;
                    //TODO PPU update
                    break;
                default:
                    return;
            }
        }
    }
}