using System;
using System.IO;

namespace Ernest
{
    class Program
    {
        //TEST ERROR : rom.log l.55

        private const string EXT_NES = ".nes";
        private const int ARG_INDEX_PATH = 0;
        private const int ARG_INDEX_NAME = 1;
        private const int ERR_FORMAT = 2;

        private static Port _PrimaryPort;

        static void Main(string[] args)
        {
            if (Path.GetExtension(args[ARG_INDEX_PATH]) != EXT_NES)
                Environment.Exit(ERR_FORMAT);
            var rom = new ROM(args[0], out _PrimaryPort);
            _PrimaryPort.Rom = rom;

            var cpu = new CPU();
            cpu.Update();
        }
    }
}
