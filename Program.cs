using System;
using System.IO;

namespace Ernest
{
    class Program
    {
        private const string EXT_NES = ".nes";
        private const int ARG_INDEX_PATH = 0;
        private const int ARG_INDEX_NAME = 1;
        private const int ERR_FORMAT = 2;

        private static Port _PrimaryPort;

        static void Main(string[] args)
        {
            if (Path.GetExtension(args[ARG_INDEX_PATH]) != EXT_NES)
                Environment.Exit(ERR_FORMAT);
            new ROM(args[0], out _PrimaryPort);

            var cpu = new CPU();
        }
    }
}
