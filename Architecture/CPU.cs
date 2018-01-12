using Ernest.Attributes;
using Ernest.Common;
using Ernest.Extensions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace Ernest
{
    public class CPU
    {
        const int VECTOR_NMI = 0xFFFA;
        const int VECTOR_IRQ = 0xFFFE;
        const int VECTOR_RST = 0xFFFC;

        private static CPU _Access;

        public static CPU Access
        {
            get
            {
                if (_Access is null)
                    _Access = new CPU();
                return _Access;
            }
        }

        private ValueTuple<Op, Am>[] _OpcodesTable;

        (Op I, Am AM) this[byte opcode] =>
            _OpcodesTable[opcode];

        /// <summary>
        /// Program Counter.
        /// </summary>
        public ushort PC;

        /// <summary>
        /// Stack Pointer.
        /// </summary>
        public ushort SP;

        /// <summary>
        /// Status register.
        /// </summary>
        BitArray S = new BitArray(8, false);

        /// <summary>
        /// Accumulator register.
        /// </summary>
        public byte A;

        /// <summary>
        /// X indexed register.
        /// </summary>
        public byte X;

        /// <summary>
        /// Y indexed register.
        /// </summary>
        public byte Y;
   
        public enum StatusRegisterFlag : byte { C, Z, I, D, B, U, V, S };

        /// <summary>
        /// Used for easy implementation of ADC and SBC
        /// </summary>
        /// <param name="mv">Memory held value</param>
        byte CrossAdcSbc(byte mv)
        {
            var carry = (this.S.Get((int)StatusRegisterFlag.C)) ? 1 : 0;
            var sum = this.A + mv + carry;
            this.S.Set((int)StatusRegisterFlag.C, sum > 0xFF);
            this.S.Set((int)StatusRegisterFlag.S, ((sum >> 7) & 1) == 1);
            this.S.Set((int)StatusRegisterFlag.V, (~(this.A ^ mv) & (this.A ^ sum) & 0x80) == 0x80);
            return (byte)sum;
        }

        [Opcode(0x18)]
        void Clc((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.C, false);
        }

        [Opcode(0xD8)]
        void Cld((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.D, false);
        }

        [Opcode(0x58)]
        void Cli((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.I, false);
        }

        [Opcode(0xB8)]
        void Clv((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.V, false);
        }

        [Opcode(0x38)]
        void Sec((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.C, true);
        }

        [Opcode(0xF8)]
        void Sed((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.D, true);
        }

        [Opcode(0x78)]
        void Sei((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.I, true);
        }

        [Opcode(0x85, 0x95, 0x8D, 0x9D, 0x99, 0x81, 0x91)]
        void Sta((ushort extract, AddressingMode am) addressingResult)
        {
            Memory.Access[addressingResult.extract] = this.A;
        }

        [Opcode(0x86, 0x96, 0x8E)]
        void Stx((ushort extract, AddressingMode am) addressingResult)
        {
            Memory.Access[addressingResult.extract] = this.X;
        }

        [Opcode(0x84, 0x94, 0x8C)]
        void Sty((ushort extract, AddressingMode am) addressingResult)
        {
            Memory.Access[addressingResult.extract] = this.Y;
        }

        [Opcode(0x4C, 0x6C)]
        void Jmp((ushort extract, AddressingMode am) addressingResult)
        {
            this.PC = addressingResult.extract;
        }

        [Opcode(0x8A)]
        void Txa((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = this.X;
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }

        [Opcode(0x98)]
        void Tya((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = this.Y;
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }


        [Opcode(0xAA)]
        void Tax((ushort extract, AddressingMode am) addressingResult)
        {
            this.X = this.A;
            this.S.Set((int)StatusRegisterFlag.Z, this.X == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X >> 7) & 1) == 1);
        }

        [Opcode(0xA8)]
        void Tay((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y = this.A;
            this.S.Set((int)StatusRegisterFlag.Z, this.Y == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y >> 7) & 1) == 1);
        }


        [Opcode(0xA9, 0xA5, 0xB5, 0xAD, 0xBD, 0xB9, 0xA1, 0xB1)]
        void Lda((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }

        [Opcode(0xA2, 0xA6, 0xB6, 0xAE, 0xBE)]
        void Ldx((ushort extract, AddressingMode am) addressingResult)
        {
            this.X = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, this.X == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X >> 7) & 1) == 1);
        }

        [Opcode(0xA0, 0xA4, 0xB4, 0xAC, 0xBC)]
        void Ldy((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, this.Y == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y >> 7) & 1) == 1);
        }

        [Opcode(0xC6, 0xD6, 0xCE, 0xDE)]
        void Dec((ushort extract, AddressingMode am) addressingResult)
        {
            int value = Memory.Access[addressingResult.extract] - 1;
            Memory.Access[addressingResult.extract] = (byte)value;
            this.S.Set((int)StatusRegisterFlag.Z, value == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((value >> 7) & 1) == 1);
        }

        [Opcode(0xCA)]
        void Dex((ushort extract, AddressingMode am) addressingResult)
        {
            this.X--;
            this.S.Set((int)StatusRegisterFlag.Z, this.X == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X >> 7) & 1) == 1);
        }

        [Opcode(0x88)]
        void Dey((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y--;
            this.S.Set((int)StatusRegisterFlag.Z, this.Y == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y >> 7) & 1) == 1);
        }

        [Opcode(0xE6, 0xF6, 0xEE, 0xFE)]
        void Inc((ushort extract, AddressingMode am) addressingResult)
        {
            int value = Memory.Access[addressingResult.extract] + 1 & 0xFF;
            Memory.Access[addressingResult.extract] = (byte)value;
            this.S.Set((int)StatusRegisterFlag.Z, value == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((value >> 7) & 1) == 1);
        }

        [Opcode(0xE8)]
        void Inx((ushort extract, AddressingMode am) addressingResult)
        {
            this.X++;
            this.S.Set((int)StatusRegisterFlag.Z, this.X == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X >> 7) & 1) == 1);
        }

        [Opcode(0xC8)]
        void Iny((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y++;
            this.S.Set((int)StatusRegisterFlag.Z, this.Y == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y >> 7) & 1) == 1);
        }

        [Opcode(0x49, 0x45, 0x55, 0x4D, 0x5D, 0x59, 0x41, 0x51)]
        void Eor((ushort extract, AddressingMode am) addressingResult)
        {
            this.A ^= ((addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract]);
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }

        [Opcode(0x09, 0x05, 0x15, 0x0D, 0x1D, 0x19, 0x01, 0x11)]
        void Ora((ushort extract, AddressingMode am) addressingResult)
        {
            this.A |= ((addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract]);
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }

        [Opcode(0xE0, 0xE4, 0xEC)]
        void Cpx((ushort extract, AddressingMode am) addressingResult)
        {
            var operand = (addressingResult.am == AddressingMode.Immediate) ? 
                addressingResult.extract : Memory.Access[addressingResult.extract];
            var comparison = this.X - operand;
            this.S.Set((int)StatusRegisterFlag.C, this.X >= operand);
            this.S.Set((int)StatusRegisterFlag.Z, comparison == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((comparison >> 7) & 1) == 1);
        }

        [Opcode(0xC0, 0xC4, 0xCC)]
        void Cpy((ushort extract, AddressingMode am) addressingResult)
        {
            var operand = (addressingResult.am == AddressingMode.Immediate) ?
                addressingResult.extract : Memory.Access[addressingResult.extract];
            var comparison = this.Y - operand;
            this.S.Set((int)StatusRegisterFlag.C, this.Y >= operand);
            this.S.Set((int)StatusRegisterFlag.Z, comparison == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((comparison >> 7) & 1) == 1);
        }

        [Opcode(0xC9, 0xC5, 0xD5, 0xCD, 0xDD, 0xD9, 0xC1, 0xD1)]
        void Cmp((ushort extract, AddressingMode am) addressingResult)
        {
            var mv = ((addressingResult.am == AddressingMode.Immediate) ? 
                addressingResult.extract : Memory.Access[addressingResult.extract]);
            var comparison = this.A - mv;
            this.S.Set((int)StatusRegisterFlag.C, this.A >= mv);
            this.S.Set((int)StatusRegisterFlag.Z, comparison == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((comparison >> 7) & 1) == 1);
        }

        [Opcode(0xEA)]
        void Nop((ushort extract, AddressingMode am) addressingResult)
        {
            return;
        }

        [Opcode(0x29, 0x25, 0x35, 0x2D, 0x3D, 0x39, 0x21, 0x31)]
        void And((ushort extract, AddressingMode am) addressingResult)
        {
            this.A &= (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }


        [Opcode(0x90)]
        void Bcc((ushort extract, AddressingMode am) addressingResult)
        {
            if(!this.S.Get((int)StatusRegisterFlag.C))
                this.PC += addressingResult.extract;
        }

        [Opcode(0xB0)]
        void Bcs((ushort extract, AddressingMode am) addressingResult)
        {
            if (this.S.Get((int)StatusRegisterFlag.C))
                this.PC += addressingResult.extract;
        }

        [Opcode(0xF0)]
        void Beq((ushort extract, AddressingMode am) addressingResult)
        {
            if (this.S.Get((int)StatusRegisterFlag.Z))
                this.PC += addressingResult.extract;
        }

        [Opcode(0xD0)]
        void Bne((ushort extract, AddressingMode am) addressingResult)
        {
            if (!this.S.Get((int)StatusRegisterFlag.Z))
                this.PC += addressingResult.extract;
        }

        [Opcode(0x30)]
        void Bmi((ushort extract, AddressingMode am) addressingResult)
        {
            if (this.S.Get((int)StatusRegisterFlag.S))
                this.PC += addressingResult.extract;
        }


        [Opcode(0x10)]
        void Bpl((ushort extract, AddressingMode am) addressingResult)
        {
            if (!this.S.Get((int)StatusRegisterFlag.S))
                this.PC += addressingResult.extract;
        }

        [Opcode(0x50)]
        void Bvc((ushort extract, AddressingMode am) addressingResult)
        {
            if (!this.S.Get((int)StatusRegisterFlag.V))
                this.PC += addressingResult.extract;
        }

        [Opcode(0x70)]
        void Bvs((ushort extract, AddressingMode am) addressingResult)
        {
            if (this.S.Get((int)StatusRegisterFlag.V))
                this.PC += addressingResult.extract;
        }

        [Opcode(0x69, 0x65, 0x75, 0x6D, 0x7D, 0x79, 0x61, 0x71)]
        void Adc((ushort extract, AddressingMode am) addressingResult)
        {
            var mv = ((addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract]);
            this.A = CrossAdcSbc(mv);
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
        }

        [Opcode(0xE9, 0xE5, 0xF5, 0xED, 0xFD, 0xF9, 0xE1, 0xF1)]
        void Sbc((ushort extract, AddressingMode am) addressingResult)
        {
            var mv = ((addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract]);
            this.A = CrossAdcSbc((byte)(~mv));
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
        }

        [Opcode(0xBA)]
        void Tsx((ushort extract, AddressingMode am) addressingResult)
        {
            this.X = (byte)this.SP;
            this.S.Set((int)StatusRegisterFlag.Z, this.X == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X >> 7) & 1) == 1);
        }

        [Opcode(0x9A)]
        void Txs((ushort extract, AddressingMode am) addressingResult)
        {
            this.SP = (ushort)(0x100 + this.X);
        }

        [Opcode(0x48)]
        void Pha((ushort extract, AddressingMode am) addressingResult)
        {
            Memory.Access[this.SP--] = this.A;
        }

        [Opcode(0x08)]
        void Php((ushort extract, AddressingMode am) addressingResult)
        {
            this.S.Set((int)StatusRegisterFlag.B, true);
            Memory.Access[this.SP--] = this.S.ConvertToByte();
            this.S.Set((int)StatusRegisterFlag.B, false);
        }

        [Opcode(0x68)]
        void Pla((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = Memory.Access[++this.SP];
            this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
        }

        [Opcode(0x28)]
        void Plp((ushort extract, AddressingMode am) addressingResult)
        {
            this.S = new BitArray(new byte[] { Memory.Access[++this.SP] });
            this.S.Set((int)StatusRegisterFlag.B, false);
            this.S.Set((int)StatusRegisterFlag.U, true);
        }


        [Opcode(0x24, 0x2C)]
        void Bit((ushort extract, AddressingMode am) addressingResult)
        {
            var mv = Memory.Access[addressingResult.extract];
            int overflowBit = (mv >> 6) & 1;
            int negativeBit = (mv >> 7) & 1;
            this.S.Set((int)StatusRegisterFlag.V, overflowBit == 1);
            this.S.Set((int)StatusRegisterFlag.S, negativeBit == 1);
            this.S.Set((int)StatusRegisterFlag.Z, (this.A & mv) == 0);
        }

        [Opcode(0x00)]
        void Brk((ushort extract, AddressingMode am) addressingResult)
        {
            Memory.Access[this.SP--] = (byte)(this.PC & 0xFF);
            Memory.Access[this.SP--] = (byte)((this.PC >> 8) & 0xFF);
            Memory.Access[this.SP--] = this.S.ConvertToByte();
            this.PC = VECTOR_IRQ;
        }

        [Opcode(0x40)]
        void Rti((ushort extract, AddressingMode am) addressingResult)
        {
            this.S = new BitArray(new byte[] { Memory.Access[++this.SP] });
            this.S.Set((int)StatusRegisterFlag.B, false);
            this.S.Set((int)StatusRegisterFlag.U, true);

            var low = Memory.Access[++this.SP];
            var high = Memory.Access[++this.SP];
            var address = (high << 8) | low;
            this.PC = (ushort)address;
        }

        [Opcode(0x60)]
        void Rts((ushort extract, AddressingMode am) addressingResult)
        {
            var low = Memory.Access[++this.SP];
            var high = Memory.Access[++this.SP];
            var address = ((high << 8) | low);
            this.PC = (ushort)(address + 1);
        }

        [Opcode(0x0A, 0x06, 0x16, 0x0E, 0x1E)]
        void Asl((ushort extract, AddressingMode am) addressingResult)
        {
            if (addressingResult.am == AddressingMode.Accumulator)
            {
                this.S.Set((int)StatusRegisterFlag.C, ((this.A >> 7) & 1) == 1);
                this.A <<= 1;
                this.A ^= (byte)((-0 ^ this.A) & (1 << 0));
                this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
            }
            else
            {
                byte mv = Memory.Access[addressingResult.extract];
                this.S.Set((int)StatusRegisterFlag.C, ((mv >> 7) & 1) == 1);
                mv <<= 1;
                mv ^= (byte)((-0 ^ mv) & (1 << 0));
                this.A ^= (byte)((-0 ^ mv) & (1 << 0));
                this.S.Set((int)StatusRegisterFlag.Z, mv == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((mv >> 7) & 1) == 1);
                Memory.Access[addressingResult.extract] = mv;
            }
        }

        [Opcode(0x2A, 0x26, 0x36, 0x2E, 0x3E)]
        void Rol((ushort extract, AddressingMode am) addressingResult)
        {
            bool carry = this.S.Get((int)StatusRegisterFlag.C);
            if (addressingResult.am == AddressingMode.Accumulator)
            {
                this.S.Set((int)StatusRegisterFlag.C, ((this.A >> 7) & 1) == 1);
                this.A <<= 1;
                this.A |= (byte)(carry ? 1 : 0);
                this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
            }
            else
            {
                byte mv = Memory.Access[addressingResult.extract];
                this.S.Set((int)StatusRegisterFlag.C, ((mv >> 7) & 1) == 1);
                mv <<= 1;
                mv |= (byte)(carry ? 1 : 0);
                this.S.Set((int)StatusRegisterFlag.Z, mv == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((mv >> 7) & 1) == 1);
                Memory.Access[addressingResult.extract] = mv;
            }
        }

        [Opcode(0x6A, 0x66, 0x76, 0x6E, 0x7E)]
        void Ror((ushort extract, AddressingMode am) addressingResult)
        {
            bool carry = this.S.Get((int)StatusRegisterFlag.C);
            if (addressingResult.am == AddressingMode.Accumulator)
            {
                this.S.Set((int)StatusRegisterFlag.C, ((this.A >> 0) & 1) == 1);
                this.A >>= 1;
                this.A |= (byte)(carry ? 0x80 : 0);
                this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
            }
            else
            {
                byte mv = Memory.Access[addressingResult.extract];
                this.S.Set((int)StatusRegisterFlag.C, ((mv >> 0) & 1) == 1);
                mv >>= 1;
                mv |= (byte)(carry ? 0x80 : 0);
                this.S.Set((int)StatusRegisterFlag.Z, mv == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((mv >> 7) & 1) == 1);
                Memory.Access[addressingResult.extract] = mv;
            }
        }


        [Opcode(0x20)]
        void Jsr((ushort extract, AddressingMode am) addressingResult)
        {
            ushort address = (ushort)(PC - 1);
            Memory.Access[this.SP--] = (byte)((address >> 8) & 0xFF);
            Memory.Access[this.SP--] = (byte)(address & 0xFF);
            this.PC = addressingResult.extract;
        }


        [Opcode(0x4A, 0x46, 0x56, 0x4E, 0x5E)]
        void Lsr((ushort extract, AddressingMode am) addressingResult)
        {
            if (addressingResult.am == AddressingMode.Accumulator)
            {
                this.S.Set((int)StatusRegisterFlag.C, ((this.A >> 0) & 1) == 1);
                this.A >>= 1;
                this.S.Set((int)StatusRegisterFlag.Z, this.A == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((this.A >> 7) & 1) == 1);
            }
            else
            {
                var mv = Memory.Access[addressingResult.extract];
                this.S.Set((int)StatusRegisterFlag.C, ((mv >> 0) & 1) == 1);
                mv >>= 1;
                this.S.Set((int)StatusRegisterFlag.Z, mv == 0);
                this.S.Set((int)StatusRegisterFlag.S, ((mv >> 7) & 1) == 1);
                Memory.Access[addressingResult.extract] = mv;
            }
        }

        #region Addressing Modes

        public enum AddressingMode : int
        {
            ZeroPage,
            ZeroPageIndexedX,
            ZeroPageIndexedY,
            Indirect,
            IndexedIndirect,
            IndirectIndexed,
            Absolute,
            AbsoluteIndexedX,
            AbsoluteIndexedY,
            Accumulator,
            Immediate,
            Relative,
            Implied
        };

        [Opcode(0x65, 0x25, 0x06, 0x45, 0xE6, 0x26, 0x66, 0xE5, 0xA5, 0x24, 0xA6, 0x85, 0xA4, 0xC5, 0x86, 0x84, 0x46, 0xE4, 0xC4, 0xC6, 0x05)]
        (ushort extract, AddressingMode addressingMode) ZeroPage()
        {
            var mv = Memory.Access[(ushort)(this.PC + 1)];
            this.PC += 2;
#if DEBUG
            Debugger.Out.PrintZeroPage(mv, Memory.Access[mv]);
#endif
            return (extract: mv, addressingMode: AddressingMode.ZeroPage);
        }
        
        [Opcode(0x75, 0x35, 0x16, 0xD6, 0x55, 0xF6, 0x36, 0x76, 0xF5, 0xB5, 0x95, 0xD5, 0xB4, 0x56, 0x94, 0x15)]
        (ushort extract, AddressingMode addressingMode) ZeroPageIndexedX()
        {
            var mv = Memory.Access[(ushort)(this.PC + 1)];
            mv += this.X;
            this.PC += 2;
            return (extract: mv, addressingMode: AddressingMode.ZeroPageIndexedX);
        }

        [Opcode(0xB6, 0x96)]
        (ushort extract, AddressingMode addressingMode) ZeroPageIndexedY()
        {
            var mv = Memory.Access[(ushort)(this.PC + 1)];
            mv += this.Y;
            this.PC += 2;
            return (extract: mv, addressingMode: AddressingMode.ZeroPageIndexedY);
        }

        [Opcode(0x0E, 0x0D, 0x20, 0x2E, 0x2D, 0x2C, 0x4E, 0x4D, 0x4C, 0x6E, 0x6D, 0x8E, 0x8D, 0x8C, 0xAE, 0xAD, 0xAC, 0xCE, 0xCD, 0xCC, 0xEE, 0xED, 0xEC)]
        (ushort extract, AddressingMode addressingMode) Absolute()
        {
            var mv = Memory.Access.MmioReadShort((ushort)(this.PC + 1));
            this.PC += 3;
#if DEBUG
            Debugger.Out.PrintAbsolute(mv, Memory.Access[mv]);
#endif
            return (extract: mv, addressingMode: AddressingMode.Absolute);
        }

        [Opcode(0x1E, 0x1D, 0x3E, 0x3D, 0x5E, 0x5D, 0x7E, 0x7D, 0x9D, 0xBD, 0xBC, 0xDE, 0xDD, 0xFE, 0xFD)]
        (ushort extract, AddressingMode addressingMode) AbsoluteIndexedX()
        {
            var mv = Memory.Access.MmioReadShort((ushort)(this.PC + 1));
            mv += this.X;
            this.PC += 3;
            return (extract: mv, addressingMode: AddressingMode.AbsoluteIndexedX);
        }

        [Opcode(0x19, 0x39, 0x59, 0x79, 0x99, 0xB9, 0xBE, 0xD9, 0xF9)]
        (ushort extract, AddressingMode addressingMode) AbsoluteIndexedY()
        {
            var mv = Memory.Access.MmioReadShort((ushort)(this.PC + 1));
            mv += this.Y;
            this.PC += 3;
            return (extract: mv, addressingMode: AddressingMode.AbsoluteIndexedY);
        }

        [Opcode(0x6C)]
        (ushort extract, AddressingMode addressingMode) Indirect()
        {
            var mv = Memory.Access.MmioReadShort((ushort)(this.PC + 1));
            this.PC += 3;
            return (extract: mv, addressingMode: AddressingMode.Indirect);
        }

        [Opcode(0x01, 0x21, 0x41, 0x61, 0x81, 0xA1, 0xC1, 0xE1)]
        (ushort extract, AddressingMode addressingMode) IndexedIndirect()
        {
            var mv = Memory.Access[(ushort)(this.PC + 1)];
            mv += this.X;
            this.PC += 2;

            var indirectMemoryAddress = Memory.Access.MmioWrapReadShort(mv);
#if DEBUG
            Debugger.Out.PrintIndexedIndirect((byte)(mv - this.X), mv, indirectMemoryAddress, Memory.Access[indirectMemoryAddress]);
#endif
            return (extract: indirectMemoryAddress, addressingMode: AddressingMode.IndexedIndirect);
        }

        [Opcode(0x11, 0x31, 0x51, 0x71, 0x91, 0xB1, 0xD1, 0xF1)]
        (ushort extract, AddressingMode addressingMode) IndirectIndexed()
        {
            byte mv = Memory.Access[(ushort)(this.PC + 1)];
            this.PC += 2;

            var indirectMemoryAddress = (ushort)((Memory.Access.MmioReadShort(mv) + this.Y) & 0xFFFF);
#if DEBUG
            Debugger.Out.PrintIndirectIndexed((byte)(mv - this.Y), mv, indirectMemoryAddress, Memory.Access[indirectMemoryAddress]);
#endif
            return (extract: indirectMemoryAddress, addressingMode: AddressingMode.IndirectIndexed);
        }

        [Opcode(0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0)]
        (ushort extract, AddressingMode addressingMode) Relative()
        {
            byte mv = Memory.Access[(ushort)(this.PC + 1)];
            this.PC += 2;
#if DEBUG
            Debugger.Out.PrintRelative(mv, (ushort)(this.PC + mv));
#endif
            return (extract: mv, addressingMode: AddressingMode.Relative);
        }

        [Opcode(0x0A, 0x2A, 0x4A, 0x6A)]
        (ushort extract, AddressingMode addressingMode) Accumulator()
        {
            this.PC += 1;
#if DEBUG
            Debugger.Out.PrintAccumulator();
#endif
            return (extract: default(ushort), addressingMode: AddressingMode.Accumulator);
        }

        [Opcode(0x00, 0x08, 0x18, 0x28, 0x38, 0x40, 0x48, 0x58, 0x60, 0x68, 0x78, 0x88, 0x8A, 0x98, 0x9A, 0xA8, 0xAA, 0xB8, 0xBA, 0xC8, 0xCA, 0xD8, 0xE8, 0xEA, 0xF8)]
        (ushort extract, AddressingMode addressingMode) Implied()
        {
            this.PC += 1;
#if DEBUG
            Debugger.Out.PrintImplied();
#endif
            return (extract: default(ushort), addressingMode: AddressingMode.Implied);
        }

        [Opcode(0x29, 0xC9, 0xE0, 0xC0, 0x49, 0xA9, 0xA2, 0xA0, 0x09, 0xE9, 0x69)]
        (ushort extract, AddressingMode addressingMode) Immediate()
        {
            var mv = Memory.Access[(ushort)(this.PC + 1)];
            this.PC += 2;
#if DEBUG
            Debugger.Out.PrintImmediate(mv);
#endif
            return (extract: mv, addressingMode: AddressingMode.Immediate);
        }

        #endregion

        public delegate void Op((ushort extract, AddressingMode am) addressingResult);
        public Op[] Instructions;

        public delegate (ushort extract, AddressingMode addressingMode) Am();
        public Am[] AddressingModes;

        public int[] Cycles =
        {
            7, 6, 0, 0, 0, 3, 5, 0, 3, 2, 2, 0, 0, 5, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0,
            6, 6, 0, 0, 3, 3, 5, 0, 4, 2, 2, 0, 4, 4, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0,
            6, 6, 0, 0, 0, 3, 5, 0, 3, 2, 2, 0, 3, 4, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0,
            6, 6, 0, 0, 0, 3, 5, 0, 4, 2, 2, 0, 5, 4, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0,
            0, 6, 0, 0, 3, 3, 3, 0, 2, 0, 2, 0, 4, 4, 4, 0,
            2, 6, 0, 0, 4, 4, 4, 0, 2, 5, 2, 0, 0, 5, 0, 0,
            2, 6, 2, 0, 3, 3, 3, 0, 2, 2, 2, 0, 4, 4, 4, 0,
            2, 5, 0, 0, 4, 4, 4, 0, 2, 4, 2, 0, 4, 4, 4, 0,
            2, 6, 0, 0, 3, 3, 5, 0, 2, 2, 2, 0, 4, 4, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0,
            2, 6, 0, 0, 3, 3, 5, 0, 2, 2, 2, 0, 4, 4, 6, 0,
            2, 5, 0, 0, 0, 4, 6, 0, 2, 4, 0, 0, 0, 4, 7, 0
        };

        public CPU()
        {
            Instructions = new Op[56]
            {
                Lda, Ldx, Ldy, Sta,
                Sty, Tax, Tay, Tsx,
                Adc, Dec, Dex, Dey,
                Inc, Inx, Iny, Sbc,
                Brk, Asl, Bit, Eor,
                Lsr, Ora, Rol, Ror,
                Bcc, Bcs, Beq, Bmi,
                Bne, Bpl, Bvc, Bvs,
                Jmp, Jsr, Rti, Rts,
                Clc, Cld, Cli, Clv,
                Cpx, Cpy, Sec, Sed,
                Pha, Php, Pla, Plp,
                Stx, Tya, Cmp, Sei,
                Txs, Nop, And, Txa
            };

            AddressingModes = new Am[13] 
            {
                Accumulator, Implied, Immediate, Relative,
                Absolute, AbsoluteIndexedX, AbsoluteIndexedY,
                Indirect, IndexedIndirect, IndirectIndexed,
                ZeroPage, ZeroPageIndexedX, ZeroPageIndexedY
            };

            (Op I, Am AM) Bind(int instructionIndex, int addressingModeIndex) =>
                (I: Instructions[instructionIndex], AM: AddressingModes[addressingModeIndex]);

            _OpcodesTable = new ValueTuple<Op, Am>[0xFF];
            for(int i = 0; i < Instructions.Length; i++)
            {
                var instructionOpcodes = (Instructions[i].Method.GetCustomAttributes(false)[0] as Opcode).Opcodes;
                for(int j = 0; j < instructionOpcodes.Length; j++)
                {
                    byte instructionOpcode = instructionOpcodes[j];
                    for(int k = 0; k < AddressingModes.Length; k++)
                    {
                        var addressingModeOpcodes = (AddressingModes[k].Method.GetCustomAttributes(false)[0] as Opcode).Opcodes;
                        for(int l = 0; l < addressingModeOpcodes.Length; l++)
                        {
                            byte addressingModeOpcode = addressingModeOpcodes[l];
                            if (instructionOpcode == addressingModeOpcode)
                            {
                                var operation = Bind(i, k);    
                                _OpcodesTable[instructionOpcode] = operation;
                            }
                        }
                    }
                }
            }

            this.SP = 0x1FD;
            this.S.Set((int)StatusRegisterFlag.I, true);
            this.S.Set((int)StatusRegisterFlag.U, true);
            this.PC = Memory.Access.MmioReadShort(VECTOR_RST);
        }

        public void Update()
        {
            while (true)
            {
                var opcode = Memory.Access[this.PC];
#if DEBUG
                Debugger.Out.PC = this.PC;
                Debugger.Out.A = this.A;
                Debugger.Out.X = this.X;
                Debugger.Out.Y = this.Y;
                Debugger.Out.SP = (byte)this.SP;
                Debugger.Out.S = this.S.ConvertToByte();
                Debugger.Out.Opcode = opcode;
                Debugger.Out.Instruction = this[opcode].I.Method.Name;
#endif
                var addressingResult = this[opcode].AM();
                this[opcode].I(addressingResult);
            }
        }
    }
}
