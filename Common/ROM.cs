using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Ernest
{
    public class ROM
    {
        /// <summary>
        /// ROM Header size is composed of 16 bytes.
        /// </summary>
        const int HEADER_SIZE = 16;

        /// <summary>
        /// Standard page size for the CHR section.
        /// </summary>
        const int CHR_PAGE_SIZE = 0x2000;

        /// <summary>
        /// Standard page size for the PRG section.
        /// </summary>
        const int PRG_PAGE_SIZE = 0x4000;

        /// <summary>
        /// Can be translated to "NES\n".
        /// </summary>
        const uint NES_SIGNATURE = 0x1A_53_45_4E;

        /// <summary>
        /// PRG section where is stored the assembled code source of the game.
        /// </summary>
        public byte[] ProgramRom;

        /// <summary>
        /// CHR section where is stored graphics data handled by the PPU.
        /// </summary>
        public byte[] CharacterRom;

        /// <summary>
        /// ROM Mapper.
        /// </summary>
        public int MapperBits;
        
        /// <summary>
        /// Type of mirroring used in the game.
        /// </summary>
        public int MirrorBits;

        /// <summary>
        /// Error stack.
        /// </summary>
        public string Errors;

        /// <summary>
        /// Number of pages handling the program source code.
        /// </summary>
        public int PRGCount;

        /// <summary>
        /// Number of pages handling the character data.
        /// </summary>
        public int CHRCount;

        public ROM(string path, out Port port)
        {
            using (FileStream fileStream = File.OpenRead(path))
            {
                if (fileStream.Length < HEADER_SIZE)
                {
                    using (BinaryReader binaryReader = new BinaryReader(fileStream))
                    {
                        uint signature = binaryReader.ReadUInt32();

                        this.PRGCount = binaryReader.ReadByte();
                        this.ProgramRom = new byte[PRG_PAGE_SIZE * PRGCount];

                        this.CHRCount = binaryReader.ReadByte();
                        this.CharacterRom = new byte[CHR_PAGE_SIZE * CHRCount];

                        int flags = binaryReader.ReadByte();
                        this.MapperBits = (flags >> 4) & 0xF;
                        this.MirrorBits = (flags) & 0xF;

                        fileStream.Seek(HEADER_SIZE, SeekOrigin.Begin);
                        fileStream.Read(ProgramRom, 0, ProgramRom.Length);
                        fileStream.Read(CharacterRom, 0, CharacterRom.Length);                    
                    }
                }
            }

            port = new Port
            {
                Rom = this
            };
        }
    }
}
