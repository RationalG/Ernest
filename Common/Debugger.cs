using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using Ernest.Attributes;
using System.Reflection;

namespace Ernest.Common
{
    public class Debugger
    {
        private static Debugger _Out;

        public static Debugger Out
        {
            get
            {
                if (_Out is null)
                    _Out = new Debugger();
                return _Out;
            }
        }

        public int LineIndex;

        public string[] Logs;

        public ushort PC;

        public byte A;

        public byte X;

        public byte Y;

        public byte SP;

        public byte S;

        public ushort Opcode;

        public string Instruction;

        
        public Debugger()
        {
            string[] logs = File.ReadAllLines(@"Samples\rom.log");
            string cycleLabel = "CYC:";
            for (int i = 0; i < logs.Length; i++)
            {
                int cycleOccurence = logs[i].IndexOf(cycleLabel);
                logs[i] = logs[i].Substring(0, cycleOccurence);
                logs[i] = Regex.Replace(logs[i], @"\s+", " ");
            }
            this.Logs = logs;
        }

        public void PrintAccumulator()
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {Instruction.ToUpper()} A";
            PrintLogLine(asm);
        }

        public void PrintImplied()
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {Instruction.ToUpper()}";
            PrintLogLine(asm);
        }

        [SpecialRule("Asl", "Stx", "Ror", "Rol", "Sty", "Sta", "Ldx", "Ldy", "Lda", "Bit", "Ora", "Eor", "And", "Adc", "Cmp", "Cpx", "Cpy", "Sbc", "Lsr", "Inc", "Dec")]
        public void PrintAbsolute(ushort operand, byte memoryExtract)
        {
            int lowByte = operand & 0xFF;
            int highByte = operand >> 8;
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {lowByte.ToString("X2")} {highByte.ToString("X2")} {Instruction.ToUpper()} ${operand.ToString("X4")}";

            var rule = MethodBase.GetCurrentMethod().GetCustomAttributes(false)[0] as SpecialRule;
            if (Array.Exists(rule.Instructions, i => i == Instruction))
                asm += $" = {memoryExtract.ToString("X2")}";
            PrintLogLine(asm);
        }

        public void PrintRelative(ushort operand, ushort futurePc)
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {operand.ToString("X2")} {Instruction.ToUpper()} ${futurePc.ToString("X4")}";
            PrintLogLine(asm);
        }

        public void PrintImmediate(ushort operand)
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {operand.ToString("X2")} {Instruction.ToUpper()} #${operand.ToString("X2")}";
            PrintLogLine(asm);
        }

        public void PrintZeroPage(ushort operand, byte memoryExtract)
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {operand.ToString("X2")} {Instruction.ToUpper()} ${operand.ToString("X2")} = {memoryExtract.ToString("X2")}";
            PrintLogLine(asm);
        }

        public void PrintIndirectIndexed(ushort operand, int sum, ushort indirectMemoryAddress, byte memoryExtract)
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {operand.ToString("X2")} {Instruction.ToUpper()} (${operand.ToString("X2")}),Y @ {sum.ToString("X2")} = {indirectMemoryAddress.ToString("X4")} = {memoryExtract.ToString("X2")}";
            PrintLogLine(asm);
        }

        public void PrintIndexedIndirect(ushort operand, int sum, ushort indirectMemoryAddress, byte memoryExtract)
        {
            string asm = $"{PC.ToString("X4")} {Opcode.ToString("X2")} {operand.ToString("X2")} {Instruction.ToUpper()} (${operand.ToString("X2")},X) @ {sum.ToString("X2")} = {indirectMemoryAddress.ToString("X4")} = {memoryExtract.ToString("X2")}";
            PrintLogLine(asm);
        }

        public void PrintLogLine(string asm)
        {
            string cpu = $"A:{A.ToString("X2")} X:{X.ToString("X2")} Y:{Y.ToString("X2")} P:{S.ToString("X2")} SP:{SP.ToString("X2")} ";
            string line = string.Format("{0} {1}", asm, cpu);

            bool error = false;
            if (line == this.Logs[this.LineIndex])
            {
                Console.ForegroundColor = ConsoleColor.Green;
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                error = true;
            }

            Console.WriteLine(string.Format("{0})\n{1}", (this.LineIndex + 1), line));
            Console.ForegroundColor = ConsoleColor.White;
            Console.WriteLine(this.Logs[this.LineIndex]);
            this.LineIndex++;

            this.PC = this.A = this.X = this.Y = this.SP = this.S = default(byte);
            this.Opcode = default(ushort);
            this.Instruction = string.Empty;

            if (error)
                Console.ReadLine();
        }

    }
}
