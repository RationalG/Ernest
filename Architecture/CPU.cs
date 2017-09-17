using Ernest.Attributes;
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
        public UInt16 PC;

        /// <summary>
        /// Stack Pointer.
        /// </summary>
        public UInt16 SP;

        /// <summary>
        /// Status register.
        /// </summary>
        BitArray S = new BitArray(8);

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
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0x98)]
        void Tya((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = this.Y;
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A | 0x80) == 0x80) ? true : false);
        }


        [Opcode(0xAA)]
        void Tax((ushort extract, AddressingMode am) addressingResult)
        {
            this.X = this.A;
            this.S.Set((int)StatusRegisterFlag.Z, (this.X == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xA8)]
        void Tay((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y = this.A;
            this.S.Set((int)StatusRegisterFlag.Z, (this.Y == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y | 0x80) == 0x80) ? true : false);
        }


        [Opcode(0xA9, 0xA5, 0xB5, 0xAD, 0xBD, 0xB9, 0xA1, 0xB1)]
        void Lda((ushort extract, AddressingMode am) addressingResult)
        {
            this.A = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xA2, 0xA6, 0xB6, 0xAE, 0xBE)]
        void Ldx((ushort extract, AddressingMode am) addressingResult)
        {
            this.X = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.X == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xA0, 0xA4, 0xB4, 0xAC, 0xBC)]
        void Ldy((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y = (addressingResult.am == AddressingMode.Immediate) ?
                (byte)addressingResult.extract : Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.Y == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xC6, 0xD6, 0xCE, 0xDE)]
        void Dec((ushort extract, AddressingMode am) addressingResult)
        {
            int value = Memory.Access[addressingResult.extract] - 1;
            Memory.Access[addressingResult.extract] = (byte)value;
            this.S.Set((int)StatusRegisterFlag.Z, (value == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((value | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xCA)]
        void Dex((ushort extract, AddressingMode am) addressingResult)
        {
            this.X--;
            this.S.Set((int)StatusRegisterFlag.Z, (this.X == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0x88)]
        void Dey((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y--;
            this.S.Set((int)StatusRegisterFlag.Z, (this.Y == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xE6, 0xF6, 0xEE, 0xFE)]
        void Inc((ushort extract, AddressingMode am) addressingResult)
        {
            int value = Memory.Access[addressingResult.extract] + 1;
            Memory.Access[addressingResult.extract] = (byte)value;
            this.S.Set((int)StatusRegisterFlag.Z, (value == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((value | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xE8)]
        void Inx((ushort extract, AddressingMode am) addressingResult)
        {
            this.X++;
            this.S.Set((int)StatusRegisterFlag.Z, (this.X == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.X | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xC8)]
        void Iny((ushort extract, AddressingMode am) addressingResult)
        {
            this.Y++;
            this.S.Set((int)StatusRegisterFlag.Z, (this.Y == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.Y | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0x49, 0x45, 0x55, 0x4D, 0x5D, 0x59, 0x41, 0x51)]
        void Eor((ushort extract, AddressingMode am) addressingResult)
        {
            this.A ^= Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0x09, 0x05, 0x15, 0x0D, 0x1D, 0x19, 0x01, 0x11)]
        void Ora((ushort extract, AddressingMode am) addressingResult)
        {
            this.A |= Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xE0, 0xE4, 0xEC)]
        void Cpx((ushort extract, AddressingMode am) addressingResult)
        {
            var value = this.X - Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.C, (this.X >=  value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.Z, (this.X == value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((value | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xC0, 0xC4, 0xCC)]
        void Cpy((ushort extract, AddressingMode am) addressingResult)
        {
            var value = this.Y - Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.C, (this.Y >= value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.Z, (this.Y == value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((value | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xC9, 0xC5, 0xD5, 0xCD, 0xDD, 0xD9, 0xC1, 0xD1)]
        void Cmp((ushort extract, AddressingMode am) addressingResult)
        {
            var value = this.A - Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.C, (this.A >= value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == value) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((value | 0x80) == 0x80) ? true : false);
        }

        [Opcode(0xEA)]
        void Nop((ushort extract, AddressingMode am) addressingResult)
        {
            return;
        }

        [Opcode(0x29, 0x25, 0x35, 0x2D, 0x3D, 0x39, 0x21, 0x31)]
        void And((ushort extract, AddressingMode am) addressingResult)
        {
            this.A &= Memory.Access[addressingResult.extract];
            this.S.Set((int)StatusRegisterFlag.Z, (this.A == 0) ? true : false);
            this.S.Set((int)StatusRegisterFlag.S, ((this.A| 0x80) == 0x80) ? true : false);
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

        [Opcode(0x2A, 0x26, 0x36, 0x2E, 0x3E)]
        void Rol((ushort extract, AddressingMode am) addressingResult)
        {
 
        }

        [Opcode(0x6A, 0x66, 0x76, 0x6E, 0x7E)]
        void Ror((ushort extract, AddressingMode am) addressingResult)
        {

        }


        [Opcode(0xBA)]
        void Tsx((ushort extract, AddressingMode am) addressingResult){ }

        [Opcode(0x69, 0x65, 0x75, 0x6D, 0x7D, 0x79, 0x61, 0x71)]
        void Adc((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0xE9, 0xE5, 0xF5, 0xED, 0xFD, 0xF9, 0xE1, 0xF1)]
        void Sbc((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x00)]
        void Brk((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x0A, 0x06, 0x16, 0x0E, 0x1E)]
        void Asl((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x24, 0x2C)]
        void Bit((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x20)]
        void Jsr((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x40)]
        void Rti((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x60)]
        void Rts((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x48)]
        void Pha((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x08)]
        void Php((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x68)]
        void Pla((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x28)]
        void Plp((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x9A)]
        void Txs((ushort extract, AddressingMode am) addressingResult) { }

        [Opcode(0x4A, 0x46, 0x56, 0x4E, 0x5E)]
        void Lsr((ushort extract, AddressingMode am) addressingResult)
        {
        }

        #region Addressing Modes

        public enum AddressingMode : int
        {
            ZeroPage,
            ZeroPageIndexedX,
            ZeroPageIndexedY,
            Indirect,
            IndirectIndexedX,
            IndirectIndexedY,
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
            return (extract: 0, addressingMode: AddressingMode.ZeroPage);
        }
        
        [Opcode(0x75, 0x35, 0x16, 0xD6, 0x55, 0xF6, 0x36, 0x76, 0xF5, 0xB5, 0x95, 0xD5, 0xB4, 0x56, 0x94, 0x15)]
        (ushort extract, AddressingMode addressingMode) ZeroPageIndexedX()
        {
            return (extract: 0, addressingMode: AddressingMode.ZeroPageIndexedX);
        }

        [Opcode(0xB6, 0x96)]
        (ushort extract, AddressingMode addressingMode) ZeroPageIndexedY()
        {
            return (extract: 0, addressingMode: AddressingMode.ZeroPageIndexedY);
        }

        [Opcode(0x0E, 0x0D, 0x20, 0x2E, 0x2D, 0x2C, 0x4E, 0x4D, 0x4C, 0x6E, 0x6D, 0x8E, 0x8D, 0x8C, 0xAE, 0xAD, 0xAC, 0xCE, 0xCD, 0xCC, 0xEE, 0xED, 0xEC)]
        (ushort extract, AddressingMode addressingMode) Absolute()
        {
            return (extract: 0, addressingMode: AddressingMode.Absolute);
        }

        [Opcode(0x1E, 0x1D, 0x3E, 0x3D, 0x5E, 0x5D, 0x7E, 0x7D, 0x9D, 0xBD, 0xBC, 0xDE, 0xDD, 0xFE, 0xFD)]
        (ushort extract, AddressingMode addressingMode) AbsoluteIndexedX()
        {
            return (extract: 0, addressingMode: AddressingMode.AbsoluteIndexedX);
        }

        [Opcode(0x19, 0x39, 0x59, 0x79, 0x99, 0xB9, 0xBE, 0xD9, 0xF9)]
        (ushort extract, AddressingMode addressingMode) AbsoluteIndexedY()
        {
            return (extract: 0, addressingMode: AddressingMode.AbsoluteIndexedY);
        }

        [Opcode(0x6C)]
        (ushort extract, AddressingMode addressingMode) Indirect()
        {
            return (extract: 0, addressingMode: AddressingMode.Indirect);
        }

        [Opcode(0x01, 0x21, 0x41, 0x61, 0x81, 0xA1, 0xC1, 0xE1)]
        (ushort extract, AddressingMode addressingMode) IndirectIndexedX()
        {
            return (extract: 0, addressingMode: AddressingMode.IndirectIndexedX);
        }

        [Opcode(0x11, 0x31, 0x51, 0x71, 0x91, 0xB1, 0xD1, 0xF1)]
        (ushort extract, AddressingMode addressingMode) IndirectIndexedY()
        {
            return (extract: 0, addressingMode: AddressingMode.IndirectIndexedY);
        }

        [Opcode(0x0A, 0x2A, 0x4A, 0x6A)]
        (ushort extract, AddressingMode addressingMode) Accumulator()
        {
            return (extract: 0, addressingMode: AddressingMode.Accumulator);
        }

        [Opcode(0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0)]
        (ushort extract, AddressingMode addressingMode) Relative()
        {
            return (extract: 0, addressingMode: AddressingMode.Relative);
        }

        [Opcode(0x00, 0x08, 0x18, 0x28, 0x38, 0x40, 0x48, 0x58, 0x60, 0x68, 0x78, 0x88, 0x8A, 0x98, 0x9A, 0xA8, 0xAA, 0xB8, 0xBA, 0xC8, 0xCA, 0xD8, 0xE8, 0xEA, 0xF8)]
        (ushort extract, AddressingMode addressingMode) Implied()
        {
            return (extract: 0, addressingMode: AddressingMode.Implied);
        }

        [Opcode(0x60, 0x29, 0xC9, 0xE0, 0xC0, 0x49, 0xA9, 0xA2, 0xA0, 0x09, 0xE9)]
        (ushort extract, AddressingMode addressingMode) Immediate()
        {
            return (extract: 0, addressingMode: AddressingMode.Immediate);
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
                Indirect, IndirectIndexedX, IndirectIndexedY,
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
#if DEBUG
                                Console.WriteLine($"{operation.I.Method.Name} | {operation.AM.Method.Name}");
#endif
                                _OpcodesTable[instructionOpcode] = operation;
                            }
                        }
                    }
                }
            }

            this.SP = 0x1FF;
            this.PC = Memory.Access.MmioReadShort(VECTOR_RST);
        }

        public void Update()
        {
            while (true)
            {
                var opcode = Memory.Access[this.PC];
                var addressingResult = this[opcode].AM();
                this[opcode].I(addressingResult);
#if DEBUG
                Console.WriteLine($"{this[opcode].I.Method.Name} | {this[opcode].AM.Method.Name}");
                Console.ReadLine();
#endif
            }
        }
    }
}
