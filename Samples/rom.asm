;-------------------------------------------------------------------------------
; rom.nes disasembled by DISASM6 v1.4
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
            .db %00000000      ; Mirroring: Horizontal
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 0
            .db %00000000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail 
            .hex 00 00 00 00    

;-------------------------------------------------------------------------------
; Program Origin
;-------------------------------------------------------------------------------
            .org $c000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      JMP __c5f5         ; $c000: 4c f5 c5  

;-------------------------------------------------------------------------------
            RTS                ; $c003: 60        

;-------------------------------------------------------------------------------
            SEI                ; $c004: 78        
            CLD                ; $c005: d8        
            LDX #$ff           ; $c006: a2 ff     
            TXS                ; $c008: 9a        
__c009:     LDA $2002          ; $c009: ad 02 20  
            BPL __c009         ; $c00c: 10 fb     
__c00e:     LDA $2002          ; $c00e: ad 02 20  
            BPL __c00e         ; $c011: 10 fb     
            LDA #$00           ; $c013: a9 00     
            STA $2000          ; $c015: 8d 00 20  
            STA $2001          ; $c018: 8d 01 20  
            STA $2005          ; $c01b: 8d 05 20  
            STA $2005          ; $c01e: 8d 05 20  
            LDA $2002          ; $c021: ad 02 20  
            LDX #$20           ; $c024: a2 20     
            STX $2006          ; $c026: 8e 06 20  
            LDX #$00           ; $c029: a2 00     
            STX $2006          ; $c02b: 8e 06 20  
            LDX #$00           ; $c02e: a2 00     
            LDY #$0f           ; $c030: a0 0f     
            LDA #$00           ; $c032: a9 00     
__c034:     STA $2007          ; $c034: 8d 07 20  
            DEX                ; $c037: ca        
            BNE __c034         ; $c038: d0 fa     
            DEY                ; $c03a: 88        
            BNE __c034         ; $c03b: d0 f7     
            LDA #$3f           ; $c03d: a9 3f     
            STA $2006          ; $c03f: 8d 06 20  
            LDA #$00           ; $c042: a9 00     
            STA $2006          ; $c044: 8d 06 20  
            LDX #$00           ; $c047: a2 00     
__c049:     LDA __ff78,x       ; $c049: bd 78 ff  
            STA $2007          ; $c04c: 8d 07 20  
            INX                ; $c04f: e8        
            CPX #$20           ; $c050: e0 20     
            BNE __c049         ; $c052: d0 f5     
            LDA #$c0           ; $c054: a9 c0     
            STA $4017          ; $c056: 8d 17 40  
            LDA #$00           ; $c059: a9 00     
            STA $4015          ; $c05b: 8d 15 40  
            LDA #$78           ; $c05e: a9 78     
            STA $d0            ; $c060: 85 d0     
            LDA #$fb           ; $c062: a9 fb     
            STA $d1            ; $c064: 85 d1     
            LDA #$7f           ; $c066: a9 7f     
            STA $d3            ; $c068: 85 d3     
            LDY #$00           ; $c06a: a0 00     
            STY $2006          ; $c06c: 8c 06 20  
            STY $2006          ; $c06f: 8c 06 20  
__c072:     LDA #$00           ; $c072: a9 00     
            STA $d7            ; $c074: 85 d7     
            LDA #$07           ; $c076: a9 07     
            STA $d0            ; $c078: 85 d0     
            LDA #$c3           ; $c07a: a9 c3     
            STA $d1            ; $c07c: 85 d1     
            JSR __c2a7         ; $c07e: 20 a7 c2  
__c081:     JSR __c28d         ; $c081: 20 8d c2  
            LDX #$12           ; $c084: a2 12     
            JSR __c261         ; $c086: 20 61 c2  
            LDA $d5            ; $c089: a5 d5     
            LSR                ; $c08b: 4a        
            LSR                ; $c08c: 4a        
            LSR                ; $c08d: 4a        
            BCS __c0ac         ; $c08e: b0 1c     
            LSR                ; $c090: 4a        
            BCS __c09f         ; $c091: b0 0c     
            LSR                ; $c093: 4a        
            BCS __c0bd         ; $c094: b0 27     
            LSR                ; $c096: 4a        
            BCS __c09c         ; $c097: b0 03     
            JMP __c081         ; $c099: 4c 81 c0  

;-------------------------------------------------------------------------------
__c09c:     JMP __c126         ; $c09c: 4c 26 c1  

;-------------------------------------------------------------------------------
__c09f:     JSR __c66f         ; $c09f: 20 6f c6  
            DEC $d7            ; $c0a2: c6 d7     
            BPL __c081         ; $c0a4: 10 db     
            LDA #$0d           ; $c0a6: a9 0d     
            STA $d7            ; $c0a8: 85 d7     
            BNE __c081         ; $c0aa: d0 d5     
__c0ac:     JSR __c66f         ; $c0ac: 20 6f c6  
            INC $d7            ; $c0af: e6 d7     
            LDA $d7            ; $c0b1: a5 d7     
            CMP #$0e           ; $c0b3: c9 0e     
            BCC __c081         ; $c0b5: 90 ca     
            LDA #$00           ; $c0b7: a9 00     
            STA $d7            ; $c0b9: 85 d7     
            BEQ __c081         ; $c0bb: f0 c4     
__c0bd:     JSR __c689         ; $c0bd: 20 89 c6  
            LDA $d7            ; $c0c0: a5 d7     
            BEQ __c0ca         ; $c0c2: f0 06     
            JSR __c0ed         ; $c0c4: 20 ed c0  
            JMP __c081         ; $c0c7: 4c 81 c0  

;-------------------------------------------------------------------------------
__c0ca:     LDA #$00           ; $c0ca: a9 00     
            STA $d8            ; $c0cc: 85 d8     
            INC $d7            ; $c0ce: e6 d7     
__c0d0:     JSR __c0ed         ; $c0d0: 20 ed c0  
            INC $d7            ; $c0d3: e6 d7     
            LDA $d7            ; $c0d5: a5 d7     
            CMP #$0e           ; $c0d7: c9 0e     
            BNE __c0d0         ; $c0d9: d0 f5     
            LDA #$00           ; $c0db: a9 00     
            STA $d7            ; $c0dd: 85 d7     
            LDA $d8            ; $c0df: a5 d8     
            BEQ __c0e5         ; $c0e1: f0 02     
            LDA #$ff           ; $c0e3: a9 ff     
__c0e5:     STA $00            ; $c0e5: 85 00     
            JSR __c1ed         ; $c0e7: 20 ed c1  
            JMP __c081         ; $c0ea: 4c 81 c0  

;-------------------------------------------------------------------------------
__c0ed:     LDA $d7            ; $c0ed: a5 d7     
            ASL                ; $c0ef: 0a        
            TAX                ; $c0f0: aa        
            LDA __c10a,x       ; $c0f1: bd 0a c1  
            STA $0200          ; $c0f4: 8d 00 02  
            LDA __c10b,x       ; $c0f7: bd 0b c1  
            STA $0201          ; $c0fa: 8d 01 02  
            LDA #$c1           ; $c0fd: a9 c1     
            PHA                ; $c0ff: 48        
            LDA #$de           ; $c100: a9 de     
            PHA                ; $c102: 48        
            LDA #$00           ; $c103: a9 00     
            STA $00            ; $c105: 85 00     
            JMP ($0200)        ; $c107: 6c 00 02  

;-------------------------------------------------------------------------------
__c10a:     .hex 2d            ; $c10a: 2d        Suspected data
__c10b:     .hex c7 2d         ; $c10b: c7 2d     Invalid Opcode - DCP $2d
            .hex c7 db         ; $c10d: c7 db     Invalid Opcode - DCP $db
            .hex c7 85         ; $c10f: c7 85     Invalid Opcode - DCP $85
            INY                ; $c111: c8        
            DEC __f8cb,x       ; $c112: de cb f8  
            CMP __ceee         ; $c115: cd ee ce  
            LDX #$cf           ; $c118: a2 cf     
            .hex 74 d1         ; $c11a: 74 d1     Invalid Opcode - NOP $d1,x
            .hex fb d4 d4      ; $c11c: fb d4 d4  Invalid Opcode - ISC __d4d4,y
            CMP ($4a,x)        ; $c11f: c1 4a     
            .hex df b8 db      ; $c121: df b8 db  Invalid Opcode - DCP __dbb8,x
            TAX                ; $c124: aa        
            .hex e1            ; $c125: e1        Suspected data
__c126:     LDA #$00           ; $c126: a9 00     
            STA $d7            ; $c128: 85 d7     
            LDA #$92           ; $c12a: a9 92     
            STA $d0            ; $c12c: 85 d0     
            LDA #$c4           ; $c12e: a9 c4     
            STA $d1            ; $c130: 85 d1     
            JSR __c2a7         ; $c132: 20 a7 c2  
__c135:     JSR __c28d         ; $c135: 20 8d c2  
            LDX #$0f           ; $c138: a2 0f     
            JSR __c261         ; $c13a: 20 61 c2  
            LDA $d5            ; $c13d: a5 d5     
            LSR                ; $c13f: 4a        
            LSR                ; $c140: 4a        
            LSR                ; $c141: 4a        
            BCS __c160         ; $c142: b0 1c     
            LSR                ; $c144: 4a        
            BCS __c153         ; $c145: b0 0c     
            LSR                ; $c147: 4a        
            BCS __c171         ; $c148: b0 27     
            LSR                ; $c14a: 4a        
            BCS __c150         ; $c14b: b0 03     
            JMP __c135         ; $c14d: 4c 35 c1  

;-------------------------------------------------------------------------------
__c150:     JMP __c072         ; $c150: 4c 72 c0  

;-------------------------------------------------------------------------------
__c153:     JSR __c66f         ; $c153: 20 6f c6  
            DEC $d7            ; $c156: c6 d7     
            BPL __c135         ; $c158: 10 db     
            LDA #$0a           ; $c15a: a9 0a     
            STA $d7            ; $c15c: 85 d7     
            BNE __c135         ; $c15e: d0 d5     
__c160:     JSR __c66f         ; $c160: 20 6f c6  
            INC $d7            ; $c163: e6 d7     
            LDA $d7            ; $c165: a5 d7     
            CMP #$0b           ; $c167: c9 0b     
            BCC __c135         ; $c169: 90 ca     
            LDA #$00           ; $c16b: a9 00     
            STA $d7            ; $c16d: 85 d7     
            BEQ __c135         ; $c16f: f0 c4     
__c171:     JSR __c689         ; $c171: 20 89 c6  
            LDA $d7            ; $c174: a5 d7     
            BEQ __c17e         ; $c176: f0 06     
            JSR __c1a1         ; $c178: 20 a1 c1  
            JMP __c135         ; $c17b: 4c 35 c1  

;-------------------------------------------------------------------------------
__c17e:     LDA #$00           ; $c17e: a9 00     
            STA $d8            ; $c180: 85 d8     
            INC $d7            ; $c182: e6 d7     
__c184:     JSR __c1a1         ; $c184: 20 a1 c1  
            INC $d7            ; $c187: e6 d7     
            LDA $d7            ; $c189: a5 d7     
            CMP #$0b           ; $c18b: c9 0b     
            BNE __c184         ; $c18d: d0 f5     
            LDA #$00           ; $c18f: a9 00     
            STA $d7            ; $c191: 85 d7     
            LDA $d8            ; $c193: a5 d8     
            BEQ __c199         ; $c195: f0 02     
            LDA #$ff           ; $c197: a9 ff     
__c199:     STA $00            ; $c199: 85 00     
            JSR __c1ed         ; $c19b: 20 ed c1  
            JMP __c135         ; $c19e: 4c 35 c1  

;-------------------------------------------------------------------------------
__c1a1:     LDA $d7            ; $c1a1: a5 d7     
            ASL                ; $c1a3: 0a        
            TAX                ; $c1a4: aa        
            LDA __c1be,x       ; $c1a5: bd be c1  
            STA $0200          ; $c1a8: 8d 00 02  
            LDA __c1bf,x       ; $c1ab: bd bf c1  
            STA $0201          ; $c1ae: 8d 01 02  
            LDA #$c1           ; $c1b1: a9 c1     
            PHA                ; $c1b3: 48        
            LDA #$de           ; $c1b4: a9 de     
            PHA                ; $c1b6: 48        
            LDA #$00           ; $c1b7: a9 00     
            STA $00            ; $c1b9: 85 00     
            JMP ($0200)        ; $c1bb: 6c 00 02  

;-------------------------------------------------------------------------------
__c1be:     .hex a3            ; $c1be: a3        Suspected data
__c1bf:     DEC $a3            ; $c1bf: c6 a3     
            DEC $1e            ; $c1c1: c6 1e     
            SBC $3d            ; $c1c3: e5 3d     
            .hex e7 d3         ; $c1c5: e7 d3     Invalid Opcode - ISC $d3
            INX                ; $c1c7: e8        
            ASL $e9,x          ; $c1c8: 16 e9     
            STX $eb            ; $c1ca: 86 eb     
            INC $ed,x          ; $c1cc: f6 ed     
            ROR $f0            ; $c1ce: 66 f0     
            DEC $f2,x          ; $c1d0: d6 f2     
            LSR $f5            ; $c1d2: 46 f5     
            LDA #$00           ; $c1d4: a9 00     
            STA $00            ; $c1d6: 85 00     
            JSR __d900         ; $c1d8: 20 00 d9  
            JSR __dae0         ; $c1db: 20 e0 da  
            NOP                ; $c1de: ea        
            NOP                ; $c1df: ea        
            NOP                ; $c1e0: ea        
            LDA $00            ; $c1e1: a5 00     
            BEQ __c1e7         ; $c1e3: f0 02     
            STA $d8            ; $c1e5: 85 d8     
__c1e7:     JMP __c1ed         ; $c1e7: 4c ed c1  

;-------------------------------------------------------------------------------
            JMP __c081         ; $c1ea: 4c 81 c0  

;-------------------------------------------------------------------------------
__c1ed:     JSR __c28d         ; $c1ed: 20 8d c2  
            LDA #$00           ; $c1f0: a9 00     
            STA $d3            ; $c1f2: 85 d3     
            LDA $d7            ; $c1f4: a5 d7     
            CLC                ; $c1f6: 18        
            ADC #$04           ; $c1f7: 69 04     
            ASL                ; $c1f9: 0a        
            ROL $d3            ; $c1fa: 26 d3     
            ASL                ; $c1fc: 0a        
            ROL $d3            ; $c1fd: 26 d3     
            ASL                ; $c1ff: 0a        
            ROL $d3            ; $c200: 26 d3     
            ASL                ; $c202: 0a        
            ROL $d3            ; $c203: 26 d3     
            ASL                ; $c205: 0a        
            ROL $d3            ; $c206: 26 d3     
            PHA                ; $c208: 48        
            LDA $d3            ; $c209: a5 d3     
            ORA #$20           ; $c20b: 09 20     
            STA $2006          ; $c20d: 8d 06 20  
            PLA                ; $c210: 68        
            ORA #$04           ; $c211: 09 04     
            STA $2006          ; $c213: 8d 06 20  
            LDA $00            ; $c216: a5 00     
            BEQ __c237         ; $c218: f0 1d     
            CMP #$ff           ; $c21a: c9 ff     
            BEQ __c244         ; $c21c: f0 26     
            LSR                ; $c21e: 4a        
            LSR                ; $c21f: 4a        
            LSR                ; $c220: 4a        
            LSR                ; $c221: 4a        
            TAX                ; $c222: aa        
            LDA __c251,x       ; $c223: bd 51 c2  
            STA $2007          ; $c226: 8d 07 20  
            LDA $00            ; $c229: a5 00     
            AND #$0f           ; $c22b: 29 0f     
            TAX                ; $c22d: aa        
            LDA __c251,x       ; $c22e: bd 51 c2  
            STA $2007          ; $c231: 8d 07 20  
            JMP __c294         ; $c234: 4c 94 c2  

;-------------------------------------------------------------------------------
__c237:     LDA #$4f           ; $c237: a9 4f     
            STA $2007          ; $c239: 8d 07 20  
            LDA #$4b           ; $c23c: a9 4b     
            STA $2007          ; $c23e: 8d 07 20  
            JMP __c294         ; $c241: 4c 94 c2  

;-------------------------------------------------------------------------------
__c244:     LDA #$45           ; $c244: a9 45     
            STA $2007          ; $c246: 8d 07 20  
            LDA #$72           ; $c249: a9 72     
            STA $2007          ; $c24b: 8d 07 20  
            JMP __c294         ; $c24e: 4c 94 c2  

;-------------------------------------------------------------------------------
__c251:     BMI __c284         ; $c251: 30 31     
            .hex 32            ; $c253: 32        Invalid Opcode - KIL 
            .hex 33 34         ; $c254: 33 34     Invalid Opcode - RLA ($34),y
            AND $36,x          ; $c256: 35 36     
            .hex 37 38         ; $c258: 37 38     Invalid Opcode - RLA $38,x
            AND $4241,y        ; $c25a: 39 41 42  
            .hex 43 44         ; $c25d: 43 44     Invalid Opcode - SRE ($44,x)
            EOR $46            ; $c25f: 45 46     
__c261:     LDA $d7            ; $c261: a5 d7     
            CLC                ; $c263: 18        
            ADC #$04           ; $c264: 69 04     
            TAY                ; $c266: a8        
            LDA #$84           ; $c267: a9 84     
            STA $2000          ; $c269: 8d 00 20  
            LDA #$20           ; $c26c: a9 20     
            STA $2006          ; $c26e: 8d 06 20  
            LDA #$02           ; $c271: a9 02     
            STA $2006          ; $c273: 8d 06 20  
            LDA #$20           ; $c276: a9 20     
            DEY                ; $c278: 88        
            INY                ; $c279: c8        
            BNE __c27e         ; $c27a: d0 02     
            LDA #$2a           ; $c27c: a9 2a     
__c27e:     STA $2007          ; $c27e: 8d 07 20  
            DEY                ; $c281: 88        
            DEX                ; $c282: ca        
            .hex d0            ; $c283: d0        Suspected data
__c284:     SBC ($a9),y        ; $c284: f1 a9     
            .hex 80 8d         ; $c286: 80 8d     Invalid Opcode - NOP #$8d
            BRK                ; $c288: 00        
            JSR $944c          ; $c289: 20 4c 94  
            .hex c2            ; $c28c: c2        Suspected data
__c28d:     LDA $d2            ; $c28d: a5 d2     
__c28f:     CMP $d2            ; $c28f: c5 d2     
            BEQ __c28f         ; $c291: f0 fc     
            RTS                ; $c293: 60        

;-------------------------------------------------------------------------------
__c294:     LDA #$00           ; $c294: a9 00     
            STA $2005          ; $c296: 8d 05 20  
            STA $2005          ; $c299: 8d 05 20  
            LDA #$00           ; $c29c: a9 00     
            STA $2006          ; $c29e: 8d 06 20  
            LDA #$00           ; $c2a1: a9 00     
            STA $2006          ; $c2a3: 8d 06 20  
            RTS                ; $c2a6: 60        

;-------------------------------------------------------------------------------
__c2a7:     LDA #$00           ; $c2a7: a9 00     
            STA $2000          ; $c2a9: 8d 00 20  
            STA $2001          ; $c2ac: 8d 01 20  
            JSR __c2ed         ; $c2af: 20 ed c2  
            LDA #$20           ; $c2b2: a9 20     
            STA $2006          ; $c2b4: 8d 06 20  
            LDY #$00           ; $c2b7: a0 00     
            STY $2006          ; $c2b9: 8c 06 20  
__c2bc:     LDX #$20           ; $c2bc: a2 20     
__c2be:     LDA ($d0),y        ; $c2be: b1 d0     
            BEQ __c2e2         ; $c2c0: f0 20     
            CMP #$ff           ; $c2c2: c9 ff     
            BEQ __c2d3         ; $c2c4: f0 0d     
            STA $2007          ; $c2c6: 8d 07 20  
            INY                ; $c2c9: c8        
            BNE __c2ce         ; $c2ca: d0 02     
            INC $d1            ; $c2cc: e6 d1     
__c2ce:     DEX                ; $c2ce: ca        
            BNE __c2be         ; $c2cf: d0 ed     
            BEQ __c2bc         ; $c2d1: f0 e9     
__c2d3:     INY                ; $c2d3: c8        
            BNE __c2d8         ; $c2d4: d0 02     
            INC $d1            ; $c2d6: e6 d1     
__c2d8:     LDA #$20           ; $c2d8: a9 20     
            STA $2007          ; $c2da: 8d 07 20  
            DEX                ; $c2dd: ca        
            BNE __c2d8         ; $c2de: d0 f8     
            BEQ __c2bc         ; $c2e0: f0 da     
__c2e2:     LDA #$80           ; $c2e2: a9 80     
            STA $2000          ; $c2e4: 8d 00 20  
            LDA #$0e           ; $c2e7: a9 0e     
            STA $2001          ; $c2e9: 8d 01 20  
            RTS                ; $c2ec: 60        

;-------------------------------------------------------------------------------
__c2ed:     LDA #$20           ; $c2ed: a9 20     
            STA $2006          ; $c2ef: 8d 06 20  
            LDA #$00           ; $c2f2: a9 00     
            STA $2006          ; $c2f4: 8d 06 20  
            LDX #$1e           ; $c2f7: a2 1e     
            LDA #$20           ; $c2f9: a9 20     
__c2fb:     LDY #$20           ; $c2fb: a0 20     
__c2fd:     STA $2007          ; $c2fd: 8d 07 20  
            DEY                ; $c300: 88        
            BNE __c2fd         ; $c301: d0 fa     
            DEX                ; $c303: ca        
            BNE __c2fb         ; $c304: d0 f5     
            RTS                ; $c306: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $c307: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 20 20      ; $c30a: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2d20          ; $c30d: 20 20 2d  
            AND $5220          ; $c310: 2d 20 52  
            ADC $6e,x          ; $c313: 75 6e     
            JSR $6c61          ; $c315: 20 61 6c  
            JMP ($7420)        ; $c318: 6c 20 74  

;-------------------------------------------------------------------------------
            ADC $73            ; $c31b: 65 73     
            .hex 74 73         ; $c31d: 74 73     Invalid Opcode - NOP $73,x
            .hex ff 20 20      ; $c31f: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2d20          ; $c322: 20 20 2d  
            AND $4220          ; $c325: 2d 20 42  
            .hex 72            ; $c328: 72        Invalid Opcode - KIL 
            ADC ($6e,x)        ; $c329: 61 6e     
            .hex 63 68         ; $c32b: 63 68     Invalid Opcode - RRA ($68,x)
            JSR $6574          ; $c32d: 20 74 65  
            .hex 73 74         ; $c330: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c332: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c334: 20 20 20  
            JSR $2d2d          ; $c337: 20 2d 2d  
            JSR $6c46          ; $c33a: 20 46 6c  
            ADC ($67,x)        ; $c33d: 61 67     
            JSR $6574          ; $c33f: 20 74 65  
            .hex 73 74         ; $c342: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c344: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c346: 20 20 20  
            JSR $2d2d          ; $c349: 20 2d 2d  
            JSR $6d49          ; $c34c: 20 49 6d  
            ADC $6465          ; $c34f: 6d 65 64  
            ADC #$61           ; $c352: 69 61     
            .hex 74 65         ; $c354: 74 65     Invalid Opcode - NOP $65,x
            JSR $6574          ; $c356: 20 74 65  
            .hex 73 74         ; $c359: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c35b: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c35d: 20 20 20  
            JSR $2d2d          ; $c360: 20 2d 2d  
            JSR $6d49          ; $c363: 20 49 6d  
            BVS __c3d4         ; $c366: 70 6c     
            ADC #$65           ; $c368: 69 65     
            .hex 64 20         ; $c36a: 64 20     Invalid Opcode - NOP $20
            .hex 74 65         ; $c36c: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c36e: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c370: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c372: 20 20 20  
            JSR $2d2d          ; $c375: 20 2d 2d  
            JSR $7453          ; $c378: 20 53 74  
            ADC ($63,x)        ; $c37b: 61 63     
            .hex 6b 20         ; $c37d: 6b 20     Invalid Opcode - ARR #$20
            .hex 74 65         ; $c37f: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c381: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c383: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c385: 20 20 20  
            JSR $2d2d          ; $c388: 20 2d 2d  
            JSR $6341          ; $c38b: 20 41 63  
            .hex 63 75         ; $c38e: 63 75     Invalid Opcode - RRA ($75,x)
            ADC $6c75          ; $c390: 6d 75 6c  
            ADC ($74,x)        ; $c393: 61 74     
            .hex 6f 72 20      ; $c395: 6f 72 20  Invalid Opcode - RRA $2072
            .hex 74 65         ; $c398: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c39a: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c39c: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c39e: 20 20 20  
            JSR $2d2d          ; $c3a1: 20 2d 2d  
            JSR $4928          ; $c3a4: 20 28 49  
            ROR $6964          ; $c3a7: 6e 64 69  
            .hex 72            ; $c3aa: 72        Invalid Opcode - KIL 
            ADC $63            ; $c3ab: 65 63     
            .hex 74 2c         ; $c3ad: 74 2c     Invalid Opcode - NOP $2c,x
            CLI                ; $c3af: 58        
            AND #$20           ; $c3b0: 29 20     
            .hex 74 65         ; $c3b2: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c3b4: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c3b6: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c3b8: 20 20 20  
            JSR $2d2d          ; $c3bb: 20 2d 2d  
            JSR $655a          ; $c3be: 20 5a 65  
            .hex 72            ; $c3c1: 72        Invalid Opcode - KIL 
            .hex 6f 70 61      ; $c3c2: 6f 70 61  Invalid Opcode - RRA $6170
            .hex 67 65         ; $c3c5: 67 65     Invalid Opcode - RRA $65
            JSR $6574          ; $c3c7: 20 74 65  
            .hex 73 74         ; $c3ca: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c3cc: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c3ce: 20 20 20  
            JSR $2d2d          ; $c3d1: 20 2d 2d  
__c3d4:     JSR $6241          ; $c3d4: 20 41 62  
            .hex 73 6f         ; $c3d7: 73 6f     Invalid Opcode - RRA ($6f),y
            JMP ($7475)        ; $c3d9: 6c 75 74  

;-------------------------------------------------------------------------------
            ADC $20            ; $c3dc: 65 20     
            .hex 74 65         ; $c3de: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c3e0: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c3e2: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c3e4: 20 20 20  
            JSR $2d2d          ; $c3e7: 20 2d 2d  
            JSR $4928          ; $c3ea: 20 28 49  
            ROR $6964          ; $c3ed: 6e 64 69  
            .hex 72            ; $c3f0: 72        Invalid Opcode - KIL 
            ADC $63            ; $c3f1: 65 63     
            .hex 74 29         ; $c3f3: 74 29     Invalid Opcode - NOP $29,x
            BIT $2059          ; $c3f5: 2c 59 20  
            .hex 74 65         ; $c3f8: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c3fa: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c3fc: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c3fe: 20 20 20  
            JSR $2d2d          ; $c401: 20 2d 2d  
            JSR $6241          ; $c404: 20 41 62  
            .hex 73 6f         ; $c407: 73 6f     Invalid Opcode - RRA ($6f),y
            JMP ($7475)        ; $c409: 6c 75 74  

;-------------------------------------------------------------------------------
            ADC $2c            ; $c40c: 65 2c     
            EOR $7420,y        ; $c40e: 59 20 74  
            ADC $73            ; $c411: 65 73     
            .hex 74 73         ; $c413: 74 73     Invalid Opcode - NOP $73,x
            .hex ff 20 20      ; $c415: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2d20          ; $c418: 20 20 2d  
            AND $5a20          ; $c41b: 2d 20 5a  
            ADC $72            ; $c41e: 65 72     
            .hex 6f 70 61      ; $c420: 6f 70 61  Invalid Opcode - RRA $6170
            .hex 67 65         ; $c423: 67 65     Invalid Opcode - RRA $65
            BIT $2058          ; $c425: 2c 58 20  
            .hex 74 65         ; $c428: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c42a: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c42c: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c42e: 20 20 20  
            JSR $2d2d          ; $c431: 20 2d 2d  
            JSR $6241          ; $c434: 20 41 62  
            .hex 73 6f         ; $c437: 73 6f     Invalid Opcode - RRA ($6f),y
            JMP ($7475)        ; $c439: 6c 75 74  

;-------------------------------------------------------------------------------
            ADC $2c            ; $c43c: 65 2c     
            CLI                ; $c43e: 58        
            JSR $6574          ; $c43f: 20 74 65  
            .hex 73 74         ; $c442: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c444: 73 ff     Invalid Opcode - RRA ($ff),y
            .hex ff ff 20      ; $c446: ff ff 20  Invalid Opcode - ISC $20ff,x
            JSR $2020          ; $c449: 20 20 20  
            EOR $70,x          ; $c44c: 55 70     
            .hex 2f 44 6f      ; $c44e: 2f 44 6f  Invalid Opcode - RLA $6f44
            .hex 77 6e         ; $c451: 77 6e     Invalid Opcode - RRA $6e,x
            .hex 3a            ; $c453: 3a        Invalid Opcode - NOP 
            JSR $6573          ; $c454: 20 73 65  
            JMP ($6365)        ; $c457: 6c 65 63  

;-------------------------------------------------------------------------------
            .hex 74 20         ; $c45a: 74 20     Invalid Opcode - NOP $20,x
            .hex 74 65         ; $c45c: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c45e: 73 74     Invalid Opcode - RRA ($74),y
            .hex ff 20 20      ; $c460: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2020          ; $c463: 20 20 20  
            JSR $7453          ; $c466: 20 53 74  
            ADC ($72,x)        ; $c469: 61 72     
            .hex 74 3a         ; $c46b: 74 3a     Invalid Opcode - NOP $3a,x
            JSR $7572          ; $c46d: 20 72 75  
            ROR $7420          ; $c470: 6e 20 74  
            ADC $73            ; $c473: 65 73     
            .hex 74 ff         ; $c475: 74 ff     Invalid Opcode - NOP $ff,x
            JSR $2020          ; $c477: 20 20 20  
            JSR $5320          ; $c47a: 20 20 53  
            ADC $6c            ; $c47d: 65 6c     
            ADC $63            ; $c47f: 65 63     
            .hex 74 3a         ; $c481: 74 3a     Invalid Opcode - NOP $3a,x
            JSR $6e49          ; $c483: 20 49 6e  
            ROR $61,x          ; $c486: 76 61     
            JMP ($6469)        ; $c488: 6c 69 64  

;-------------------------------------------------------------------------------
            JSR $706f          ; $c48b: 20 6f 70  
            .hex 73 21         ; $c48e: 73 21     Invalid Opcode - RRA ($21),y
            .hex ff 00 ff      ; $c490: ff 00 ff  Invalid Opcode - ISC __ff00,x
            .hex ff ff ff      ; $c493: ff ff ff  Invalid Opcode - ISC $ffff,x
            JSR $2020          ; $c496: 20 20 20  
            JSR $2d2d          ; $c499: 20 2d 2d  
            JSR $7552          ; $c49c: 20 52 75  
            ROR $6120          ; $c49f: 6e 20 61  
            JMP ($206c)        ; $c4a2: 6c 6c 20  

;-------------------------------------------------------------------------------
            .hex 74 65         ; $c4a5: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c4a7: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c4a9: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c4ab: 20 20 20  
            JSR $2d2d          ; $c4ae: 20 2d 2d  
            JSR $4f4e          ; $c4b1: 20 4e 4f  
            BVC __c4d6         ; $c4b4: 50 20     
            .hex 74 65         ; $c4b6: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c4b8: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c4ba: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c4bc: 20 20 20  
            JSR $2d2d          ; $c4bf: 20 2d 2d  
            JSR $414c          ; $c4c2: 20 4c 41  
            CLI                ; $c4c5: 58        
            JSR $6574          ; $c4c6: 20 74 65  
            .hex 73 74         ; $c4c9: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c4cb: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c4cd: 20 20 20  
            JSR $2d2d          ; $c4d0: 20 2d 2d  
            JSR $4153          ; $c4d3: 20 53 41  
__c4d6:     CLI                ; $c4d6: 58        
            JSR $6574          ; $c4d7: 20 74 65  
            .hex 73 74         ; $c4da: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c4dc: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c4de: 20 20 20  
            JSR $2d2d          ; $c4e1: 20 2d 2d  
            JSR $4253          ; $c4e4: 20 53 42  
            .hex 43 20         ; $c4e7: 43 20     Invalid Opcode - SRE ($20,x)
            .hex 74 65         ; $c4e9: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c4eb: 73 74     Invalid Opcode - RRA ($74),y
            JSR $6f28          ; $c4ed: 20 28 6f  
            BVS __c555         ; $c4f0: 70 63     
            .hex 6f 64 65      ; $c4f2: 6f 64 65  Invalid Opcode - RRA $6564
            JSR $4530          ; $c4f5: 20 30 45  
            .hex 42            ; $c4f8: 42        Invalid Opcode - KIL 
            PLA                ; $c4f9: 68        
            AND #$ff           ; $c4fa: 29 ff     
            JSR $2020          ; $c4fc: 20 20 20  
            JSR $2d2d          ; $c4ff: 20 2d 2d  
            JSR $4344          ; $c502: 20 44 43  
            BVC __c527         ; $c505: 50 20     
            .hex 74 65         ; $c507: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c509: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c50b: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c50d: 20 20 20  
            JSR $2d2d          ; $c510: 20 2d 2d  
            JSR $5349          ; $c513: 20 49 53  
            .hex 42            ; $c516: 42        Invalid Opcode - KIL 
            JSR $6574          ; $c517: 20 74 65  
            .hex 73 74         ; $c51a: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c51c: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c51e: 20 20 20  
            JSR $2d2d          ; $c521: 20 2d 2d  
            JSR $4c53          ; $c524: 20 53 4c  
__c527:     .hex 4f 20 74      ; $c527: 4f 20 74  Invalid Opcode - SRE $7420
            ADC $73            ; $c52a: 65 73     
            .hex 74 73         ; $c52c: 74 73     Invalid Opcode - NOP $73,x
            .hex ff 20 20      ; $c52e: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2d20          ; $c531: 20 20 2d  
            AND $5220          ; $c534: 2d 20 52  
            JMP $2041          ; $c537: 4c 41 20  

;-------------------------------------------------------------------------------
            .hex 74 65         ; $c53a: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c53c: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c53e: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c540: 20 20 20  
            JSR $2d2d          ; $c543: 20 2d 2d  
            JSR $5253          ; $c546: 20 53 52  
            EOR $20            ; $c549: 45 20     
            .hex 74 65         ; $c54b: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c54d: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c54f: 73 ff     Invalid Opcode - RRA ($ff),y
            JSR $2020          ; $c551: 20 20 20  
            .hex 20            ; $c554: 20        Suspected data
__c555:     AND $202d          ; $c555: 2d 2d 20  
            .hex 52            ; $c558: 52        Invalid Opcode - KIL 
            .hex 52            ; $c559: 52        Invalid Opcode - KIL 
            EOR ($20,x)        ; $c55a: 41 20     
            .hex 74 65         ; $c55c: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c55e: 73 74     Invalid Opcode - RRA ($74),y
            .hex 73 ff         ; $c560: 73 ff     Invalid Opcode - RRA ($ff),y
            .hex ff ff ff      ; $c562: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 20      ; $c565: ff ff 20  Invalid Opcode - ISC $20ff,x
            JSR $2020          ; $c568: 20 20 20  
            EOR $70,x          ; $c56b: 55 70     
            .hex 2f 44 6f      ; $c56d: 2f 44 6f  Invalid Opcode - RLA $6f44
            .hex 77 6e         ; $c570: 77 6e     Invalid Opcode - RRA $6e,x
            .hex 3a            ; $c572: 3a        Invalid Opcode - NOP 
            JSR $6573          ; $c573: 20 73 65  
            JMP ($6365)        ; $c576: 6c 65 63  

;-------------------------------------------------------------------------------
            .hex 74 20         ; $c579: 74 20     Invalid Opcode - NOP $20,x
            .hex 74 65         ; $c57b: 74 65     Invalid Opcode - NOP $65,x
            .hex 73 74         ; $c57d: 73 74     Invalid Opcode - RRA ($74),y
            .hex ff 20 20      ; $c57f: ff 20 20  Invalid Opcode - ISC $2020,x
            JSR $2020          ; $c582: 20 20 20  
            JSR $7453          ; $c585: 20 53 74  
            ADC ($72,x)        ; $c588: 61 72     
            .hex 74 3a         ; $c58a: 74 3a     Invalid Opcode - NOP $3a,x
            JSR $7572          ; $c58c: 20 72 75  
            ROR $7420          ; $c58f: 6e 20 74  
            ADC $73            ; $c592: 65 73     
            .hex 74 ff         ; $c594: 74 ff     Invalid Opcode - NOP $ff,x
            JSR $2020          ; $c596: 20 20 20  
            JSR $5320          ; $c599: 20 20 53  
            ADC $6c            ; $c59c: 65 6c     
            ADC $63            ; $c59e: 65 63     
            .hex 74 3a         ; $c5a0: 74 3a     Invalid Opcode - NOP $3a,x
            JSR $6f4e          ; $c5a2: 20 4e 6f  
            .hex 72            ; $c5a5: 72        Invalid Opcode - KIL 
            ADC $6c61          ; $c5a6: 6d 61 6c  
            JSR $706f          ; $c5a9: 20 6f 70  
            .hex 73 ff         ; $c5ac: 73 ff     Invalid Opcode - RRA ($ff),y
            BRK                ; $c5ae: 00        

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        PHA                ; $c5af: 48        
            TXA                ; $c5b0: 8a        
            PHA                ; $c5b1: 48        
            LDA $2002          ; $c5b2: ad 02 20  
            LDA #$20           ; $c5b5: a9 20     
            STA $2006          ; $c5b7: 8d 06 20  
            LDA #$40           ; $c5ba: a9 40     
            STA $2006          ; $c5bc: 8d 06 20  
            INC $d2            ; $c5bf: e6 d2     
            LDA #$00           ; $c5c1: a9 00     
            STA $2005          ; $c5c3: 8d 05 20  
            STA $2005          ; $c5c6: 8d 05 20  
            LDA #$00           ; $c5c9: a9 00     
            STA $2006          ; $c5cb: 8d 06 20  
            LDA #$00           ; $c5ce: a9 00     
            STA $2006          ; $c5d0: 8d 06 20  
            LDX #$09           ; $c5d3: a2 09     
            STX $4016          ; $c5d5: 8e 16 40  
            DEX                ; $c5d8: ca        
            STX $4016          ; $c5d9: 8e 16 40  
__c5dc:     LDA $4016          ; $c5dc: ad 16 40  
            LSR                ; $c5df: 4a        
            ROL $d4            ; $c5e0: 26 d4     
            DEX                ; $c5e2: ca        
            BNE __c5dc         ; $c5e3: d0 f7     
            LDA $d4            ; $c5e5: a5 d4     
            TAX                ; $c5e7: aa        
            EOR $d6            ; $c5e8: 45 d6     
            AND $d4            ; $c5ea: 25 d4     
            STA $d5            ; $c5ec: 85 d5     
            STX $d6            ; $c5ee: 86 d6     
            PLA                ; $c5f0: 68        
            TAX                ; $c5f1: aa        
            PLA                ; $c5f2: 68        
            RTI                ; $c5f3: 40        

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        RTI                ; $c5f4: 40        

;-------------------------------------------------------------------------------
__c5f5:     LDX #$00           ; $c5f5: a2 00     
            STX $00            ; $c5f7: 86 00     
            STX $10            ; $c5f9: 86 10     
            STX $11            ; $c5fb: 86 11     
            JSR __c72d         ; $c5fd: 20 2d c7  
            JSR __c7db         ; $c600: 20 db c7  
            JSR __c885         ; $c603: 20 85 c8  
            JSR __cbde         ; $c606: 20 de cb  
            JSR __cdf8         ; $c609: 20 f8 cd  
            JSR __ceee         ; $c60c: 20 ee ce  
            JSR __cfa2         ; $c60f: 20 a2 cf  
            JSR __d174         ; $c612: 20 74 d1  
            JSR __d4fb         ; $c615: 20 fb d4  
            JSR __d900         ; $c618: 20 00 d9  
            LDA $00            ; $c61b: a5 00     
            STA $10            ; $c61d: 85 10     
            LDA #$00           ; $c61f: a9 00     
            STA $00            ; $c621: 85 00     
            JSR __dae0         ; $c623: 20 e0 da  
            JSR __df4a         ; $c626: 20 4a df  
            JSR __dbb8         ; $c629: 20 b8 db  
            JSR __e1aa         ; $c62c: 20 aa e1  
            JSR __c6a3         ; $c62f: 20 a3 c6  
            JSR __e51e         ; $c632: 20 1e e5  
            JSR __e73d         ; $c635: 20 3d e7  
            JSR __e8d3         ; $c638: 20 d3 e8  
            JSR __e916         ; $c63b: 20 16 e9  
            JSR __eb86         ; $c63e: 20 86 eb  
            JSR __edf6         ; $c641: 20 f6 ed  
            JSR __f066         ; $c644: 20 66 f0  
            JSR __f2d6         ; $c647: 20 d6 f2  
            LDA $00            ; $c64a: a5 00     
            STA $11            ; $c64c: 85 11     
            LDA #$00           ; $c64e: a9 00     
            STA $00            ; $c650: 85 00     
            JSR __f546         ; $c652: 20 46 f5  
            LDA $00            ; $c655: a5 00     
            ORA $10            ; $c657: 05 10     
            ORA $11            ; $c659: 05 11     
            BEQ __c66b         ; $c65b: f0 0e     
            JSR __c66f         ; $c65d: 20 6f c6  
            LDX $00            ; $c660: a6 00     
            STX $02            ; $c662: 86 02     
            LDX $10            ; $c664: a6 10     
            STX $03            ; $c666: 86 03     
            JMP __c66e         ; $c668: 4c 6e c6  

;-------------------------------------------------------------------------------
__c66b:     JSR __c689         ; $c66b: 20 89 c6  
__c66e:     RTS                ; $c66e: 60        

;-------------------------------------------------------------------------------
__c66f:     LDA #$03           ; $c66f: a9 03     
            STA $4015          ; $c671: 8d 15 40  
            LDA #$87           ; $c674: a9 87     
            STA $4000          ; $c676: 8d 00 40  
            LDA #$89           ; $c679: a9 89     
            STA $4001          ; $c67b: 8d 01 40  
            LDA #$f0           ; $c67e: a9 f0     
            STA $4002          ; $c680: 8d 02 40  
            LDA #$00           ; $c683: a9 00     
            STA $4003          ; $c685: 8d 03 40  
            RTS                ; $c688: 60        

;-------------------------------------------------------------------------------
__c689:     LDA #$02           ; $c689: a9 02     
            STA $4015          ; $c68b: 8d 15 40  
            LDA #$3f           ; $c68e: a9 3f     
            STA $4004          ; $c690: 8d 04 40  
            LDA #$9a           ; $c693: a9 9a     
            STA $4005          ; $c695: 8d 05 40  
            LDA #$ff           ; $c698: a9 ff     
            STA $4006          ; $c69a: 8d 06 40  
            LDA #$00           ; $c69d: a9 00     
            STA $4007          ; $c69f: 8d 07 40  
            RTS                ; $c6a2: 60        

;-------------------------------------------------------------------------------
__c6a3:     LDY #$4e           ; $c6a3: a0 4e     
            LDA #$ff           ; $c6a5: a9 ff     
            STA $01            ; $c6a7: 85 01     
            JSR __c6b0         ; $c6a9: 20 b0 c6  
            JSR __c6b7         ; $c6ac: 20 b7 c6  
            RTS                ; $c6af: 60        

;-------------------------------------------------------------------------------
__c6b0:     LDA #$ff           ; $c6b0: a9 ff     
            PHA                ; $c6b2: 48        
            LDA #$aa           ; $c6b3: a9 aa     
            BNE __c6bc         ; $c6b5: d0 05     
__c6b7:     LDA #$34           ; $c6b7: a9 34     
            PHA                ; $c6b9: 48        
            LDA #$55           ; $c6ba: a9 55     
__c6bc:     PLP                ; $c6bc: 28        
            .hex 04 a9         ; $c6bd: 04 a9     Invalid Opcode - NOP $a9
            .hex 44 a9         ; $c6bf: 44 a9     Invalid Opcode - NOP $a9
            .hex 64 a9         ; $c6c1: 64 a9     Invalid Opcode - NOP $a9
            NOP                ; $c6c3: ea        
            NOP                ; $c6c4: ea        
            NOP                ; $c6c5: ea        
__c6c6:     NOP                ; $c6c6: ea        
            PHP                ; $c6c7: 08        
            PHA                ; $c6c8: 48        
            .hex 0c a9 a9      ; $c6c9: 0c a9 a9  Invalid Opcode - NOP $a9a9
            NOP                ; $c6cc: ea        
            NOP                ; $c6cd: ea        
            NOP                ; $c6ce: ea        
            NOP                ; $c6cf: ea        
            PHP                ; $c6d0: 08        
            PHA                ; $c6d1: 48        
            .hex 14 a9         ; $c6d2: 14 a9     Invalid Opcode - NOP $a9,x
            .hex 34 a9         ; $c6d4: 34 a9     Invalid Opcode - NOP $a9,x
            .hex 54 a9         ; $c6d6: 54 a9     Invalid Opcode - NOP $a9,x
            .hex 74 a9         ; $c6d8: 74 a9     Invalid Opcode - NOP $a9,x
            .hex d4 a9         ; $c6da: d4 a9     Invalid Opcode - NOP $a9,x
            .hex f4 a9         ; $c6dc: f4 a9     Invalid Opcode - NOP $a9,x
            NOP                ; $c6de: ea        
            NOP                ; $c6df: ea        
            NOP                ; $c6e0: ea        
            NOP                ; $c6e1: ea        
            PHP                ; $c6e2: 08        
            PHA                ; $c6e3: 48        
            .hex 1a            ; $c6e4: 1a        Invalid Opcode - NOP 
            .hex 3a            ; $c6e5: 3a        Invalid Opcode - NOP 
            .hex 5a            ; $c6e6: 5a        Invalid Opcode - NOP 
            .hex 7a            ; $c6e7: 7a        Invalid Opcode - NOP 
            .hex da            ; $c6e8: da        Invalid Opcode - NOP 
            .hex fa            ; $c6e9: fa        Invalid Opcode - NOP 
            .hex 80 89         ; $c6ea: 80 89     Invalid Opcode - NOP #$89
            NOP                ; $c6ec: ea        
            NOP                ; $c6ed: ea        
            NOP                ; $c6ee: ea        
            NOP                ; $c6ef: ea        
            PHP                ; $c6f0: 08        
            PHA                ; $c6f1: 48        
            .hex 1c a9 a9      ; $c6f2: 1c a9 a9  Invalid Opcode - NOP $a9a9,x
            .hex 3c a9 a9      ; $c6f5: 3c a9 a9  Invalid Opcode - NOP $a9a9,x
            .hex 5c a9 a9      ; $c6f8: 5c a9 a9  Invalid Opcode - NOP $a9a9,x
            .hex 7c a9 a9      ; $c6fb: 7c a9 a9  Invalid Opcode - NOP $a9a9,x
            .hex dc a9 a9      ; $c6fe: dc a9 a9  Invalid Opcode - NOP $a9a9,x
            .hex fc a9 a9      ; $c701: fc a9 a9  Invalid Opcode - NOP $a9a9,x
            NOP                ; $c704: ea        
            NOP                ; $c705: ea        
            NOP                ; $c706: ea        
            NOP                ; $c707: ea        
            PHP                ; $c708: 08        
            PHA                ; $c709: 48        
            LDX #$05           ; $c70a: a2 05     
__c70c:     PLA                ; $c70c: 68        
            CMP #$55           ; $c70d: c9 55     
            BEQ __c71b         ; $c70f: f0 0a     
            CMP #$aa           ; $c711: c9 aa     
            BEQ __c71b         ; $c713: f0 06     
            PLA                ; $c715: 68        
            STY $00            ; $c716: 84 00     
            JMP __c728         ; $c718: 4c 28 c7  

;-------------------------------------------------------------------------------
__c71b:     PLA                ; $c71b: 68        
            AND #$cb           ; $c71c: 29 cb     
            CMP #$00           ; $c71e: c9 00     
            BEQ __c728         ; $c720: f0 06     
            CMP #$cb           ; $c722: c9 cb     
            BEQ __c728         ; $c724: f0 02     
            STY $00            ; $c726: 84 00     
__c728:     INY                ; $c728: c8        
            DEX                ; $c729: ca        
            BNE __c70c         ; $c72a: d0 e0     
            RTS                ; $c72c: 60        

;-------------------------------------------------------------------------------
__c72d:     NOP                ; $c72d: ea        
            SEC                ; $c72e: 38        
            BCS __c735         ; $c72f: b0 04     
            LDX #$01           ; $c731: a2 01     
            STX $00            ; $c733: 86 00     
__c735:     NOP                ; $c735: ea        
            CLC                ; $c736: 18        
            BCS __c73c         ; $c737: b0 03     
            JMP __c740         ; $c739: 4c 40 c7  

;-------------------------------------------------------------------------------
__c73c:     LDX #$02           ; $c73c: a2 02     
            STX $00            ; $c73e: 86 00     
__c740:     NOP                ; $c740: ea        
            SEC                ; $c741: 38        
            BCC __c747         ; $c742: 90 03     
            JMP __c74b         ; $c744: 4c 4b c7  

;-------------------------------------------------------------------------------
__c747:     LDX #$03           ; $c747: a2 03     
            STX $00            ; $c749: 86 00     
__c74b:     NOP                ; $c74b: ea        
            CLC                ; $c74c: 18        
            BCC __c753         ; $c74d: 90 04     
            LDX #$04           ; $c74f: a2 04     
            STX $00            ; $c751: 86 00     
__c753:     NOP                ; $c753: ea        
            LDA #$00           ; $c754: a9 00     
            BEQ __c75c         ; $c756: f0 04     
            LDX #$05           ; $c758: a2 05     
            STX $00            ; $c75a: 86 00     
__c75c:     NOP                ; $c75c: ea        
            LDA #$40           ; $c75d: a9 40     
            BEQ __c764         ; $c75f: f0 03     
            JMP __c768         ; $c761: 4c 68 c7  

;-------------------------------------------------------------------------------
__c764:     LDX #$06           ; $c764: a2 06     
            STX $00            ; $c766: 86 00     
__c768:     NOP                ; $c768: ea        
            LDA #$40           ; $c769: a9 40     
            BNE __c771         ; $c76b: d0 04     
            LDX #$07           ; $c76d: a2 07     
            STX $00            ; $c76f: 86 00     
__c771:     NOP                ; $c771: ea        
            LDA #$00           ; $c772: a9 00     
            BNE __c779         ; $c774: d0 03     
            JMP __c77d         ; $c776: 4c 7d c7  

;-------------------------------------------------------------------------------
__c779:     LDX #$08           ; $c779: a2 08     
            STX $00            ; $c77b: 86 00     
__c77d:     NOP                ; $c77d: ea        
            LDA #$ff           ; $c77e: a9 ff     
            STA $01            ; $c780: 85 01     
            BIT $01            ; $c782: 24 01     
            BVS __c78a         ; $c784: 70 04     
            LDX #$09           ; $c786: a2 09     
            STX $00            ; $c788: 86 00     
__c78a:     NOP                ; $c78a: ea        
            BIT $01            ; $c78b: 24 01     
            BVC __c792         ; $c78d: 50 03     
            JMP __c796         ; $c78f: 4c 96 c7  

;-------------------------------------------------------------------------------
__c792:     LDX #$0a           ; $c792: a2 0a     
            STX $00            ; $c794: 86 00     
__c796:     NOP                ; $c796: ea        
            LDA #$00           ; $c797: a9 00     
            STA $01            ; $c799: 85 01     
            BIT $01            ; $c79b: 24 01     
            BVC __c7a3         ; $c79d: 50 04     
            LDX #$0b           ; $c79f: a2 0b     
            STX $00            ; $c7a1: 86 00     
__c7a3:     NOP                ; $c7a3: ea        
            BIT $01            ; $c7a4: 24 01     
            BVS __c7ab         ; $c7a6: 70 03     
            JMP __c7af         ; $c7a8: 4c af c7  

;-------------------------------------------------------------------------------
__c7ab:     LDX #$0c           ; $c7ab: a2 0c     
            STX $00            ; $c7ad: 86 00     
__c7af:     NOP                ; $c7af: ea        
            LDA #$00           ; $c7b0: a9 00     
            BPL __c7b8         ; $c7b2: 10 04     
            LDX #$0d           ; $c7b4: a2 0d     
            STX $00            ; $c7b6: 86 00     
__c7b8:     NOP                ; $c7b8: ea        
            LDA #$80           ; $c7b9: a9 80     
            BPL __c7c0         ; $c7bb: 10 03     
            JMP __c7d9         ; $c7bd: 4c d9 c7  

;-------------------------------------------------------------------------------
__c7c0:     LDX #$0e           ; $c7c0: a2 0e     
            STX $00            ; $c7c2: 86 00     
            NOP                ; $c7c4: ea        
            LDA #$80           ; $c7c5: a9 80     
            BMI __c7cd         ; $c7c7: 30 04     
            LDX #$0f           ; $c7c9: a2 0f     
            STX $00            ; $c7cb: 86 00     
__c7cd:     NOP                ; $c7cd: ea        
            LDA #$00           ; $c7ce: a9 00     
            BMI __c7d5         ; $c7d0: 30 03     
            JMP __c7d9         ; $c7d2: 4c d9 c7  

;-------------------------------------------------------------------------------
__c7d5:     LDX #$10           ; $c7d5: a2 10     
            STX $00            ; $c7d7: 86 00     
__c7d9:     NOP                ; $c7d9: ea        
            RTS                ; $c7da: 60        

;-------------------------------------------------------------------------------
__c7db:     NOP                ; $c7db: ea        
            LDA #$ff           ; $c7dc: a9 ff     
            STA $01            ; $c7de: 85 01     
            BIT $01            ; $c7e0: 24 01     
            LDA #$00           ; $c7e2: a9 00     
            SEC                ; $c7e4: 38        
            SEI                ; $c7e5: 78        
            SED                ; $c7e6: f8        
            PHP                ; $c7e7: 08        
            PLA                ; $c7e8: 68        
            AND #$ef           ; $c7e9: 29 ef     
            CMP #$6f           ; $c7eb: c9 6f     
            BEQ __c7f3         ; $c7ed: f0 04     
            LDX #$11           ; $c7ef: a2 11     
            STX $00            ; $c7f1: 86 00     
__c7f3:     NOP                ; $c7f3: ea        
            LDA #$40           ; $c7f4: a9 40     
            STA $01            ; $c7f6: 85 01     
            BIT $01            ; $c7f8: 24 01     
            CLD                ; $c7fa: d8        
            LDA #$10           ; $c7fb: a9 10     
            CLC                ; $c7fd: 18        
            PHP                ; $c7fe: 08        
            PLA                ; $c7ff: 68        
            AND #$ef           ; $c800: 29 ef     
            CMP #$64           ; $c802: c9 64     
            BEQ __c80a         ; $c804: f0 04     
            LDX #$12           ; $c806: a2 12     
            STX $00            ; $c808: 86 00     
__c80a:     NOP                ; $c80a: ea        
            LDA #$80           ; $c80b: a9 80     
            STA $01            ; $c80d: 85 01     
            BIT $01            ; $c80f: 24 01     
            SED                ; $c811: f8        
            LDA #$00           ; $c812: a9 00     
            SEC                ; $c814: 38        
            PHP                ; $c815: 08        
            PLA                ; $c816: 68        
            AND #$ef           ; $c817: 29 ef     
            CMP #$2f           ; $c819: c9 2f     
            BEQ __c821         ; $c81b: f0 04     
            LDX #$13           ; $c81d: a2 13     
            STX $00            ; $c81f: 86 00     
__c821:     NOP                ; $c821: ea        
            LDA #$ff           ; $c822: a9 ff     
            PHA                ; $c824: 48        
            PLP                ; $c825: 28        
            BNE __c831         ; $c826: d0 09     
            BPL __c831         ; $c828: 10 07     
            BVC __c831         ; $c82a: 50 05     
            BCC __c831         ; $c82c: 90 03     
            JMP __c835         ; $c82e: 4c 35 c8  

;-------------------------------------------------------------------------------
__c831:     LDX #$14           ; $c831: a2 14     
            STX $00            ; $c833: 86 00     
__c835:     NOP                ; $c835: ea        
            LDA #$04           ; $c836: a9 04     
            PHA                ; $c838: 48        
            PLP                ; $c839: 28        
            BEQ __c845         ; $c83a: f0 09     
            BMI __c845         ; $c83c: 30 07     
            BVS __c845         ; $c83e: 70 05     
            BCS __c845         ; $c840: b0 03     
            JMP __c849         ; $c842: 4c 49 c8  

;-------------------------------------------------------------------------------
__c845:     LDX #$15           ; $c845: a2 15     
            STX $00            ; $c847: 86 00     
__c849:     NOP                ; $c849: ea        
            SED                ; $c84a: f8        
            LDA #$ff           ; $c84b: a9 ff     
            STA $01            ; $c84d: 85 01     
            BIT $01            ; $c84f: 24 01     
            CLC                ; $c851: 18        
            LDA #$00           ; $c852: a9 00     
            PHA                ; $c854: 48        
            LDA #$ff           ; $c855: a9 ff     
            PLA                ; $c857: 68        
            BNE __c863         ; $c858: d0 09     
            BMI __c863         ; $c85a: 30 07     
            BVC __c863         ; $c85c: 50 05     
            BCS __c863         ; $c85e: b0 03     
            JMP __c867         ; $c860: 4c 67 c8  

;-------------------------------------------------------------------------------
__c863:     LDX #$16           ; $c863: a2 16     
            STX $00            ; $c865: 86 00     
__c867:     NOP                ; $c867: ea        
            LDA #$00           ; $c868: a9 00     
            STA $01            ; $c86a: 85 01     
            BIT $01            ; $c86c: 24 01     
            SEC                ; $c86e: 38        
            LDA #$ff           ; $c86f: a9 ff     
            PHA                ; $c871: 48        
            LDA #$00           ; $c872: a9 00     
            PLA                ; $c874: 68        
            BEQ __c880         ; $c875: f0 09     
            BPL __c880         ; $c877: 10 07     
            BVS __c880         ; $c879: 70 05     
            BCC __c880         ; $c87b: 90 03     
            JMP __c884         ; $c87d: 4c 84 c8  

;-------------------------------------------------------------------------------
__c880:     LDX #$17           ; $c880: a2 17     
            STX $00            ; $c882: 86 00     
__c884:     RTS                ; $c884: 60        

;-------------------------------------------------------------------------------
__c885:     NOP                ; $c885: ea        
            CLC                ; $c886: 18        
            LDA #$ff           ; $c887: a9 ff     
            STA $01            ; $c889: 85 01     
            BIT $01            ; $c88b: 24 01     
            LDA #$55           ; $c88d: a9 55     
            ORA #$aa           ; $c88f: 09 aa     
            BCS __c89e         ; $c891: b0 0b     
            BPL __c89e         ; $c893: 10 09     
            CMP #$ff           ; $c895: c9 ff     
            BNE __c89e         ; $c897: d0 05     
            BVC __c89e         ; $c899: 50 03     
            JMP __c8a2         ; $c89b: 4c a2 c8  

;-------------------------------------------------------------------------------
__c89e:     LDX #$18           ; $c89e: a2 18     
            STX $00            ; $c8a0: 86 00     
__c8a2:     NOP                ; $c8a2: ea        
            SEC                ; $c8a3: 38        
            CLV                ; $c8a4: b8        
            LDA #$00           ; $c8a5: a9 00     
            ORA #$00           ; $c8a7: 09 00     
            BNE __c8b4         ; $c8a9: d0 09     
            BVS __c8b4         ; $c8ab: 70 07     
            BCC __c8b4         ; $c8ad: 90 05     
            BMI __c8b4         ; $c8af: 30 03     
            JMP __c8b8         ; $c8b1: 4c b8 c8  

;-------------------------------------------------------------------------------
__c8b4:     LDX #$19           ; $c8b4: a2 19     
            STX $00            ; $c8b6: 86 00     
__c8b8:     NOP                ; $c8b8: ea        
            CLC                ; $c8b9: 18        
            BIT $01            ; $c8ba: 24 01     
            LDA #$55           ; $c8bc: a9 55     
            AND #$aa           ; $c8be: 29 aa     
            BNE __c8cb         ; $c8c0: d0 09     
            BVC __c8cb         ; $c8c2: 50 07     
            BCS __c8cb         ; $c8c4: b0 05     
            BMI __c8cb         ; $c8c6: 30 03     
            JMP __c8cf         ; $c8c8: 4c cf c8  

;-------------------------------------------------------------------------------
__c8cb:     LDX #$1a           ; $c8cb: a2 1a     
            STX $00            ; $c8cd: 86 00     
__c8cf:     NOP                ; $c8cf: ea        
            SEC                ; $c8d0: 38        
            CLV                ; $c8d1: b8        
            LDA #$f8           ; $c8d2: a9 f8     
            AND #$ef           ; $c8d4: 29 ef     
            BCC __c8e3         ; $c8d6: 90 0b     
            BPL __c8e3         ; $c8d8: 10 09     
            CMP #$e8           ; $c8da: c9 e8     
            BNE __c8e3         ; $c8dc: d0 05     
            BVS __c8e3         ; $c8de: 70 03     
            JMP __c8e7         ; $c8e0: 4c e7 c8  

;-------------------------------------------------------------------------------
__c8e3:     LDX #$1b           ; $c8e3: a2 1b     
            STX $00            ; $c8e5: 86 00     
__c8e7:     NOP                ; $c8e7: ea        
            CLC                ; $c8e8: 18        
            BIT $01            ; $c8e9: 24 01     
            LDA #$5f           ; $c8eb: a9 5f     
            EOR #$aa           ; $c8ed: 49 aa     
            BCS __c8fc         ; $c8ef: b0 0b     
            BPL __c8fc         ; $c8f1: 10 09     
            CMP #$f5           ; $c8f3: c9 f5     
            BNE __c8fc         ; $c8f5: d0 05     
            BVC __c8fc         ; $c8f7: 50 03     
            JMP __c900         ; $c8f9: 4c 00 c9  

;-------------------------------------------------------------------------------
__c8fc:     LDX #$1c           ; $c8fc: a2 1c     
            STX $00            ; $c8fe: 86 00     
__c900:     NOP                ; $c900: ea        
            SEC                ; $c901: 38        
            CLV                ; $c902: b8        
            LDA #$70           ; $c903: a9 70     
            EOR #$70           ; $c905: 49 70     
            BNE __c912         ; $c907: d0 09     
            BVS __c912         ; $c909: 70 07     
            BCC __c912         ; $c90b: 90 05     
            BMI __c912         ; $c90d: 30 03     
            JMP __c916         ; $c90f: 4c 16 c9  

;-------------------------------------------------------------------------------
__c912:     LDX #$1d           ; $c912: a2 1d     
            STX $00            ; $c914: 86 00     
__c916:     NOP                ; $c916: ea        
            CLC                ; $c917: 18        
            BIT $01            ; $c918: 24 01     
            LDA #$00           ; $c91a: a9 00     
            ADC #$69           ; $c91c: 69 69     
            BMI __c92b         ; $c91e: 30 0b     
            BCS __c92b         ; $c920: b0 09     
            CMP #$69           ; $c922: c9 69     
            BNE __c92b         ; $c924: d0 05     
            BVS __c92b         ; $c926: 70 03     
            JMP __c92f         ; $c928: 4c 2f c9  

;-------------------------------------------------------------------------------
__c92b:     LDX #$1e           ; $c92b: a2 1e     
            STX $00            ; $c92d: 86 00     
__c92f:     NOP                ; $c92f: ea        
            SEC                ; $c930: 38        
            SED                ; $c931: f8        
            BIT $01            ; $c932: 24 01     
            LDA #$01           ; $c934: a9 01     
            ADC #$69           ; $c936: 69 69     
            BMI __c945         ; $c938: 30 0b     
            BCS __c945         ; $c93a: b0 09     
            CMP #$6b           ; $c93c: c9 6b     
            BNE __c945         ; $c93e: d0 05     
            BVS __c945         ; $c940: 70 03     
            JMP __c949         ; $c942: 4c 49 c9  

;-------------------------------------------------------------------------------
__c945:     LDX #$1f           ; $c945: a2 1f     
            STX $00            ; $c947: 86 00     
__c949:     NOP                ; $c949: ea        
            CLD                ; $c94a: d8        
            SEC                ; $c94b: 38        
            CLV                ; $c94c: b8        
            LDA #$7f           ; $c94d: a9 7f     
            ADC #$7f           ; $c94f: 69 7f     
            BPL __c95e         ; $c951: 10 0b     
            BCS __c95e         ; $c953: b0 09     
            CMP #$ff           ; $c955: c9 ff     
            BNE __c95e         ; $c957: d0 05     
            BVC __c95e         ; $c959: 50 03     
            JMP __c962         ; $c95b: 4c 62 c9  

;-------------------------------------------------------------------------------
__c95e:     LDX #$20           ; $c95e: a2 20     
            STX $00            ; $c960: 86 00     
__c962:     NOP                ; $c962: ea        
            CLC                ; $c963: 18        
            BIT $01            ; $c964: 24 01     
            LDA #$7f           ; $c966: a9 7f     
            ADC #$80           ; $c968: 69 80     
            BPL __c977         ; $c96a: 10 0b     
            BCS __c977         ; $c96c: b0 09     
            CMP #$ff           ; $c96e: c9 ff     
            BNE __c977         ; $c970: d0 05     
            BVS __c977         ; $c972: 70 03     
            JMP __c97b         ; $c974: 4c 7b c9  

;-------------------------------------------------------------------------------
__c977:     LDX #$21           ; $c977: a2 21     
            STX $00            ; $c979: 86 00     
__c97b:     NOP                ; $c97b: ea        
            SEC                ; $c97c: 38        
            CLV                ; $c97d: b8        
            LDA #$7f           ; $c97e: a9 7f     
            ADC #$80           ; $c980: 69 80     
            BNE __c98d         ; $c982: d0 09     
            BMI __c98d         ; $c984: 30 07     
            BVS __c98d         ; $c986: 70 05     
            BCC __c98d         ; $c988: 90 03     
            JMP __c991         ; $c98a: 4c 91 c9  

;-------------------------------------------------------------------------------
__c98d:     LDX #$22           ; $c98d: a2 22     
            STX $00            ; $c98f: 86 00     
__c991:     NOP                ; $c991: ea        
            SEC                ; $c992: 38        
            CLV                ; $c993: b8        
            LDA #$9f           ; $c994: a9 9f     
            BEQ __c9a1         ; $c996: f0 09     
            BPL __c9a1         ; $c998: 10 07     
            BVS __c9a1         ; $c99a: 70 05     
            BCC __c9a1         ; $c99c: 90 03     
            JMP __c9a5         ; $c99e: 4c a5 c9  

;-------------------------------------------------------------------------------
__c9a1:     LDX #$23           ; $c9a1: a2 23     
            STX $00            ; $c9a3: 86 00     
__c9a5:     NOP                ; $c9a5: ea        
            CLC                ; $c9a6: 18        
            BIT $01            ; $c9a7: 24 01     
            LDA #$00           ; $c9a9: a9 00     
            BNE __c9b6         ; $c9ab: d0 09     
            BMI __c9b6         ; $c9ad: 30 07     
            BVC __c9b6         ; $c9af: 50 05     
            BCS __c9b6         ; $c9b1: b0 03     
            JMP __c9ba         ; $c9b3: 4c ba c9  

;-------------------------------------------------------------------------------
__c9b6:     LDX #$23           ; $c9b6: a2 23     
            STX $00            ; $c9b8: 86 00     
__c9ba:     NOP                ; $c9ba: ea        
            BIT $01            ; $c9bb: 24 01     
            LDA #$40           ; $c9bd: a9 40     
            CMP #$40           ; $c9bf: c9 40     
            BMI __c9cc         ; $c9c1: 30 09     
            BCC __c9cc         ; $c9c3: 90 07     
            BNE __c9cc         ; $c9c5: d0 05     
            BVC __c9cc         ; $c9c7: 50 03     
            JMP __c9d0         ; $c9c9: 4c d0 c9  

;-------------------------------------------------------------------------------
__c9cc:     LDX #$24           ; $c9cc: a2 24     
            STX $00            ; $c9ce: 86 00     
__c9d0:     NOP                ; $c9d0: ea        
            CLV                ; $c9d1: b8        
            CMP #$3f           ; $c9d2: c9 3f     
            BEQ __c9df         ; $c9d4: f0 09     
            BMI __c9df         ; $c9d6: 30 07     
            BCC __c9df         ; $c9d8: 90 05     
            BVS __c9df         ; $c9da: 70 03     
            JMP __c9e3         ; $c9dc: 4c e3 c9  

;-------------------------------------------------------------------------------
__c9df:     LDX #$25           ; $c9df: a2 25     
            STX $00            ; $c9e1: 86 00     
__c9e3:     NOP                ; $c9e3: ea        
            CMP #$41           ; $c9e4: c9 41     
            BEQ __c9ef         ; $c9e6: f0 07     
            BPL __c9ef         ; $c9e8: 10 05     
            BPL __c9ef         ; $c9ea: 10 03     
            JMP __c9f3         ; $c9ec: 4c f3 c9  

;-------------------------------------------------------------------------------
__c9ef:     LDX #$26           ; $c9ef: a2 26     
            STX $00            ; $c9f1: 86 00     
__c9f3:     NOP                ; $c9f3: ea        
            LDA #$80           ; $c9f4: a9 80     
            CMP #$00           ; $c9f6: c9 00     
            BEQ __ca01         ; $c9f8: f0 07     
            BPL __ca01         ; $c9fa: 10 05     
            BCC __ca01         ; $c9fc: 90 03     
            JMP __ca05         ; $c9fe: 4c 05 ca  

;-------------------------------------------------------------------------------
__ca01:     LDX #$27           ; $ca01: a2 27     
            STX $00            ; $ca03: 86 00     
__ca05:     NOP                ; $ca05: ea        
            CMP #$80           ; $ca06: c9 80     
            BNE __ca11         ; $ca08: d0 07     
            BMI __ca11         ; $ca0a: 30 05     
            BCC __ca11         ; $ca0c: 90 03     
            JMP __ca15         ; $ca0e: 4c 15 ca  

;-------------------------------------------------------------------------------
__ca11:     LDX #$28           ; $ca11: a2 28     
            STX $00            ; $ca13: 86 00     
__ca15:     NOP                ; $ca15: ea        
            CMP #$81           ; $ca16: c9 81     
            BCS __ca21         ; $ca18: b0 07     
            BEQ __ca21         ; $ca1a: f0 05     
            BPL __ca21         ; $ca1c: 10 03     
            JMP __ca25         ; $ca1e: 4c 25 ca  

;-------------------------------------------------------------------------------
__ca21:     LDX #$29           ; $ca21: a2 29     
            STX $00            ; $ca23: 86 00     
__ca25:     NOP                ; $ca25: ea        
            CMP #$7f           ; $ca26: c9 7f     
            BCC __ca31         ; $ca28: 90 07     
            BEQ __ca31         ; $ca2a: f0 05     
            BMI __ca31         ; $ca2c: 30 03     
            JMP __ca35         ; $ca2e: 4c 35 ca  

;-------------------------------------------------------------------------------
__ca31:     LDX #$2a           ; $ca31: a2 2a     
            STX $00            ; $ca33: 86 00     
__ca35:     NOP                ; $ca35: ea        
            BIT $01            ; $ca36: 24 01     
            LDY #$40           ; $ca38: a0 40     
            CPY #$40           ; $ca3a: c0 40     
            BNE __ca47         ; $ca3c: d0 09     
            BMI __ca47         ; $ca3e: 30 07     
            BCC __ca47         ; $ca40: 90 05     
            BVC __ca47         ; $ca42: 50 03     
            JMP __ca4b         ; $ca44: 4c 4b ca  

;-------------------------------------------------------------------------------
__ca47:     LDX #$2b           ; $ca47: a2 2b     
            STX $00            ; $ca49: 86 00     
__ca4b:     NOP                ; $ca4b: ea        
            CLV                ; $ca4c: b8        
            CPY #$3f           ; $ca4d: c0 3f     
            BEQ __ca5a         ; $ca4f: f0 09     
            BMI __ca5a         ; $ca51: 30 07     
            BCC __ca5a         ; $ca53: 90 05     
            BVS __ca5a         ; $ca55: 70 03     
            JMP __ca5e         ; $ca57: 4c 5e ca  

;-------------------------------------------------------------------------------
__ca5a:     LDX #$2c           ; $ca5a: a2 2c     
            STX $00            ; $ca5c: 86 00     
__ca5e:     NOP                ; $ca5e: ea        
            CPY #$41           ; $ca5f: c0 41     
            BEQ __ca6a         ; $ca61: f0 07     
            BPL __ca6a         ; $ca63: 10 05     
            BPL __ca6a         ; $ca65: 10 03     
            JMP __ca6e         ; $ca67: 4c 6e ca  

;-------------------------------------------------------------------------------
__ca6a:     LDX #$2d           ; $ca6a: a2 2d     
            STX $00            ; $ca6c: 86 00     
__ca6e:     NOP                ; $ca6e: ea        
            LDY #$80           ; $ca6f: a0 80     
            CPY #$00           ; $ca71: c0 00     
            BEQ __ca7c         ; $ca73: f0 07     
            BPL __ca7c         ; $ca75: 10 05     
            BCC __ca7c         ; $ca77: 90 03     
            JMP __ca80         ; $ca79: 4c 80 ca  

;-------------------------------------------------------------------------------
__ca7c:     LDX #$2e           ; $ca7c: a2 2e     
            STX $00            ; $ca7e: 86 00     
__ca80:     NOP                ; $ca80: ea        
            CPY #$80           ; $ca81: c0 80     
            BNE __ca8c         ; $ca83: d0 07     
            BMI __ca8c         ; $ca85: 30 05     
            BCC __ca8c         ; $ca87: 90 03     
            JMP __ca90         ; $ca89: 4c 90 ca  

;-------------------------------------------------------------------------------
__ca8c:     LDX #$2f           ; $ca8c: a2 2f     
            STX $00            ; $ca8e: 86 00     
__ca90:     NOP                ; $ca90: ea        
            CPY #$81           ; $ca91: c0 81     
            BCS __ca9c         ; $ca93: b0 07     
            BEQ __ca9c         ; $ca95: f0 05     
            BPL __ca9c         ; $ca97: 10 03     
            JMP __caa0         ; $ca99: 4c a0 ca  

;-------------------------------------------------------------------------------
__ca9c:     LDX #$30           ; $ca9c: a2 30     
            STX $00            ; $ca9e: 86 00     
__caa0:     NOP                ; $caa0: ea        
            CPY #$7f           ; $caa1: c0 7f     
            BCC __caac         ; $caa3: 90 07     
            BEQ __caac         ; $caa5: f0 05     
            BMI __caac         ; $caa7: 30 03     
            JMP __cab0         ; $caa9: 4c b0 ca  

;-------------------------------------------------------------------------------
__caac:     LDX #$31           ; $caac: a2 31     
            STX $00            ; $caae: 86 00     
__cab0:     NOP                ; $cab0: ea        
            BIT $01            ; $cab1: 24 01     
            LDX #$40           ; $cab3: a2 40     
            CPX #$40           ; $cab5: e0 40     
            BNE __cac2         ; $cab7: d0 09     
            BMI __cac2         ; $cab9: 30 07     
            BCC __cac2         ; $cabb: 90 05     
            BVC __cac2         ; $cabd: 50 03     
            JMP __cac6         ; $cabf: 4c c6 ca  

;-------------------------------------------------------------------------------
__cac2:     LDA #$32           ; $cac2: a9 32     
            STA $00            ; $cac4: 85 00     
__cac6:     NOP                ; $cac6: ea        
            CLV                ; $cac7: b8        
            CPX #$3f           ; $cac8: e0 3f     
            BEQ __cad5         ; $caca: f0 09     
            BMI __cad5         ; $cacc: 30 07     
            BCC __cad5         ; $cace: 90 05     
            BVS __cad5         ; $cad0: 70 03     
            JMP __cad9         ; $cad2: 4c d9 ca  

;-------------------------------------------------------------------------------
__cad5:     LDA #$33           ; $cad5: a9 33     
            STA $00            ; $cad7: 85 00     
__cad9:     NOP                ; $cad9: ea        
            CPX #$41           ; $cada: e0 41     
            BEQ __cae5         ; $cadc: f0 07     
            BPL __cae5         ; $cade: 10 05     
            BPL __cae5         ; $cae0: 10 03     
            JMP __cae9         ; $cae2: 4c e9 ca  

;-------------------------------------------------------------------------------
__cae5:     LDA #$34           ; $cae5: a9 34     
            STA $00            ; $cae7: 85 00     
__cae9:     NOP                ; $cae9: ea        
            LDX #$80           ; $caea: a2 80     
            CPX #$00           ; $caec: e0 00     
            BEQ __caf7         ; $caee: f0 07     
            BPL __caf7         ; $caf0: 10 05     
            BCC __caf7         ; $caf2: 90 03     
            JMP __cafb         ; $caf4: 4c fb ca  

;-------------------------------------------------------------------------------
__caf7:     LDA #$35           ; $caf7: a9 35     
            STA $00            ; $caf9: 85 00     
__cafb:     NOP                ; $cafb: ea        
            CPX #$80           ; $cafc: e0 80     
            BNE __cb07         ; $cafe: d0 07     
            BMI __cb07         ; $cb00: 30 05     
            BCC __cb07         ; $cb02: 90 03     
            JMP __cb0b         ; $cb04: 4c 0b cb  

;-------------------------------------------------------------------------------
__cb07:     LDA #$36           ; $cb07: a9 36     
            STA $00            ; $cb09: 85 00     
__cb0b:     NOP                ; $cb0b: ea        
            CPX #$81           ; $cb0c: e0 81     
            BCS __cb17         ; $cb0e: b0 07     
            BEQ __cb17         ; $cb10: f0 05     
            BPL __cb17         ; $cb12: 10 03     
            JMP __cb1b         ; $cb14: 4c 1b cb  

;-------------------------------------------------------------------------------
__cb17:     LDA #$37           ; $cb17: a9 37     
            STA $00            ; $cb19: 85 00     
__cb1b:     NOP                ; $cb1b: ea        
            CPX #$7f           ; $cb1c: e0 7f     
            BCC __cb27         ; $cb1e: 90 07     
            BEQ __cb27         ; $cb20: f0 05     
            BMI __cb27         ; $cb22: 30 03     
            JMP __cb2b         ; $cb24: 4c 2b cb  

;-------------------------------------------------------------------------------
__cb27:     LDA #$38           ; $cb27: a9 38     
            STA $00            ; $cb29: 85 00     
__cb2b:     NOP                ; $cb2b: ea        
            SEC                ; $cb2c: 38        
            CLV                ; $cb2d: b8        
            LDX #$9f           ; $cb2e: a2 9f     
            BEQ __cb3b         ; $cb30: f0 09     
            BPL __cb3b         ; $cb32: 10 07     
            BVS __cb3b         ; $cb34: 70 05     
            BCC __cb3b         ; $cb36: 90 03     
            JMP __cb3f         ; $cb38: 4c 3f cb  

;-------------------------------------------------------------------------------
__cb3b:     LDX #$39           ; $cb3b: a2 39     
            STX $00            ; $cb3d: 86 00     
__cb3f:     NOP                ; $cb3f: ea        
            CLC                ; $cb40: 18        
            BIT $01            ; $cb41: 24 01     
            LDX #$00           ; $cb43: a2 00     
            BNE __cb50         ; $cb45: d0 09     
            BMI __cb50         ; $cb47: 30 07     
            BVC __cb50         ; $cb49: 50 05     
            BCS __cb50         ; $cb4b: b0 03     
            JMP __cb54         ; $cb4d: 4c 54 cb  

;-------------------------------------------------------------------------------
__cb50:     LDX #$3a           ; $cb50: a2 3a     
            STX $00            ; $cb52: 86 00     
__cb54:     NOP                ; $cb54: ea        
            SEC                ; $cb55: 38        
            CLV                ; $cb56: b8        
            LDY #$9f           ; $cb57: a0 9f     
            BEQ __cb64         ; $cb59: f0 09     
            BPL __cb64         ; $cb5b: 10 07     
            BVS __cb64         ; $cb5d: 70 05     
            BCC __cb64         ; $cb5f: 90 03     
            JMP __cb68         ; $cb61: 4c 68 cb  

;-------------------------------------------------------------------------------
__cb64:     LDX #$3b           ; $cb64: a2 3b     
            STX $00            ; $cb66: 86 00     
__cb68:     NOP                ; $cb68: ea        
            CLC                ; $cb69: 18        
            BIT $01            ; $cb6a: 24 01     
            LDY #$00           ; $cb6c: a0 00     
            BNE __cb79         ; $cb6e: d0 09     
            BMI __cb79         ; $cb70: 30 07     
            BVC __cb79         ; $cb72: 50 05     
            BCS __cb79         ; $cb74: b0 03     
            JMP __cb7d         ; $cb76: 4c 7d cb  

;-------------------------------------------------------------------------------
__cb79:     LDX #$3c           ; $cb79: a2 3c     
            STX $00            ; $cb7b: 86 00     
__cb7d:     NOP                ; $cb7d: ea        
            LDA #$55           ; $cb7e: a9 55     
            LDX #$aa           ; $cb80: a2 aa     
            LDY #$33           ; $cb82: a0 33     
            CMP #$55           ; $cb84: c9 55     
            BNE __cbab         ; $cb86: d0 23     
            CPX #$aa           ; $cb88: e0 aa     
            BNE __cbab         ; $cb8a: d0 1f     
            CPY #$33           ; $cb8c: c0 33     
            BNE __cbab         ; $cb8e: d0 1b     
            CMP #$55           ; $cb90: c9 55     
            BNE __cbab         ; $cb92: d0 17     
            CPX #$aa           ; $cb94: e0 aa     
            BNE __cbab         ; $cb96: d0 13     
            CPY #$33           ; $cb98: c0 33     
            BNE __cbab         ; $cb9a: d0 0f     
            CMP #$56           ; $cb9c: c9 56     
            BEQ __cbab         ; $cb9e: f0 0b     
            CPX #$ab           ; $cba0: e0 ab     
            BEQ __cbab         ; $cba2: f0 07     
            CPY #$34           ; $cba4: c0 34     
            BEQ __cbab         ; $cba6: f0 03     
            JMP __cbaf         ; $cba8: 4c af cb  

;-------------------------------------------------------------------------------
__cbab:     LDX #$3d           ; $cbab: a2 3d     
            STX $00            ; $cbad: 86 00     
__cbaf:     LDY #$71           ; $cbaf: a0 71     
            JSR __f931         ; $cbb1: 20 31 f9  
            SBC #$40           ; $cbb4: e9 40     
            JSR __f937         ; $cbb6: 20 37 f9  
            INY                ; $cbb9: c8        
            JSR __f947         ; $cbba: 20 47 f9  
            SBC #$3f           ; $cbbd: e9 3f     
            JSR __f94c         ; $cbbf: 20 4c f9  
            INY                ; $cbc2: c8        
            JSR __f95c         ; $cbc3: 20 5c f9  
            SBC #$41           ; $cbc6: e9 41     
            JSR __f962         ; $cbc8: 20 62 f9  
            INY                ; $cbcb: c8        
            JSR __f972         ; $cbcc: 20 72 f9  
            SBC #$00           ; $cbcf: e9 00     
            JSR __f976         ; $cbd1: 20 76 f9  
            INY                ; $cbd4: c8        
            JSR __f980         ; $cbd5: 20 80 f9  
            SBC #$7f           ; $cbd8: e9 7f     
            JSR __f984         ; $cbda: 20 84 f9  
            RTS                ; $cbdd: 60        

;-------------------------------------------------------------------------------
__cbde:     NOP                ; $cbde: ea        
            LDA #$ff           ; $cbdf: a9 ff     
            STA $01            ; $cbe1: 85 01     
            LDA #$44           ; $cbe3: a9 44     
            LDX #$55           ; $cbe5: a2 55     
            LDY #$66           ; $cbe7: a0 66     
            INX                ; $cbe9: e8        
            DEY                ; $cbea: 88        
            CPX #$56           ; $cbeb: e0 56     
            BNE __cc10         ; $cbed: d0 21     
            CPY #$65           ; $cbef: c0 65     
            BNE __cc10         ; $cbf1: d0 1d     
            INX                ; $cbf3: e8        
            INX                ; $cbf4: e8        
            DEY                ; $cbf5: 88        
            DEY                ; $cbf6: 88        
            CPX #$58           ; $cbf7: e0 58     
            BNE __cc10         ; $cbf9: d0 15     
            CPY #$63           ; $cbfb: c0 63     
            BNE __cc10         ; $cbfd: d0 11     
            DEX                ; $cbff: ca        
            INY                ; $cc00: c8        
            CPX #$57           ; $cc01: e0 57     
            BNE __cc10         ; $cc03: d0 0b     
            CPY #$64           ; $cc05: c0 64     
            BNE __cc10         ; $cc07: d0 07     
            CMP #$44           ; $cc09: c9 44     
            BNE __cc10         ; $cc0b: d0 03     
            JMP __cc14         ; $cc0d: 4c 14 cc  

;-------------------------------------------------------------------------------
__cc10:     LDX #$3e           ; $cc10: a2 3e     
            STX $00            ; $cc12: 86 00     
__cc14:     NOP                ; $cc14: ea        
            SEC                ; $cc15: 38        
            LDX #$69           ; $cc16: a2 69     
            LDA #$96           ; $cc18: a9 96     
            BIT $01            ; $cc1a: 24 01     
            LDY #$ff           ; $cc1c: a0 ff     
            INY                ; $cc1e: c8        
            BNE __cc5e         ; $cc1f: d0 3d     
            BMI __cc5e         ; $cc21: 30 3b     
            BCC __cc5e         ; $cc23: 90 39     
            BVC __cc5e         ; $cc25: 50 37     
            CPY #$00           ; $cc27: c0 00     
            BNE __cc5e         ; $cc29: d0 33     
            INY                ; $cc2b: c8        
            BEQ __cc5e         ; $cc2c: f0 30     
            BMI __cc5e         ; $cc2e: 30 2e     
            BCC __cc5e         ; $cc30: 90 2c     
            BVC __cc5e         ; $cc32: 50 2a     
            CLC                ; $cc34: 18        
            CLV                ; $cc35: b8        
            LDY #$00           ; $cc36: a0 00     
            DEY                ; $cc38: 88        
            BEQ __cc5e         ; $cc39: f0 23     
            BPL __cc5e         ; $cc3b: 10 21     
            BCS __cc5e         ; $cc3d: b0 1f     
            BVS __cc5e         ; $cc3f: 70 1d     
            CPY #$ff           ; $cc41: c0 ff     
            BNE __cc5e         ; $cc43: d0 19     
            CLC                ; $cc45: 18        
            DEY                ; $cc46: 88        
            BEQ __cc5e         ; $cc47: f0 15     
            BPL __cc5e         ; $cc49: 10 13     
            BCS __cc5e         ; $cc4b: b0 11     
            BVS __cc5e         ; $cc4d: 70 0f     
            CPY #$fe           ; $cc4f: c0 fe     
            BNE __cc5e         ; $cc51: d0 0b     
            CMP #$96           ; $cc53: c9 96     
            BNE __cc5e         ; $cc55: d0 07     
            CPX #$69           ; $cc57: e0 69     
            BNE __cc5e         ; $cc59: d0 03     
            JMP __cc62         ; $cc5b: 4c 62 cc  

;-------------------------------------------------------------------------------
__cc5e:     LDX #$3f           ; $cc5e: a2 3f     
            STX $00            ; $cc60: 86 00     
__cc62:     NOP                ; $cc62: ea        
            SEC                ; $cc63: 38        
            LDY #$69           ; $cc64: a0 69     
            LDA #$96           ; $cc66: a9 96     
            BIT $01            ; $cc68: 24 01     
            LDX #$ff           ; $cc6a: a2 ff     
            INX                ; $cc6c: e8        
            BNE __ccac         ; $cc6d: d0 3d     
            BMI __ccac         ; $cc6f: 30 3b     
            BCC __ccac         ; $cc71: 90 39     
            BVC __ccac         ; $cc73: 50 37     
            CPX #$00           ; $cc75: e0 00     
            BNE __ccac         ; $cc77: d0 33     
            INX                ; $cc79: e8        
            BEQ __ccac         ; $cc7a: f0 30     
            BMI __ccac         ; $cc7c: 30 2e     
            BCC __ccac         ; $cc7e: 90 2c     
            BVC __ccac         ; $cc80: 50 2a     
            CLC                ; $cc82: 18        
            CLV                ; $cc83: b8        
            LDX #$00           ; $cc84: a2 00     
            DEX                ; $cc86: ca        
            BEQ __ccac         ; $cc87: f0 23     
            BPL __ccac         ; $cc89: 10 21     
            BCS __ccac         ; $cc8b: b0 1f     
            BVS __ccac         ; $cc8d: 70 1d     
            CPX #$ff           ; $cc8f: e0 ff     
            BNE __ccac         ; $cc91: d0 19     
            CLC                ; $cc93: 18        
            DEX                ; $cc94: ca        
            BEQ __ccac         ; $cc95: f0 15     
            BPL __ccac         ; $cc97: 10 13     
            BCS __ccac         ; $cc99: b0 11     
            BVS __ccac         ; $cc9b: 70 0f     
            CPX #$fe           ; $cc9d: e0 fe     
            BNE __ccac         ; $cc9f: d0 0b     
            CMP #$96           ; $cca1: c9 96     
            BNE __ccac         ; $cca3: d0 07     
            CPY #$69           ; $cca5: c0 69     
            BNE __ccac         ; $cca7: d0 03     
            JMP __ccb0         ; $cca9: 4c b0 cc  

;-------------------------------------------------------------------------------
__ccac:     LDX #$40           ; $ccac: a2 40     
            STX $00            ; $ccae: 86 00     
__ccb0:     NOP                ; $ccb0: ea        
            LDA #$85           ; $ccb1: a9 85     
            LDX #$34           ; $ccb3: a2 34     
            LDY #$99           ; $ccb5: a0 99     
            CLC                ; $ccb7: 18        
            BIT $01            ; $ccb8: 24 01     
            TAY                ; $ccba: a8        
            BEQ __cceb         ; $ccbb: f0 2e     
            BCS __cceb         ; $ccbd: b0 2c     
            BVC __cceb         ; $ccbf: 50 2a     
            BPL __cceb         ; $ccc1: 10 28     
            CMP #$85           ; $ccc3: c9 85     
            BNE __cceb         ; $ccc5: d0 24     
            CPX #$34           ; $ccc7: e0 34     
            BNE __cceb         ; $ccc9: d0 20     
            CPY #$85           ; $cccb: c0 85     
            BNE __cceb         ; $cccd: d0 1c     
            LDA #$00           ; $cccf: a9 00     
            SEC                ; $ccd1: 38        
            CLV                ; $ccd2: b8        
            TAY                ; $ccd3: a8        
            BNE __cceb         ; $ccd4: d0 15     
            BCC __cceb         ; $ccd6: 90 13     
            BVS __cceb         ; $ccd8: 70 11     
            BMI __cceb         ; $ccda: 30 0f     
            CMP #$00           ; $ccdc: c9 00     
            BNE __cceb         ; $ccde: d0 0b     
            CPX #$34           ; $cce0: e0 34     
            BNE __cceb         ; $cce2: d0 07     
            CPY #$00           ; $cce4: c0 00     
            BNE __cceb         ; $cce6: d0 03     
            JMP __ccef         ; $cce8: 4c ef cc  

;-------------------------------------------------------------------------------
__cceb:     LDX #$41           ; $cceb: a2 41     
            STX $00            ; $cced: 86 00     
__ccef:     NOP                ; $ccef: ea        
            LDA #$85           ; $ccf0: a9 85     
            LDX #$34           ; $ccf2: a2 34     
            LDY #$99           ; $ccf4: a0 99     
            CLC                ; $ccf6: 18        
            BIT $01            ; $ccf7: 24 01     
            TAX                ; $ccf9: aa        
            BEQ __cd2a         ; $ccfa: f0 2e     
            BCS __cd2a         ; $ccfc: b0 2c     
            BVC __cd2a         ; $ccfe: 50 2a     
            BPL __cd2a         ; $cd00: 10 28     
            CMP #$85           ; $cd02: c9 85     
            BNE __cd2a         ; $cd04: d0 24     
            CPX #$85           ; $cd06: e0 85     
            BNE __cd2a         ; $cd08: d0 20     
            CPY #$99           ; $cd0a: c0 99     
            BNE __cd2a         ; $cd0c: d0 1c     
            LDA #$00           ; $cd0e: a9 00     
            SEC                ; $cd10: 38        
            CLV                ; $cd11: b8        
            TAX                ; $cd12: aa        
            BNE __cd2a         ; $cd13: d0 15     
            BCC __cd2a         ; $cd15: 90 13     
            BVS __cd2a         ; $cd17: 70 11     
            BMI __cd2a         ; $cd19: 30 0f     
            CMP #$00           ; $cd1b: c9 00     
            BNE __cd2a         ; $cd1d: d0 0b     
            CPX #$00           ; $cd1f: e0 00     
            BNE __cd2a         ; $cd21: d0 07     
            CPY #$99           ; $cd23: c0 99     
            BNE __cd2a         ; $cd25: d0 03     
            JMP __cd2e         ; $cd27: 4c 2e cd  

;-------------------------------------------------------------------------------
__cd2a:     LDX #$42           ; $cd2a: a2 42     
            STX $00            ; $cd2c: 86 00     
__cd2e:     NOP                ; $cd2e: ea        
            LDA #$85           ; $cd2f: a9 85     
            LDX #$34           ; $cd31: a2 34     
            LDY #$99           ; $cd33: a0 99     
            CLC                ; $cd35: 18        
            BIT $01            ; $cd36: 24 01     
            TYA                ; $cd38: 98        
            BEQ __cd69         ; $cd39: f0 2e     
            BCS __cd69         ; $cd3b: b0 2c     
            BVC __cd69         ; $cd3d: 50 2a     
            BPL __cd69         ; $cd3f: 10 28     
            CMP #$99           ; $cd41: c9 99     
            BNE __cd69         ; $cd43: d0 24     
            CPX #$34           ; $cd45: e0 34     
            BNE __cd69         ; $cd47: d0 20     
            CPY #$99           ; $cd49: c0 99     
            BNE __cd69         ; $cd4b: d0 1c     
            LDY #$00           ; $cd4d: a0 00     
            SEC                ; $cd4f: 38        
            CLV                ; $cd50: b8        
            TYA                ; $cd51: 98        
            BNE __cd69         ; $cd52: d0 15     
            BCC __cd69         ; $cd54: 90 13     
            BVS __cd69         ; $cd56: 70 11     
            BMI __cd69         ; $cd58: 30 0f     
            CMP #$00           ; $cd5a: c9 00     
            BNE __cd69         ; $cd5c: d0 0b     
            CPX #$34           ; $cd5e: e0 34     
            BNE __cd69         ; $cd60: d0 07     
            CPY #$00           ; $cd62: c0 00     
            BNE __cd69         ; $cd64: d0 03     
            JMP __cd6d         ; $cd66: 4c 6d cd  

;-------------------------------------------------------------------------------
__cd69:     LDX #$43           ; $cd69: a2 43     
            STX $00            ; $cd6b: 86 00     
__cd6d:     NOP                ; $cd6d: ea        
            LDA #$85           ; $cd6e: a9 85     
            LDX #$34           ; $cd70: a2 34     
            LDY #$99           ; $cd72: a0 99     
            CLC                ; $cd74: 18        
            BIT $01            ; $cd75: 24 01     
            TXA                ; $cd77: 8a        
            BEQ __cda8         ; $cd78: f0 2e     
            BCS __cda8         ; $cd7a: b0 2c     
            BVC __cda8         ; $cd7c: 50 2a     
            BMI __cda8         ; $cd7e: 30 28     
            CMP #$34           ; $cd80: c9 34     
            BNE __cda8         ; $cd82: d0 24     
            CPX #$34           ; $cd84: e0 34     
            BNE __cda8         ; $cd86: d0 20     
            CPY #$99           ; $cd88: c0 99     
            BNE __cda8         ; $cd8a: d0 1c     
            LDX #$00           ; $cd8c: a2 00     
            SEC                ; $cd8e: 38        
            CLV                ; $cd8f: b8        
            TXA                ; $cd90: 8a        
            BNE __cda8         ; $cd91: d0 15     
            BCC __cda8         ; $cd93: 90 13     
            BVS __cda8         ; $cd95: 70 11     
            BMI __cda8         ; $cd97: 30 0f     
            CMP #$00           ; $cd99: c9 00     
            BNE __cda8         ; $cd9b: d0 0b     
            CPX #$00           ; $cd9d: e0 00     
            BNE __cda8         ; $cd9f: d0 07     
            CPY #$99           ; $cda1: c0 99     
            BNE __cda8         ; $cda3: d0 03     
            JMP __cdac         ; $cda5: 4c ac cd  

;-------------------------------------------------------------------------------
__cda8:     LDX #$44           ; $cda8: a2 44     
            STX $00            ; $cdaa: 86 00     
__cdac:     NOP                ; $cdac: ea        
            TSX                ; $cdad: ba        
            STX $07ff          ; $cdae: 8e ff 07  
            LDY #$33           ; $cdb1: a0 33     
            LDX #$69           ; $cdb3: a2 69     
            LDA #$84           ; $cdb5: a9 84     
            CLC                ; $cdb7: 18        
            BIT $01            ; $cdb8: 24 01     
            TXS                ; $cdba: 9a        
            BEQ __cdef         ; $cdbb: f0 32     
            BPL __cdef         ; $cdbd: 10 30     
            BCS __cdef         ; $cdbf: b0 2e     
            BVC __cdef         ; $cdc1: 50 2c     
            CMP #$84           ; $cdc3: c9 84     
            BNE __cdef         ; $cdc5: d0 28     
            CPX #$69           ; $cdc7: e0 69     
            BNE __cdef         ; $cdc9: d0 24     
            CPY #$33           ; $cdcb: c0 33     
            BNE __cdef         ; $cdcd: d0 20     
            LDY #$01           ; $cdcf: a0 01     
            LDA #$04           ; $cdd1: a9 04     
            SEC                ; $cdd3: 38        
            CLV                ; $cdd4: b8        
            LDX #$00           ; $cdd5: a2 00     
            TSX                ; $cdd7: ba        
            BEQ __cdef         ; $cdd8: f0 15     
            BMI __cdef         ; $cdda: 30 13     
            BCC __cdef         ; $cddc: 90 11     
            BVS __cdef         ; $cdde: 70 0f     
            CPX #$69           ; $cde0: e0 69     
            BNE __cdef         ; $cde2: d0 0b     
            CMP #$04           ; $cde4: c9 04     
            BNE __cdef         ; $cde6: d0 07     
            CPY #$01           ; $cde8: c0 01     
            BNE __cdef         ; $cdea: d0 03     
            JMP __cdf3         ; $cdec: 4c f3 cd  

;-------------------------------------------------------------------------------
__cdef:     LDX #$45           ; $cdef: a2 45     
            STX $00            ; $cdf1: 86 00     
__cdf3:     LDX $07ff          ; $cdf3: ae ff 07  
            TXS                ; $cdf6: 9a        
            RTS                ; $cdf7: 60        

;-------------------------------------------------------------------------------
__cdf8:     LDA #$ff           ; $cdf8: a9 ff     
            STA $01            ; $cdfa: 85 01     
            TSX                ; $cdfc: ba        
            STX $07ff          ; $cdfd: 8e ff 07  
            NOP                ; $ce00: ea        
            LDX #$80           ; $ce01: a2 80     
            TXS                ; $ce03: 9a        
            LDA #$33           ; $ce04: a9 33     
            PHA                ; $ce06: 48        
            LDA #$69           ; $ce07: a9 69     
            PHA                ; $ce09: 48        
            TSX                ; $ce0a: ba        
            CPX #$7e           ; $ce0b: e0 7e     
            BNE __ce2f         ; $ce0d: d0 20     
            PLA                ; $ce0f: 68        
            CMP #$69           ; $ce10: c9 69     
            BNE __ce2f         ; $ce12: d0 1b     
            PLA                ; $ce14: 68        
            CMP #$33           ; $ce15: c9 33     
            BNE __ce2f         ; $ce17: d0 16     
            TSX                ; $ce19: ba        
            CPX #$80           ; $ce1a: e0 80     
            BNE __ce2f         ; $ce1c: d0 11     
            LDA $0180          ; $ce1e: ad 80 01  
            CMP #$33           ; $ce21: c9 33     
            BNE __ce2f         ; $ce23: d0 0a     
            LDA $017f          ; $ce25: ad 7f 01  
            CMP #$69           ; $ce28: c9 69     
            BNE __ce2f         ; $ce2a: d0 03     
            JMP __ce33         ; $ce2c: 4c 33 ce  

;-------------------------------------------------------------------------------
__ce2f:     LDX #$46           ; $ce2f: a2 46     
            STX $00            ; $ce31: 86 00     
__ce33:     NOP                ; $ce33: ea        
            LDX #$80           ; $ce34: a2 80     
            TXS                ; $ce36: 9a        
            JSR __ce3d         ; $ce37: 20 3d ce  
            JMP __ce5b         ; $ce3a: 4c 5b ce  

;-------------------------------------------------------------------------------
__ce3d:     TSX                ; $ce3d: ba        
            CPX #$7e           ; $ce3e: e0 7e     
            BNE __ce5b         ; $ce40: d0 19     
            PLA                ; $ce42: 68        
            PLA                ; $ce43: 68        
            TSX                ; $ce44: ba        
            CPX #$80           ; $ce45: e0 80     
            BNE __ce5b         ; $ce47: d0 12     
            LDA #$00           ; $ce49: a9 00     
            JSR __ce4e         ; $ce4b: 20 4e ce  
__ce4e:     PLA                ; $ce4e: 68        
            CMP #$4d           ; $ce4f: c9 4d     
            BNE __ce5b         ; $ce51: d0 08     
            PLA                ; $ce53: 68        
            CMP #$ce           ; $ce54: c9 ce     
            BNE __ce5b         ; $ce56: d0 03     
            JMP __ce5f         ; $ce58: 4c 5f ce  

;-------------------------------------------------------------------------------
__ce5b:     LDX #$47           ; $ce5b: a2 47     
            STX $00            ; $ce5d: 86 00     
__ce5f:     NOP                ; $ce5f: ea        
            LDA #$ce           ; $ce60: a9 ce     
            PHA                ; $ce62: 48        
            LDA #$66           ; $ce63: a9 66     
            PHA                ; $ce65: 48        
__ce66:     RTS                ; $ce66: 60        

;-------------------------------------------------------------------------------
            LDX #$77           ; $ce67: a2 77     
            LDY #$69           ; $ce69: a0 69     
            CLC                ; $ce6b: 18        
            BIT $01            ; $ce6c: 24 01     
            LDA #$83           ; $ce6e: a9 83     
            JSR __ce66         ; $ce70: 20 66 ce  
            BEQ __ce99         ; $ce73: f0 24     
            BPL __ce99         ; $ce75: 10 22     
            BCS __ce99         ; $ce77: b0 20     
            BVC __ce99         ; $ce79: 50 1e     
            CMP #$83           ; $ce7b: c9 83     
            BNE __ce99         ; $ce7d: d0 1a     
            CPY #$69           ; $ce7f: c0 69     
            BNE __ce99         ; $ce81: d0 16     
            CPX #$77           ; $ce83: e0 77     
            BNE __ce99         ; $ce85: d0 12     
            SEC                ; $ce87: 38        
            CLV                ; $ce88: b8        
            LDA #$00           ; $ce89: a9 00     
            JSR __ce66         ; $ce8b: 20 66 ce  
            BNE __ce99         ; $ce8e: d0 09     
            BMI __ce99         ; $ce90: 30 07     
            BCC __ce99         ; $ce92: 90 05     
            BVS __ce99         ; $ce94: 70 03     
            JMP __ce9d         ; $ce96: 4c 9d ce  

;-------------------------------------------------------------------------------
__ce99:     LDX #$48           ; $ce99: a2 48     
            STX $00            ; $ce9b: 86 00     
__ce9d:     NOP                ; $ce9d: ea        
            LDA #$ce           ; $ce9e: a9 ce     
            PHA                ; $cea0: 48        
            LDA #$ae           ; $cea1: a9 ae     
            PHA                ; $cea3: 48        
            LDA #$65           ; $cea4: a9 65     
            PHA                ; $cea6: 48        
            LDA #$55           ; $cea7: a9 55     
            LDY #$88           ; $cea9: a0 88     
            LDX #$99           ; $ceab: a2 99     
            RTI                ; $cead: 40        

;-------------------------------------------------------------------------------
            BMI __cee5         ; $ceae: 30 35     
            BVC __cee5         ; $ceb0: 50 33     
            BEQ __cee5         ; $ceb2: f0 31     
            BCC __cee5         ; $ceb4: 90 2f     
            CMP #$55           ; $ceb6: c9 55     
            BNE __cee5         ; $ceb8: d0 2b     
            CPY #$88           ; $ceba: c0 88     
            BNE __cee5         ; $cebc: d0 27     
            CPX #$99           ; $cebe: e0 99     
            BNE __cee5         ; $cec0: d0 23     
            LDA #$ce           ; $cec2: a9 ce     
            PHA                ; $cec4: 48        
            LDA #$ce           ; $cec5: a9 ce     
            PHA                ; $cec7: 48        
            LDA #$87           ; $cec8: a9 87     
            PHA                ; $ceca: 48        
            LDA #$55           ; $cecb: a9 55     
            RTI                ; $cecd: 40        

;-------------------------------------------------------------------------------
            BPL __cee5         ; $cece: 10 15     
            BVS __cee5         ; $ced0: 70 13     
            BNE __cee5         ; $ced2: d0 11     
            BCC __cee5         ; $ced4: 90 0f     
            CMP #$55           ; $ced6: c9 55     
            BNE __cee5         ; $ced8: d0 0b     
            CPY #$88           ; $ceda: c0 88     
            BNE __cee5         ; $cedc: d0 07     
            CPX #$99           ; $cede: e0 99     
            BNE __cee5         ; $cee0: d0 03     
            JMP __cee9         ; $cee2: 4c e9 ce  

;-------------------------------------------------------------------------------
__cee5:     LDX #$49           ; $cee5: a2 49     
            STX $00            ; $cee7: 86 00     
__cee9:     LDX $07ff          ; $cee9: ae ff 07  
            TXS                ; $ceec: 9a        
            RTS                ; $ceed: 60        

;-------------------------------------------------------------------------------
__ceee:     LDX #$55           ; $ceee: a2 55     
            LDY #$69           ; $cef0: a0 69     
            LDA #$ff           ; $cef2: a9 ff     
            STA $01            ; $cef4: 85 01     
            NOP                ; $cef6: ea        
            BIT $01            ; $cef7: 24 01     
            SEC                ; $cef9: 38        
            LDA #$01           ; $cefa: a9 01     
            LSR                ; $cefc: 4a        
            BCC __cf1c         ; $cefd: 90 1d     
            BNE __cf1c         ; $ceff: d0 1b     
            BMI __cf1c         ; $cf01: 30 19     
            BVC __cf1c         ; $cf03: 50 17     
            CMP #$00           ; $cf05: c9 00     
            BNE __cf1c         ; $cf07: d0 13     
            CLV                ; $cf09: b8        
            LDA #$aa           ; $cf0a: a9 aa     
            LSR                ; $cf0c: 4a        
            BCS __cf1c         ; $cf0d: b0 0d     
            BEQ __cf1c         ; $cf0f: f0 0b     
            BMI __cf1c         ; $cf11: 30 09     
            BVS __cf1c         ; $cf13: 70 07     
            CMP #$55           ; $cf15: c9 55     
            BNE __cf1c         ; $cf17: d0 03     
            JMP __cf20         ; $cf19: 4c 20 cf  

;-------------------------------------------------------------------------------
__cf1c:     LDX #$4a           ; $cf1c: a2 4a     
            STX $00            ; $cf1e: 86 00     
__cf20:     NOP                ; $cf20: ea        
            BIT $01            ; $cf21: 24 01     
            SEC                ; $cf23: 38        
            LDA #$80           ; $cf24: a9 80     
            ASL                ; $cf26: 0a        
            BCC __cf47         ; $cf27: 90 1e     
            BNE __cf47         ; $cf29: d0 1c     
            BMI __cf47         ; $cf2b: 30 1a     
            BVC __cf47         ; $cf2d: 50 18     
            CMP #$00           ; $cf2f: c9 00     
            BNE __cf47         ; $cf31: d0 14     
            CLV                ; $cf33: b8        
            SEC                ; $cf34: 38        
            LDA #$55           ; $cf35: a9 55     
            ASL                ; $cf37: 0a        
            BCS __cf47         ; $cf38: b0 0d     
            BEQ __cf47         ; $cf3a: f0 0b     
            BPL __cf47         ; $cf3c: 10 09     
            BVS __cf47         ; $cf3e: 70 07     
            CMP #$aa           ; $cf40: c9 aa     
            BNE __cf47         ; $cf42: d0 03     
            JMP __cf4b         ; $cf44: 4c 4b cf  

;-------------------------------------------------------------------------------
__cf47:     LDX #$4b           ; $cf47: a2 4b     
            STX $00            ; $cf49: 86 00     
__cf4b:     NOP                ; $cf4b: ea        
            BIT $01            ; $cf4c: 24 01     
            SEC                ; $cf4e: 38        
            LDA #$01           ; $cf4f: a9 01     
            ROR                ; $cf51: 6a        
            BCC __cf72         ; $cf52: 90 1e     
            BEQ __cf72         ; $cf54: f0 1c     
            BPL __cf72         ; $cf56: 10 1a     
            BVC __cf72         ; $cf58: 50 18     
            CMP #$80           ; $cf5a: c9 80     
            BNE __cf72         ; $cf5c: d0 14     
            CLV                ; $cf5e: b8        
            CLC                ; $cf5f: 18        
            LDA #$55           ; $cf60: a9 55     
            ROR                ; $cf62: 6a        
            BCC __cf72         ; $cf63: 90 0d     
            BEQ __cf72         ; $cf65: f0 0b     
            BMI __cf72         ; $cf67: 30 09     
            BVS __cf72         ; $cf69: 70 07     
            CMP #$2a           ; $cf6b: c9 2a     
            BNE __cf72         ; $cf6d: d0 03     
            JMP __cf76         ; $cf6f: 4c 76 cf  

;-------------------------------------------------------------------------------
__cf72:     LDX #$4c           ; $cf72: a2 4c     
            STX $00            ; $cf74: 86 00     
__cf76:     NOP                ; $cf76: ea        
            BIT $01            ; $cf77: 24 01     
            SEC                ; $cf79: 38        
            LDA #$80           ; $cf7a: a9 80     
            ROL                ; $cf7c: 2a        
            BCC __cf9d         ; $cf7d: 90 1e     
            BEQ __cf9d         ; $cf7f: f0 1c     
            BMI __cf9d         ; $cf81: 30 1a     
            BVC __cf9d         ; $cf83: 50 18     
            CMP #$01           ; $cf85: c9 01     
            BNE __cf9d         ; $cf87: d0 14     
            CLV                ; $cf89: b8        
            CLC                ; $cf8a: 18        
            LDA #$55           ; $cf8b: a9 55     
            ROL                ; $cf8d: 2a        
            BCS __cf9d         ; $cf8e: b0 0d     
            BEQ __cf9d         ; $cf90: f0 0b     
            BPL __cf9d         ; $cf92: 10 09     
            BVS __cf9d         ; $cf94: 70 07     
            CMP #$aa           ; $cf96: c9 aa     
            BNE __cf9d         ; $cf98: d0 03     
            JMP __cfa1         ; $cf9a: 4c a1 cf  

;-------------------------------------------------------------------------------
__cf9d:     LDX #$4d           ; $cf9d: a2 4d     
            STX $00            ; $cf9f: 86 00     
__cfa1:     RTS                ; $cfa1: 60        

;-------------------------------------------------------------------------------
__cfa2:     LDA $00            ; $cfa2: a5 00     
            STA $07ff          ; $cfa4: 8d ff 07  
            LDA #$00           ; $cfa7: a9 00     
            STA $80            ; $cfa9: 85 80     
            LDA #$02           ; $cfab: a9 02     
            STA $81            ; $cfad: 85 81     
            LDA #$ff           ; $cfaf: a9 ff     
            STA $01            ; $cfb1: 85 01     
            LDA #$00           ; $cfb3: a9 00     
            STA $82            ; $cfb5: 85 82     
            LDA #$03           ; $cfb7: a9 03     
            STA $83            ; $cfb9: 85 83     
            STA $84            ; $cfbb: 85 84     
            LDA #$00           ; $cfbd: a9 00     
            STA $ff            ; $cfbf: 85 ff     
            LDA #$04           ; $cfc1: a9 04     
            STA $00            ; $cfc3: 85 00     
            LDA #$5a           ; $cfc5: a9 5a     
            STA $0200          ; $cfc7: 8d 00 02  
            LDA #$5b           ; $cfca: a9 5b     
            STA $0300          ; $cfcc: 8d 00 03  
            LDA #$5c           ; $cfcf: a9 5c     
            STA $0303          ; $cfd1: 8d 03 03  
            LDA #$5d           ; $cfd4: a9 5d     
            STA $0400          ; $cfd6: 8d 00 04  
            LDX #$00           ; $cfd9: a2 00     
            LDA ($80,x)        ; $cfdb: a1 80     
            CMP #$5a           ; $cfdd: c9 5a     
            BNE __d000         ; $cfdf: d0 1f     
            INX                ; $cfe1: e8        
            INX                ; $cfe2: e8        
            LDA ($80,x)        ; $cfe3: a1 80     
            CMP #$5b           ; $cfe5: c9 5b     
            BNE __d000         ; $cfe7: d0 17     
            INX                ; $cfe9: e8        
            LDA ($80,x)        ; $cfea: a1 80     
            CMP #$5c           ; $cfec: c9 5c     
            BNE __d000         ; $cfee: d0 10     
            LDX #$00           ; $cff0: a2 00     
            LDA ($ff,x)        ; $cff2: a1 ff     
            CMP #$5d           ; $cff4: c9 5d     
            BNE __d000         ; $cff6: d0 08     
            LDX #$81           ; $cff8: a2 81     
            LDA ($ff,x)        ; $cffa: a1 ff     
            CMP #$5a           ; $cffc: c9 5a     
            BEQ __d005         ; $cffe: f0 05     
__d000:     LDA #$58           ; $d000: a9 58     
            STA $07ff          ; $d002: 8d ff 07  
__d005:     LDA #$aa           ; $d005: a9 aa     
            LDX #$00           ; $d007: a2 00     
            STA ($80,x)        ; $d009: 81 80     
            INX                ; $d00b: e8        
            INX                ; $d00c: e8        
            LDA #$ab           ; $d00d: a9 ab     
            STA ($80,x)        ; $d00f: 81 80     
            INX                ; $d011: e8        
            LDA #$ac           ; $d012: a9 ac     
            STA ($80,x)        ; $d014: 81 80     
            LDX #$00           ; $d016: a2 00     
            LDA #$ad           ; $d018: a9 ad     
            STA ($ff,x)        ; $d01a: 81 ff     
            LDA $0200          ; $d01c: ad 00 02  
            CMP #$aa           ; $d01f: c9 aa     
            BNE __d038         ; $d021: d0 15     
            LDA $0300          ; $d023: ad 00 03  
            CMP #$ab           ; $d026: c9 ab     
            BNE __d038         ; $d028: d0 0e     
            LDA $0303          ; $d02a: ad 03 03  
            CMP #$ac           ; $d02d: c9 ac     
            BNE __d038         ; $d02f: d0 07     
            LDA $0400          ; $d031: ad 00 04  
            CMP #$ad           ; $d034: c9 ad     
            BEQ __d03d         ; $d036: f0 05     
__d038:     LDA #$59           ; $d038: a9 59     
            STA $07ff          ; $d03a: 8d ff 07  
__d03d:     LDA $07ff          ; $d03d: ad ff 07  
            STA $00            ; $d040: 85 00     
            LDA #$00           ; $d042: a9 00     
            STA $0300          ; $d044: 8d 00 03  
            LDA #$aa           ; $d047: a9 aa     
            STA $0200          ; $d049: 8d 00 02  
            LDX #$00           ; $d04c: a2 00     
            LDY #$5a           ; $d04e: a0 5a     
            JSR __f7b6         ; $d050: 20 b6 f7  
            ORA ($80,x)        ; $d053: 01 80     
            JSR __f7c0         ; $d055: 20 c0 f7  
            INY                ; $d058: c8        
            JSR __f7ce         ; $d059: 20 ce f7  
            ORA ($82,x)        ; $d05c: 01 82     
            JSR __f7d3         ; $d05e: 20 d3 f7  
            INY                ; $d061: c8        
            JSR __f7df         ; $d062: 20 df f7  
            AND ($80,x)        ; $d065: 21 80     
            JSR __f7e5         ; $d067: 20 e5 f7  
            INY                ; $d06a: c8        
            LDA #$ef           ; $d06b: a9 ef     
            STA $0300          ; $d06d: 8d 00 03  
            JSR __f7f1         ; $d070: 20 f1 f7  
            AND ($82,x)        ; $d073: 21 82     
            JSR __f7f6         ; $d075: 20 f6 f7  
            INY                ; $d078: c8        
            JSR __f804         ; $d079: 20 04 f8  
            EOR ($80,x)        ; $d07c: 41 80     
            JSR __f80a         ; $d07e: 20 0a f8  
            INY                ; $d081: c8        
            LDA #$70           ; $d082: a9 70     
            STA $0300          ; $d084: 8d 00 03  
            JSR __f818         ; $d087: 20 18 f8  
            EOR ($82,x)        ; $d08a: 41 82     
            JSR __f81d         ; $d08c: 20 1d f8  
            INY                ; $d08f: c8        
            LDA #$69           ; $d090: a9 69     
            STA $0200          ; $d092: 8d 00 02  
            JSR __f829         ; $d095: 20 29 f8  
            ADC ($80,x)        ; $d098: 61 80     
            JSR __f82f         ; $d09a: 20 2f f8  
            INY                ; $d09d: c8        
            JSR __f83d         ; $d09e: 20 3d f8  
            ADC ($80,x)        ; $d0a1: 61 80     
            JSR __f843         ; $d0a3: 20 43 f8  
            INY                ; $d0a6: c8        
            LDA #$7f           ; $d0a7: a9 7f     
            STA $0200          ; $d0a9: 8d 00 02  
            JSR __f851         ; $d0ac: 20 51 f8  
            ADC ($80,x)        ; $d0af: 61 80     
            JSR __f856         ; $d0b1: 20 56 f8  
            INY                ; $d0b4: c8        
            LDA #$80           ; $d0b5: a9 80     
            STA $0200          ; $d0b7: 8d 00 02  
            JSR __f864         ; $d0ba: 20 64 f8  
            ADC ($80,x)        ; $d0bd: 61 80     
            JSR __f86a         ; $d0bf: 20 6a f8  
            INY                ; $d0c2: c8        
            JSR __f878         ; $d0c3: 20 78 f8  
            ADC ($80,x)        ; $d0c6: 61 80     
            JSR __f87d         ; $d0c8: 20 7d f8  
            INY                ; $d0cb: c8        
            LDA #$40           ; $d0cc: a9 40     
            STA $0200          ; $d0ce: 8d 00 02  
            JSR __f889         ; $d0d1: 20 89 f8  
            CMP ($80,x)        ; $d0d4: c1 80     
            JSR __f88e         ; $d0d6: 20 8e f8  
            INY                ; $d0d9: c8        
            PHA                ; $d0da: 48        
            LDA #$3f           ; $d0db: a9 3f     
            STA $0200          ; $d0dd: 8d 00 02  
            PLA                ; $d0e0: 68        
            JSR __f89a         ; $d0e1: 20 9a f8  
            CMP ($80,x)        ; $d0e4: c1 80     
            JSR __f89c         ; $d0e6: 20 9c f8  
            INY                ; $d0e9: c8        
            PHA                ; $d0ea: 48        
            LDA #$41           ; $d0eb: a9 41     
            STA $0200          ; $d0ed: 8d 00 02  
            PLA                ; $d0f0: 68        
            CMP ($80,x)        ; $d0f1: c1 80     
            JSR __f8a8         ; $d0f3: 20 a8 f8  
            INY                ; $d0f6: c8        
            PHA                ; $d0f7: 48        
            LDA #$00           ; $d0f8: a9 00     
            STA $0200          ; $d0fa: 8d 00 02  
            PLA                ; $d0fd: 68        
            JSR __f8b2         ; $d0fe: 20 b2 f8  
            CMP ($80,x)        ; $d101: c1 80     
            JSR __f8b5         ; $d103: 20 b5 f8  
            INY                ; $d106: c8        
            PHA                ; $d107: 48        
            LDA #$80           ; $d108: a9 80     
            STA $0200          ; $d10a: 8d 00 02  
            PLA                ; $d10d: 68        
            CMP ($80,x)        ; $d10e: c1 80     
            JSR __f8bf         ; $d110: 20 bf f8  
            INY                ; $d113: c8        
            PHA                ; $d114: 48        
            LDA #$81           ; $d115: a9 81     
            STA $0200          ; $d117: 8d 00 02  
            PLA                ; $d11a: 68        
            CMP ($80,x)        ; $d11b: c1 80     
            JSR __f8c9         ; $d11d: 20 c9 f8  
            INY                ; $d120: c8        
            PHA                ; $d121: 48        
            LDA #$7f           ; $d122: a9 7f     
            STA $0200          ; $d124: 8d 00 02  
            PLA                ; $d127: 68        
            CMP ($80,x)        ; $d128: c1 80     
            JSR __f8d3         ; $d12a: 20 d3 f8  
            INY                ; $d12d: c8        
            LDA #$40           ; $d12e: a9 40     
            STA $0200          ; $d130: 8d 00 02  
            JSR __f931         ; $d133: 20 31 f9  
            SBC ($80,x)        ; $d136: e1 80     
            JSR __f937         ; $d138: 20 37 f9  
            INY                ; $d13b: c8        
            LDA #$3f           ; $d13c: a9 3f     
            STA $0200          ; $d13e: 8d 00 02  
            JSR __f947         ; $d141: 20 47 f9  
            SBC ($80,x)        ; $d144: e1 80     
            JSR __f94c         ; $d146: 20 4c f9  
            INY                ; $d149: c8        
            LDA #$41           ; $d14a: a9 41     
            STA $0200          ; $d14c: 8d 00 02  
            JSR __f95c         ; $d14f: 20 5c f9  
            SBC ($80,x)        ; $d152: e1 80     
            JSR __f962         ; $d154: 20 62 f9  
            INY                ; $d157: c8        
            LDA #$00           ; $d158: a9 00     
            STA $0200          ; $d15a: 8d 00 02  
            JSR __f972         ; $d15d: 20 72 f9  
            SBC ($80,x)        ; $d160: e1 80     
            JSR __f976         ; $d162: 20 76 f9  
            INY                ; $d165: c8        
            LDA #$7f           ; $d166: a9 7f     
            STA $0200          ; $d168: 8d 00 02  
            JSR __f980         ; $d16b: 20 80 f9  
            SBC ($80,x)        ; $d16e: e1 80     
            JSR __f984         ; $d170: 20 84 f9  
            RTS                ; $d173: 60        

;-------------------------------------------------------------------------------
__d174:     LDA #$55           ; $d174: a9 55     
            STA $78            ; $d176: 85 78     
            LDA #$ff           ; $d178: a9 ff     
            STA $01            ; $d17a: 85 01     
            BIT $01            ; $d17c: 24 01     
            LDY #$11           ; $d17e: a0 11     
            LDX #$23           ; $d180: a2 23     
            LDA #$00           ; $d182: a9 00     
            LDA $78            ; $d184: a5 78     
            BEQ __d198         ; $d186: f0 10     
            BMI __d198         ; $d188: 30 0e     
            CMP #$55           ; $d18a: c9 55     
            BNE __d198         ; $d18c: d0 0a     
            CPY #$11           ; $d18e: c0 11     
            BNE __d198         ; $d190: d0 06     
            CPX #$23           ; $d192: e0 23     
            BVC __d198         ; $d194: 50 02     
            BEQ __d19c         ; $d196: f0 04     
__d198:     LDA #$76           ; $d198: a9 76     
            STA $00            ; $d19a: 85 00     
__d19c:     LDA #$46           ; $d19c: a9 46     
            BIT $01            ; $d19e: 24 01     
            STA $78            ; $d1a0: 85 78     
            BEQ __d1ae         ; $d1a2: f0 0a     
            BPL __d1ae         ; $d1a4: 10 08     
            BVC __d1ae         ; $d1a6: 50 06     
            LDA $78            ; $d1a8: a5 78     
            CMP #$46           ; $d1aa: c9 46     
            BEQ __d1b2         ; $d1ac: f0 04     
__d1ae:     LDA #$77           ; $d1ae: a9 77     
            STA $00            ; $d1b0: 85 00     
__d1b2:     LDA #$55           ; $d1b2: a9 55     
            STA $78            ; $d1b4: 85 78     
            BIT $01            ; $d1b6: 24 01     
            LDA #$11           ; $d1b8: a9 11     
            LDX #$23           ; $d1ba: a2 23     
            LDY #$00           ; $d1bc: a0 00     
            LDY $78            ; $d1be: a4 78     
            BEQ __d1d2         ; $d1c0: f0 10     
            BMI __d1d2         ; $d1c2: 30 0e     
            CPY #$55           ; $d1c4: c0 55     
            BNE __d1d2         ; $d1c6: d0 0a     
            CMP #$11           ; $d1c8: c9 11     
            BNE __d1d2         ; $d1ca: d0 06     
            CPX #$23           ; $d1cc: e0 23     
            BVC __d1d2         ; $d1ce: 50 02     
            BEQ __d1d6         ; $d1d0: f0 04     
__d1d2:     LDA #$78           ; $d1d2: a9 78     
            STA $00            ; $d1d4: 85 00     
__d1d6:     LDY #$46           ; $d1d6: a0 46     
            BIT $01            ; $d1d8: 24 01     
            STY $78            ; $d1da: 84 78     
            BEQ __d1e8         ; $d1dc: f0 0a     
            BPL __d1e8         ; $d1de: 10 08     
            BVC __d1e8         ; $d1e0: 50 06     
            LDY $78            ; $d1e2: a4 78     
            CPY #$46           ; $d1e4: c0 46     
            BEQ __d1ec         ; $d1e6: f0 04     
__d1e8:     LDA #$79           ; $d1e8: a9 79     
            STA $00            ; $d1ea: 85 00     
__d1ec:     BIT $01            ; $d1ec: 24 01     
            LDA #$55           ; $d1ee: a9 55     
            STA $78            ; $d1f0: 85 78     
            LDY #$11           ; $d1f2: a0 11     
            LDA #$23           ; $d1f4: a9 23     
            LDX #$00           ; $d1f6: a2 00     
            LDX $78            ; $d1f8: a6 78     
            BEQ __d20c         ; $d1fa: f0 10     
            BMI __d20c         ; $d1fc: 30 0e     
            CPX #$55           ; $d1fe: e0 55     
            BNE __d20c         ; $d200: d0 0a     
            CPY #$11           ; $d202: c0 11     
            BNE __d20c         ; $d204: d0 06     
            CMP #$23           ; $d206: c9 23     
            BVC __d20c         ; $d208: 50 02     
            BEQ __d210         ; $d20a: f0 04     
__d20c:     LDA #$7a           ; $d20c: a9 7a     
            STA $00            ; $d20e: 85 00     
__d210:     LDX #$46           ; $d210: a2 46     
            BIT $01            ; $d212: 24 01     
            STX $78            ; $d214: 86 78     
            BEQ __d222         ; $d216: f0 0a     
            BPL __d222         ; $d218: 10 08     
            BVC __d222         ; $d21a: 50 06     
            LDX $78            ; $d21c: a6 78     
            CPX #$46           ; $d21e: e0 46     
            BEQ __d226         ; $d220: f0 04     
__d222:     LDA #$7b           ; $d222: a9 7b     
            STA $00            ; $d224: 85 00     
__d226:     LDA #$c0           ; $d226: a9 c0     
            STA $78            ; $d228: 85 78     
            LDX #$33           ; $d22a: a2 33     
            LDY #$88           ; $d22c: a0 88     
            LDA #$05           ; $d22e: a9 05     
            BIT $78            ; $d230: 24 78     
            BPL __d244         ; $d232: 10 10     
            BVC __d244         ; $d234: 50 0e     
            BNE __d244         ; $d236: d0 0c     
            CMP #$05           ; $d238: c9 05     
            BNE __d244         ; $d23a: d0 08     
            CPX #$33           ; $d23c: e0 33     
            BNE __d244         ; $d23e: d0 04     
            CPY #$88           ; $d240: c0 88     
            BEQ __d248         ; $d242: f0 04     
__d244:     LDA #$7c           ; $d244: a9 7c     
            STA $00            ; $d246: 85 00     
__d248:     LDA #$03           ; $d248: a9 03     
            STA $78            ; $d24a: 85 78     
            LDA #$01           ; $d24c: a9 01     
            BIT $78            ; $d24e: 24 78     
            BMI __d25a         ; $d250: 30 08     
            BVS __d25a         ; $d252: 70 06     
            BEQ __d25a         ; $d254: f0 04     
            CMP #$01           ; $d256: c9 01     
            BEQ __d25e         ; $d258: f0 04     
__d25a:     LDA #$7d           ; $d25a: a9 7d     
            STA $00            ; $d25c: 85 00     
__d25e:     LDY #$7e           ; $d25e: a0 7e     
            LDA #$aa           ; $d260: a9 aa     
            STA $78            ; $d262: 85 78     
            JSR __f7b6         ; $d264: 20 b6 f7  
            ORA $78            ; $d267: 05 78     
            JSR __f7c0         ; $d269: 20 c0 f7  
            INY                ; $d26c: c8        
            LDA #$00           ; $d26d: a9 00     
            STA $78            ; $d26f: 85 78     
            JSR __f7ce         ; $d271: 20 ce f7  
            ORA $78            ; $d274: 05 78     
            JSR __f7d3         ; $d276: 20 d3 f7  
            INY                ; $d279: c8        
            LDA #$aa           ; $d27a: a9 aa     
            STA $78            ; $d27c: 85 78     
            JSR __f7df         ; $d27e: 20 df f7  
            AND $78            ; $d281: 25 78     
            JSR __f7e5         ; $d283: 20 e5 f7  
            INY                ; $d286: c8        
            LDA #$ef           ; $d287: a9 ef     
            STA $78            ; $d289: 85 78     
            JSR __f7f1         ; $d28b: 20 f1 f7  
            AND $78            ; $d28e: 25 78     
            JSR __f7f6         ; $d290: 20 f6 f7  
            INY                ; $d293: c8        
            LDA #$aa           ; $d294: a9 aa     
            STA $78            ; $d296: 85 78     
            JSR __f804         ; $d298: 20 04 f8  
            EOR $78            ; $d29b: 45 78     
            JSR __f80a         ; $d29d: 20 0a f8  
            INY                ; $d2a0: c8        
            LDA #$70           ; $d2a1: a9 70     
            STA $78            ; $d2a3: 85 78     
            JSR __f818         ; $d2a5: 20 18 f8  
            EOR $78            ; $d2a8: 45 78     
            JSR __f81d         ; $d2aa: 20 1d f8  
            INY                ; $d2ad: c8        
            LDA #$69           ; $d2ae: a9 69     
            STA $78            ; $d2b0: 85 78     
            JSR __f829         ; $d2b2: 20 29 f8  
            ADC $78            ; $d2b5: 65 78     
            JSR __f82f         ; $d2b7: 20 2f f8  
            INY                ; $d2ba: c8        
            JSR __f83d         ; $d2bb: 20 3d f8  
            ADC $78            ; $d2be: 65 78     
            JSR __f843         ; $d2c0: 20 43 f8  
            INY                ; $d2c3: c8        
            LDA #$7f           ; $d2c4: a9 7f     
            STA $78            ; $d2c6: 85 78     
            JSR __f851         ; $d2c8: 20 51 f8  
            ADC $78            ; $d2cb: 65 78     
            JSR __f856         ; $d2cd: 20 56 f8  
            INY                ; $d2d0: c8        
            LDA #$80           ; $d2d1: a9 80     
            STA $78            ; $d2d3: 85 78     
            JSR __f864         ; $d2d5: 20 64 f8  
            ADC $78            ; $d2d8: 65 78     
            JSR __f86a         ; $d2da: 20 6a f8  
            INY                ; $d2dd: c8        
            JSR __f878         ; $d2de: 20 78 f8  
            ADC $78            ; $d2e1: 65 78     
            JSR __f87d         ; $d2e3: 20 7d f8  
            INY                ; $d2e6: c8        
            LDA #$40           ; $d2e7: a9 40     
            STA $78            ; $d2e9: 85 78     
            JSR __f889         ; $d2eb: 20 89 f8  
            CMP $78            ; $d2ee: c5 78     
            JSR __f88e         ; $d2f0: 20 8e f8  
            INY                ; $d2f3: c8        
            PHA                ; $d2f4: 48        
            LDA #$3f           ; $d2f5: a9 3f     
            STA $78            ; $d2f7: 85 78     
            PLA                ; $d2f9: 68        
            JSR __f89a         ; $d2fa: 20 9a f8  
            CMP $78            ; $d2fd: c5 78     
            JSR __f89c         ; $d2ff: 20 9c f8  
            INY                ; $d302: c8        
            PHA                ; $d303: 48        
            LDA #$41           ; $d304: a9 41     
            STA $78            ; $d306: 85 78     
            PLA                ; $d308: 68        
            CMP $78            ; $d309: c5 78     
            JSR __f8a8         ; $d30b: 20 a8 f8  
            INY                ; $d30e: c8        
            PHA                ; $d30f: 48        
            LDA #$00           ; $d310: a9 00     
            STA $78            ; $d312: 85 78     
            PLA                ; $d314: 68        
            JSR __f8b2         ; $d315: 20 b2 f8  
            CMP $78            ; $d318: c5 78     
            JSR __f8b5         ; $d31a: 20 b5 f8  
            INY                ; $d31d: c8        
            PHA                ; $d31e: 48        
            LDA #$80           ; $d31f: a9 80     
            STA $78            ; $d321: 85 78     
            PLA                ; $d323: 68        
            CMP $78            ; $d324: c5 78     
            JSR __f8bf         ; $d326: 20 bf f8  
            INY                ; $d329: c8        
            PHA                ; $d32a: 48        
            LDA #$81           ; $d32b: a9 81     
            STA $78            ; $d32d: 85 78     
            PLA                ; $d32f: 68        
            CMP $78            ; $d330: c5 78     
            JSR __f8c9         ; $d332: 20 c9 f8  
            INY                ; $d335: c8        
            PHA                ; $d336: 48        
            LDA #$7f           ; $d337: a9 7f     
            STA $78            ; $d339: 85 78     
            PLA                ; $d33b: 68        
            CMP $78            ; $d33c: c5 78     
            JSR __f8d3         ; $d33e: 20 d3 f8  
            INY                ; $d341: c8        
            LDA #$40           ; $d342: a9 40     
            STA $78            ; $d344: 85 78     
            JSR __f931         ; $d346: 20 31 f9  
            SBC $78            ; $d349: e5 78     
            JSR __f937         ; $d34b: 20 37 f9  
            INY                ; $d34e: c8        
            LDA #$3f           ; $d34f: a9 3f     
            STA $78            ; $d351: 85 78     
            JSR __f947         ; $d353: 20 47 f9  
            SBC $78            ; $d356: e5 78     
            JSR __f94c         ; $d358: 20 4c f9  
            INY                ; $d35b: c8        
            LDA #$41           ; $d35c: a9 41     
            STA $78            ; $d35e: 85 78     
            JSR __f95c         ; $d360: 20 5c f9  
            SBC $78            ; $d363: e5 78     
            JSR __f962         ; $d365: 20 62 f9  
            INY                ; $d368: c8        
            LDA #$00           ; $d369: a9 00     
            STA $78            ; $d36b: 85 78     
            JSR __f972         ; $d36d: 20 72 f9  
            SBC $78            ; $d370: e5 78     
            JSR __f976         ; $d372: 20 76 f9  
            INY                ; $d375: c8        
            LDA #$7f           ; $d376: a9 7f     
            STA $78            ; $d378: 85 78     
            JSR __f980         ; $d37a: 20 80 f9  
            SBC $78            ; $d37d: e5 78     
            JSR __f984         ; $d37f: 20 84 f9  
            INY                ; $d382: c8        
            LDA #$40           ; $d383: a9 40     
            STA $78            ; $d385: 85 78     
            JSR __f889         ; $d387: 20 89 f8  
            TAX                ; $d38a: aa        
            CPX $78            ; $d38b: e4 78     
            JSR __f88e         ; $d38d: 20 8e f8  
            INY                ; $d390: c8        
            LDA #$3f           ; $d391: a9 3f     
            STA $78            ; $d393: 85 78     
            JSR __f89a         ; $d395: 20 9a f8  
            CPX $78            ; $d398: e4 78     
            JSR __f89c         ; $d39a: 20 9c f8  
            INY                ; $d39d: c8        
            LDA #$41           ; $d39e: a9 41     
            STA $78            ; $d3a0: 85 78     
            CPX $78            ; $d3a2: e4 78     
            JSR __f8a8         ; $d3a4: 20 a8 f8  
            INY                ; $d3a7: c8        
            LDA #$00           ; $d3a8: a9 00     
            STA $78            ; $d3aa: 85 78     
            JSR __f8b2         ; $d3ac: 20 b2 f8  
            TAX                ; $d3af: aa        
            CPX $78            ; $d3b0: e4 78     
            JSR __f8b5         ; $d3b2: 20 b5 f8  
            INY                ; $d3b5: c8        
            LDA #$80           ; $d3b6: a9 80     
            STA $78            ; $d3b8: 85 78     
            CPX $78            ; $d3ba: e4 78     
            JSR __f8bf         ; $d3bc: 20 bf f8  
            INY                ; $d3bf: c8        
            LDA #$81           ; $d3c0: a9 81     
            STA $78            ; $d3c2: 85 78     
            CPX $78            ; $d3c4: e4 78     
            JSR __f8c9         ; $d3c6: 20 c9 f8  
            INY                ; $d3c9: c8        
            LDA #$7f           ; $d3ca: a9 7f     
            STA $78            ; $d3cc: 85 78     
            CPX $78            ; $d3ce: e4 78     
            JSR __f8d3         ; $d3d0: 20 d3 f8  
            INY                ; $d3d3: c8        
            TYA                ; $d3d4: 98        
            TAX                ; $d3d5: aa        
            LDA #$40           ; $d3d6: a9 40     
            STA $78            ; $d3d8: 85 78     
            JSR __f8dd         ; $d3da: 20 dd f8  
            CPY $78            ; $d3dd: c4 78     
            JSR __f8e2         ; $d3df: 20 e2 f8  
            INX                ; $d3e2: e8        
            LDA #$3f           ; $d3e3: a9 3f     
            STA $78            ; $d3e5: 85 78     
            JSR __f8ee         ; $d3e7: 20 ee f8  
            CPY $78            ; $d3ea: c4 78     
            JSR __f8f0         ; $d3ec: 20 f0 f8  
            INX                ; $d3ef: e8        
            LDA #$41           ; $d3f0: a9 41     
            STA $78            ; $d3f2: 85 78     
            CPY $78            ; $d3f4: c4 78     
            JSR __f8fc         ; $d3f6: 20 fc f8  
            INX                ; $d3f9: e8        
            LDA #$00           ; $d3fa: a9 00     
            STA $78            ; $d3fc: 85 78     
            JSR __f906         ; $d3fe: 20 06 f9  
            CPY $78            ; $d401: c4 78     
            JSR __f909         ; $d403: 20 09 f9  
            INX                ; $d406: e8        
            LDA #$80           ; $d407: a9 80     
            STA $78            ; $d409: 85 78     
            CPY $78            ; $d40b: c4 78     
            JSR __f913         ; $d40d: 20 13 f9  
            INX                ; $d410: e8        
            LDA #$81           ; $d411: a9 81     
            STA $78            ; $d413: 85 78     
            CPY $78            ; $d415: c4 78     
            JSR __f91d         ; $d417: 20 1d f9  
            INX                ; $d41a: e8        
            LDA #$7f           ; $d41b: a9 7f     
            STA $78            ; $d41d: 85 78     
            CPY $78            ; $d41f: c4 78     
            JSR __f927         ; $d421: 20 27 f9  
            INX                ; $d424: e8        
            TXA                ; $d425: 8a        
            TAY                ; $d426: a8        
            JSR __f990         ; $d427: 20 90 f9  
            STA $78            ; $d42a: 85 78     
            LSR $78            ; $d42c: 46 78     
            LDA $78            ; $d42e: a5 78     
            JSR __f99d         ; $d430: 20 9d f9  
            INY                ; $d433: c8        
            STA $78            ; $d434: 85 78     
            LSR $78            ; $d436: 46 78     
            LDA $78            ; $d438: a5 78     
            JSR __f9ad         ; $d43a: 20 ad f9  
            INY                ; $d43d: c8        
            JSR __f9bd         ; $d43e: 20 bd f9  
            STA $78            ; $d441: 85 78     
            ASL $78            ; $d443: 06 78     
            LDA $78            ; $d445: a5 78     
            JSR __f9c3         ; $d447: 20 c3 f9  
            INY                ; $d44a: c8        
            STA $78            ; $d44b: 85 78     
            ASL $78            ; $d44d: 06 78     
            LDA $78            ; $d44f: a5 78     
            JSR __f9d4         ; $d451: 20 d4 f9  
            INY                ; $d454: c8        
            JSR __f9e4         ; $d455: 20 e4 f9  
            STA $78            ; $d458: 85 78     
            ROR $78            ; $d45a: 66 78     
            LDA $78            ; $d45c: a5 78     
            JSR __f9ea         ; $d45e: 20 ea f9  
            INY                ; $d461: c8        
            STA $78            ; $d462: 85 78     
            ROR $78            ; $d464: 66 78     
            LDA $78            ; $d466: a5 78     
            JSR __f9fb         ; $d468: 20 fb f9  
            INY                ; $d46b: c8        
            JSR __fa0a         ; $d46c: 20 0a fa  
            STA $78            ; $d46f: 85 78     
            ROL $78            ; $d471: 26 78     
            LDA $78            ; $d473: a5 78     
            JSR __fa10         ; $d475: 20 10 fa  
            INY                ; $d478: c8        
            STA $78            ; $d479: 85 78     
            ROL $78            ; $d47b: 26 78     
            LDA $78            ; $d47d: a5 78     
            JSR __fa21         ; $d47f: 20 21 fa  
            LDA #$ff           ; $d482: a9 ff     
            STA $78            ; $d484: 85 78     
            STA $01            ; $d486: 85 01     
            BIT $01            ; $d488: 24 01     
            SEC                ; $d48a: 38        
            INC $78            ; $d48b: e6 78     
            BNE __d49b         ; $d48d: d0 0c     
            BMI __d49b         ; $d48f: 30 0a     
            BVC __d49b         ; $d491: 50 08     
            BCC __d49b         ; $d493: 90 06     
            LDA $78            ; $d495: a5 78     
            CMP #$00           ; $d497: c9 00     
            BEQ __d49f         ; $d499: f0 04     
__d49b:     LDA #$ab           ; $d49b: a9 ab     
            STA $00            ; $d49d: 85 00     
__d49f:     LDA #$7f           ; $d49f: a9 7f     
            STA $78            ; $d4a1: 85 78     
            CLV                ; $d4a3: b8        
            CLC                ; $d4a4: 18        
            INC $78            ; $d4a5: e6 78     
            BEQ __d4b5         ; $d4a7: f0 0c     
            BPL __d4b5         ; $d4a9: 10 0a     
            BVS __d4b5         ; $d4ab: 70 08     
            BCS __d4b5         ; $d4ad: b0 06     
            LDA $78            ; $d4af: a5 78     
            CMP #$80           ; $d4b1: c9 80     
            BEQ __d4b9         ; $d4b3: f0 04     
__d4b5:     LDA #$ac           ; $d4b5: a9 ac     
            STA $00            ; $d4b7: 85 00     
__d4b9:     LDA #$00           ; $d4b9: a9 00     
            STA $78            ; $d4bb: 85 78     
            BIT $01            ; $d4bd: 24 01     
            SEC                ; $d4bf: 38        
            DEC $78            ; $d4c0: c6 78     
            BEQ __d4d0         ; $d4c2: f0 0c     
            BPL __d4d0         ; $d4c4: 10 0a     
            BVC __d4d0         ; $d4c6: 50 08     
            BCC __d4d0         ; $d4c8: 90 06     
            LDA $78            ; $d4ca: a5 78     
            CMP #$ff           ; $d4cc: c9 ff     
            BEQ __d4d4         ; $d4ce: f0 04     
__d4d0:     LDA #$ad           ; $d4d0: a9 ad     
            STA $00            ; $d4d2: 85 00     
__d4d4:     LDA #$80           ; $d4d4: a9 80     
            STA $78            ; $d4d6: 85 78     
            CLV                ; $d4d8: b8        
            CLC                ; $d4d9: 18        
            DEC $78            ; $d4da: c6 78     
            BEQ __d4ea         ; $d4dc: f0 0c     
            BMI __d4ea         ; $d4de: 30 0a     
            BVS __d4ea         ; $d4e0: 70 08     
            BCS __d4ea         ; $d4e2: b0 06     
            LDA $78            ; $d4e4: a5 78     
            CMP #$7f           ; $d4e6: c9 7f     
            BEQ __d4ee         ; $d4e8: f0 04     
__d4ea:     LDA #$ae           ; $d4ea: a9 ae     
            STA $00            ; $d4ec: 85 00     
__d4ee:     LDA #$01           ; $d4ee: a9 01     
            STA $78            ; $d4f0: 85 78     
            DEC $78            ; $d4f2: c6 78     
            BEQ __d4fa         ; $d4f4: f0 04     
            LDA #$af           ; $d4f6: a9 af     
            STA $00            ; $d4f8: 85 00     
__d4fa:     RTS                ; $d4fa: 60        

;-------------------------------------------------------------------------------
__d4fb:     LDA #$55           ; $d4fb: a9 55     
            STA $0678          ; $d4fd: 8d 78 06  
            LDA #$ff           ; $d500: a9 ff     
            STA $01            ; $d502: 85 01     
            BIT $01            ; $d504: 24 01     
            LDY #$11           ; $d506: a0 11     
            LDX #$23           ; $d508: a2 23     
            LDA #$00           ; $d50a: a9 00     
            LDA $0678          ; $d50c: ad 78 06  
            BEQ __d521         ; $d50f: f0 10     
            BMI __d521         ; $d511: 30 0e     
            CMP #$55           ; $d513: c9 55     
            BNE __d521         ; $d515: d0 0a     
            CPY #$11           ; $d517: c0 11     
            BNE __d521         ; $d519: d0 06     
            CPX #$23           ; $d51b: e0 23     
            BVC __d521         ; $d51d: 50 02     
            BEQ __d525         ; $d51f: f0 04     
__d521:     LDA #$b0           ; $d521: a9 b0     
            STA $00            ; $d523: 85 00     
__d525:     LDA #$46           ; $d525: a9 46     
            BIT $01            ; $d527: 24 01     
            STA $0678          ; $d529: 8d 78 06  
            BEQ __d539         ; $d52c: f0 0b     
            BPL __d539         ; $d52e: 10 09     
            BVC __d539         ; $d530: 50 07     
            LDA $0678          ; $d532: ad 78 06  
            CMP #$46           ; $d535: c9 46     
            BEQ __d53d         ; $d537: f0 04     
__d539:     LDA #$b1           ; $d539: a9 b1     
            STA $00            ; $d53b: 85 00     
__d53d:     LDA #$55           ; $d53d: a9 55     
            STA $0678          ; $d53f: 8d 78 06  
            BIT $01            ; $d542: 24 01     
            LDA #$11           ; $d544: a9 11     
            LDX #$23           ; $d546: a2 23     
            LDY #$00           ; $d548: a0 00     
            LDY $0678          ; $d54a: ac 78 06  
            BEQ __d55f         ; $d54d: f0 10     
            BMI __d55f         ; $d54f: 30 0e     
            CPY #$55           ; $d551: c0 55     
            BNE __d55f         ; $d553: d0 0a     
            CMP #$11           ; $d555: c9 11     
            BNE __d55f         ; $d557: d0 06     
            CPX #$23           ; $d559: e0 23     
            BVC __d55f         ; $d55b: 50 02     
            BEQ __d563         ; $d55d: f0 04     
__d55f:     LDA #$b2           ; $d55f: a9 b2     
            STA $00            ; $d561: 85 00     
__d563:     LDY #$46           ; $d563: a0 46     
            BIT $01            ; $d565: 24 01     
            STY $0678          ; $d567: 8c 78 06  
            BEQ __d577         ; $d56a: f0 0b     
            BPL __d577         ; $d56c: 10 09     
            BVC __d577         ; $d56e: 50 07     
            LDY $0678          ; $d570: ac 78 06  
            CPY #$46           ; $d573: c0 46     
            BEQ __d57b         ; $d575: f0 04     
__d577:     LDA #$b3           ; $d577: a9 b3     
            STA $00            ; $d579: 85 00     
__d57b:     BIT $01            ; $d57b: 24 01     
            LDA #$55           ; $d57d: a9 55     
            STA $0678          ; $d57f: 8d 78 06  
            LDY #$11           ; $d582: a0 11     
            LDA #$23           ; $d584: a9 23     
            LDX #$00           ; $d586: a2 00     
            LDX $0678          ; $d588: ae 78 06  
            BEQ __d59d         ; $d58b: f0 10     
            BMI __d59d         ; $d58d: 30 0e     
            CPX #$55           ; $d58f: e0 55     
            BNE __d59d         ; $d591: d0 0a     
            CPY #$11           ; $d593: c0 11     
            BNE __d59d         ; $d595: d0 06     
            CMP #$23           ; $d597: c9 23     
            BVC __d59d         ; $d599: 50 02     
            BEQ __d5a1         ; $d59b: f0 04     
__d59d:     LDA #$b4           ; $d59d: a9 b4     
            STA $00            ; $d59f: 85 00     
__d5a1:     LDX #$46           ; $d5a1: a2 46     
            BIT $01            ; $d5a3: 24 01     
            STX $0678          ; $d5a5: 8e 78 06  
            BEQ __d5b5         ; $d5a8: f0 0b     
            BPL __d5b5         ; $d5aa: 10 09     
            BVC __d5b5         ; $d5ac: 50 07     
            LDX $0678          ; $d5ae: ae 78 06  
            CPX #$46           ; $d5b1: e0 46     
            BEQ __d5b9         ; $d5b3: f0 04     
__d5b5:     LDA #$b5           ; $d5b5: a9 b5     
            STA $00            ; $d5b7: 85 00     
__d5b9:     LDA #$c0           ; $d5b9: a9 c0     
            STA $0678          ; $d5bb: 8d 78 06  
            LDX #$33           ; $d5be: a2 33     
            LDY #$88           ; $d5c0: a0 88     
            LDA #$05           ; $d5c2: a9 05     
            BIT $0678          ; $d5c4: 2c 78 06  
            BPL __d5d9         ; $d5c7: 10 10     
            BVC __d5d9         ; $d5c9: 50 0e     
            BNE __d5d9         ; $d5cb: d0 0c     
            CMP #$05           ; $d5cd: c9 05     
            BNE __d5d9         ; $d5cf: d0 08     
            CPX #$33           ; $d5d1: e0 33     
            BNE __d5d9         ; $d5d3: d0 04     
            CPY #$88           ; $d5d5: c0 88     
            BEQ __d5dd         ; $d5d7: f0 04     
__d5d9:     LDA #$b6           ; $d5d9: a9 b6     
            STA $00            ; $d5db: 85 00     
__d5dd:     LDA #$03           ; $d5dd: a9 03     
            STA $0678          ; $d5df: 8d 78 06  
            LDA #$01           ; $d5e2: a9 01     
            BIT $0678          ; $d5e4: 2c 78 06  
            BMI __d5f1         ; $d5e7: 30 08     
            BVS __d5f1         ; $d5e9: 70 06     
            BEQ __d5f1         ; $d5eb: f0 04     
            CMP #$01           ; $d5ed: c9 01     
            BEQ __d5f5         ; $d5ef: f0 04     
__d5f1:     LDA #$b7           ; $d5f1: a9 b7     
            STA $00            ; $d5f3: 85 00     
__d5f5:     LDY #$b8           ; $d5f5: a0 b8     
            LDA #$aa           ; $d5f7: a9 aa     
            STA $0678          ; $d5f9: 8d 78 06  
            JSR __f7b6         ; $d5fc: 20 b6 f7  
            ORA $0678          ; $d5ff: 0d 78 06  
            JSR __f7c0         ; $d602: 20 c0 f7  
            INY                ; $d605: c8        
            LDA #$00           ; $d606: a9 00     
            STA $0678          ; $d608: 8d 78 06  
            JSR __f7ce         ; $d60b: 20 ce f7  
            ORA $0678          ; $d60e: 0d 78 06  
            JSR __f7d3         ; $d611: 20 d3 f7  
            INY                ; $d614: c8        
            LDA #$aa           ; $d615: a9 aa     
            STA $0678          ; $d617: 8d 78 06  
            JSR __f7df         ; $d61a: 20 df f7  
            AND $0678          ; $d61d: 2d 78 06  
            JSR __f7e5         ; $d620: 20 e5 f7  
            INY                ; $d623: c8        
            LDA #$ef           ; $d624: a9 ef     
            STA $0678          ; $d626: 8d 78 06  
            JSR __f7f1         ; $d629: 20 f1 f7  
            AND $0678          ; $d62c: 2d 78 06  
            JSR __f7f6         ; $d62f: 20 f6 f7  
            INY                ; $d632: c8        
            LDA #$aa           ; $d633: a9 aa     
            STA $0678          ; $d635: 8d 78 06  
            JSR __f804         ; $d638: 20 04 f8  
            EOR $0678          ; $d63b: 4d 78 06  
            JSR __f80a         ; $d63e: 20 0a f8  
            INY                ; $d641: c8        
            LDA #$70           ; $d642: a9 70     
            STA $0678          ; $d644: 8d 78 06  
            JSR __f818         ; $d647: 20 18 f8  
            EOR $0678          ; $d64a: 4d 78 06  
            JSR __f81d         ; $d64d: 20 1d f8  
            INY                ; $d650: c8        
            LDA #$69           ; $d651: a9 69     
            STA $0678          ; $d653: 8d 78 06  
            JSR __f829         ; $d656: 20 29 f8  
            ADC $0678          ; $d659: 6d 78 06  
            JSR __f82f         ; $d65c: 20 2f f8  
            INY                ; $d65f: c8        
            JSR __f83d         ; $d660: 20 3d f8  
            ADC $0678          ; $d663: 6d 78 06  
            JSR __f843         ; $d666: 20 43 f8  
            INY                ; $d669: c8        
            LDA #$7f           ; $d66a: a9 7f     
            STA $0678          ; $d66c: 8d 78 06  
            JSR __f851         ; $d66f: 20 51 f8  
            ADC $0678          ; $d672: 6d 78 06  
            JSR __f856         ; $d675: 20 56 f8  
            INY                ; $d678: c8        
            LDA #$80           ; $d679: a9 80     
            STA $0678          ; $d67b: 8d 78 06  
            JSR __f864         ; $d67e: 20 64 f8  
            ADC $0678          ; $d681: 6d 78 06  
            JSR __f86a         ; $d684: 20 6a f8  
            INY                ; $d687: c8        
            JSR __f878         ; $d688: 20 78 f8  
            ADC $0678          ; $d68b: 6d 78 06  
            JSR __f87d         ; $d68e: 20 7d f8  
            INY                ; $d691: c8        
            LDA #$40           ; $d692: a9 40     
            STA $0678          ; $d694: 8d 78 06  
            JSR __f889         ; $d697: 20 89 f8  
            CMP $0678          ; $d69a: cd 78 06  
            JSR __f88e         ; $d69d: 20 8e f8  
            INY                ; $d6a0: c8        
            PHA                ; $d6a1: 48        
            LDA #$3f           ; $d6a2: a9 3f     
            STA $0678          ; $d6a4: 8d 78 06  
            PLA                ; $d6a7: 68        
            JSR __f89a         ; $d6a8: 20 9a f8  
            CMP $0678          ; $d6ab: cd 78 06  
            JSR __f89c         ; $d6ae: 20 9c f8  
            INY                ; $d6b1: c8        
            PHA                ; $d6b2: 48        
            LDA #$41           ; $d6b3: a9 41     
            STA $0678          ; $d6b5: 8d 78 06  
            PLA                ; $d6b8: 68        
            CMP $0678          ; $d6b9: cd 78 06  
            JSR __f8a8         ; $d6bc: 20 a8 f8  
            INY                ; $d6bf: c8        
            PHA                ; $d6c0: 48        
            LDA #$00           ; $d6c1: a9 00     
            STA $0678          ; $d6c3: 8d 78 06  
            PLA                ; $d6c6: 68        
            JSR __f8b2         ; $d6c7: 20 b2 f8  
            CMP $0678          ; $d6ca: cd 78 06  
            JSR __f8b5         ; $d6cd: 20 b5 f8  
            INY                ; $d6d0: c8        
            PHA                ; $d6d1: 48        
            LDA #$80           ; $d6d2: a9 80     
            STA $0678          ; $d6d4: 8d 78 06  
            PLA                ; $d6d7: 68        
            CMP $0678          ; $d6d8: cd 78 06  
            JSR __f8bf         ; $d6db: 20 bf f8  
            INY                ; $d6de: c8        
            PHA                ; $d6df: 48        
            LDA #$81           ; $d6e0: a9 81     
            STA $0678          ; $d6e2: 8d 78 06  
            PLA                ; $d6e5: 68        
            CMP $0678          ; $d6e6: cd 78 06  
            JSR __f8c9         ; $d6e9: 20 c9 f8  
            INY                ; $d6ec: c8        
            PHA                ; $d6ed: 48        
            LDA #$7f           ; $d6ee: a9 7f     
            STA $0678          ; $d6f0: 8d 78 06  
            PLA                ; $d6f3: 68        
            CMP $0678          ; $d6f4: cd 78 06  
            JSR __f8d3         ; $d6f7: 20 d3 f8  
            INY                ; $d6fa: c8        
            LDA #$40           ; $d6fb: a9 40     
            STA $0678          ; $d6fd: 8d 78 06  
            JSR __f931         ; $d700: 20 31 f9  
            SBC $0678          ; $d703: ed 78 06  
            JSR __f937         ; $d706: 20 37 f9  
            INY                ; $d709: c8        
            LDA #$3f           ; $d70a: a9 3f     
            STA $0678          ; $d70c: 8d 78 06  
            JSR __f947         ; $d70f: 20 47 f9  
            SBC $0678          ; $d712: ed 78 06  
            JSR __f94c         ; $d715: 20 4c f9  
            INY                ; $d718: c8        
            LDA #$41           ; $d719: a9 41     
            STA $0678          ; $d71b: 8d 78 06  
            JSR __f95c         ; $d71e: 20 5c f9  
            SBC $0678          ; $d721: ed 78 06  
            JSR __f962         ; $d724: 20 62 f9  
            INY                ; $d727: c8        
            LDA #$00           ; $d728: a9 00     
            STA $0678          ; $d72a: 8d 78 06  
            JSR __f972         ; $d72d: 20 72 f9  
            SBC $0678          ; $d730: ed 78 06  
            JSR __f976         ; $d733: 20 76 f9  
            INY                ; $d736: c8        
            LDA #$7f           ; $d737: a9 7f     
            STA $0678          ; $d739: 8d 78 06  
            JSR __f980         ; $d73c: 20 80 f9  
            SBC $0678          ; $d73f: ed 78 06  
            JSR __f984         ; $d742: 20 84 f9  
            INY                ; $d745: c8        
            LDA #$40           ; $d746: a9 40     
            STA $0678          ; $d748: 8d 78 06  
            JSR __f889         ; $d74b: 20 89 f8  
            TAX                ; $d74e: aa        
            CPX $0678          ; $d74f: ec 78 06  
            JSR __f88e         ; $d752: 20 8e f8  
            INY                ; $d755: c8        
            LDA #$3f           ; $d756: a9 3f     
            STA $0678          ; $d758: 8d 78 06  
            JSR __f89a         ; $d75b: 20 9a f8  
            CPX $0678          ; $d75e: ec 78 06  
            JSR __f89c         ; $d761: 20 9c f8  
            INY                ; $d764: c8        
            LDA #$41           ; $d765: a9 41     
            STA $0678          ; $d767: 8d 78 06  
            CPX $0678          ; $d76a: ec 78 06  
            JSR __f8a8         ; $d76d: 20 a8 f8  
            INY                ; $d770: c8        
            LDA #$00           ; $d771: a9 00     
            STA $0678          ; $d773: 8d 78 06  
            JSR __f8b2         ; $d776: 20 b2 f8  
            TAX                ; $d779: aa        
            CPX $0678          ; $d77a: ec 78 06  
            JSR __f8b5         ; $d77d: 20 b5 f8  
            INY                ; $d780: c8        
            LDA #$80           ; $d781: a9 80     
            STA $0678          ; $d783: 8d 78 06  
            CPX $0678          ; $d786: ec 78 06  
            JSR __f8bf         ; $d789: 20 bf f8  
            INY                ; $d78c: c8        
            LDA #$81           ; $d78d: a9 81     
            STA $0678          ; $d78f: 8d 78 06  
            CPX $0678          ; $d792: ec 78 06  
            JSR __f8c9         ; $d795: 20 c9 f8  
            INY                ; $d798: c8        
            LDA #$7f           ; $d799: a9 7f     
            STA $0678          ; $d79b: 8d 78 06  
            CPX $0678          ; $d79e: ec 78 06  
            JSR __f8d3         ; $d7a1: 20 d3 f8  
            INY                ; $d7a4: c8        
            TYA                ; $d7a5: 98        
            TAX                ; $d7a6: aa        
            LDA #$40           ; $d7a7: a9 40     
            STA $0678          ; $d7a9: 8d 78 06  
            JSR __f8dd         ; $d7ac: 20 dd f8  
            CPY $0678          ; $d7af: cc 78 06  
            JSR __f8e2         ; $d7b2: 20 e2 f8  
            INX                ; $d7b5: e8        
            LDA #$3f           ; $d7b6: a9 3f     
            STA $0678          ; $d7b8: 8d 78 06  
            JSR __f8ee         ; $d7bb: 20 ee f8  
            CPY $0678          ; $d7be: cc 78 06  
            JSR __f8f0         ; $d7c1: 20 f0 f8  
            INX                ; $d7c4: e8        
            LDA #$41           ; $d7c5: a9 41     
            STA $0678          ; $d7c7: 8d 78 06  
            CPY $0678          ; $d7ca: cc 78 06  
            JSR __f8fc         ; $d7cd: 20 fc f8  
            INX                ; $d7d0: e8        
            LDA #$00           ; $d7d1: a9 00     
            STA $0678          ; $d7d3: 8d 78 06  
            JSR __f906         ; $d7d6: 20 06 f9  
            CPY $0678          ; $d7d9: cc 78 06  
            JSR __f909         ; $d7dc: 20 09 f9  
            INX                ; $d7df: e8        
            LDA #$80           ; $d7e0: a9 80     
            STA $0678          ; $d7e2: 8d 78 06  
            CPY $0678          ; $d7e5: cc 78 06  
            JSR __f913         ; $d7e8: 20 13 f9  
            INX                ; $d7eb: e8        
            LDA #$81           ; $d7ec: a9 81     
            STA $0678          ; $d7ee: 8d 78 06  
            CPY $0678          ; $d7f1: cc 78 06  
            JSR __f91d         ; $d7f4: 20 1d f9  
            INX                ; $d7f7: e8        
            LDA #$7f           ; $d7f8: a9 7f     
            STA $0678          ; $d7fa: 8d 78 06  
            CPY $0678          ; $d7fd: cc 78 06  
            JSR __f927         ; $d800: 20 27 f9  
            INX                ; $d803: e8        
            TXA                ; $d804: 8a        
            TAY                ; $d805: a8        
            JSR __f990         ; $d806: 20 90 f9  
            STA $0678          ; $d809: 8d 78 06  
            LSR $0678          ; $d80c: 4e 78 06  
            LDA $0678          ; $d80f: ad 78 06  
            JSR __f99d         ; $d812: 20 9d f9  
            INY                ; $d815: c8        
            STA $0678          ; $d816: 8d 78 06  
            LSR $0678          ; $d819: 4e 78 06  
            LDA $0678          ; $d81c: ad 78 06  
            JSR __f9ad         ; $d81f: 20 ad f9  
            INY                ; $d822: c8        
            JSR __f9bd         ; $d823: 20 bd f9  
            STA $0678          ; $d826: 8d 78 06  
            ASL $0678          ; $d829: 0e 78 06  
            LDA $0678          ; $d82c: ad 78 06  
            JSR __f9c3         ; $d82f: 20 c3 f9  
            INY                ; $d832: c8        
            STA $0678          ; $d833: 8d 78 06  
            ASL $0678          ; $d836: 0e 78 06  
            LDA $0678          ; $d839: ad 78 06  
            JSR __f9d4         ; $d83c: 20 d4 f9  
            INY                ; $d83f: c8        
            JSR __f9e4         ; $d840: 20 e4 f9  
            STA $0678          ; $d843: 8d 78 06  
            ROR $0678          ; $d846: 6e 78 06  
            LDA $0678          ; $d849: ad 78 06  
            JSR __f9ea         ; $d84c: 20 ea f9  
            INY                ; $d84f: c8        
            STA $0678          ; $d850: 8d 78 06  
            ROR $0678          ; $d853: 6e 78 06  
            LDA $0678          ; $d856: ad 78 06  
            JSR __f9fb         ; $d859: 20 fb f9  
            INY                ; $d85c: c8        
            JSR __fa0a         ; $d85d: 20 0a fa  
            STA $0678          ; $d860: 8d 78 06  
            ROL $0678          ; $d863: 2e 78 06  
            LDA $0678          ; $d866: ad 78 06  
            JSR __fa10         ; $d869: 20 10 fa  
            INY                ; $d86c: c8        
            STA $0678          ; $d86d: 8d 78 06  
            ROL $0678          ; $d870: 2e 78 06  
            LDA $0678          ; $d873: ad 78 06  
            JSR __fa21         ; $d876: 20 21 fa  
            LDA #$ff           ; $d879: a9 ff     
            STA $0678          ; $d87b: 8d 78 06  
            STA $01            ; $d87e: 85 01     
            BIT $01            ; $d880: 24 01     
            SEC                ; $d882: 38        
            INC $0678          ; $d883: ee 78 06  
            BNE __d895         ; $d886: d0 0d     
            BMI __d895         ; $d888: 30 0b     
            BVC __d895         ; $d88a: 50 09     
            BCC __d895         ; $d88c: 90 07     
            LDA $0678          ; $d88e: ad 78 06  
            CMP #$00           ; $d891: c9 00     
            BEQ __d899         ; $d893: f0 04     
__d895:     LDA #$e5           ; $d895: a9 e5     
            STA $00            ; $d897: 85 00     
__d899:     LDA #$7f           ; $d899: a9 7f     
            STA $0678          ; $d89b: 8d 78 06  
            CLV                ; $d89e: b8        
            CLC                ; $d89f: 18        
            INC $0678          ; $d8a0: ee 78 06  
            BEQ __d8b2         ; $d8a3: f0 0d     
            BPL __d8b2         ; $d8a5: 10 0b     
            BVS __d8b2         ; $d8a7: 70 09     
            BCS __d8b2         ; $d8a9: b0 07     
            LDA $0678          ; $d8ab: ad 78 06  
            CMP #$80           ; $d8ae: c9 80     
            BEQ __d8b6         ; $d8b0: f0 04     
__d8b2:     LDA #$e6           ; $d8b2: a9 e6     
            STA $00            ; $d8b4: 85 00     
__d8b6:     LDA #$00           ; $d8b6: a9 00     
            STA $0678          ; $d8b8: 8d 78 06  
            BIT $01            ; $d8bb: 24 01     
            SEC                ; $d8bd: 38        
            DEC $0678          ; $d8be: ce 78 06  
            BEQ __d8d0         ; $d8c1: f0 0d     
            BPL __d8d0         ; $d8c3: 10 0b     
            BVC __d8d0         ; $d8c5: 50 09     
            BCC __d8d0         ; $d8c7: 90 07     
            LDA $0678          ; $d8c9: ad 78 06  
            CMP #$ff           ; $d8cc: c9 ff     
            BEQ __d8d4         ; $d8ce: f0 04     
__d8d0:     LDA #$e7           ; $d8d0: a9 e7     
            STA $00            ; $d8d2: 85 00     
__d8d4:     LDA #$80           ; $d8d4: a9 80     
            STA $0678          ; $d8d6: 8d 78 06  
            CLV                ; $d8d9: b8        
            CLC                ; $d8da: 18        
            DEC $0678          ; $d8db: ce 78 06  
            BEQ __d8ed         ; $d8de: f0 0d     
            BMI __d8ed         ; $d8e0: 30 0b     
            BVS __d8ed         ; $d8e2: 70 09     
            BCS __d8ed         ; $d8e4: b0 07     
            LDA $0678          ; $d8e6: ad 78 06  
            CMP #$7f           ; $d8e9: c9 7f     
            BEQ __d8f1         ; $d8eb: f0 04     
__d8ed:     LDA #$e8           ; $d8ed: a9 e8     
            STA $00            ; $d8ef: 85 00     
__d8f1:     LDA #$01           ; $d8f1: a9 01     
            STA $0678          ; $d8f3: 8d 78 06  
            DEC $0678          ; $d8f6: ce 78 06  
            BEQ __d8ff         ; $d8f9: f0 04     
            LDA #$e9           ; $d8fb: a9 e9     
            STA $00            ; $d8fd: 85 00     
__d8ff:     RTS                ; $d8ff: 60        

;-------------------------------------------------------------------------------
__d900:     LDA #$a3           ; $d900: a9 a3     
            STA $33            ; $d902: 85 33     
            LDA #$89           ; $d904: a9 89     
            STA $0300          ; $d906: 8d 00 03  
            LDA #$12           ; $d909: a9 12     
            STA $0245          ; $d90b: 8d 45 02  
            LDA #$ff           ; $d90e: a9 ff     
            STA $01            ; $d910: 85 01     
            LDX #$65           ; $d912: a2 65     
            LDA #$00           ; $d914: a9 00     
            STA $89            ; $d916: 85 89     
            LDA #$03           ; $d918: a9 03     
            STA $8a            ; $d91a: 85 8a     
            LDY #$00           ; $d91c: a0 00     
            SEC                ; $d91e: 38        
            LDA #$00           ; $d91f: a9 00     
            CLV                ; $d921: b8        
            LDA ($89),y        ; $d922: b1 89     
            BEQ __d932         ; $d924: f0 0c     
            BCC __d932         ; $d926: 90 0a     
            BVS __d932         ; $d928: 70 08     
            CMP #$89           ; $d92a: c9 89     
            BNE __d932         ; $d92c: d0 04     
            CPX #$65           ; $d92e: e0 65     
            BEQ __d936         ; $d930: f0 04     
__d932:     LDA #$ea           ; $d932: a9 ea     
            STA $00            ; $d934: 85 00     
__d936:     LDA #$ff           ; $d936: a9 ff     
            STA $97            ; $d938: 85 97     
            STA $98            ; $d93a: 85 98     
            BIT $98            ; $d93c: 24 98     
            LDY #$34           ; $d93e: a0 34     
            LDA ($97),y        ; $d940: b1 97     
            CMP #$a3           ; $d942: c9 a3     
            BNE __d948         ; $d944: d0 02     
            BCS __d94c         ; $d946: b0 04     
__d948:     LDA #$eb           ; $d948: a9 eb     
            STA $00            ; $d94a: 85 00     
__d94c:     LDA $00            ; $d94c: a5 00     
            PHA                ; $d94e: 48        
            LDA #$46           ; $d94f: a9 46     
            STA $ff            ; $d951: 85 ff     
            LDA #$01           ; $d953: a9 01     
            STA $00            ; $d955: 85 00     
            LDY #$ff           ; $d957: a0 ff     
            LDA ($ff),y        ; $d959: b1 ff     
            CMP #$12           ; $d95b: c9 12     
            BEQ __d963         ; $d95d: f0 04     
            PLA                ; $d95f: 68        
            LDA #$ec           ; $d960: a9 ec     
            PHA                ; $d962: 48        
__d963:     PLA                ; $d963: 68        
            STA $00            ; $d964: 85 00     
            LDX #$ed           ; $d966: a2 ed     
            LDA #$00           ; $d968: a9 00     
            STA $33            ; $d96a: 85 33     
            LDA #$04           ; $d96c: a9 04     
            STA $34            ; $d96e: 85 34     
            LDY #$00           ; $d970: a0 00     
            CLC                ; $d972: 18        
            LDA #$ff           ; $d973: a9 ff     
            STA $01            ; $d975: 85 01     
            BIT $01            ; $d977: 24 01     
            LDA #$aa           ; $d979: a9 aa     
            STA $0400          ; $d97b: 8d 00 04  
            LDA #$55           ; $d97e: a9 55     
            ORA ($33),y        ; $d980: 11 33     
            BCS __d98c         ; $d982: b0 08     
            BPL __d98c         ; $d984: 10 06     
            CMP #$ff           ; $d986: c9 ff     
            BNE __d98c         ; $d988: d0 02     
            BVS __d98e         ; $d98a: 70 02     
__d98c:     STX $00            ; $d98c: 86 00     
__d98e:     INX                ; $d98e: e8        
            SEC                ; $d98f: 38        
            CLV                ; $d990: b8        
            LDA #$00           ; $d991: a9 00     
            ORA ($33),y        ; $d993: 11 33     
            BEQ __d99d         ; $d995: f0 06     
            BVS __d99d         ; $d997: 70 04     
            BCC __d99d         ; $d999: 90 02     
            BMI __d99f         ; $d99b: 30 02     
__d99d:     STX $00            ; $d99d: 86 00     
__d99f:     INX                ; $d99f: e8        
            CLC                ; $d9a0: 18        
            BIT $01            ; $d9a1: 24 01     
            LDA #$55           ; $d9a3: a9 55     
            AND ($33),y        ; $d9a5: 31 33     
            BNE __d9af         ; $d9a7: d0 06     
            BVC __d9af         ; $d9a9: 50 04     
            BCS __d9af         ; $d9ab: b0 02     
            BPL __d9b1         ; $d9ad: 10 02     
__d9af:     STX $00            ; $d9af: 86 00     
__d9b1:     INX                ; $d9b1: e8        
            SEC                ; $d9b2: 38        
            CLV                ; $d9b3: b8        
            LDA #$ef           ; $d9b4: a9 ef     
            STA $0400          ; $d9b6: 8d 00 04  
            LDA #$f8           ; $d9b9: a9 f8     
            AND ($33),y        ; $d9bb: 31 33     
            BCC __d9c7         ; $d9bd: 90 08     
            BPL __d9c7         ; $d9bf: 10 06     
            CMP #$e8           ; $d9c1: c9 e8     
            BNE __d9c7         ; $d9c3: d0 02     
            BVC __d9c9         ; $d9c5: 50 02     
__d9c7:     STX $00            ; $d9c7: 86 00     
__d9c9:     INX                ; $d9c9: e8        
            CLC                ; $d9ca: 18        
            BIT $01            ; $d9cb: 24 01     
            LDA #$aa           ; $d9cd: a9 aa     
            STA $0400          ; $d9cf: 8d 00 04  
            LDA #$5f           ; $d9d2: a9 5f     
            EOR ($33),y        ; $d9d4: 51 33     
            BCS __d9e0         ; $d9d6: b0 08     
            BPL __d9e0         ; $d9d8: 10 06     
            CMP #$f5           ; $d9da: c9 f5     
            BNE __d9e0         ; $d9dc: d0 02     
            BVS __d9e2         ; $d9de: 70 02     
__d9e0:     STX $00            ; $d9e0: 86 00     
__d9e2:     INX                ; $d9e2: e8        
            SEC                ; $d9e3: 38        
            CLV                ; $d9e4: b8        
            LDA #$70           ; $d9e5: a9 70     
            STA $0400          ; $d9e7: 8d 00 04  
            EOR ($33),y        ; $d9ea: 51 33     
            BNE __d9f4         ; $d9ec: d0 06     
            BVS __d9f4         ; $d9ee: 70 04     
            BCC __d9f4         ; $d9f0: 90 02     
            BPL __d9f6         ; $d9f2: 10 02     
__d9f4:     STX $00            ; $d9f4: 86 00     
__d9f6:     INX                ; $d9f6: e8        
            CLC                ; $d9f7: 18        
            BIT $01            ; $d9f8: 24 01     
            LDA #$69           ; $d9fa: a9 69     
            STA $0400          ; $d9fc: 8d 00 04  
            LDA #$00           ; $d9ff: a9 00     
            ADC ($33),y        ; $da01: 71 33     
            BMI __da0d         ; $da03: 30 08     
            BCS __da0d         ; $da05: b0 06     
            CMP #$69           ; $da07: c9 69     
            BNE __da0d         ; $da09: d0 02     
            BVC __da0f         ; $da0b: 50 02     
__da0d:     STX $00            ; $da0d: 86 00     
__da0f:     INX                ; $da0f: e8        
            SEC                ; $da10: 38        
            BIT $01            ; $da11: 24 01     
            LDA #$00           ; $da13: a9 00     
            ADC ($33),y        ; $da15: 71 33     
            BMI __da21         ; $da17: 30 08     
            BCS __da21         ; $da19: b0 06     
            CMP #$6a           ; $da1b: c9 6a     
            BNE __da21         ; $da1d: d0 02     
            BVC __da23         ; $da1f: 50 02     
__da21:     STX $00            ; $da21: 86 00     
__da23:     INX                ; $da23: e8        
            SEC                ; $da24: 38        
            CLV                ; $da25: b8        
            LDA #$7f           ; $da26: a9 7f     
            STA $0400          ; $da28: 8d 00 04  
            ADC ($33),y        ; $da2b: 71 33     
            BPL __da37         ; $da2d: 10 08     
            BCS __da37         ; $da2f: b0 06     
            CMP #$ff           ; $da31: c9 ff     
            BNE __da37         ; $da33: d0 02     
            BVS __da39         ; $da35: 70 02     
__da37:     STX $00            ; $da37: 86 00     
__da39:     INX                ; $da39: e8        
            CLC                ; $da3a: 18        
            BIT $01            ; $da3b: 24 01     
            LDA #$80           ; $da3d: a9 80     
            STA $0400          ; $da3f: 8d 00 04  
            LDA #$7f           ; $da42: a9 7f     
            ADC ($33),y        ; $da44: 71 33     
            BPL __da50         ; $da46: 10 08     
            BCS __da50         ; $da48: b0 06     
            CMP #$ff           ; $da4a: c9 ff     
            BNE __da50         ; $da4c: d0 02     
            BVC __da52         ; $da4e: 50 02     
__da50:     STX $00            ; $da50: 86 00     
__da52:     INX                ; $da52: e8        
            SEC                ; $da53: 38        
            CLV                ; $da54: b8        
            LDA #$80           ; $da55: a9 80     
            STA $0400          ; $da57: 8d 00 04  
            LDA #$7f           ; $da5a: a9 7f     
            ADC ($33),y        ; $da5c: 71 33     
            BNE __da66         ; $da5e: d0 06     
            BMI __da66         ; $da60: 30 04     
            BVS __da66         ; $da62: 70 02     
            BCS __da68         ; $da64: b0 02     
__da66:     STX $00            ; $da66: 86 00     
__da68:     INX                ; $da68: e8        
            BIT $01            ; $da69: 24 01     
            LDA #$40           ; $da6b: a9 40     
            STA $0400          ; $da6d: 8d 00 04  
            CMP ($33),y        ; $da70: d1 33     
            BMI __da7a         ; $da72: 30 06     
            BCC __da7a         ; $da74: 90 04     
            BNE __da7a         ; $da76: d0 02     
            BVS __da7c         ; $da78: 70 02     
__da7a:     STX $00            ; $da7a: 86 00     
__da7c:     INX                ; $da7c: e8        
            CLV                ; $da7d: b8        
            DEC $0400          ; $da7e: ce 00 04  
            CMP ($33),y        ; $da81: d1 33     
            BEQ __da8b         ; $da83: f0 06     
            BMI __da8b         ; $da85: 30 04     
            BCC __da8b         ; $da87: 90 02     
            BVC __da8d         ; $da89: 50 02     
__da8b:     STX $00            ; $da8b: 86 00     
__da8d:     INX                ; $da8d: e8        
            INC $0400          ; $da8e: ee 00 04  
            INC $0400          ; $da91: ee 00 04  
            CMP ($33),y        ; $da94: d1 33     
            BEQ __da9a         ; $da96: f0 02     
            BMI __da9c         ; $da98: 30 02     
__da9a:     STX $00            ; $da9a: 86 00     
__da9c:     INX                ; $da9c: e8        
            LDA #$00           ; $da9d: a9 00     
            STA $0400          ; $da9f: 8d 00 04  
            LDA #$80           ; $daa2: a9 80     
            CMP ($33),y        ; $daa4: d1 33     
            BEQ __daac         ; $daa6: f0 04     
            BPL __daac         ; $daa8: 10 02     
            BCS __daae         ; $daaa: b0 02     
__daac:     STX $00            ; $daac: 86 00     
__daae:     INX                ; $daae: e8        
            LDY #$80           ; $daaf: a0 80     
            STY $0400          ; $dab1: 8c 00 04  
            LDY #$00           ; $dab4: a0 00     
            CMP ($33),y        ; $dab6: d1 33     
            BNE __dabe         ; $dab8: d0 04     
            BMI __dabe         ; $daba: 30 02     
            BCS __dac0         ; $dabc: b0 02     
__dabe:     STX $00            ; $dabe: 86 00     
__dac0:     INX                ; $dac0: e8        
            INC $0400          ; $dac1: ee 00 04  
            CMP ($33),y        ; $dac4: d1 33     
            BCS __dacc         ; $dac6: b0 04     
            BEQ __dacc         ; $dac8: f0 02     
            BMI __dace         ; $daca: 30 02     
__dacc:     STX $00            ; $dacc: 86 00     
__dace:     INX                ; $dace: e8        
            DEC $0400          ; $dacf: ce 00 04  
            DEC $0400          ; $dad2: ce 00 04  
            CMP ($33),y        ; $dad5: d1 33     
            BCC __dadd         ; $dad7: 90 04     
            BEQ __dadd         ; $dad9: f0 02     
            BPL __dadf         ; $dadb: 10 02     
__dadd:     STX $00            ; $dadd: 86 00     
__dadf:     RTS                ; $dadf: 60        

;-------------------------------------------------------------------------------
__dae0:     LDA #$00           ; $dae0: a9 00     
            STA $33            ; $dae2: 85 33     
            LDA #$04           ; $dae4: a9 04     
            STA $34            ; $dae6: 85 34     
            LDY #$00           ; $dae8: a0 00     
            LDX #$01           ; $daea: a2 01     
            BIT $01            ; $daec: 24 01     
            LDA #$40           ; $daee: a9 40     
            STA $0400          ; $daf0: 8d 00 04  
            SEC                ; $daf3: 38        
            SBC ($33),y        ; $daf4: f1 33     
            BMI __db02         ; $daf6: 30 0a     
            BCC __db02         ; $daf8: 90 08     
            BNE __db02         ; $dafa: d0 06     
            BVS __db02         ; $dafc: 70 04     
            CMP #$00           ; $dafe: c9 00     
            BEQ __db04         ; $db00: f0 02     
__db02:     STX $00            ; $db02: 86 00     
__db04:     INX                ; $db04: e8        
            CLV                ; $db05: b8        
            SEC                ; $db06: 38        
            LDA #$40           ; $db07: a9 40     
            DEC $0400          ; $db09: ce 00 04  
            SBC ($33),y        ; $db0c: f1 33     
            BEQ __db1a         ; $db0e: f0 0a     
            BMI __db1a         ; $db10: 30 08     
            BCC __db1a         ; $db12: 90 06     
            BVS __db1a         ; $db14: 70 04     
            CMP #$01           ; $db16: c9 01     
            BEQ __db1c         ; $db18: f0 02     
__db1a:     STX $00            ; $db1a: 86 00     
__db1c:     INX                ; $db1c: e8        
            LDA #$40           ; $db1d: a9 40     
            SEC                ; $db1f: 38        
            BIT $01            ; $db20: 24 01     
            INC $0400          ; $db22: ee 00 04  
            INC $0400          ; $db25: ee 00 04  
            SBC ($33),y        ; $db28: f1 33     
            BCS __db36         ; $db2a: b0 0a     
            BEQ __db36         ; $db2c: f0 08     
            BPL __db36         ; $db2e: 10 06     
            BVS __db36         ; $db30: 70 04     
            CMP #$ff           ; $db32: c9 ff     
            BEQ __db38         ; $db34: f0 02     
__db36:     STX $00            ; $db36: 86 00     
__db38:     INX                ; $db38: e8        
            CLC                ; $db39: 18        
            LDA #$00           ; $db3a: a9 00     
            STA $0400          ; $db3c: 8d 00 04  
            LDA #$80           ; $db3f: a9 80     
            SBC ($33),y        ; $db41: f1 33     
            BCC __db49         ; $db43: 90 04     
            CMP #$7f           ; $db45: c9 7f     
            BEQ __db4b         ; $db47: f0 02     
__db49:     STX $00            ; $db49: 86 00     
__db4b:     INX                ; $db4b: e8        
            SEC                ; $db4c: 38        
            LDA #$7f           ; $db4d: a9 7f     
            STA $0400          ; $db4f: 8d 00 04  
            LDA #$81           ; $db52: a9 81     
            SBC ($33),y        ; $db54: f1 33     
            BVC __db5e         ; $db56: 50 06     
            BCC __db5e         ; $db58: 90 04     
            CMP #$02           ; $db5a: c9 02     
            BEQ __db60         ; $db5c: f0 02     
__db5e:     STX $00            ; $db5e: 86 00     
__db60:     INX                ; $db60: e8        
            LDA #$00           ; $db61: a9 00     
            LDA #$87           ; $db63: a9 87     
            STA ($33),y        ; $db65: 91 33     
            LDA $0400          ; $db67: ad 00 04  
            CMP #$87           ; $db6a: c9 87     
            BEQ __db70         ; $db6c: f0 02     
            STX $00            ; $db6e: 86 00     
__db70:     INX                ; $db70: e8        
            LDA #$7e           ; $db71: a9 7e     
            STA $0200          ; $db73: 8d 00 02  
            LDA #$db           ; $db76: a9 db     
            STA $0201          ; $db78: 8d 01 02  
            JMP ($0200)        ; $db7b: 6c 00 02  

;-------------------------------------------------------------------------------
            LDA #$00           ; $db7e: a9 00     
            STA $02ff          ; $db80: 8d ff 02  
            LDA #$01           ; $db83: a9 01     
            STA $0300          ; $db85: 8d 00 03  
            LDA #$03           ; $db88: a9 03     
            STA $0200          ; $db8a: 8d 00 02  
            LDA #$a9           ; $db8d: a9 a9     
            STA $0100          ; $db8f: 8d 00 01  
            LDA #$55           ; $db92: a9 55     
            STA $0101          ; $db94: 8d 01 01  
            LDA #$60           ; $db97: a9 60     
            STA $0102          ; $db99: 8d 02 01  
            LDA #$a9           ; $db9c: a9 a9     
            STA $0300          ; $db9e: 8d 00 03  
            LDA #$aa           ; $dba1: a9 aa     
            STA $0301          ; $dba3: 8d 01 03  
            LDA #$60           ; $dba6: a9 60     
            STA $0302          ; $dba8: 8d 02 03  
            JSR __dbb5         ; $dbab: 20 b5 db  
            CMP #$aa           ; $dbae: c9 aa     
            BEQ __dbb4         ; $dbb0: f0 02     
            STX $00            ; $dbb2: 86 00     
__dbb4:     RTS                ; $dbb4: 60        

;-------------------------------------------------------------------------------
__dbb5:     JMP ($02ff)        ; $dbb5: 6c ff 02  

;-------------------------------------------------------------------------------
__dbb8:     LDA #$ff           ; $dbb8: a9 ff     
            STA $01            ; $dbba: 85 01     
            LDA #$aa           ; $dbbc: a9 aa     
            STA $33            ; $dbbe: 85 33     
            LDA #$bb           ; $dbc0: a9 bb     
            STA $89            ; $dbc2: 85 89     
            LDX #$00           ; $dbc4: a2 00     
            LDA #$66           ; $dbc6: a9 66     
            BIT $01            ; $dbc8: 24 01     
            SEC                ; $dbca: 38        
            LDY #$00           ; $dbcb: a0 00     
            LDY $33,x          ; $dbcd: b4 33     
            BPL __dbe3         ; $dbcf: 10 12     
            BEQ __dbe3         ; $dbd1: f0 10     
            BVC __dbe3         ; $dbd3: 50 0e     
            BCC __dbe3         ; $dbd5: 90 0c     
            CMP #$66           ; $dbd7: c9 66     
            BNE __dbe3         ; $dbd9: d0 08     
            CPX #$00           ; $dbdb: e0 00     
            BNE __dbe3         ; $dbdd: d0 04     
            CPY #$aa           ; $dbdf: c0 aa     
            BEQ __dbe7         ; $dbe1: f0 04     
__dbe3:     LDA #$08           ; $dbe3: a9 08     
            STA $00            ; $dbe5: 85 00     
__dbe7:     LDX #$8a           ; $dbe7: a2 8a     
            LDA #$66           ; $dbe9: a9 66     
            CLV                ; $dbeb: b8        
            CLC                ; $dbec: 18        
            LDY #$00           ; $dbed: a0 00     
            LDY $ff,x          ; $dbef: b4 ff     
            BPL __dc05         ; $dbf1: 10 12     
            BEQ __dc05         ; $dbf3: f0 10     
            BVS __dc05         ; $dbf5: 70 0e     
            BCS __dc05         ; $dbf7: b0 0c     
            CPY #$bb           ; $dbf9: c0 bb     
            BNE __dc05         ; $dbfb: d0 08     
            CMP #$66           ; $dbfd: c9 66     
            BNE __dc05         ; $dbff: d0 04     
            CPX #$8a           ; $dc01: e0 8a     
            BEQ __dc09         ; $dc03: f0 04     
__dc05:     LDA #$09           ; $dc05: a9 09     
            STA $00            ; $dc07: 85 00     
__dc09:     BIT $01            ; $dc09: 24 01     
            SEC                ; $dc0b: 38        
            LDY #$44           ; $dc0c: a0 44     
            LDX #$00           ; $dc0e: a2 00     
            STY $33,x          ; $dc10: 94 33     
            LDA $33            ; $dc12: a5 33     
            BCC __dc2e         ; $dc14: 90 18     
            CMP #$44           ; $dc16: c9 44     
            BNE __dc2e         ; $dc18: d0 14     
            BVC __dc2e         ; $dc1a: 50 12     
            CLC                ; $dc1c: 18        
            CLV                ; $dc1d: b8        
            LDY #$99           ; $dc1e: a0 99     
            LDX #$80           ; $dc20: a2 80     
            STY $85,x          ; $dc22: 94 85     
            LDA $05            ; $dc24: a5 05     
            BCS __dc2e         ; $dc26: b0 06     
            CMP #$99           ; $dc28: c9 99     
            BNE __dc2e         ; $dc2a: d0 02     
            BVC __dc32         ; $dc2c: 50 04     
__dc2e:     LDA #$0a           ; $dc2e: a9 0a     
            STA $00            ; $dc30: 85 00     
__dc32:     LDY #$0b           ; $dc32: a0 0b     
            LDA #$aa           ; $dc34: a9 aa     
            LDX #$78           ; $dc36: a2 78     
            STA $78            ; $dc38: 85 78     
            JSR __f7b6         ; $dc3a: 20 b6 f7  
            ORA $00,x          ; $dc3d: 15 00     
            JSR __f7c0         ; $dc3f: 20 c0 f7  
            INY                ; $dc42: c8        
            LDA #$00           ; $dc43: a9 00     
            STA $78            ; $dc45: 85 78     
            JSR __f7ce         ; $dc47: 20 ce f7  
            ORA $00,x          ; $dc4a: 15 00     
            JSR __f7d3         ; $dc4c: 20 d3 f7  
            INY                ; $dc4f: c8        
            LDA #$aa           ; $dc50: a9 aa     
            STA $78            ; $dc52: 85 78     
            JSR __f7df         ; $dc54: 20 df f7  
            AND $00,x          ; $dc57: 35 00     
            JSR __f7e5         ; $dc59: 20 e5 f7  
            INY                ; $dc5c: c8        
            LDA #$ef           ; $dc5d: a9 ef     
            STA $78            ; $dc5f: 85 78     
            JSR __f7f1         ; $dc61: 20 f1 f7  
            AND $00,x          ; $dc64: 35 00     
            JSR __f7f6         ; $dc66: 20 f6 f7  
            INY                ; $dc69: c8        
            LDA #$aa           ; $dc6a: a9 aa     
            STA $78            ; $dc6c: 85 78     
            JSR __f804         ; $dc6e: 20 04 f8  
            EOR $00,x          ; $dc71: 55 00     
            JSR __f80a         ; $dc73: 20 0a f8  
            INY                ; $dc76: c8        
            LDA #$70           ; $dc77: a9 70     
            STA $78            ; $dc79: 85 78     
            JSR __f818         ; $dc7b: 20 18 f8  
            EOR $00,x          ; $dc7e: 55 00     
            JSR __f81d         ; $dc80: 20 1d f8  
            INY                ; $dc83: c8        
            LDA #$69           ; $dc84: a9 69     
            STA $78            ; $dc86: 85 78     
            JSR __f829         ; $dc88: 20 29 f8  
            ADC $00,x          ; $dc8b: 75 00     
            JSR __f82f         ; $dc8d: 20 2f f8  
            INY                ; $dc90: c8        
            JSR __f83d         ; $dc91: 20 3d f8  
            ADC $00,x          ; $dc94: 75 00     
            JSR __f843         ; $dc96: 20 43 f8  
            INY                ; $dc99: c8        
            LDA #$7f           ; $dc9a: a9 7f     
            STA $78            ; $dc9c: 85 78     
            JSR __f851         ; $dc9e: 20 51 f8  
            ADC $00,x          ; $dca1: 75 00     
            JSR __f856         ; $dca3: 20 56 f8  
            INY                ; $dca6: c8        
            LDA #$80           ; $dca7: a9 80     
            STA $78            ; $dca9: 85 78     
            JSR __f864         ; $dcab: 20 64 f8  
            ADC $00,x          ; $dcae: 75 00     
            JSR __f86a         ; $dcb0: 20 6a f8  
            INY                ; $dcb3: c8        
            JSR __f878         ; $dcb4: 20 78 f8  
            ADC $00,x          ; $dcb7: 75 00     
            JSR __f87d         ; $dcb9: 20 7d f8  
            INY                ; $dcbc: c8        
            LDA #$40           ; $dcbd: a9 40     
            STA $78            ; $dcbf: 85 78     
            JSR __f889         ; $dcc1: 20 89 f8  
            CMP $00,x          ; $dcc4: d5 00     
            JSR __f88e         ; $dcc6: 20 8e f8  
            INY                ; $dcc9: c8        
            PHA                ; $dcca: 48        
            LDA #$3f           ; $dccb: a9 3f     
            STA $78            ; $dccd: 85 78     
            PLA                ; $dccf: 68        
            JSR __f89a         ; $dcd0: 20 9a f8  
            CMP $00,x          ; $dcd3: d5 00     
            JSR __f89c         ; $dcd5: 20 9c f8  
            INY                ; $dcd8: c8        
            PHA                ; $dcd9: 48        
            LDA #$41           ; $dcda: a9 41     
            STA $78            ; $dcdc: 85 78     
            PLA                ; $dcde: 68        
            CMP $00,x          ; $dcdf: d5 00     
            JSR __f8a8         ; $dce1: 20 a8 f8  
            INY                ; $dce4: c8        
            PHA                ; $dce5: 48        
            LDA #$00           ; $dce6: a9 00     
            STA $78            ; $dce8: 85 78     
            PLA                ; $dcea: 68        
            JSR __f8b2         ; $dceb: 20 b2 f8  
            CMP $00,x          ; $dcee: d5 00     
            JSR __f8b5         ; $dcf0: 20 b5 f8  
            INY                ; $dcf3: c8        
            PHA                ; $dcf4: 48        
            LDA #$80           ; $dcf5: a9 80     
            STA $78            ; $dcf7: 85 78     
            PLA                ; $dcf9: 68        
            CMP $00,x          ; $dcfa: d5 00     
            JSR __f8bf         ; $dcfc: 20 bf f8  
            INY                ; $dcff: c8        
            PHA                ; $dd00: 48        
            LDA #$81           ; $dd01: a9 81     
            STA $78            ; $dd03: 85 78     
            PLA                ; $dd05: 68        
            CMP $00,x          ; $dd06: d5 00     
            JSR __f8c9         ; $dd08: 20 c9 f8  
            INY                ; $dd0b: c8        
            PHA                ; $dd0c: 48        
            LDA #$7f           ; $dd0d: a9 7f     
            STA $78            ; $dd0f: 85 78     
            PLA                ; $dd11: 68        
            CMP $00,x          ; $dd12: d5 00     
            JSR __f8d3         ; $dd14: 20 d3 f8  
            INY                ; $dd17: c8        
            LDA #$40           ; $dd18: a9 40     
            STA $78            ; $dd1a: 85 78     
            JSR __f931         ; $dd1c: 20 31 f9  
            SBC $00,x          ; $dd1f: f5 00     
            JSR __f937         ; $dd21: 20 37 f9  
            INY                ; $dd24: c8        
            LDA #$3f           ; $dd25: a9 3f     
            STA $78            ; $dd27: 85 78     
            JSR __f947         ; $dd29: 20 47 f9  
            SBC $00,x          ; $dd2c: f5 00     
            JSR __f94c         ; $dd2e: 20 4c f9  
            INY                ; $dd31: c8        
            LDA #$41           ; $dd32: a9 41     
            STA $78            ; $dd34: 85 78     
            JSR __f95c         ; $dd36: 20 5c f9  
            SBC $00,x          ; $dd39: f5 00     
            JSR __f962         ; $dd3b: 20 62 f9  
            INY                ; $dd3e: c8        
            LDA #$00           ; $dd3f: a9 00     
            STA $78            ; $dd41: 85 78     
            JSR __f972         ; $dd43: 20 72 f9  
            SBC $00,x          ; $dd46: f5 00     
            JSR __f976         ; $dd48: 20 76 f9  
            INY                ; $dd4b: c8        
            LDA #$7f           ; $dd4c: a9 7f     
            STA $78            ; $dd4e: 85 78     
            JSR __f980         ; $dd50: 20 80 f9  
            SBC $00,x          ; $dd53: f5 00     
            JSR __f984         ; $dd55: 20 84 f9  
            LDA #$aa           ; $dd58: a9 aa     
            STA $33            ; $dd5a: 85 33     
            LDA #$bb           ; $dd5c: a9 bb     
            STA $89            ; $dd5e: 85 89     
            LDX #$00           ; $dd60: a2 00     
            LDY #$66           ; $dd62: a0 66     
            BIT $01            ; $dd64: 24 01     
            SEC                ; $dd66: 38        
            LDA #$00           ; $dd67: a9 00     
            LDA $33,x          ; $dd69: b5 33     
            BPL __dd7f         ; $dd6b: 10 12     
            BEQ __dd7f         ; $dd6d: f0 10     
            BVC __dd7f         ; $dd6f: 50 0e     
            BCC __dd7f         ; $dd71: 90 0c     
            CPY #$66           ; $dd73: c0 66     
            BNE __dd7f         ; $dd75: d0 08     
            CPX #$00           ; $dd77: e0 00     
            BNE __dd7f         ; $dd79: d0 04     
            CMP #$aa           ; $dd7b: c9 aa     
            BEQ __dd83         ; $dd7d: f0 04     
__dd7f:     LDA #$22           ; $dd7f: a9 22     
            STA $00            ; $dd81: 85 00     
__dd83:     LDX #$8a           ; $dd83: a2 8a     
            LDY #$66           ; $dd85: a0 66     
            CLV                ; $dd87: b8        
            CLC                ; $dd88: 18        
            LDA #$00           ; $dd89: a9 00     
            LDA $ff,x          ; $dd8b: b5 ff     
            BPL __dda1         ; $dd8d: 10 12     
            BEQ __dda1         ; $dd8f: f0 10     
            BVS __dda1         ; $dd91: 70 0e     
            BCS __dda1         ; $dd93: b0 0c     
            CMP #$bb           ; $dd95: c9 bb     
            BNE __dda1         ; $dd97: d0 08     
            CPY #$66           ; $dd99: c0 66     
            BNE __dda1         ; $dd9b: d0 04     
            CPX #$8a           ; $dd9d: e0 8a     
            BEQ __dda5         ; $dd9f: f0 04     
__dda1:     LDA #$23           ; $dda1: a9 23     
            STA $00            ; $dda3: 85 00     
__dda5:     BIT $01            ; $dda5: 24 01     
            SEC                ; $dda7: 38        
            LDA #$44           ; $dda8: a9 44     
            LDX #$00           ; $ddaa: a2 00     
            STA $33,x          ; $ddac: 95 33     
            LDA $33            ; $ddae: a5 33     
            BCC __ddca         ; $ddb0: 90 18     
            CMP #$44           ; $ddb2: c9 44     
            BNE __ddca         ; $ddb4: d0 14     
            BVC __ddca         ; $ddb6: 50 12     
            CLC                ; $ddb8: 18        
            CLV                ; $ddb9: b8        
            LDA #$99           ; $ddba: a9 99     
            LDX #$80           ; $ddbc: a2 80     
            STA $85,x          ; $ddbe: 95 85     
            LDA $05            ; $ddc0: a5 05     
            BCS __ddca         ; $ddc2: b0 06     
            CMP #$99           ; $ddc4: c9 99     
            BNE __ddca         ; $ddc6: d0 02     
            BVC __ddce         ; $ddc8: 50 04     
__ddca:     LDA #$24           ; $ddca: a9 24     
            STA $00            ; $ddcc: 85 00     
__ddce:     LDY #$25           ; $ddce: a0 25     
            LDX #$78           ; $ddd0: a2 78     
            JSR __f990         ; $ddd2: 20 90 f9  
            STA $00,x          ; $ddd5: 95 00     
            LSR $00,x          ; $ddd7: 56 00     
            LDA $00,x          ; $ddd9: b5 00     
            JSR __f99d         ; $dddb: 20 9d f9  
            INY                ; $ddde: c8        
            STA $00,x          ; $dddf: 95 00     
            LSR $00,x          ; $dde1: 56 00     
            LDA $00,x          ; $dde3: b5 00     
            JSR __f9ad         ; $dde5: 20 ad f9  
            INY                ; $dde8: c8        
            JSR __f9bd         ; $dde9: 20 bd f9  
            STA $00,x          ; $ddec: 95 00     
            ASL $00,x          ; $ddee: 16 00     
            LDA $00,x          ; $ddf0: b5 00     
            JSR __f9c3         ; $ddf2: 20 c3 f9  
            INY                ; $ddf5: c8        
            STA $00,x          ; $ddf6: 95 00     
            ASL $00,x          ; $ddf8: 16 00     
            LDA $00,x          ; $ddfa: b5 00     
            JSR __f9d4         ; $ddfc: 20 d4 f9  
            INY                ; $ddff: c8        
            JSR __f9e4         ; $de00: 20 e4 f9  
            STA $00,x          ; $de03: 95 00     
            ROR $00,x          ; $de05: 76 00     
            LDA $00,x          ; $de07: b5 00     
            JSR __f9ea         ; $de09: 20 ea f9  
            INY                ; $de0c: c8        
            STA $00,x          ; $de0d: 95 00     
            ROR $00,x          ; $de0f: 76 00     
            LDA $00,x          ; $de11: b5 00     
            JSR __f9fb         ; $de13: 20 fb f9  
            INY                ; $de16: c8        
            JSR __fa0a         ; $de17: 20 0a fa  
            STA $00,x          ; $de1a: 95 00     
            ROL $00,x          ; $de1c: 36 00     
            LDA $00,x          ; $de1e: b5 00     
            JSR __fa10         ; $de20: 20 10 fa  
            INY                ; $de23: c8        
            STA $00,x          ; $de24: 95 00     
            ROL $00,x          ; $de26: 36 00     
            LDA $00,x          ; $de28: b5 00     
            JSR __fa21         ; $de2a: 20 21 fa  
            LDA #$ff           ; $de2d: a9 ff     
            STA $00,x          ; $de2f: 95 00     
            STA $01            ; $de31: 85 01     
            BIT $01            ; $de33: 24 01     
            SEC                ; $de35: 38        
            INC $00,x          ; $de36: f6 00     
            BNE __de46         ; $de38: d0 0c     
            BMI __de46         ; $de3a: 30 0a     
            BVC __de46         ; $de3c: 50 08     
            BCC __de46         ; $de3e: 90 06     
            LDA $00,x          ; $de40: b5 00     
            CMP #$00           ; $de42: c9 00     
            BEQ __de4a         ; $de44: f0 04     
__de46:     LDA #$2d           ; $de46: a9 2d     
            STA $00            ; $de48: 85 00     
__de4a:     LDA #$7f           ; $de4a: a9 7f     
            STA $00,x          ; $de4c: 95 00     
            CLV                ; $de4e: b8        
            CLC                ; $de4f: 18        
            INC $00,x          ; $de50: f6 00     
            BEQ __de60         ; $de52: f0 0c     
            BPL __de60         ; $de54: 10 0a     
            BVS __de60         ; $de56: 70 08     
            BCS __de60         ; $de58: b0 06     
            LDA $00,x          ; $de5a: b5 00     
            CMP #$80           ; $de5c: c9 80     
            BEQ __de64         ; $de5e: f0 04     
__de60:     LDA #$2e           ; $de60: a9 2e     
            STA $00            ; $de62: 85 00     
__de64:     LDA #$00           ; $de64: a9 00     
            STA $00,x          ; $de66: 95 00     
            BIT $01            ; $de68: 24 01     
            SEC                ; $de6a: 38        
            DEC $00,x          ; $de6b: d6 00     
            BEQ __de7b         ; $de6d: f0 0c     
            BPL __de7b         ; $de6f: 10 0a     
            BVC __de7b         ; $de71: 50 08     
            BCC __de7b         ; $de73: 90 06     
            LDA $00,x          ; $de75: b5 00     
            CMP #$ff           ; $de77: c9 ff     
            BEQ __de7f         ; $de79: f0 04     
__de7b:     LDA #$2f           ; $de7b: a9 2f     
            STA $00            ; $de7d: 85 00     
__de7f:     LDA #$80           ; $de7f: a9 80     
            STA $00,x          ; $de81: 95 00     
            CLV                ; $de83: b8        
            CLC                ; $de84: 18        
            DEC $00,x          ; $de85: d6 00     
            BEQ __de95         ; $de87: f0 0c     
            BMI __de95         ; $de89: 30 0a     
            BVS __de95         ; $de8b: 70 08     
            BCS __de95         ; $de8d: b0 06     
            LDA $00,x          ; $de8f: b5 00     
            CMP #$7f           ; $de91: c9 7f     
            BEQ __de99         ; $de93: f0 04     
__de95:     LDA #$30           ; $de95: a9 30     
            STA $00            ; $de97: 85 00     
__de99:     LDA #$01           ; $de99: a9 01     
            STA $00,x          ; $de9b: 95 00     
            DEC $00,x          ; $de9d: d6 00     
            BEQ __dea5         ; $de9f: f0 04     
            LDA #$31           ; $dea1: a9 31     
            STA $00            ; $dea3: 85 00     
__dea5:     LDA #$33           ; $dea5: a9 33     
            STA $78            ; $dea7: 85 78     
            LDA #$44           ; $dea9: a9 44     
            LDY #$78           ; $deab: a0 78     
            LDX #$00           ; $dead: a2 00     
            SEC                ; $deaf: 38        
            BIT $01            ; $deb0: 24 01     
            LDX $00,y          ; $deb2: b6 00     
            BCC __dec8         ; $deb4: 90 12     
            BVC __dec8         ; $deb6: 50 10     
            BMI __dec8         ; $deb8: 30 0e     
            BEQ __dec8         ; $deba: f0 0c     
            CPX #$33           ; $debc: e0 33     
            BNE __dec8         ; $debe: d0 08     
            CPY #$78           ; $dec0: c0 78     
            BNE __dec8         ; $dec2: d0 04     
            CMP #$44           ; $dec4: c9 44     
            BEQ __decc         ; $dec6: f0 04     
__dec8:     LDA #$32           ; $dec8: a9 32     
            STA $00            ; $deca: 85 00     
__decc:     LDA #$97           ; $decc: a9 97     
            STA $7f            ; $dece: 85 7f     
            LDA #$47           ; $ded0: a9 47     
            LDY #$ff           ; $ded2: a0 ff     
            LDX #$00           ; $ded4: a2 00     
            CLC                ; $ded6: 18        
            CLV                ; $ded7: b8        
            LDX $80,y          ; $ded8: b6 80     
            BCS __deee         ; $deda: b0 12     
            BVS __deee         ; $dedc: 70 10     
            BPL __deee         ; $dede: 10 0e     
            BEQ __deee         ; $dee0: f0 0c     
            CPX #$97           ; $dee2: e0 97     
            BNE __deee         ; $dee4: d0 08     
            CPY #$ff           ; $dee6: c0 ff     
            BNE __deee         ; $dee8: d0 04     
            CMP #$47           ; $deea: c9 47     
            BEQ __def2         ; $deec: f0 04     
__deee:     LDA #$33           ; $deee: a9 33     
            STA $00            ; $def0: 85 00     
__def2:     LDA #$00           ; $def2: a9 00     
            STA $7f            ; $def4: 85 7f     
            LDA #$47           ; $def6: a9 47     
            LDY #$ff           ; $def8: a0 ff     
            LDX #$69           ; $defa: a2 69     
            CLC                ; $defc: 18        
            CLV                ; $defd: b8        
            STX $80,y          ; $defe: 96 80     
            BCS __df1a         ; $df00: b0 18     
            BVS __df1a         ; $df02: 70 16     
            BMI __df1a         ; $df04: 30 14     
            BEQ __df1a         ; $df06: f0 12     
            CPX #$69           ; $df08: e0 69     
            BNE __df1a         ; $df0a: d0 0e     
            CPY #$ff           ; $df0c: c0 ff     
            BNE __df1a         ; $df0e: d0 0a     
            CMP #$47           ; $df10: c9 47     
            BNE __df1a         ; $df12: d0 06     
            LDA $7f            ; $df14: a5 7f     
            CMP #$69           ; $df16: c9 69     
            BEQ __df1e         ; $df18: f0 04     
__df1a:     LDA #$34           ; $df1a: a9 34     
            STA $00            ; $df1c: 85 00     
__df1e:     LDA #$f5           ; $df1e: a9 f5     
            STA $4f            ; $df20: 85 4f     
            LDA #$47           ; $df22: a9 47     
            LDY #$4f           ; $df24: a0 4f     
            BIT $01            ; $df26: 24 01     
            LDX #$00           ; $df28: a2 00     
            SEC                ; $df2a: 38        
            STX $00,y          ; $df2b: 96 00     
            BCC __df45         ; $df2d: 90 16     
            BVC __df45         ; $df2f: 50 14     
            BMI __df45         ; $df31: 30 12     
            BNE __df45         ; $df33: d0 10     
            CPX #$00           ; $df35: e0 00     
            BNE __df45         ; $df37: d0 0c     
            CPY #$4f           ; $df39: c0 4f     
            BNE __df45         ; $df3b: d0 08     
            CMP #$47           ; $df3d: c9 47     
            BNE __df45         ; $df3f: d0 04     
            LDA $4f            ; $df41: a5 4f     
            BEQ __df49         ; $df43: f0 04     
__df45:     LDA #$35           ; $df45: a9 35     
            STA $00            ; $df47: 85 00     
__df49:     RTS                ; $df49: 60        

;-------------------------------------------------------------------------------
__df4a:     LDA #$89           ; $df4a: a9 89     
            STA $0300          ; $df4c: 8d 00 03  
            LDA #$a3           ; $df4f: a9 a3     
            STA $33            ; $df51: 85 33     
            LDA #$12           ; $df53: a9 12     
            STA $0245          ; $df55: 8d 45 02  
            LDX #$65           ; $df58: a2 65     
            LDY #$00           ; $df5a: a0 00     
            SEC                ; $df5c: 38        
            LDA #$00           ; $df5d: a9 00     
            CLV                ; $df5f: b8        
            LDA $0300,y        ; $df60: b9 00 03  
            BEQ __df71         ; $df63: f0 0c     
            BCC __df71         ; $df65: 90 0a     
            BVS __df71         ; $df67: 70 08     
            CMP #$89           ; $df69: c9 89     
            BNE __df71         ; $df6b: d0 04     
            CPX #$65           ; $df6d: e0 65     
            BEQ __df75         ; $df6f: f0 04     
__df71:     LDA #$36           ; $df71: a9 36     
            STA $00            ; $df73: 85 00     
__df75:     LDA #$ff           ; $df75: a9 ff     
            STA $01            ; $df77: 85 01     
            BIT $01            ; $df79: 24 01     
            LDY #$34           ; $df7b: a0 34     
            LDA $ffff,y        ; $df7d: b9 ff ff  
            CMP #$a3           ; $df80: c9 a3     
            BNE __df86         ; $df82: d0 02     
            BCS __df8a         ; $df84: b0 04     
__df86:     LDA #$37           ; $df86: a9 37     
            STA $00            ; $df88: 85 00     
__df8a:     LDA #$46           ; $df8a: a9 46     
            STA $ff            ; $df8c: 85 ff     
            LDY #$ff           ; $df8e: a0 ff     
            LDA $0146,y        ; $df90: b9 46 01  
            CMP #$12           ; $df93: c9 12     
            BEQ __df9b         ; $df95: f0 04     
            LDA #$38           ; $df97: a9 38     
            STA $00            ; $df99: 85 00     
__df9b:     LDX #$39           ; $df9b: a2 39     
            CLC                ; $df9d: 18        
            LDA #$ff           ; $df9e: a9 ff     
            STA $01            ; $dfa0: 85 01     
            BIT $01            ; $dfa2: 24 01     
            LDA #$aa           ; $dfa4: a9 aa     
            STA $0400          ; $dfa6: 8d 00 04  
            LDA #$55           ; $dfa9: a9 55     
            LDY #$00           ; $dfab: a0 00     
            ORA $0400,y        ; $dfad: 19 00 04  
            BCS __dfba         ; $dfb0: b0 08     
            BPL __dfba         ; $dfb2: 10 06     
            CMP #$ff           ; $dfb4: c9 ff     
            BNE __dfba         ; $dfb6: d0 02     
            BVS __dfbc         ; $dfb8: 70 02     
__dfba:     STX $00            ; $dfba: 86 00     
__dfbc:     INX                ; $dfbc: e8        
            SEC                ; $dfbd: 38        
            CLV                ; $dfbe: b8        
            LDA #$00           ; $dfbf: a9 00     
            ORA $0400,y        ; $dfc1: 19 00 04  
            BEQ __dfcc         ; $dfc4: f0 06     
            BVS __dfcc         ; $dfc6: 70 04     
            BCC __dfcc         ; $dfc8: 90 02     
            BMI __dfce         ; $dfca: 30 02     
__dfcc:     STX $00            ; $dfcc: 86 00     
__dfce:     INX                ; $dfce: e8        
            CLC                ; $dfcf: 18        
            BIT $01            ; $dfd0: 24 01     
            LDA #$55           ; $dfd2: a9 55     
            AND $0400,y        ; $dfd4: 39 00 04  
            BNE __dfdf         ; $dfd7: d0 06     
            BVC __dfdf         ; $dfd9: 50 04     
            BCS __dfdf         ; $dfdb: b0 02     
            BPL __dfe1         ; $dfdd: 10 02     
__dfdf:     STX $00            ; $dfdf: 86 00     
__dfe1:     INX                ; $dfe1: e8        
            SEC                ; $dfe2: 38        
            CLV                ; $dfe3: b8        
            LDA #$ef           ; $dfe4: a9 ef     
            STA $0400          ; $dfe6: 8d 00 04  
            LDA #$f8           ; $dfe9: a9 f8     
            AND $0400,y        ; $dfeb: 39 00 04  
            BCC __dff8         ; $dfee: 90 08     
            BPL __dff8         ; $dff0: 10 06     
            CMP #$e8           ; $dff2: c9 e8     
            BNE __dff8         ; $dff4: d0 02     
            BVC __dffa         ; $dff6: 50 02     
__dff8:     STX $00            ; $dff8: 86 00     
__dffa:     INX                ; $dffa: e8        
            CLC                ; $dffb: 18        
            BIT $01            ; $dffc: 24 01     
            LDA #$aa           ; $dffe: a9 aa     
            STA $0400          ; $e000: 8d 00 04  
            LDA #$5f           ; $e003: a9 5f     
            EOR $0400,y        ; $e005: 59 00 04  
            BCS __e012         ; $e008: b0 08     
            BPL __e012         ; $e00a: 10 06     
            CMP #$f5           ; $e00c: c9 f5     
            BNE __e012         ; $e00e: d0 02     
            BVS __e014         ; $e010: 70 02     
__e012:     STX $00            ; $e012: 86 00     
__e014:     INX                ; $e014: e8        
            SEC                ; $e015: 38        
            CLV                ; $e016: b8        
            LDA #$70           ; $e017: a9 70     
            STA $0400          ; $e019: 8d 00 04  
            EOR $0400,y        ; $e01c: 59 00 04  
            BNE __e027         ; $e01f: d0 06     
            BVS __e027         ; $e021: 70 04     
            BCC __e027         ; $e023: 90 02     
            BPL __e029         ; $e025: 10 02     
__e027:     STX $00            ; $e027: 86 00     
__e029:     INX                ; $e029: e8        
            CLC                ; $e02a: 18        
            BIT $01            ; $e02b: 24 01     
            LDA #$69           ; $e02d: a9 69     
            STA $0400          ; $e02f: 8d 00 04  
            LDA #$00           ; $e032: a9 00     
            ADC $0400,y        ; $e034: 79 00 04  
            BMI __e041         ; $e037: 30 08     
            BCS __e041         ; $e039: b0 06     
            CMP #$69           ; $e03b: c9 69     
            BNE __e041         ; $e03d: d0 02     
            BVC __e043         ; $e03f: 50 02     
__e041:     STX $00            ; $e041: 86 00     
__e043:     INX                ; $e043: e8        
            SEC                ; $e044: 38        
            BIT $01            ; $e045: 24 01     
            LDA #$00           ; $e047: a9 00     
            ADC $0400,y        ; $e049: 79 00 04  
            BMI __e056         ; $e04c: 30 08     
            BCS __e056         ; $e04e: b0 06     
            CMP #$6a           ; $e050: c9 6a     
            BNE __e056         ; $e052: d0 02     
            BVC __e058         ; $e054: 50 02     
__e056:     STX $00            ; $e056: 86 00     
__e058:     INX                ; $e058: e8        
            SEC                ; $e059: 38        
            CLV                ; $e05a: b8        
            LDA #$7f           ; $e05b: a9 7f     
            STA $0400          ; $e05d: 8d 00 04  
            ADC $0400,y        ; $e060: 79 00 04  
            BPL __e06d         ; $e063: 10 08     
            BCS __e06d         ; $e065: b0 06     
            CMP #$ff           ; $e067: c9 ff     
            BNE __e06d         ; $e069: d0 02     
            BVS __e06f         ; $e06b: 70 02     
__e06d:     STX $00            ; $e06d: 86 00     
__e06f:     INX                ; $e06f: e8        
            CLC                ; $e070: 18        
            BIT $01            ; $e071: 24 01     
            LDA #$80           ; $e073: a9 80     
            STA $0400          ; $e075: 8d 00 04  
            LDA #$7f           ; $e078: a9 7f     
            ADC $0400,y        ; $e07a: 79 00 04  
            BPL __e087         ; $e07d: 10 08     
            BCS __e087         ; $e07f: b0 06     
            CMP #$ff           ; $e081: c9 ff     
            BNE __e087         ; $e083: d0 02     
            BVC __e089         ; $e085: 50 02     
__e087:     STX $00            ; $e087: 86 00     
__e089:     INX                ; $e089: e8        
            SEC                ; $e08a: 38        
            CLV                ; $e08b: b8        
            LDA #$80           ; $e08c: a9 80     
            STA $0400          ; $e08e: 8d 00 04  
            LDA #$7f           ; $e091: a9 7f     
            ADC $0400,y        ; $e093: 79 00 04  
            BNE __e09e         ; $e096: d0 06     
            BMI __e09e         ; $e098: 30 04     
            BVS __e09e         ; $e09a: 70 02     
            BCS __e0a0         ; $e09c: b0 02     
__e09e:     STX $00            ; $e09e: 86 00     
__e0a0:     INX                ; $e0a0: e8        
            BIT $01            ; $e0a1: 24 01     
            LDA #$40           ; $e0a3: a9 40     
            STA $0400          ; $e0a5: 8d 00 04  
            CMP $0400,y        ; $e0a8: d9 00 04  
            BMI __e0b3         ; $e0ab: 30 06     
            BCC __e0b3         ; $e0ad: 90 04     
            BNE __e0b3         ; $e0af: d0 02     
            BVS __e0b5         ; $e0b1: 70 02     
__e0b3:     STX $00            ; $e0b3: 86 00     
__e0b5:     INX                ; $e0b5: e8        
            CLV                ; $e0b6: b8        
            DEC $0400          ; $e0b7: ce 00 04  
            CMP $0400,y        ; $e0ba: d9 00 04  
            BEQ __e0c5         ; $e0bd: f0 06     
            BMI __e0c5         ; $e0bf: 30 04     
            BCC __e0c5         ; $e0c1: 90 02     
            BVC __e0c7         ; $e0c3: 50 02     
__e0c5:     STX $00            ; $e0c5: 86 00     
__e0c7:     INX                ; $e0c7: e8        
            INC $0400          ; $e0c8: ee 00 04  
            INC $0400          ; $e0cb: ee 00 04  
            CMP $0400,y        ; $e0ce: d9 00 04  
            BEQ __e0d5         ; $e0d1: f0 02     
            BMI __e0d7         ; $e0d3: 30 02     
__e0d5:     STX $00            ; $e0d5: 86 00     
__e0d7:     INX                ; $e0d7: e8        
            LDA #$00           ; $e0d8: a9 00     
            STA $0400          ; $e0da: 8d 00 04  
            LDA #$80           ; $e0dd: a9 80     
            CMP $0400,y        ; $e0df: d9 00 04  
            BEQ __e0e8         ; $e0e2: f0 04     
            BPL __e0e8         ; $e0e4: 10 02     
            BCS __e0ea         ; $e0e6: b0 02     
__e0e8:     STX $00            ; $e0e8: 86 00     
__e0ea:     INX                ; $e0ea: e8        
            LDY #$80           ; $e0eb: a0 80     
            STY $0400          ; $e0ed: 8c 00 04  
            LDY #$00           ; $e0f0: a0 00     
            CMP $0400,y        ; $e0f2: d9 00 04  
            BNE __e0fb         ; $e0f5: d0 04     
            BMI __e0fb         ; $e0f7: 30 02     
            BCS __e0fd         ; $e0f9: b0 02     
__e0fb:     STX $00            ; $e0fb: 86 00     
__e0fd:     INX                ; $e0fd: e8        
            INC $0400          ; $e0fe: ee 00 04  
            CMP $0400,y        ; $e101: d9 00 04  
            BCS __e10a         ; $e104: b0 04     
            BEQ __e10a         ; $e106: f0 02     
            BMI __e10c         ; $e108: 30 02     
__e10a:     STX $00            ; $e10a: 86 00     
__e10c:     INX                ; $e10c: e8        
            DEC $0400          ; $e10d: ce 00 04  
            DEC $0400          ; $e110: ce 00 04  
            CMP $0400,y        ; $e113: d9 00 04  
            BCC __e11c         ; $e116: 90 04     
            BEQ __e11c         ; $e118: f0 02     
            BPL __e11e         ; $e11a: 10 02     
__e11c:     STX $00            ; $e11c: 86 00     
__e11e:     INX                ; $e11e: e8        
            BIT $01            ; $e11f: 24 01     
            LDA #$40           ; $e121: a9 40     
            STA $0400          ; $e123: 8d 00 04  
            SEC                ; $e126: 38        
            SBC $0400,y        ; $e127: f9 00 04  
            BMI __e136         ; $e12a: 30 0a     
            BCC __e136         ; $e12c: 90 08     
            BNE __e136         ; $e12e: d0 06     
            BVS __e136         ; $e130: 70 04     
            CMP #$00           ; $e132: c9 00     
            BEQ __e138         ; $e134: f0 02     
__e136:     STX $00            ; $e136: 86 00     
__e138:     INX                ; $e138: e8        
            CLV                ; $e139: b8        
            SEC                ; $e13a: 38        
            LDA #$40           ; $e13b: a9 40     
            DEC $0400          ; $e13d: ce 00 04  
            SBC $0400,y        ; $e140: f9 00 04  
            BEQ __e14f         ; $e143: f0 0a     
            BMI __e14f         ; $e145: 30 08     
            BCC __e14f         ; $e147: 90 06     
            BVS __e14f         ; $e149: 70 04     
            CMP #$01           ; $e14b: c9 01     
            BEQ __e151         ; $e14d: f0 02     
__e14f:     STX $00            ; $e14f: 86 00     
__e151:     INX                ; $e151: e8        
            LDA #$40           ; $e152: a9 40     
            SEC                ; $e154: 38        
            BIT $01            ; $e155: 24 01     
            INC $0400          ; $e157: ee 00 04  
            INC $0400          ; $e15a: ee 00 04  
            SBC $0400,y        ; $e15d: f9 00 04  
            BCS __e16c         ; $e160: b0 0a     
            BEQ __e16c         ; $e162: f0 08     
            BPL __e16c         ; $e164: 10 06     
            BVS __e16c         ; $e166: 70 04     
            CMP #$ff           ; $e168: c9 ff     
            BEQ __e16e         ; $e16a: f0 02     
__e16c:     STX $00            ; $e16c: 86 00     
__e16e:     INX                ; $e16e: e8        
            CLC                ; $e16f: 18        
            LDA #$00           ; $e170: a9 00     
            STA $0400          ; $e172: 8d 00 04  
            LDA #$80           ; $e175: a9 80     
            SBC $0400,y        ; $e177: f9 00 04  
            BCC __e180         ; $e17a: 90 04     
            CMP #$7f           ; $e17c: c9 7f     
            BEQ __e182         ; $e17e: f0 02     
__e180:     STX $00            ; $e180: 86 00     
__e182:     INX                ; $e182: e8        
            SEC                ; $e183: 38        
            LDA #$7f           ; $e184: a9 7f     
            STA $0400          ; $e186: 8d 00 04  
            LDA #$81           ; $e189: a9 81     
            SBC $0400,y        ; $e18b: f9 00 04  
            BVC __e196         ; $e18e: 50 06     
            BCC __e196         ; $e190: 90 04     
            CMP #$02           ; $e192: c9 02     
            BEQ __e198         ; $e194: f0 02     
__e196:     STX $00            ; $e196: 86 00     
__e198:     INX                ; $e198: e8        
            LDA #$00           ; $e199: a9 00     
            LDA #$87           ; $e19b: a9 87     
            STA $0400,y        ; $e19d: 99 00 04  
            LDA $0400          ; $e1a0: ad 00 04  
            CMP #$87           ; $e1a3: c9 87     
            BEQ __e1a9         ; $e1a5: f0 02     
            STX $00            ; $e1a7: 86 00     
__e1a9:     RTS                ; $e1a9: 60        

;-------------------------------------------------------------------------------
__e1aa:     LDA #$ff           ; $e1aa: a9 ff     
            STA $01            ; $e1ac: 85 01     
            LDA #$aa           ; $e1ae: a9 aa     
            STA $0633          ; $e1b0: 8d 33 06  
            LDA #$bb           ; $e1b3: a9 bb     
            STA $0689          ; $e1b5: 8d 89 06  
            LDX #$00           ; $e1b8: a2 00     
            LDA #$66           ; $e1ba: a9 66     
            BIT $01            ; $e1bc: 24 01     
            SEC                ; $e1be: 38        
            LDY #$00           ; $e1bf: a0 00     
            LDY $0633,x        ; $e1c1: bc 33 06  
            BPL __e1d8         ; $e1c4: 10 12     
            BEQ __e1d8         ; $e1c6: f0 10     
            BVC __e1d8         ; $e1c8: 50 0e     
            BCC __e1d8         ; $e1ca: 90 0c     
            CMP #$66           ; $e1cc: c9 66     
            BNE __e1d8         ; $e1ce: d0 08     
            CPX #$00           ; $e1d0: e0 00     
            BNE __e1d8         ; $e1d2: d0 04     
            CPY #$aa           ; $e1d4: c0 aa     
            BEQ __e1dc         ; $e1d6: f0 04     
__e1d8:     LDA #$51           ; $e1d8: a9 51     
            STA $00            ; $e1da: 85 00     
__e1dc:     LDX #$8a           ; $e1dc: a2 8a     
            LDA #$66           ; $e1de: a9 66     
            CLV                ; $e1e0: b8        
            CLC                ; $e1e1: 18        
            LDY #$00           ; $e1e2: a0 00     
            LDY $05ff,x        ; $e1e4: bc ff 05  
            BPL __e1fb         ; $e1e7: 10 12     
            BEQ __e1fb         ; $e1e9: f0 10     
            BVS __e1fb         ; $e1eb: 70 0e     
            BCS __e1fb         ; $e1ed: b0 0c     
            CPY #$bb           ; $e1ef: c0 bb     
            BNE __e1fb         ; $e1f1: d0 08     
            CMP #$66           ; $e1f3: c9 66     
            BNE __e1fb         ; $e1f5: d0 04     
            CPX #$8a           ; $e1f7: e0 8a     
            BEQ __e1ff         ; $e1f9: f0 04     
__e1fb:     LDA #$52           ; $e1fb: a9 52     
            STA $00            ; $e1fd: 85 00     
__e1ff:     LDY #$53           ; $e1ff: a0 53     
            LDA #$aa           ; $e201: a9 aa     
            LDX #$78           ; $e203: a2 78     
            STA $0678          ; $e205: 8d 78 06  
            JSR __f7b6         ; $e208: 20 b6 f7  
            ORA $0600,x        ; $e20b: 1d 00 06  
            JSR __f7c0         ; $e20e: 20 c0 f7  
            INY                ; $e211: c8        
            LDA #$00           ; $e212: a9 00     
            STA $0678          ; $e214: 8d 78 06  
            JSR __f7ce         ; $e217: 20 ce f7  
            ORA $0600,x        ; $e21a: 1d 00 06  
            JSR __f7d3         ; $e21d: 20 d3 f7  
            INY                ; $e220: c8        
            LDA #$aa           ; $e221: a9 aa     
            STA $0678          ; $e223: 8d 78 06  
            JSR __f7df         ; $e226: 20 df f7  
            AND $0600,x        ; $e229: 3d 00 06  
            JSR __f7e5         ; $e22c: 20 e5 f7  
            INY                ; $e22f: c8        
            LDA #$ef           ; $e230: a9 ef     
            STA $0678          ; $e232: 8d 78 06  
            JSR __f7f1         ; $e235: 20 f1 f7  
            AND $0600,x        ; $e238: 3d 00 06  
            JSR __f7f6         ; $e23b: 20 f6 f7  
            INY                ; $e23e: c8        
            LDA #$aa           ; $e23f: a9 aa     
            STA $0678          ; $e241: 8d 78 06  
            JSR __f804         ; $e244: 20 04 f8  
            EOR $0600,x        ; $e247: 5d 00 06  
            JSR __f80a         ; $e24a: 20 0a f8  
            INY                ; $e24d: c8        
            LDA #$70           ; $e24e: a9 70     
            STA $0678          ; $e250: 8d 78 06  
            JSR __f818         ; $e253: 20 18 f8  
            EOR $0600,x        ; $e256: 5d 00 06  
            JSR __f81d         ; $e259: 20 1d f8  
            INY                ; $e25c: c8        
            LDA #$69           ; $e25d: a9 69     
            STA $0678          ; $e25f: 8d 78 06  
            JSR __f829         ; $e262: 20 29 f8  
            ADC $0600,x        ; $e265: 7d 00 06  
            JSR __f82f         ; $e268: 20 2f f8  
            INY                ; $e26b: c8        
            JSR __f83d         ; $e26c: 20 3d f8  
            ADC $0600,x        ; $e26f: 7d 00 06  
            JSR __f843         ; $e272: 20 43 f8  
            INY                ; $e275: c8        
            LDA #$7f           ; $e276: a9 7f     
            STA $0678          ; $e278: 8d 78 06  
            JSR __f851         ; $e27b: 20 51 f8  
            ADC $0600,x        ; $e27e: 7d 00 06  
            JSR __f856         ; $e281: 20 56 f8  
            INY                ; $e284: c8        
            LDA #$80           ; $e285: a9 80     
            STA $0678          ; $e287: 8d 78 06  
            JSR __f864         ; $e28a: 20 64 f8  
            ADC $0600,x        ; $e28d: 7d 00 06  
            JSR __f86a         ; $e290: 20 6a f8  
            INY                ; $e293: c8        
            JSR __f878         ; $e294: 20 78 f8  
            ADC $0600,x        ; $e297: 7d 00 06  
            JSR __f87d         ; $e29a: 20 7d f8  
            INY                ; $e29d: c8        
            LDA #$40           ; $e29e: a9 40     
            STA $0678          ; $e2a0: 8d 78 06  
            JSR __f889         ; $e2a3: 20 89 f8  
            CMP $0600,x        ; $e2a6: dd 00 06  
            JSR __f88e         ; $e2a9: 20 8e f8  
            INY                ; $e2ac: c8        
            PHA                ; $e2ad: 48        
            LDA #$3f           ; $e2ae: a9 3f     
            STA $0678          ; $e2b0: 8d 78 06  
            PLA                ; $e2b3: 68        
            JSR __f89a         ; $e2b4: 20 9a f8  
            CMP $0600,x        ; $e2b7: dd 00 06  
            JSR __f89c         ; $e2ba: 20 9c f8  
            INY                ; $e2bd: c8        
            PHA                ; $e2be: 48        
            LDA #$41           ; $e2bf: a9 41     
            STA $0678          ; $e2c1: 8d 78 06  
            PLA                ; $e2c4: 68        
            CMP $0600,x        ; $e2c5: dd 00 06  
            JSR __f8a8         ; $e2c8: 20 a8 f8  
            INY                ; $e2cb: c8        
            PHA                ; $e2cc: 48        
            LDA #$00           ; $e2cd: a9 00     
            STA $0678          ; $e2cf: 8d 78 06  
            PLA                ; $e2d2: 68        
            JSR __f8b2         ; $e2d3: 20 b2 f8  
            CMP $0600,x        ; $e2d6: dd 00 06  
            JSR __f8b5         ; $e2d9: 20 b5 f8  
            INY                ; $e2dc: c8        
            PHA                ; $e2dd: 48        
            LDA #$80           ; $e2de: a9 80     
            STA $0678          ; $e2e0: 8d 78 06  
            PLA                ; $e2e3: 68        
            CMP $0600,x        ; $e2e4: dd 00 06  
            JSR __f8bf         ; $e2e7: 20 bf f8  
            INY                ; $e2ea: c8        
            PHA                ; $e2eb: 48        
            LDA #$81           ; $e2ec: a9 81     
            STA $0678          ; $e2ee: 8d 78 06  
            PLA                ; $e2f1: 68        
            CMP $0600,x        ; $e2f2: dd 00 06  
            JSR __f8c9         ; $e2f5: 20 c9 f8  
            INY                ; $e2f8: c8        
            PHA                ; $e2f9: 48        
            LDA #$7f           ; $e2fa: a9 7f     
            STA $0678          ; $e2fc: 8d 78 06  
            PLA                ; $e2ff: 68        
            CMP $0600,x        ; $e300: dd 00 06  
            JSR __f8d3         ; $e303: 20 d3 f8  
            INY                ; $e306: c8        
            LDA #$40           ; $e307: a9 40     
            STA $0678          ; $e309: 8d 78 06  
            JSR __f931         ; $e30c: 20 31 f9  
            SBC $0600,x        ; $e30f: fd 00 06  
            JSR __f937         ; $e312: 20 37 f9  
            INY                ; $e315: c8        
            LDA #$3f           ; $e316: a9 3f     
            STA $0678          ; $e318: 8d 78 06  
            JSR __f947         ; $e31b: 20 47 f9  
            SBC $0600,x        ; $e31e: fd 00 06  
            JSR __f94c         ; $e321: 20 4c f9  
            INY                ; $e324: c8        
            LDA #$41           ; $e325: a9 41     
            STA $0678          ; $e327: 8d 78 06  
            JSR __f95c         ; $e32a: 20 5c f9  
            SBC $0600,x        ; $e32d: fd 00 06  
            JSR __f962         ; $e330: 20 62 f9  
            INY                ; $e333: c8        
            LDA #$00           ; $e334: a9 00     
            STA $0678          ; $e336: 8d 78 06  
            JSR __f972         ; $e339: 20 72 f9  
            SBC $0600,x        ; $e33c: fd 00 06  
            JSR __f976         ; $e33f: 20 76 f9  
            INY                ; $e342: c8        
            LDA #$7f           ; $e343: a9 7f     
            STA $0678          ; $e345: 8d 78 06  
            JSR __f980         ; $e348: 20 80 f9  
            SBC $0600,x        ; $e34b: fd 00 06  
            JSR __f984         ; $e34e: 20 84 f9  
            LDA #$aa           ; $e351: a9 aa     
            STA $0633          ; $e353: 8d 33 06  
            LDA #$bb           ; $e356: a9 bb     
            STA $0689          ; $e358: 8d 89 06  
            LDX #$00           ; $e35b: a2 00     
            LDY #$66           ; $e35d: a0 66     
            BIT $01            ; $e35f: 24 01     
            SEC                ; $e361: 38        
            LDA #$00           ; $e362: a9 00     
            LDA $0633,x        ; $e364: bd 33 06  
            BPL __e37b         ; $e367: 10 12     
            BEQ __e37b         ; $e369: f0 10     
            BVC __e37b         ; $e36b: 50 0e     
            BCC __e37b         ; $e36d: 90 0c     
            CPY #$66           ; $e36f: c0 66     
            BNE __e37b         ; $e371: d0 08     
            CPX #$00           ; $e373: e0 00     
            BNE __e37b         ; $e375: d0 04     
            CMP #$aa           ; $e377: c9 aa     
            BEQ __e37f         ; $e379: f0 04     
__e37b:     LDA #$6a           ; $e37b: a9 6a     
            STA $00            ; $e37d: 85 00     
__e37f:     LDX #$8a           ; $e37f: a2 8a     
            LDY #$66           ; $e381: a0 66     
            CLV                ; $e383: b8        
            CLC                ; $e384: 18        
            LDA #$00           ; $e385: a9 00     
            LDA $05ff,x        ; $e387: bd ff 05  
            BPL __e39e         ; $e38a: 10 12     
            BEQ __e39e         ; $e38c: f0 10     
            BVS __e39e         ; $e38e: 70 0e     
            BCS __e39e         ; $e390: b0 0c     
            CMP #$bb           ; $e392: c9 bb     
            BNE __e39e         ; $e394: d0 08     
            CPY #$66           ; $e396: c0 66     
            BNE __e39e         ; $e398: d0 04     
            CPX #$8a           ; $e39a: e0 8a     
            BEQ __e3a2         ; $e39c: f0 04     
__e39e:     LDA #$6b           ; $e39e: a9 6b     
            STA $00            ; $e3a0: 85 00     
__e3a2:     BIT $01            ; $e3a2: 24 01     
            SEC                ; $e3a4: 38        
            LDA #$44           ; $e3a5: a9 44     
            LDX #$00           ; $e3a7: a2 00     
            STA $0633,x        ; $e3a9: 9d 33 06  
            LDA $0633          ; $e3ac: ad 33 06  
            BCC __e3cb         ; $e3af: 90 1a     
            CMP #$44           ; $e3b1: c9 44     
            BNE __e3cb         ; $e3b3: d0 16     
            BVC __e3cb         ; $e3b5: 50 14     
            CLC                ; $e3b7: 18        
            CLV                ; $e3b8: b8        
            LDA #$99           ; $e3b9: a9 99     
            LDX #$80           ; $e3bb: a2 80     
            STA $0585,x        ; $e3bd: 9d 85 05  
            LDA $0605          ; $e3c0: ad 05 06  
            BCS __e3cb         ; $e3c3: b0 06     
            CMP #$99           ; $e3c5: c9 99     
            BNE __e3cb         ; $e3c7: d0 02     
            BVC __e3cf         ; $e3c9: 50 04     
__e3cb:     LDA #$6c           ; $e3cb: a9 6c     
            STA $00            ; $e3cd: 85 00     
__e3cf:     LDY #$6d           ; $e3cf: a0 6d     
            LDX #$6d           ; $e3d1: a2 6d     
            JSR __f990         ; $e3d3: 20 90 f9  
            STA $0600,x        ; $e3d6: 9d 00 06  
            LSR $0600,x        ; $e3d9: 5e 00 06  
            LDA $0600,x        ; $e3dc: bd 00 06  
            JSR __f99d         ; $e3df: 20 9d f9  
            INY                ; $e3e2: c8        
            STA $0600,x        ; $e3e3: 9d 00 06  
            LSR $0600,x        ; $e3e6: 5e 00 06  
            LDA $0600,x        ; $e3e9: bd 00 06  
            JSR __f9ad         ; $e3ec: 20 ad f9  
            INY                ; $e3ef: c8        
            JSR __f9bd         ; $e3f0: 20 bd f9  
            STA $0600,x        ; $e3f3: 9d 00 06  
            ASL $0600,x        ; $e3f6: 1e 00 06  
            LDA $0600,x        ; $e3f9: bd 00 06  
            JSR __f9c3         ; $e3fc: 20 c3 f9  
            INY                ; $e3ff: c8        
            STA $0600,x        ; $e400: 9d 00 06  
            ASL $0600,x        ; $e403: 1e 00 06  
            LDA $0600,x        ; $e406: bd 00 06  
            JSR __f9d4         ; $e409: 20 d4 f9  
            INY                ; $e40c: c8        
            JSR __f9e4         ; $e40d: 20 e4 f9  
            STA $0600,x        ; $e410: 9d 00 06  
            ROR $0600,x        ; $e413: 7e 00 06  
            LDA $0600,x        ; $e416: bd 00 06  
            JSR __f9ea         ; $e419: 20 ea f9  
            INY                ; $e41c: c8        
            STA $0600,x        ; $e41d: 9d 00 06  
            ROR $0600,x        ; $e420: 7e 00 06  
            LDA $0600,x        ; $e423: bd 00 06  
            JSR __f9fb         ; $e426: 20 fb f9  
            INY                ; $e429: c8        
            JSR __fa0a         ; $e42a: 20 0a fa  
            STA $0600,x        ; $e42d: 9d 00 06  
            ROL $0600,x        ; $e430: 3e 00 06  
            LDA $0600,x        ; $e433: bd 00 06  
            JSR __fa10         ; $e436: 20 10 fa  
            INY                ; $e439: c8        
            STA $0600,x        ; $e43a: 9d 00 06  
            ROL $0600,x        ; $e43d: 3e 00 06  
            LDA $0600,x        ; $e440: bd 00 06  
            JSR __fa21         ; $e443: 20 21 fa  
            LDA #$ff           ; $e446: a9 ff     
            STA $0600,x        ; $e448: 9d 00 06  
            STA $01            ; $e44b: 85 01     
            BIT $01            ; $e44d: 24 01     
            SEC                ; $e44f: 38        
            INC $0600,x        ; $e450: fe 00 06  
            BNE __e462         ; $e453: d0 0d     
            BMI __e462         ; $e455: 30 0b     
            BVC __e462         ; $e457: 50 09     
            BCC __e462         ; $e459: 90 07     
            LDA $0600,x        ; $e45b: bd 00 06  
            CMP #$00           ; $e45e: c9 00     
            BEQ __e466         ; $e460: f0 04     
__e462:     LDA #$75           ; $e462: a9 75     
            STA $00            ; $e464: 85 00     
__e466:     LDA #$7f           ; $e466: a9 7f     
            STA $0600,x        ; $e468: 9d 00 06  
            CLV                ; $e46b: b8        
            CLC                ; $e46c: 18        
            INC $0600,x        ; $e46d: fe 00 06  
            BEQ __e47f         ; $e470: f0 0d     
            BPL __e47f         ; $e472: 10 0b     
            BVS __e47f         ; $e474: 70 09     
            BCS __e47f         ; $e476: b0 07     
            LDA $0600,x        ; $e478: bd 00 06  
            CMP #$80           ; $e47b: c9 80     
            BEQ __e483         ; $e47d: f0 04     
__e47f:     LDA #$76           ; $e47f: a9 76     
            STA $00            ; $e481: 85 00     
__e483:     LDA #$00           ; $e483: a9 00     
            STA $0600,x        ; $e485: 9d 00 06  
            BIT $01            ; $e488: 24 01     
            SEC                ; $e48a: 38        
            DEC $0600,x        ; $e48b: de 00 06  
            BEQ __e49d         ; $e48e: f0 0d     
            BPL __e49d         ; $e490: 10 0b     
            BVC __e49d         ; $e492: 50 09     
            BCC __e49d         ; $e494: 90 07     
            LDA $0600,x        ; $e496: bd 00 06  
            CMP #$ff           ; $e499: c9 ff     
            BEQ __e4a1         ; $e49b: f0 04     
__e49d:     LDA #$77           ; $e49d: a9 77     
            STA $00            ; $e49f: 85 00     
__e4a1:     LDA #$80           ; $e4a1: a9 80     
            STA $0600,x        ; $e4a3: 9d 00 06  
            CLV                ; $e4a6: b8        
            CLC                ; $e4a7: 18        
            DEC $0600,x        ; $e4a8: de 00 06  
            BEQ __e4ba         ; $e4ab: f0 0d     
            BMI __e4ba         ; $e4ad: 30 0b     
            BVS __e4ba         ; $e4af: 70 09     
            BCS __e4ba         ; $e4b1: b0 07     
            LDA $0600,x        ; $e4b3: bd 00 06  
            CMP #$7f           ; $e4b6: c9 7f     
            BEQ __e4be         ; $e4b8: f0 04     
__e4ba:     LDA #$78           ; $e4ba: a9 78     
            STA $00            ; $e4bc: 85 00     
__e4be:     LDA #$01           ; $e4be: a9 01     
            STA $0600,x        ; $e4c0: 9d 00 06  
            DEC $0600,x        ; $e4c3: de 00 06  
            BEQ __e4cc         ; $e4c6: f0 04     
            LDA #$79           ; $e4c8: a9 79     
            STA $00            ; $e4ca: 85 00     
__e4cc:     LDA #$33           ; $e4cc: a9 33     
            STA $0678          ; $e4ce: 8d 78 06  
            LDA #$44           ; $e4d1: a9 44     
            LDY #$78           ; $e4d3: a0 78     
            LDX #$00           ; $e4d5: a2 00     
            SEC                ; $e4d7: 38        
            BIT $01            ; $e4d8: 24 01     
            LDX $0600,y        ; $e4da: be 00 06  
            BCC __e4f1         ; $e4dd: 90 12     
            BVC __e4f1         ; $e4df: 50 10     
            BMI __e4f1         ; $e4e1: 30 0e     
            BEQ __e4f1         ; $e4e3: f0 0c     
            CPX #$33           ; $e4e5: e0 33     
            BNE __e4f1         ; $e4e7: d0 08     
            CPY #$78           ; $e4e9: c0 78     
            BNE __e4f1         ; $e4eb: d0 04     
            CMP #$44           ; $e4ed: c9 44     
            BEQ __e4f5         ; $e4ef: f0 04     
__e4f1:     LDA #$7a           ; $e4f1: a9 7a     
            STA $00            ; $e4f3: 85 00     
__e4f5:     LDA #$97           ; $e4f5: a9 97     
            STA $067f          ; $e4f7: 8d 7f 06  
            LDA #$47           ; $e4fa: a9 47     
            LDY #$ff           ; $e4fc: a0 ff     
            LDX #$00           ; $e4fe: a2 00     
            CLC                ; $e500: 18        
            CLV                ; $e501: b8        
            LDX $0580,y        ; $e502: be 80 05  
            BCS __e519         ; $e505: b0 12     
            BVS __e519         ; $e507: 70 10     
            BPL __e519         ; $e509: 10 0e     
            BEQ __e519         ; $e50b: f0 0c     
            CPX #$97           ; $e50d: e0 97     
            BNE __e519         ; $e50f: d0 08     
            CPY #$ff           ; $e511: c0 ff     
            BNE __e519         ; $e513: d0 04     
            CMP #$47           ; $e515: c9 47     
            BEQ __e51d         ; $e517: f0 04     
__e519:     LDA #$7b           ; $e519: a9 7b     
            STA $00            ; $e51b: 85 00     
__e51d:     RTS                ; $e51d: 60        

;-------------------------------------------------------------------------------
__e51e:     LDA #$55           ; $e51e: a9 55     
            STA $0580          ; $e520: 8d 80 05  
            LDA #$aa           ; $e523: a9 aa     
            STA $0432          ; $e525: 8d 32 04  
            LDA #$80           ; $e528: a9 80     
            STA $43            ; $e52a: 85 43     
            LDA #$05           ; $e52c: a9 05     
            STA $44            ; $e52e: 85 44     
            LDA #$32           ; $e530: a9 32     
            STA $45            ; $e532: 85 45     
            LDA #$04           ; $e534: a9 04     
            STA $46            ; $e536: 85 46     
            LDX #$03           ; $e538: a2 03     
            LDY #$77           ; $e53a: a0 77     
            LDA #$ff           ; $e53c: a9 ff     
            STA $01            ; $e53e: 85 01     
            BIT $01            ; $e540: 24 01     
            SEC                ; $e542: 38        
            LDA #$00           ; $e543: a9 00     
            .hex a3 40         ; $e545: a3 40     Invalid Opcode - LAX ($40,x)
            NOP                ; $e547: ea        
            NOP                ; $e548: ea        
            NOP                ; $e549: ea        
            NOP                ; $e54a: ea        
            BEQ __e55f         ; $e54b: f0 12     
            BMI __e55f         ; $e54d: 30 10     
            BVC __e55f         ; $e54f: 50 0e     
            BCC __e55f         ; $e551: 90 0c     
            CMP #$55           ; $e553: c9 55     
            BNE __e55f         ; $e555: d0 08     
            CPX #$55           ; $e557: e0 55     
            BNE __e55f         ; $e559: d0 04     
            CPY #$77           ; $e55b: c0 77     
            BEQ __e563         ; $e55d: f0 04     
__e55f:     LDA #$7c           ; $e55f: a9 7c     
            STA $00            ; $e561: 85 00     
__e563:     LDX #$05           ; $e563: a2 05     
            LDY #$33           ; $e565: a0 33     
            CLV                ; $e567: b8        
            CLC                ; $e568: 18        
            LDA #$00           ; $e569: a9 00     
            .hex a3 40         ; $e56b: a3 40     Invalid Opcode - LAX ($40,x)
            NOP                ; $e56d: ea        
            NOP                ; $e56e: ea        
            NOP                ; $e56f: ea        
            NOP                ; $e570: ea        
            BEQ __e585         ; $e571: f0 12     
            BPL __e585         ; $e573: 10 10     
            BVS __e585         ; $e575: 70 0e     
            BCS __e585         ; $e577: b0 0c     
            CMP #$aa           ; $e579: c9 aa     
            BNE __e585         ; $e57b: d0 08     
            CPX #$aa           ; $e57d: e0 aa     
            BNE __e585         ; $e57f: d0 04     
            CPY #$33           ; $e581: c0 33     
            BEQ __e589         ; $e583: f0 04     
__e585:     LDA #$7d           ; $e585: a9 7d     
            STA $00            ; $e587: 85 00     
__e589:     LDA #$87           ; $e589: a9 87     
            STA $67            ; $e58b: 85 67     
            LDA #$32           ; $e58d: a9 32     
            STA $68            ; $e58f: 85 68     
            LDY #$57           ; $e591: a0 57     
            BIT $01            ; $e593: 24 01     
            SEC                ; $e595: 38        
            LDA #$00           ; $e596: a9 00     
            .hex a7 67         ; $e598: a7 67     Invalid Opcode - LAX $67
            NOP                ; $e59a: ea        
            NOP                ; $e59b: ea        
            NOP                ; $e59c: ea        
            NOP                ; $e59d: ea        
            BEQ __e5b2         ; $e59e: f0 12     
            BPL __e5b2         ; $e5a0: 10 10     
            BVC __e5b2         ; $e5a2: 50 0e     
            BCC __e5b2         ; $e5a4: 90 0c     
            CMP #$87           ; $e5a6: c9 87     
            BNE __e5b2         ; $e5a8: d0 08     
            CPX #$87           ; $e5aa: e0 87     
            BNE __e5b2         ; $e5ac: d0 04     
            CPY #$57           ; $e5ae: c0 57     
            BEQ __e5b6         ; $e5b0: f0 04     
__e5b2:     LDA #$7e           ; $e5b2: a9 7e     
            STA $00            ; $e5b4: 85 00     
__e5b6:     LDY #$53           ; $e5b6: a0 53     
            CLV                ; $e5b8: b8        
            CLC                ; $e5b9: 18        
            LDA #$00           ; $e5ba: a9 00     
            .hex a7 68         ; $e5bc: a7 68     Invalid Opcode - LAX $68
            NOP                ; $e5be: ea        
            NOP                ; $e5bf: ea        
            NOP                ; $e5c0: ea        
            NOP                ; $e5c1: ea        
            BEQ __e5d6         ; $e5c2: f0 12     
            BMI __e5d6         ; $e5c4: 30 10     
            BVS __e5d6         ; $e5c6: 70 0e     
            BCS __e5d6         ; $e5c8: b0 0c     
            CMP #$32           ; $e5ca: c9 32     
            BNE __e5d6         ; $e5cc: d0 08     
            CPX #$32           ; $e5ce: e0 32     
            BNE __e5d6         ; $e5d0: d0 04     
            CPY #$53           ; $e5d2: c0 53     
            BEQ __e5da         ; $e5d4: f0 04     
__e5d6:     LDA #$7f           ; $e5d6: a9 7f     
            STA $00            ; $e5d8: 85 00     
__e5da:     LDA #$87           ; $e5da: a9 87     
            STA $0577          ; $e5dc: 8d 77 05  
            LDA #$32           ; $e5df: a9 32     
            STA $0578          ; $e5e1: 8d 78 05  
            LDY #$57           ; $e5e4: a0 57     
            BIT $01            ; $e5e6: 24 01     
            SEC                ; $e5e8: 38        
            LDA #$00           ; $e5e9: a9 00     
            .hex af 77 05      ; $e5eb: af 77 05  Invalid Opcode - LAX $0577
            NOP                ; $e5ee: ea        
            NOP                ; $e5ef: ea        
            NOP                ; $e5f0: ea        
            NOP                ; $e5f1: ea        
            BEQ __e606         ; $e5f2: f0 12     
            BPL __e606         ; $e5f4: 10 10     
            BVC __e606         ; $e5f6: 50 0e     
            BCC __e606         ; $e5f8: 90 0c     
            CMP #$87           ; $e5fa: c9 87     
            BNE __e606         ; $e5fc: d0 08     
            CPX #$87           ; $e5fe: e0 87     
            BNE __e606         ; $e600: d0 04     
            CPY #$57           ; $e602: c0 57     
            BEQ __e60a         ; $e604: f0 04     
__e606:     LDA #$80           ; $e606: a9 80     
            STA $00            ; $e608: 85 00     
__e60a:     LDY #$53           ; $e60a: a0 53     
            CLV                ; $e60c: b8        
            CLC                ; $e60d: 18        
            LDA #$00           ; $e60e: a9 00     
            .hex af 78 05      ; $e610: af 78 05  Invalid Opcode - LAX $0578
            NOP                ; $e613: ea        
            NOP                ; $e614: ea        
            NOP                ; $e615: ea        
            NOP                ; $e616: ea        
            BEQ __e62b         ; $e617: f0 12     
            BMI __e62b         ; $e619: 30 10     
            BVS __e62b         ; $e61b: 70 0e     
            BCS __e62b         ; $e61d: b0 0c     
            CMP #$32           ; $e61f: c9 32     
            BNE __e62b         ; $e621: d0 08     
            CPX #$32           ; $e623: e0 32     
            BNE __e62b         ; $e625: d0 04     
            CPY #$53           ; $e627: c0 53     
            BEQ __e62f         ; $e629: f0 04     
__e62b:     LDA #$81           ; $e62b: a9 81     
            STA $00            ; $e62d: 85 00     
__e62f:     LDA #$ff           ; $e62f: a9 ff     
            STA $43            ; $e631: 85 43     
            LDA #$04           ; $e633: a9 04     
            STA $44            ; $e635: 85 44     
            LDA #$32           ; $e637: a9 32     
            STA $45            ; $e639: 85 45     
            LDA #$04           ; $e63b: a9 04     
            STA $46            ; $e63d: 85 46     
            LDA #$55           ; $e63f: a9 55     
            STA $0580          ; $e641: 8d 80 05  
            LDA #$aa           ; $e644: a9 aa     
            STA $0432          ; $e646: 8d 32 04  
            LDX #$03           ; $e649: a2 03     
            LDY #$81           ; $e64b: a0 81     
            BIT $01            ; $e64d: 24 01     
            SEC                ; $e64f: 38        
            LDA #$00           ; $e650: a9 00     
            .hex b3 43         ; $e652: b3 43     Invalid Opcode - LAX ($43),y
            NOP                ; $e654: ea        
            NOP                ; $e655: ea        
            NOP                ; $e656: ea        
            NOP                ; $e657: ea        
            BEQ __e66c         ; $e658: f0 12     
            BMI __e66c         ; $e65a: 30 10     
            BVC __e66c         ; $e65c: 50 0e     
            BCC __e66c         ; $e65e: 90 0c     
            CMP #$55           ; $e660: c9 55     
            BNE __e66c         ; $e662: d0 08     
            CPX #$55           ; $e664: e0 55     
            BNE __e66c         ; $e666: d0 04     
            CPY #$81           ; $e668: c0 81     
            BEQ __e670         ; $e66a: f0 04     
__e66c:     LDA #$82           ; $e66c: a9 82     
            STA $00            ; $e66e: 85 00     
__e670:     LDX #$05           ; $e670: a2 05     
            LDY #$00           ; $e672: a0 00     
            CLV                ; $e674: b8        
            CLC                ; $e675: 18        
            LDA #$00           ; $e676: a9 00     
            .hex b3 45         ; $e678: b3 45     Invalid Opcode - LAX ($45),y
            NOP                ; $e67a: ea        
            NOP                ; $e67b: ea        
            NOP                ; $e67c: ea        
            NOP                ; $e67d: ea        
            BEQ __e692         ; $e67e: f0 12     
            BPL __e692         ; $e680: 10 10     
            BVS __e692         ; $e682: 70 0e     
            BCS __e692         ; $e684: b0 0c     
            CMP #$aa           ; $e686: c9 aa     
            BNE __e692         ; $e688: d0 08     
            CPX #$aa           ; $e68a: e0 aa     
            BNE __e692         ; $e68c: d0 04     
            CPY #$00           ; $e68e: c0 00     
            BEQ __e696         ; $e690: f0 04     
__e692:     LDA #$83           ; $e692: a9 83     
            STA $00            ; $e694: 85 00     
__e696:     LDA #$87           ; $e696: a9 87     
            STA $67            ; $e698: 85 67     
            LDA #$32           ; $e69a: a9 32     
            STA $68            ; $e69c: 85 68     
            LDY #$57           ; $e69e: a0 57     
            BIT $01            ; $e6a0: 24 01     
            SEC                ; $e6a2: 38        
            LDA #$00           ; $e6a3: a9 00     
            .hex b7 10         ; $e6a5: b7 10     Invalid Opcode - LAX $10,y
            NOP                ; $e6a7: ea        
            NOP                ; $e6a8: ea        
            NOP                ; $e6a9: ea        
            NOP                ; $e6aa: ea        
            BEQ __e6bf         ; $e6ab: f0 12     
            BPL __e6bf         ; $e6ad: 10 10     
            BVC __e6bf         ; $e6af: 50 0e     
            BCC __e6bf         ; $e6b1: 90 0c     
            CMP #$87           ; $e6b3: c9 87     
            BNE __e6bf         ; $e6b5: d0 08     
            CPX #$87           ; $e6b7: e0 87     
            BNE __e6bf         ; $e6b9: d0 04     
            CPY #$57           ; $e6bb: c0 57     
            BEQ __e6c3         ; $e6bd: f0 04     
__e6bf:     LDA #$84           ; $e6bf: a9 84     
            STA $00            ; $e6c1: 85 00     
__e6c3:     LDY #$ff           ; $e6c3: a0 ff     
            CLV                ; $e6c5: b8        
            CLC                ; $e6c6: 18        
            LDA #$00           ; $e6c7: a9 00     
            .hex b7 69         ; $e6c9: b7 69     Invalid Opcode - LAX $69,y
            NOP                ; $e6cb: ea        
            NOP                ; $e6cc: ea        
            NOP                ; $e6cd: ea        
            NOP                ; $e6ce: ea        
            BEQ __e6e3         ; $e6cf: f0 12     
            BMI __e6e3         ; $e6d1: 30 10     
            BVS __e6e3         ; $e6d3: 70 0e     
            BCS __e6e3         ; $e6d5: b0 0c     
            CMP #$32           ; $e6d7: c9 32     
            BNE __e6e3         ; $e6d9: d0 08     
            CPX #$32           ; $e6db: e0 32     
            BNE __e6e3         ; $e6dd: d0 04     
            .hex c0            ; $e6df: c0        Suspected data
__e6e0:     .hex ff f0 04      ; $e6e0: ff f0 04  Invalid Opcode - ISC $04f0,x
__e6e3:     LDA #$85           ; $e6e3: a9 85     
            STA $00            ; $e6e5: 85 00     
            LDA #$87           ; $e6e7: a9 87     
            STA $0587          ; $e6e9: 8d 87 05  
            LDA #$32           ; $e6ec: a9 32     
            STA $0588          ; $e6ee: 8d 88 05  
            LDY #$30           ; $e6f1: a0 30     
            BIT $01            ; $e6f3: 24 01     
            SEC                ; $e6f5: 38        
            LDA #$00           ; $e6f6: a9 00     
            .hex bf 57 05      ; $e6f8: bf 57 05  Invalid Opcode - LAX $0557,y
            NOP                ; $e6fb: ea        
            NOP                ; $e6fc: ea        
            NOP                ; $e6fd: ea        
            NOP                ; $e6fe: ea        
            BEQ __e713         ; $e6ff: f0 12     
            BPL __e713         ; $e701: 10 10     
            BVC __e713         ; $e703: 50 0e     
            BCC __e713         ; $e705: 90 0c     
            CMP #$87           ; $e707: c9 87     
            BNE __e713         ; $e709: d0 08     
            CPX #$87           ; $e70b: e0 87     
            BNE __e70f         ; $e70d: d0 00     
__e70f:     CPY #$30           ; $e70f: c0 30     
            BEQ __e717         ; $e711: f0 04     
__e713:     LDA #$86           ; $e713: a9 86     
            STA $00            ; $e715: 85 00     
__e717:     LDY #$40           ; $e717: a0 40     
            CLV                ; $e719: b8        
            CLC                ; $e71a: 18        
            LDA #$00           ; $e71b: a9 00     
            .hex bf 48 05      ; $e71d: bf 48 05  Invalid Opcode - LAX $0548,y
            NOP                ; $e720: ea        
            NOP                ; $e721: ea        
            NOP                ; $e722: ea        
            NOP                ; $e723: ea        
            BEQ __e738         ; $e724: f0 12     
            BMI __e738         ; $e726: 30 10     
            BVS __e738         ; $e728: 70 0e     
            BCS __e738         ; $e72a: b0 0c     
            CMP #$32           ; $e72c: c9 32     
            BNE __e738         ; $e72e: d0 08     
            CPX #$32           ; $e730: e0 32     
            BNE __e738         ; $e732: d0 04     
            CPY #$40           ; $e734: c0 40     
            BEQ __e73c         ; $e736: f0 04     
__e738:     LDA #$87           ; $e738: a9 87     
            STA $00            ; $e73a: 85 00     
__e73c:     RTS                ; $e73c: 60        

;-------------------------------------------------------------------------------
__e73d:     LDA #$c0           ; $e73d: a9 c0     
            STA $01            ; $e73f: 85 01     
            LDA #$00           ; $e741: a9 00     
            STA $0489          ; $e743: 8d 89 04  
            LDA #$89           ; $e746: a9 89     
            STA $60            ; $e748: 85 60     
            LDA #$04           ; $e74a: a9 04     
            STA $61            ; $e74c: 85 61     
            LDY #$44           ; $e74e: a0 44     
            LDX #$17           ; $e750: a2 17     
            LDA #$3e           ; $e752: a9 3e     
            BIT $01            ; $e754: 24 01     
            CLC                ; $e756: 18        
            .hex 83 49         ; $e757: 83 49     Invalid Opcode - SAX ($49,x)
            NOP                ; $e759: ea        
            NOP                ; $e75a: ea        
            NOP                ; $e75b: ea        
            NOP                ; $e75c: ea        
            BNE __e778         ; $e75d: d0 19     
            BCS __e778         ; $e75f: b0 17     
            BVC __e778         ; $e761: 50 15     
            BPL __e778         ; $e763: 10 13     
            CMP #$3e           ; $e765: c9 3e     
            BNE __e778         ; $e767: d0 0f     
            CPY #$44           ; $e769: c0 44     
            BNE __e778         ; $e76b: d0 0b     
            CPX #$17           ; $e76d: e0 17     
            BNE __e778         ; $e76f: d0 07     
            LDA $0489          ; $e771: ad 89 04  
            CMP #$16           ; $e774: c9 16     
            BEQ __e77c         ; $e776: f0 04     
__e778:     LDA #$88           ; $e778: a9 88     
            STA $00            ; $e77a: 85 00     
__e77c:     LDY #$44           ; $e77c: a0 44     
            LDX #$7a           ; $e77e: a2 7a     
            LDA #$66           ; $e780: a9 66     
            SEC                ; $e782: 38        
            CLV                ; $e783: b8        
            .hex 83 e6         ; $e784: 83 e6     Invalid Opcode - SAX ($e6,x)
            NOP                ; $e786: ea        
            NOP                ; $e787: ea        
            NOP                ; $e788: ea        
            NOP                ; $e789: ea        
            BEQ __e7a5         ; $e78a: f0 19     
            BCC __e7a5         ; $e78c: 90 17     
            BVS __e7a5         ; $e78e: 70 15     
            BMI __e7a5         ; $e790: 30 13     
            CMP #$66           ; $e792: c9 66     
            BNE __e7a5         ; $e794: d0 0f     
            CPY #$44           ; $e796: c0 44     
            BNE __e7a5         ; $e798: d0 0b     
            CPX #$7a           ; $e79a: e0 7a     
            BNE __e7a5         ; $e79c: d0 07     
            LDA $0489          ; $e79e: ad 89 04  
            CMP #$62           ; $e7a1: c9 62     
            BEQ __e7a9         ; $e7a3: f0 04     
__e7a5:     LDA #$89           ; $e7a5: a9 89     
            STA $00            ; $e7a7: 85 00     
__e7a9:     LDA #$ff           ; $e7a9: a9 ff     
            STA $49            ; $e7ab: 85 49     
            LDY #$44           ; $e7ad: a0 44     
            LDX #$aa           ; $e7af: a2 aa     
            LDA #$55           ; $e7b1: a9 55     
            BIT $01            ; $e7b3: 24 01     
            CLC                ; $e7b5: 18        
            .hex 87 49         ; $e7b6: 87 49     Invalid Opcode - SAX $49
            NOP                ; $e7b8: ea        
            NOP                ; $e7b9: ea        
            NOP                ; $e7ba: ea        
            NOP                ; $e7bb: ea        
            BEQ __e7d6         ; $e7bc: f0 18     
            BCS __e7d6         ; $e7be: b0 16     
            BVC __e7d6         ; $e7c0: 50 14     
            BPL __e7d6         ; $e7c2: 10 12     
            CMP #$55           ; $e7c4: c9 55     
            BNE __e7d6         ; $e7c6: d0 0e     
            CPY #$44           ; $e7c8: c0 44     
            BNE __e7d6         ; $e7ca: d0 0a     
            CPX #$aa           ; $e7cc: e0 aa     
            BNE __e7d6         ; $e7ce: d0 06     
            LDA $49            ; $e7d0: a5 49     
            CMP #$00           ; $e7d2: c9 00     
            BEQ __e7da         ; $e7d4: f0 04     
__e7d6:     LDA #$8a           ; $e7d6: a9 8a     
            STA $00            ; $e7d8: 85 00     
__e7da:     LDA #$00           ; $e7da: a9 00     
            STA $56            ; $e7dc: 85 56     
            LDY #$58           ; $e7de: a0 58     
            LDX #$ef           ; $e7e0: a2 ef     
            LDA #$66           ; $e7e2: a9 66     
            SEC                ; $e7e4: 38        
            CLV                ; $e7e5: b8        
            .hex 87 56         ; $e7e6: 87 56     Invalid Opcode - SAX $56
            NOP                ; $e7e8: ea        
            NOP                ; $e7e9: ea        
            NOP                ; $e7ea: ea        
            NOP                ; $e7eb: ea        
            BEQ __e806         ; $e7ec: f0 18     
            BCC __e806         ; $e7ee: 90 16     
            BVS __e806         ; $e7f0: 70 14     
            BMI __e806         ; $e7f2: 30 12     
            CMP #$66           ; $e7f4: c9 66     
            BNE __e806         ; $e7f6: d0 0e     
            CPY #$58           ; $e7f8: c0 58     
            BNE __e806         ; $e7fa: d0 0a     
            CPX #$ef           ; $e7fc: e0 ef     
            BNE __e806         ; $e7fe: d0 06     
            LDA $56            ; $e800: a5 56     
            CMP #$66           ; $e802: c9 66     
            BEQ __e80a         ; $e804: f0 04     
__e806:     LDA #$8b           ; $e806: a9 8b     
            STA $00            ; $e808: 85 00     
__e80a:     LDA #$ff           ; $e80a: a9 ff     
            STA $0549          ; $e80c: 8d 49 05  
            LDY #$e5           ; $e80f: a0 e5     
            LDX #$af           ; $e811: a2 af     
            LDA #$f5           ; $e813: a9 f5     
            BIT $01            ; $e815: 24 01     
            CLC                ; $e817: 18        
            .hex 8f 49 05      ; $e818: 8f 49 05  Invalid Opcode - SAX $0549
            NOP                ; $e81b: ea        
            NOP                ; $e81c: ea        
            NOP                ; $e81d: ea        
            NOP                ; $e81e: ea        
            BEQ __e83a         ; $e81f: f0 19     
            BCS __e83a         ; $e821: b0 17     
            BVC __e83a         ; $e823: 50 15     
            BPL __e83a         ; $e825: 10 13     
            CMP #$f5           ; $e827: c9 f5     
            BNE __e83a         ; $e829: d0 0f     
            CPY #$e5           ; $e82b: c0 e5     
            BNE __e83a         ; $e82d: d0 0b     
            CPX #$af           ; $e82f: e0 af     
            BNE __e83a         ; $e831: d0 07     
            LDA $0549          ; $e833: ad 49 05  
            CMP #$a5           ; $e836: c9 a5     
            BEQ __e83e         ; $e838: f0 04     
__e83a:     LDA #$8c           ; $e83a: a9 8c     
            STA $00            ; $e83c: 85 00     
__e83e:     LDA #$00           ; $e83e: a9 00     
            STA $0556          ; $e840: 8d 56 05  
            LDY #$58           ; $e843: a0 58     
            LDX #$b3           ; $e845: a2 b3     
            LDA #$97           ; $e847: a9 97     
            SEC                ; $e849: 38        
            CLV                ; $e84a: b8        
            .hex 8f 56 05      ; $e84b: 8f 56 05  Invalid Opcode - SAX $0556
            NOP                ; $e84e: ea        
            NOP                ; $e84f: ea        
            NOP                ; $e850: ea        
            NOP                ; $e851: ea        
            BEQ __e86d         ; $e852: f0 19     
            BCC __e86d         ; $e854: 90 17     
            BVS __e86d         ; $e856: 70 15     
            BPL __e86d         ; $e858: 10 13     
            CMP #$97           ; $e85a: c9 97     
            BNE __e86d         ; $e85c: d0 0f     
            CPY #$58           ; $e85e: c0 58     
            BNE __e86d         ; $e860: d0 0b     
            CPX #$b3           ; $e862: e0 b3     
            BNE __e86d         ; $e864: d0 07     
            LDA $0556          ; $e866: ad 56 05  
            CMP #$93           ; $e869: c9 93     
            BEQ __e871         ; $e86b: f0 04     
__e86d:     LDA #$8d           ; $e86d: a9 8d     
            STA $00            ; $e86f: 85 00     
__e871:     LDA #$ff           ; $e871: a9 ff     
            STA $49            ; $e873: 85 49     
            LDY #$ff           ; $e875: a0 ff     
            LDX #$aa           ; $e877: a2 aa     
            LDA #$55           ; $e879: a9 55     
            BIT $01            ; $e87b: 24 01     
            CLC                ; $e87d: 18        
            .hex 97 4a         ; $e87e: 97 4a     Invalid Opcode - SAX $4a,y
            NOP                ; $e880: ea        
            NOP                ; $e881: ea        
            NOP                ; $e882: ea        
            NOP                ; $e883: ea        
            BEQ __e89e         ; $e884: f0 18     
            BCS __e89e         ; $e886: b0 16     
            BVC __e89e         ; $e888: 50 14     
            BPL __e89e         ; $e88a: 10 12     
            CMP #$55           ; $e88c: c9 55     
            BNE __e89e         ; $e88e: d0 0e     
            CPY #$ff           ; $e890: c0 ff     
            BNE __e89e         ; $e892: d0 0a     
            CPX #$aa           ; $e894: e0 aa     
            BNE __e89e         ; $e896: d0 06     
            LDA $49            ; $e898: a5 49     
            CMP #$00           ; $e89a: c9 00     
            BEQ __e8a2         ; $e89c: f0 04     
__e89e:     LDA #$8e           ; $e89e: a9 8e     
            STA $00            ; $e8a0: 85 00     
__e8a2:     LDA #$00           ; $e8a2: a9 00     
            STA $56            ; $e8a4: 85 56     
            LDY #$06           ; $e8a6: a0 06     
            LDX #$ef           ; $e8a8: a2 ef     
            LDA #$66           ; $e8aa: a9 66     
            SEC                ; $e8ac: 38        
            CLV                ; $e8ad: b8        
            .hex 97 50         ; $e8ae: 97 50     Invalid Opcode - SAX $50,y
            NOP                ; $e8b0: ea        
            NOP                ; $e8b1: ea        
            NOP                ; $e8b2: ea        
            NOP                ; $e8b3: ea        
            BEQ __e8ce         ; $e8b4: f0 18     
            BCC __e8ce         ; $e8b6: 90 16     
            BVS __e8ce         ; $e8b8: 70 14     
            BMI __e8ce         ; $e8ba: 30 12     
            CMP #$66           ; $e8bc: c9 66     
            BNE __e8ce         ; $e8be: d0 0e     
            CPY #$06           ; $e8c0: c0 06     
            BNE __e8ce         ; $e8c2: d0 0a     
            CPX #$ef           ; $e8c4: e0 ef     
            BNE __e8ce         ; $e8c6: d0 06     
            LDA $56            ; $e8c8: a5 56     
            CMP #$66           ; $e8ca: c9 66     
            BEQ __e8d2         ; $e8cc: f0 04     
__e8ce:     LDA #$8f           ; $e8ce: a9 8f     
            STA $00            ; $e8d0: 85 00     
__e8d2:     RTS                ; $e8d2: 60        

;-------------------------------------------------------------------------------
__e8d3:     LDY #$90           ; $e8d3: a0 90     
            JSR __f931         ; $e8d5: 20 31 f9  
            .hex eb 40         ; $e8d8: eb 40     Invalid Opcode - SBC #$40
            NOP                ; $e8da: ea        
            NOP                ; $e8db: ea        
            NOP                ; $e8dc: ea        
            NOP                ; $e8dd: ea        
            JSR __f937         ; $e8de: 20 37 f9  
            INY                ; $e8e1: c8        
            JSR __f947         ; $e8e2: 20 47 f9  
            .hex eb 3f         ; $e8e5: eb 3f     Invalid Opcode - SBC #$3f
            NOP                ; $e8e7: ea        
            NOP                ; $e8e8: ea        
            NOP                ; $e8e9: ea        
            NOP                ; $e8ea: ea        
            JSR __f94c         ; $e8eb: 20 4c f9  
            INY                ; $e8ee: c8        
            JSR __f95c         ; $e8ef: 20 5c f9  
            .hex eb 41         ; $e8f2: eb 41     Invalid Opcode - SBC #$41
            NOP                ; $e8f4: ea        
            NOP                ; $e8f5: ea        
            NOP                ; $e8f6: ea        
            NOP                ; $e8f7: ea        
            JSR __f962         ; $e8f8: 20 62 f9  
            INY                ; $e8fb: c8        
            JSR __f972         ; $e8fc: 20 72 f9  
            .hex eb 00         ; $e8ff: eb 00     Invalid Opcode - SBC #$00
            NOP                ; $e901: ea        
            NOP                ; $e902: ea        
            NOP                ; $e903: ea        
            NOP                ; $e904: ea        
            JSR __f976         ; $e905: 20 76 f9  
            INY                ; $e908: c8        
            JSR __f980         ; $e909: 20 80 f9  
            .hex eb 7f         ; $e90c: eb 7f     Invalid Opcode - SBC #$7f
            NOP                ; $e90e: ea        
            NOP                ; $e90f: ea        
            NOP                ; $e910: ea        
            NOP                ; $e911: ea        
            JSR __f984         ; $e912: 20 84 f9  
            RTS                ; $e915: 60        

;-------------------------------------------------------------------------------
__e916:     LDA #$ff           ; $e916: a9 ff     
            STA $01            ; $e918: 85 01     
            LDY #$95           ; $e91a: a0 95     
            LDX #$02           ; $e91c: a2 02     
            LDA #$47           ; $e91e: a9 47     
            STA $47            ; $e920: 85 47     
            LDA #$06           ; $e922: a9 06     
            STA $48            ; $e924: 85 48     
            LDA #$eb           ; $e926: a9 eb     
            STA $0647          ; $e928: 8d 47 06  
            JSR __fa31         ; $e92b: 20 31 fa  
            .hex c3 45         ; $e92e: c3 45     Invalid Opcode - DCP ($45,x)
            NOP                ; $e930: ea        
            NOP                ; $e931: ea        
            NOP                ; $e932: ea        
            NOP                ; $e933: ea        
            JSR __fa37         ; $e934: 20 37 fa  
            LDA $0647          ; $e937: ad 47 06  
            CMP #$ea           ; $e93a: c9 ea     
            BEQ __e940         ; $e93c: f0 02     
            STY $00            ; $e93e: 84 00     
__e940:     INY                ; $e940: c8        
            LDA #$00           ; $e941: a9 00     
            STA $0647          ; $e943: 8d 47 06  
            JSR __fa42         ; $e946: 20 42 fa  
            .hex c3 45         ; $e949: c3 45     Invalid Opcode - DCP ($45,x)
            NOP                ; $e94b: ea        
            NOP                ; $e94c: ea        
            NOP                ; $e94d: ea        
            NOP                ; $e94e: ea        
            JSR __fa47         ; $e94f: 20 47 fa  
            LDA $0647          ; $e952: ad 47 06  
            CMP #$ff           ; $e955: c9 ff     
            BEQ __e95b         ; $e957: f0 02     
            STY $00            ; $e959: 84 00     
__e95b:     INY                ; $e95b: c8        
            LDA #$37           ; $e95c: a9 37     
            STA $0647          ; $e95e: 8d 47 06  
            JSR __fa54         ; $e961: 20 54 fa  
            .hex c3 45         ; $e964: c3 45     Invalid Opcode - DCP ($45,x)
            NOP                ; $e966: ea        
            NOP                ; $e967: ea        
            NOP                ; $e968: ea        
            NOP                ; $e969: ea        
            JSR __fa59         ; $e96a: 20 59 fa  
            LDA $0647          ; $e96d: ad 47 06  
            CMP #$36           ; $e970: c9 36     
            BEQ __e976         ; $e972: f0 02     
            STY $00            ; $e974: 84 00     
__e976:     INY                ; $e976: c8        
            LDA #$eb           ; $e977: a9 eb     
            STA $47            ; $e979: 85 47     
            JSR __fa31         ; $e97b: 20 31 fa  
            .hex c7 47         ; $e97e: c7 47     Invalid Opcode - DCP $47
            NOP                ; $e980: ea        
            NOP                ; $e981: ea        
            NOP                ; $e982: ea        
            NOP                ; $e983: ea        
            JSR __fa37         ; $e984: 20 37 fa  
            LDA $47            ; $e987: a5 47     
            CMP #$ea           ; $e989: c9 ea     
            BEQ __e98f         ; $e98b: f0 02     
            STY $00            ; $e98d: 84 00     
__e98f:     INY                ; $e98f: c8        
            LDA #$00           ; $e990: a9 00     
            STA $47            ; $e992: 85 47     
            JSR __fa42         ; $e994: 20 42 fa  
            .hex c7 47         ; $e997: c7 47     Invalid Opcode - DCP $47
            NOP                ; $e999: ea        
            NOP                ; $e99a: ea        
            NOP                ; $e99b: ea        
            NOP                ; $e99c: ea        
            JSR __fa47         ; $e99d: 20 47 fa  
            LDA $47            ; $e9a0: a5 47     
            CMP #$ff           ; $e9a2: c9 ff     
            BEQ __e9a8         ; $e9a4: f0 02     
            STY $00            ; $e9a6: 84 00     
__e9a8:     INY                ; $e9a8: c8        
            LDA #$37           ; $e9a9: a9 37     
            STA $47            ; $e9ab: 85 47     
            JSR __fa54         ; $e9ad: 20 54 fa  
            .hex c7 47         ; $e9b0: c7 47     Invalid Opcode - DCP $47
            NOP                ; $e9b2: ea        
            NOP                ; $e9b3: ea        
            NOP                ; $e9b4: ea        
            NOP                ; $e9b5: ea        
            JSR __fa59         ; $e9b6: 20 59 fa  
            LDA $47            ; $e9b9: a5 47     
            CMP #$36           ; $e9bb: c9 36     
            BEQ __e9c1         ; $e9bd: f0 02     
            STY $00            ; $e9bf: 84 00     
__e9c1:     INY                ; $e9c1: c8        
            LDA #$eb           ; $e9c2: a9 eb     
            STA $0647          ; $e9c4: 8d 47 06  
            JSR __fa31         ; $e9c7: 20 31 fa  
            .hex cf 47 06      ; $e9ca: cf 47 06  Invalid Opcode - DCP $0647
            NOP                ; $e9cd: ea        
            NOP                ; $e9ce: ea        
            NOP                ; $e9cf: ea        
            NOP                ; $e9d0: ea        
            JSR __fa37         ; $e9d1: 20 37 fa  
            LDA $0647          ; $e9d4: ad 47 06  
            CMP #$ea           ; $e9d7: c9 ea     
            BEQ __e9dd         ; $e9d9: f0 02     
            STY $00            ; $e9db: 84 00     
__e9dd:     INY                ; $e9dd: c8        
            LDA #$00           ; $e9de: a9 00     
            STA $0647          ; $e9e0: 8d 47 06  
            JSR __fa42         ; $e9e3: 20 42 fa  
            .hex cf 47 06      ; $e9e6: cf 47 06  Invalid Opcode - DCP $0647
            NOP                ; $e9e9: ea        
            NOP                ; $e9ea: ea        
            NOP                ; $e9eb: ea        
            NOP                ; $e9ec: ea        
            JSR __fa47         ; $e9ed: 20 47 fa  
            LDA $0647          ; $e9f0: ad 47 06  
            CMP #$ff           ; $e9f3: c9 ff     
            BEQ __e9f9         ; $e9f5: f0 02     
            STY $00            ; $e9f7: 84 00     
__e9f9:     INY                ; $e9f9: c8        
            LDA #$37           ; $e9fa: a9 37     
            STA $0647          ; $e9fc: 8d 47 06  
            JSR __fa54         ; $e9ff: 20 54 fa  
            .hex cf 47 06      ; $ea02: cf 47 06  Invalid Opcode - DCP $0647
            NOP                ; $ea05: ea        
            NOP                ; $ea06: ea        
            NOP                ; $ea07: ea        
            NOP                ; $ea08: ea        
            JSR __fa59         ; $ea09: 20 59 fa  
            LDA $0647          ; $ea0c: ad 47 06  
            CMP #$36           ; $ea0f: c9 36     
            BEQ __ea15         ; $ea11: f0 02     
            STY $00            ; $ea13: 84 00     
__ea15:     LDA #$eb           ; $ea15: a9 eb     
            STA $0647          ; $ea17: 8d 47 06  
            LDA #$48           ; $ea1a: a9 48     
            STA $45            ; $ea1c: 85 45     
            LDA #$05           ; $ea1e: a9 05     
            STA $46            ; $ea20: 85 46     
            LDY #$ff           ; $ea22: a0 ff     
            JSR __fa31         ; $ea24: 20 31 fa  
            .hex d3 45         ; $ea27: d3 45     Invalid Opcode - DCP ($45),y
            NOP                ; $ea29: ea        
            NOP                ; $ea2a: ea        
            PHP                ; $ea2b: 08        
            PHA                ; $ea2c: 48        
            LDY #$9e           ; $ea2d: a0 9e     
            PLA                ; $ea2f: 68        
            PLP                ; $ea30: 28        
            JSR __fa37         ; $ea31: 20 37 fa  
            LDA $0647          ; $ea34: ad 47 06  
            CMP #$ea           ; $ea37: c9 ea     
            BEQ __ea3d         ; $ea39: f0 02     
            STY $00            ; $ea3b: 84 00     
__ea3d:     LDY #$ff           ; $ea3d: a0 ff     
            LDA #$00           ; $ea3f: a9 00     
            STA $0647          ; $ea41: 8d 47 06  
            JSR __fa42         ; $ea44: 20 42 fa  
            .hex d3 45         ; $ea47: d3 45     Invalid Opcode - DCP ($45),y
            NOP                ; $ea49: ea        
            NOP                ; $ea4a: ea        
            PHP                ; $ea4b: 08        
            PHA                ; $ea4c: 48        
            LDY #$9f           ; $ea4d: a0 9f     
            PLA                ; $ea4f: 68        
            PLP                ; $ea50: 28        
            JSR __fa47         ; $ea51: 20 47 fa  
            LDA $0647          ; $ea54: ad 47 06  
            CMP #$ff           ; $ea57: c9 ff     
            BEQ __ea5d         ; $ea59: f0 02     
            STY $00            ; $ea5b: 84 00     
__ea5d:     LDY #$ff           ; $ea5d: a0 ff     
            LDA #$37           ; $ea5f: a9 37     
            STA $0647          ; $ea61: 8d 47 06  
            JSR __fa54         ; $ea64: 20 54 fa  
            .hex d3 45         ; $ea67: d3 45     Invalid Opcode - DCP ($45),y
            NOP                ; $ea69: ea        
            NOP                ; $ea6a: ea        
            PHP                ; $ea6b: 08        
            PHA                ; $ea6c: 48        
            LDY #$a0           ; $ea6d: a0 a0     
            PLA                ; $ea6f: 68        
            PLP                ; $ea70: 28        
            JSR __fa59         ; $ea71: 20 59 fa  
            LDA $0647          ; $ea74: ad 47 06  
            CMP #$36           ; $ea77: c9 36     
            BEQ __ea7d         ; $ea79: f0 02     
            STY $00            ; $ea7b: 84 00     
__ea7d:     LDY #$a1           ; $ea7d: a0 a1     
            LDX #$ff           ; $ea7f: a2 ff     
            LDA #$eb           ; $ea81: a9 eb     
            STA $47            ; $ea83: 85 47     
            JSR __fa31         ; $ea85: 20 31 fa  
            .hex d7 48         ; $ea88: d7 48     Invalid Opcode - DCP $48,x
            NOP                ; $ea8a: ea        
            NOP                ; $ea8b: ea        
            NOP                ; $ea8c: ea        
            NOP                ; $ea8d: ea        
            JSR __fa37         ; $ea8e: 20 37 fa  
            LDA $47            ; $ea91: a5 47     
            CMP #$ea           ; $ea93: c9 ea     
            BEQ __ea99         ; $ea95: f0 02     
            STY $00            ; $ea97: 84 00     
__ea99:     INY                ; $ea99: c8        
            LDA #$00           ; $ea9a: a9 00     
            STA $47            ; $ea9c: 85 47     
            JSR __fa42         ; $ea9e: 20 42 fa  
            .hex d7 48         ; $eaa1: d7 48     Invalid Opcode - DCP $48,x
            NOP                ; $eaa3: ea        
            NOP                ; $eaa4: ea        
            NOP                ; $eaa5: ea        
            NOP                ; $eaa6: ea        
            JSR __fa47         ; $eaa7: 20 47 fa  
            LDA $47            ; $eaaa: a5 47     
            CMP #$ff           ; $eaac: c9 ff     
            BEQ __eab2         ; $eaae: f0 02     
            STY $00            ; $eab0: 84 00     
__eab2:     INY                ; $eab2: c8        
            LDA #$37           ; $eab3: a9 37     
            STA $47            ; $eab5: 85 47     
            JSR __fa54         ; $eab7: 20 54 fa  
            .hex d7 48         ; $eaba: d7 48     Invalid Opcode - DCP $48,x
            NOP                ; $eabc: ea        
            NOP                ; $eabd: ea        
            NOP                ; $eabe: ea        
            NOP                ; $eabf: ea        
            JSR __fa59         ; $eac0: 20 59 fa  
            LDA $47            ; $eac3: a5 47     
            CMP #$36           ; $eac5: c9 36     
            BEQ __eacb         ; $eac7: f0 02     
            STY $00            ; $eac9: 84 00     
__eacb:     LDA #$eb           ; $eacb: a9 eb     
            STA $0647          ; $eacd: 8d 47 06  
            LDY #$ff           ; $ead0: a0 ff     
            JSR __fa31         ; $ead2: 20 31 fa  
            .hex db 48 05      ; $ead5: db 48 05  Invalid Opcode - DCP $0548,y
            NOP                ; $ead8: ea        
            NOP                ; $ead9: ea        
            PHP                ; $eada: 08        
            PHA                ; $eadb: 48        
            LDY #$a4           ; $eadc: a0 a4     
            PLA                ; $eade: 68        
            PLP                ; $eadf: 28        
            JSR __fa37         ; $eae0: 20 37 fa  
            LDA $0647          ; $eae3: ad 47 06  
            CMP #$ea           ; $eae6: c9 ea     
            BEQ __eaec         ; $eae8: f0 02     
            STY $00            ; $eaea: 84 00     
__eaec:     LDY #$ff           ; $eaec: a0 ff     
            LDA #$00           ; $eaee: a9 00     
            STA $0647          ; $eaf0: 8d 47 06  
            JSR __fa42         ; $eaf3: 20 42 fa  
            .hex db 48 05      ; $eaf6: db 48 05  Invalid Opcode - DCP $0548,y
            NOP                ; $eaf9: ea        
            NOP                ; $eafa: ea        
            PHP                ; $eafb: 08        
            PHA                ; $eafc: 48        
            LDY #$a5           ; $eafd: a0 a5     
            PLA                ; $eaff: 68        
            PLP                ; $eb00: 28        
            JSR __fa47         ; $eb01: 20 47 fa  
            LDA $0647          ; $eb04: ad 47 06  
            CMP #$ff           ; $eb07: c9 ff     
            BEQ __eb0d         ; $eb09: f0 02     
            STY $00            ; $eb0b: 84 00     
__eb0d:     LDY #$ff           ; $eb0d: a0 ff     
            LDA #$37           ; $eb0f: a9 37     
            STA $0647          ; $eb11: 8d 47 06  
            JSR __fa54         ; $eb14: 20 54 fa  
            .hex db 48 05      ; $eb17: db 48 05  Invalid Opcode - DCP $0548,y
            NOP                ; $eb1a: ea        
            NOP                ; $eb1b: ea        
            PHP                ; $eb1c: 08        
            PHA                ; $eb1d: 48        
            LDY #$a6           ; $eb1e: a0 a6     
            PLA                ; $eb20: 68        
            PLP                ; $eb21: 28        
            JSR __fa59         ; $eb22: 20 59 fa  
            LDA $0647          ; $eb25: ad 47 06  
            CMP #$36           ; $eb28: c9 36     
            BEQ __eb2e         ; $eb2a: f0 02     
            STY $00            ; $eb2c: 84 00     
__eb2e:     LDY #$a7           ; $eb2e: a0 a7     
            LDX #$ff           ; $eb30: a2 ff     
            LDA #$eb           ; $eb32: a9 eb     
            STA $0647          ; $eb34: 8d 47 06  
            JSR __fa31         ; $eb37: 20 31 fa  
            .hex df 48 05      ; $eb3a: df 48 05  Invalid Opcode - DCP $0548,x
            NOP                ; $eb3d: ea        
            NOP                ; $eb3e: ea        
            NOP                ; $eb3f: ea        
            NOP                ; $eb40: ea        
            JSR __fa37         ; $eb41: 20 37 fa  
            LDA $0647          ; $eb44: ad 47 06  
            CMP #$ea           ; $eb47: c9 ea     
            BEQ __eb4d         ; $eb49: f0 02     
            STY $00            ; $eb4b: 84 00     
__eb4d:     INY                ; $eb4d: c8        
            LDA #$00           ; $eb4e: a9 00     
            STA $0647          ; $eb50: 8d 47 06  
            JSR __fa42         ; $eb53: 20 42 fa  
            .hex df 48 05      ; $eb56: df 48 05  Invalid Opcode - DCP $0548,x
            NOP                ; $eb59: ea        
            NOP                ; $eb5a: ea        
            NOP                ; $eb5b: ea        
            NOP                ; $eb5c: ea        
            JSR __fa47         ; $eb5d: 20 47 fa  
            LDA $0647          ; $eb60: ad 47 06  
            CMP #$ff           ; $eb63: c9 ff     
            BEQ __eb69         ; $eb65: f0 02     
            STY $00            ; $eb67: 84 00     
__eb69:     INY                ; $eb69: c8        
            LDA #$37           ; $eb6a: a9 37     
            STA $0647          ; $eb6c: 8d 47 06  
            JSR __fa54         ; $eb6f: 20 54 fa  
            .hex df 48 05      ; $eb72: df 48 05  Invalid Opcode - DCP $0548,x
            NOP                ; $eb75: ea        
            NOP                ; $eb76: ea        
            NOP                ; $eb77: ea        
            NOP                ; $eb78: ea        
            JSR __fa59         ; $eb79: 20 59 fa  
            LDA $0647          ; $eb7c: ad 47 06  
            CMP #$36           ; $eb7f: c9 36     
            BEQ __eb85         ; $eb81: f0 02     
            STY $00            ; $eb83: 84 00     
__eb85:     RTS                ; $eb85: 60        

;-------------------------------------------------------------------------------
__eb86:     LDA #$ff           ; $eb86: a9 ff     
            STA $01            ; $eb88: 85 01     
            LDY #$aa           ; $eb8a: a0 aa     
            LDX #$02           ; $eb8c: a2 02     
            LDA #$47           ; $eb8e: a9 47     
            STA $47            ; $eb90: 85 47     
            LDA #$06           ; $eb92: a9 06     
            STA $48            ; $eb94: 85 48     
            LDA #$eb           ; $eb96: a9 eb     
            STA $0647          ; $eb98: 8d 47 06  
            JSR __fab1         ; $eb9b: 20 b1 fa  
            .hex e3 45         ; $eb9e: e3 45     Invalid Opcode - ISC ($45,x)
            NOP                ; $eba0: ea        
            NOP                ; $eba1: ea        
            NOP                ; $eba2: ea        
            NOP                ; $eba3: ea        
            JSR __fab7         ; $eba4: 20 b7 fa  
            LDA $0647          ; $eba7: ad 47 06  
            CMP #$ec           ; $ebaa: c9 ec     
            BEQ __ebb0         ; $ebac: f0 02     
            STY $00            ; $ebae: 84 00     
__ebb0:     INY                ; $ebb0: c8        
            LDA #$ff           ; $ebb1: a9 ff     
            STA $0647          ; $ebb3: 8d 47 06  
            JSR __fac2         ; $ebb6: 20 c2 fa  
            .hex e3 45         ; $ebb9: e3 45     Invalid Opcode - ISC ($45,x)
            NOP                ; $ebbb: ea        
            NOP                ; $ebbc: ea        
            NOP                ; $ebbd: ea        
            NOP                ; $ebbe: ea        
            JSR __fac7         ; $ebbf: 20 c7 fa  
            LDA $0647          ; $ebc2: ad 47 06  
            CMP #$00           ; $ebc5: c9 00     
            BEQ __ebcb         ; $ebc7: f0 02     
            STY $00            ; $ebc9: 84 00     
__ebcb:     INY                ; $ebcb: c8        
            LDA #$37           ; $ebcc: a9 37     
            STA $0647          ; $ebce: 8d 47 06  
            JSR __fad4         ; $ebd1: 20 d4 fa  
            .hex e3 45         ; $ebd4: e3 45     Invalid Opcode - ISC ($45,x)
            NOP                ; $ebd6: ea        
            NOP                ; $ebd7: ea        
            NOP                ; $ebd8: ea        
            NOP                ; $ebd9: ea        
            JSR __fada         ; $ebda: 20 da fa  
            LDA $0647          ; $ebdd: ad 47 06  
            CMP #$38           ; $ebe0: c9 38     
            BEQ __ebe6         ; $ebe2: f0 02     
            STY $00            ; $ebe4: 84 00     
__ebe6:     INY                ; $ebe6: c8        
            LDA #$eb           ; $ebe7: a9 eb     
            STA $47            ; $ebe9: 85 47     
            JSR __fab1         ; $ebeb: 20 b1 fa  
            .hex e7 47         ; $ebee: e7 47     Invalid Opcode - ISC $47
            NOP                ; $ebf0: ea        
            NOP                ; $ebf1: ea        
            NOP                ; $ebf2: ea        
            NOP                ; $ebf3: ea        
            JSR __fab7         ; $ebf4: 20 b7 fa  
            LDA $47            ; $ebf7: a5 47     
            CMP #$ec           ; $ebf9: c9 ec     
            BEQ __ebff         ; $ebfb: f0 02     
            STY $00            ; $ebfd: 84 00     
__ebff:     INY                ; $ebff: c8        
            LDA #$ff           ; $ec00: a9 ff     
            STA $47            ; $ec02: 85 47     
            JSR __fac2         ; $ec04: 20 c2 fa  
            .hex e7 47         ; $ec07: e7 47     Invalid Opcode - ISC $47
            NOP                ; $ec09: ea        
            NOP                ; $ec0a: ea        
            NOP                ; $ec0b: ea        
            NOP                ; $ec0c: ea        
            JSR __fac7         ; $ec0d: 20 c7 fa  
            LDA $47            ; $ec10: a5 47     
            CMP #$00           ; $ec12: c9 00     
            BEQ __ec18         ; $ec14: f0 02     
            STY $00            ; $ec16: 84 00     
__ec18:     INY                ; $ec18: c8        
            LDA #$37           ; $ec19: a9 37     
            STA $47            ; $ec1b: 85 47     
            JSR __fad4         ; $ec1d: 20 d4 fa  
            .hex e7 47         ; $ec20: e7 47     Invalid Opcode - ISC $47
            NOP                ; $ec22: ea        
            NOP                ; $ec23: ea        
            NOP                ; $ec24: ea        
            NOP                ; $ec25: ea        
            JSR __fada         ; $ec26: 20 da fa  
            LDA $47            ; $ec29: a5 47     
            CMP #$38           ; $ec2b: c9 38     
            BEQ __ec31         ; $ec2d: f0 02     
            STY $00            ; $ec2f: 84 00     
__ec31:     INY                ; $ec31: c8        
            LDA #$eb           ; $ec32: a9 eb     
            STA $0647          ; $ec34: 8d 47 06  
            JSR __fab1         ; $ec37: 20 b1 fa  
            .hex ef 47 06      ; $ec3a: ef 47 06  Invalid Opcode - ISC $0647
            NOP                ; $ec3d: ea        
            NOP                ; $ec3e: ea        
            NOP                ; $ec3f: ea        
            NOP                ; $ec40: ea        
            JSR __fab7         ; $ec41: 20 b7 fa  
            LDA $0647          ; $ec44: ad 47 06  
            CMP #$ec           ; $ec47: c9 ec     
            BEQ __ec4d         ; $ec49: f0 02     
            STY $00            ; $ec4b: 84 00     
__ec4d:     INY                ; $ec4d: c8        
            LDA #$ff           ; $ec4e: a9 ff     
            STA $0647          ; $ec50: 8d 47 06  
            JSR __fac2         ; $ec53: 20 c2 fa  
            .hex ef 47 06      ; $ec56: ef 47 06  Invalid Opcode - ISC $0647
            NOP                ; $ec59: ea        
            NOP                ; $ec5a: ea        
            NOP                ; $ec5b: ea        
            NOP                ; $ec5c: ea        
            JSR __fac7         ; $ec5d: 20 c7 fa  
            LDA $0647          ; $ec60: ad 47 06  
            CMP #$00           ; $ec63: c9 00     
            BEQ __ec69         ; $ec65: f0 02     
            STY $00            ; $ec67: 84 00     
__ec69:     INY                ; $ec69: c8        
            LDA #$37           ; $ec6a: a9 37     
            STA $0647          ; $ec6c: 8d 47 06  
            JSR __fad4         ; $ec6f: 20 d4 fa  
            .hex ef 47 06      ; $ec72: ef 47 06  Invalid Opcode - ISC $0647
            NOP                ; $ec75: ea        
            NOP                ; $ec76: ea        
            NOP                ; $ec77: ea        
            NOP                ; $ec78: ea        
            JSR __fada         ; $ec79: 20 da fa  
            LDA $0647          ; $ec7c: ad 47 06  
            CMP #$38           ; $ec7f: c9 38     
            BEQ __ec85         ; $ec81: f0 02     
            STY $00            ; $ec83: 84 00     
__ec85:     LDA #$eb           ; $ec85: a9 eb     
            STA $0647          ; $ec87: 8d 47 06  
            LDA #$48           ; $ec8a: a9 48     
            STA $45            ; $ec8c: 85 45     
            LDA #$05           ; $ec8e: a9 05     
            STA $46            ; $ec90: 85 46     
            LDY #$ff           ; $ec92: a0 ff     
            JSR __fab1         ; $ec94: 20 b1 fa  
            .hex f3 45         ; $ec97: f3 45     Invalid Opcode - ISC ($45),y
            NOP                ; $ec99: ea        
            NOP                ; $ec9a: ea        
            PHP                ; $ec9b: 08        
            PHA                ; $ec9c: 48        
            LDY #$b3           ; $ec9d: a0 b3     
            PLA                ; $ec9f: 68        
            PLP                ; $eca0: 28        
            JSR __fab7         ; $eca1: 20 b7 fa  
            LDA $0647          ; $eca4: ad 47 06  
            CMP #$ec           ; $eca7: c9 ec     
            BEQ __ecad         ; $eca9: f0 02     
            STY $00            ; $ecab: 84 00     
__ecad:     LDY #$ff           ; $ecad: a0 ff     
            LDA #$ff           ; $ecaf: a9 ff     
            STA $0647          ; $ecb1: 8d 47 06  
            JSR __fac2         ; $ecb4: 20 c2 fa  
            .hex f3 45         ; $ecb7: f3 45     Invalid Opcode - ISC ($45),y
            NOP                ; $ecb9: ea        
            NOP                ; $ecba: ea        
            PHP                ; $ecbb: 08        
            PHA                ; $ecbc: 48        
            LDY #$b4           ; $ecbd: a0 b4     
            PLA                ; $ecbf: 68        
            PLP                ; $ecc0: 28        
            JSR __fac7         ; $ecc1: 20 c7 fa  
            LDA $0647          ; $ecc4: ad 47 06  
            CMP #$00           ; $ecc7: c9 00     
            BEQ __eccd         ; $ecc9: f0 02     
            STY $00            ; $eccb: 84 00     
__eccd:     LDY #$ff           ; $eccd: a0 ff     
            LDA #$37           ; $eccf: a9 37     
            STA $0647          ; $ecd1: 8d 47 06  
            JSR __fad4         ; $ecd4: 20 d4 fa  
            .hex f3 45         ; $ecd7: f3 45     Invalid Opcode - ISC ($45),y
            NOP                ; $ecd9: ea        
            NOP                ; $ecda: ea        
            PHP                ; $ecdb: 08        
            PHA                ; $ecdc: 48        
            LDY #$b5           ; $ecdd: a0 b5     
            PLA                ; $ecdf: 68        
            PLP                ; $ece0: 28        
            JSR __fada         ; $ece1: 20 da fa  
            LDA $0647          ; $ece4: ad 47 06  
            CMP #$38           ; $ece7: c9 38     
            BEQ __eced         ; $ece9: f0 02     
            STY $00            ; $eceb: 84 00     
__eced:     LDY #$b6           ; $eced: a0 b6     
            LDX #$ff           ; $ecef: a2 ff     
            LDA #$eb           ; $ecf1: a9 eb     
            STA $47            ; $ecf3: 85 47     
            JSR __fab1         ; $ecf5: 20 b1 fa  
            .hex f7 48         ; $ecf8: f7 48     Invalid Opcode - ISC $48,x
            NOP                ; $ecfa: ea        
            NOP                ; $ecfb: ea        
            NOP                ; $ecfc: ea        
            NOP                ; $ecfd: ea        
            JSR __fab7         ; $ecfe: 20 b7 fa  
            LDA $47            ; $ed01: a5 47     
            CMP #$ec           ; $ed03: c9 ec     
            BEQ __ed09         ; $ed05: f0 02     
            STY $00            ; $ed07: 84 00     
__ed09:     INY                ; $ed09: c8        
            LDA #$ff           ; $ed0a: a9 ff     
            STA $47            ; $ed0c: 85 47     
            JSR __fac2         ; $ed0e: 20 c2 fa  
            .hex f7 48         ; $ed11: f7 48     Invalid Opcode - ISC $48,x
            NOP                ; $ed13: ea        
            NOP                ; $ed14: ea        
            NOP                ; $ed15: ea        
            NOP                ; $ed16: ea        
            JSR __fac7         ; $ed17: 20 c7 fa  
            LDA $47            ; $ed1a: a5 47     
            CMP #$00           ; $ed1c: c9 00     
            BEQ __ed22         ; $ed1e: f0 02     
            STY $00            ; $ed20: 84 00     
__ed22:     INY                ; $ed22: c8        
            LDA #$37           ; $ed23: a9 37     
            STA $47            ; $ed25: 85 47     
            JSR __fad4         ; $ed27: 20 d4 fa  
            .hex f7 48         ; $ed2a: f7 48     Invalid Opcode - ISC $48,x
            NOP                ; $ed2c: ea        
            NOP                ; $ed2d: ea        
            NOP                ; $ed2e: ea        
            NOP                ; $ed2f: ea        
            JSR __fada         ; $ed30: 20 da fa  
            LDA $47            ; $ed33: a5 47     
            CMP #$38           ; $ed35: c9 38     
            BEQ __ed3b         ; $ed37: f0 02     
            STY $00            ; $ed39: 84 00     
__ed3b:     LDA #$eb           ; $ed3b: a9 eb     
            STA $0647          ; $ed3d: 8d 47 06  
            LDY #$ff           ; $ed40: a0 ff     
            JSR __fab1         ; $ed42: 20 b1 fa  
            .hex fb 48 05      ; $ed45: fb 48 05  Invalid Opcode - ISC $0548,y
            NOP                ; $ed48: ea        
            NOP                ; $ed49: ea        
            PHP                ; $ed4a: 08        
            PHA                ; $ed4b: 48        
            LDY #$b9           ; $ed4c: a0 b9     
            PLA                ; $ed4e: 68        
            PLP                ; $ed4f: 28        
            JSR __fab7         ; $ed50: 20 b7 fa  
            LDA $0647          ; $ed53: ad 47 06  
            CMP #$ec           ; $ed56: c9 ec     
            BEQ __ed5c         ; $ed58: f0 02     
            STY $00            ; $ed5a: 84 00     
__ed5c:     LDY #$ff           ; $ed5c: a0 ff     
            LDA #$ff           ; $ed5e: a9 ff     
            STA $0647          ; $ed60: 8d 47 06  
            JSR __fac2         ; $ed63: 20 c2 fa  
            .hex fb 48 05      ; $ed66: fb 48 05  Invalid Opcode - ISC $0548,y
            NOP                ; $ed69: ea        
            NOP                ; $ed6a: ea        
            PHP                ; $ed6b: 08        
            PHA                ; $ed6c: 48        
            LDY #$ba           ; $ed6d: a0 ba     
            PLA                ; $ed6f: 68        
            PLP                ; $ed70: 28        
            JSR __fac7         ; $ed71: 20 c7 fa  
            LDA $0647          ; $ed74: ad 47 06  
            CMP #$00           ; $ed77: c9 00     
            BEQ __ed7d         ; $ed79: f0 02     
            STY $00            ; $ed7b: 84 00     
__ed7d:     LDY #$ff           ; $ed7d: a0 ff     
            LDA #$37           ; $ed7f: a9 37     
            STA $0647          ; $ed81: 8d 47 06  
            JSR __fad4         ; $ed84: 20 d4 fa  
            .hex fb 48 05      ; $ed87: fb 48 05  Invalid Opcode - ISC $0548,y
            NOP                ; $ed8a: ea        
            NOP                ; $ed8b: ea        
            PHP                ; $ed8c: 08        
            PHA                ; $ed8d: 48        
            LDY #$bb           ; $ed8e: a0 bb     
            PLA                ; $ed90: 68        
            PLP                ; $ed91: 28        
            JSR __fada         ; $ed92: 20 da fa  
            LDA $0647          ; $ed95: ad 47 06  
            CMP #$38           ; $ed98: c9 38     
            BEQ __ed9e         ; $ed9a: f0 02     
            STY $00            ; $ed9c: 84 00     
__ed9e:     LDY #$bc           ; $ed9e: a0 bc     
            LDX #$ff           ; $eda0: a2 ff     
            LDA #$eb           ; $eda2: a9 eb     
            STA $0647          ; $eda4: 8d 47 06  
            JSR __fab1         ; $eda7: 20 b1 fa  
            .hex ff 48 05      ; $edaa: ff 48 05  Invalid Opcode - ISC $0548,x
            NOP                ; $edad: ea        
            NOP                ; $edae: ea        
            NOP                ; $edaf: ea        
            NOP                ; $edb0: ea        
            JSR __fab7         ; $edb1: 20 b7 fa  
            LDA $0647          ; $edb4: ad 47 06  
            CMP #$ec           ; $edb7: c9 ec     
            BEQ __edbd         ; $edb9: f0 02     
            STY $00            ; $edbb: 84 00     
__edbd:     INY                ; $edbd: c8        
            LDA #$ff           ; $edbe: a9 ff     
            STA $0647          ; $edc0: 8d 47 06  
            JSR __fac2         ; $edc3: 20 c2 fa  
            .hex ff 48 05      ; $edc6: ff 48 05  Invalid Opcode - ISC $0548,x
            NOP                ; $edc9: ea        
            NOP                ; $edca: ea        
            NOP                ; $edcb: ea        
            NOP                ; $edcc: ea        
            JSR __fac7         ; $edcd: 20 c7 fa  
            LDA $0647          ; $edd0: ad 47 06  
            CMP #$00           ; $edd3: c9 00     
            BEQ __edd9         ; $edd5: f0 02     
            STY $00            ; $edd7: 84 00     
__edd9:     INY                ; $edd9: c8        
            LDA #$37           ; $edda: a9 37     
            STA $0647          ; $eddc: 8d 47 06  
            JSR __fad4         ; $eddf: 20 d4 fa  
            .hex ff 48 05      ; $ede2: ff 48 05  Invalid Opcode - ISC $0548,x
            NOP                ; $ede5: ea        
            NOP                ; $ede6: ea        
            NOP                ; $ede7: ea        
            NOP                ; $ede8: ea        
            JSR __fada         ; $ede9: 20 da fa  
            LDA $0647          ; $edec: ad 47 06  
            CMP #$38           ; $edef: c9 38     
            BEQ __edf5         ; $edf1: f0 02     
            STY $00            ; $edf3: 84 00     
__edf5:     RTS                ; $edf5: 60        

;-------------------------------------------------------------------------------
__edf6:     LDA #$ff           ; $edf6: a9 ff     
            STA $01            ; $edf8: 85 01     
            LDY #$bf           ; $edfa: a0 bf     
            LDX #$02           ; $edfc: a2 02     
            LDA #$47           ; $edfe: a9 47     
            STA $47            ; $ee00: 85 47     
            LDA #$06           ; $ee02: a9 06     
            STA $48            ; $ee04: 85 48     
            LDA #$a5           ; $ee06: a9 a5     
            STA $0647          ; $ee08: 8d 47 06  
            JSR __fa7b         ; $ee0b: 20 7b fa  
            .hex 03 45         ; $ee0e: 03 45     Invalid Opcode - SLO ($45,x)
            NOP                ; $ee10: ea        
            NOP                ; $ee11: ea        
            NOP                ; $ee12: ea        
            NOP                ; $ee13: ea        
            JSR __fa81         ; $ee14: 20 81 fa  
            LDA $0647          ; $ee17: ad 47 06  
            CMP #$4a           ; $ee1a: c9 4a     
            BEQ __ee20         ; $ee1c: f0 02     
            STY $00            ; $ee1e: 84 00     
__ee20:     INY                ; $ee20: c8        
            LDA #$29           ; $ee21: a9 29     
            STA $0647          ; $ee23: 8d 47 06  
            JSR __fa8c         ; $ee26: 20 8c fa  
            .hex 03 45         ; $ee29: 03 45     Invalid Opcode - SLO ($45,x)
            NOP                ; $ee2b: ea        
            NOP                ; $ee2c: ea        
            NOP                ; $ee2d: ea        
            NOP                ; $ee2e: ea        
            JSR __fa91         ; $ee2f: 20 91 fa  
            LDA $0647          ; $ee32: ad 47 06  
            CMP #$52           ; $ee35: c9 52     
            BEQ __ee3b         ; $ee37: f0 02     
            STY $00            ; $ee39: 84 00     
__ee3b:     INY                ; $ee3b: c8        
            LDA #$37           ; $ee3c: a9 37     
            STA $0647          ; $ee3e: 8d 47 06  
            JSR __fa9e         ; $ee41: 20 9e fa  
            .hex 03 45         ; $ee44: 03 45     Invalid Opcode - SLO ($45,x)
            NOP                ; $ee46: ea        
            NOP                ; $ee47: ea        
            NOP                ; $ee48: ea        
            NOP                ; $ee49: ea        
            JSR __faa4         ; $ee4a: 20 a4 fa  
            LDA $0647          ; $ee4d: ad 47 06  
            CMP #$6e           ; $ee50: c9 6e     
            BEQ __ee56         ; $ee52: f0 02     
            STY $00            ; $ee54: 84 00     
__ee56:     INY                ; $ee56: c8        
            LDA #$a5           ; $ee57: a9 a5     
            STA $47            ; $ee59: 85 47     
            JSR __fa7b         ; $ee5b: 20 7b fa  
            .hex 07 47         ; $ee5e: 07 47     Invalid Opcode - SLO $47
            NOP                ; $ee60: ea        
            NOP                ; $ee61: ea        
            NOP                ; $ee62: ea        
            NOP                ; $ee63: ea        
            JSR __fa81         ; $ee64: 20 81 fa  
            LDA $47            ; $ee67: a5 47     
            CMP #$4a           ; $ee69: c9 4a     
            BEQ __ee6f         ; $ee6b: f0 02     
            STY $00            ; $ee6d: 84 00     
__ee6f:     INY                ; $ee6f: c8        
            LDA #$29           ; $ee70: a9 29     
            STA $47            ; $ee72: 85 47     
            JSR __fa8c         ; $ee74: 20 8c fa  
            .hex 07 47         ; $ee77: 07 47     Invalid Opcode - SLO $47
            NOP                ; $ee79: ea        
            NOP                ; $ee7a: ea        
            NOP                ; $ee7b: ea        
            NOP                ; $ee7c: ea        
            JSR __fa91         ; $ee7d: 20 91 fa  
            LDA $47            ; $ee80: a5 47     
            CMP #$52           ; $ee82: c9 52     
            BEQ __ee88         ; $ee84: f0 02     
            STY $00            ; $ee86: 84 00     
__ee88:     INY                ; $ee88: c8        
            LDA #$37           ; $ee89: a9 37     
            STA $47            ; $ee8b: 85 47     
            JSR __fa9e         ; $ee8d: 20 9e fa  
            .hex 07 47         ; $ee90: 07 47     Invalid Opcode - SLO $47
            NOP                ; $ee92: ea        
            NOP                ; $ee93: ea        
            NOP                ; $ee94: ea        
            NOP                ; $ee95: ea        
            JSR __faa4         ; $ee96: 20 a4 fa  
            LDA $47            ; $ee99: a5 47     
            CMP #$6e           ; $ee9b: c9 6e     
            BEQ __eea1         ; $ee9d: f0 02     
            STY $00            ; $ee9f: 84 00     
__eea1:     INY                ; $eea1: c8        
            LDA #$a5           ; $eea2: a9 a5     
            STA $0647          ; $eea4: 8d 47 06  
            JSR __fa7b         ; $eea7: 20 7b fa  
            .hex 0f 47 06      ; $eeaa: 0f 47 06  Invalid Opcode - SLO $0647
            NOP                ; $eead: ea        
            NOP                ; $eeae: ea        
            NOP                ; $eeaf: ea        
            NOP                ; $eeb0: ea        
            JSR __fa81         ; $eeb1: 20 81 fa  
            LDA $0647          ; $eeb4: ad 47 06  
            CMP #$4a           ; $eeb7: c9 4a     
            BEQ __eebd         ; $eeb9: f0 02     
            STY $00            ; $eebb: 84 00     
__eebd:     INY                ; $eebd: c8        
            LDA #$29           ; $eebe: a9 29     
            STA $0647          ; $eec0: 8d 47 06  
            JSR __fa8c         ; $eec3: 20 8c fa  
            .hex 0f 47 06      ; $eec6: 0f 47 06  Invalid Opcode - SLO $0647
            NOP                ; $eec9: ea        
            NOP                ; $eeca: ea        
            NOP                ; $eecb: ea        
            NOP                ; $eecc: ea        
            JSR __fa91         ; $eecd: 20 91 fa  
            LDA $0647          ; $eed0: ad 47 06  
            CMP #$52           ; $eed3: c9 52     
            BEQ __eed9         ; $eed5: f0 02     
            STY $00            ; $eed7: 84 00     
__eed9:     INY                ; $eed9: c8        
            LDA #$37           ; $eeda: a9 37     
            STA $0647          ; $eedc: 8d 47 06  
            JSR __fa9e         ; $eedf: 20 9e fa  
            .hex 0f 47 06      ; $eee2: 0f 47 06  Invalid Opcode - SLO $0647
            NOP                ; $eee5: ea        
            NOP                ; $eee6: ea        
            NOP                ; $eee7: ea        
            NOP                ; $eee8: ea        
            JSR __faa4         ; $eee9: 20 a4 fa  
            LDA $0647          ; $eeec: ad 47 06  
            CMP #$6e           ; $eeef: c9 6e     
            BEQ __eef5         ; $eef1: f0 02     
            STY $00            ; $eef3: 84 00     
__eef5:     LDA #$a5           ; $eef5: a9 a5     
            STA $0647          ; $eef7: 8d 47 06  
            LDA #$48           ; $eefa: a9 48     
            STA $45            ; $eefc: 85 45     
            LDA #$05           ; $eefe: a9 05     
            STA $46            ; $ef00: 85 46     
            LDY #$ff           ; $ef02: a0 ff     
            JSR __fa7b         ; $ef04: 20 7b fa  
            .hex 13 45         ; $ef07: 13 45     Invalid Opcode - SLO ($45),y
            NOP                ; $ef09: ea        
            NOP                ; $ef0a: ea        
            PHP                ; $ef0b: 08        
            PHA                ; $ef0c: 48        
            LDY #$c8           ; $ef0d: a0 c8     
            PLA                ; $ef0f: 68        
            PLP                ; $ef10: 28        
            JSR __fa81         ; $ef11: 20 81 fa  
            LDA $0647          ; $ef14: ad 47 06  
            CMP #$4a           ; $ef17: c9 4a     
            BEQ __ef1d         ; $ef19: f0 02     
            STY $00            ; $ef1b: 84 00     
__ef1d:     LDY #$ff           ; $ef1d: a0 ff     
            LDA #$29           ; $ef1f: a9 29     
            STA $0647          ; $ef21: 8d 47 06  
            JSR __fa8c         ; $ef24: 20 8c fa  
            .hex 13 45         ; $ef27: 13 45     Invalid Opcode - SLO ($45),y
            NOP                ; $ef29: ea        
            NOP                ; $ef2a: ea        
            PHP                ; $ef2b: 08        
            PHA                ; $ef2c: 48        
            LDY #$c9           ; $ef2d: a0 c9     
            PLA                ; $ef2f: 68        
            PLP                ; $ef30: 28        
            JSR __fa91         ; $ef31: 20 91 fa  
            LDA $0647          ; $ef34: ad 47 06  
            CMP #$52           ; $ef37: c9 52     
            BEQ __ef3d         ; $ef39: f0 02     
            STY $00            ; $ef3b: 84 00     
__ef3d:     LDY #$ff           ; $ef3d: a0 ff     
            LDA #$37           ; $ef3f: a9 37     
            STA $0647          ; $ef41: 8d 47 06  
            JSR __fa9e         ; $ef44: 20 9e fa  
            .hex 13 45         ; $ef47: 13 45     Invalid Opcode - SLO ($45),y
            NOP                ; $ef49: ea        
            NOP                ; $ef4a: ea        
            PHP                ; $ef4b: 08        
            PHA                ; $ef4c: 48        
            LDY #$ca           ; $ef4d: a0 ca     
            PLA                ; $ef4f: 68        
            PLP                ; $ef50: 28        
            JSR __faa4         ; $ef51: 20 a4 fa  
            LDA $0647          ; $ef54: ad 47 06  
            CMP #$6e           ; $ef57: c9 6e     
            BEQ __ef5d         ; $ef59: f0 02     
            STY $00            ; $ef5b: 84 00     
__ef5d:     LDY #$cb           ; $ef5d: a0 cb     
            LDX #$ff           ; $ef5f: a2 ff     
            LDA #$a5           ; $ef61: a9 a5     
            STA $47            ; $ef63: 85 47     
            JSR __fa7b         ; $ef65: 20 7b fa  
            .hex 17 48         ; $ef68: 17 48     Invalid Opcode - SLO $48,x
            NOP                ; $ef6a: ea        
            NOP                ; $ef6b: ea        
            NOP                ; $ef6c: ea        
            NOP                ; $ef6d: ea        
            JSR __fa81         ; $ef6e: 20 81 fa  
            LDA $47            ; $ef71: a5 47     
            CMP #$4a           ; $ef73: c9 4a     
            BEQ __ef79         ; $ef75: f0 02     
            STY $00            ; $ef77: 84 00     
__ef79:     INY                ; $ef79: c8        
            LDA #$29           ; $ef7a: a9 29     
            STA $47            ; $ef7c: 85 47     
            JSR __fa8c         ; $ef7e: 20 8c fa  
            .hex 17 48         ; $ef81: 17 48     Invalid Opcode - SLO $48,x
            NOP                ; $ef83: ea        
            NOP                ; $ef84: ea        
            NOP                ; $ef85: ea        
            NOP                ; $ef86: ea        
            JSR __fa91         ; $ef87: 20 91 fa  
            LDA $47            ; $ef8a: a5 47     
            CMP #$52           ; $ef8c: c9 52     
            BEQ __ef92         ; $ef8e: f0 02     
            STY $00            ; $ef90: 84 00     
__ef92:     INY                ; $ef92: c8        
            LDA #$37           ; $ef93: a9 37     
            STA $47            ; $ef95: 85 47     
            JSR __fa9e         ; $ef97: 20 9e fa  
            .hex 17 48         ; $ef9a: 17 48     Invalid Opcode - SLO $48,x
            NOP                ; $ef9c: ea        
            NOP                ; $ef9d: ea        
            NOP                ; $ef9e: ea        
            NOP                ; $ef9f: ea        
            JSR __faa4         ; $efa0: 20 a4 fa  
            LDA $47            ; $efa3: a5 47     
            CMP #$6e           ; $efa5: c9 6e     
            BEQ __efab         ; $efa7: f0 02     
            STY $00            ; $efa9: 84 00     
__efab:     LDA #$a5           ; $efab: a9 a5     
            STA $0647          ; $efad: 8d 47 06  
            LDY #$ff           ; $efb0: a0 ff     
            JSR __fa7b         ; $efb2: 20 7b fa  
            .hex 1b 48 05      ; $efb5: 1b 48 05  Invalid Opcode - SLO $0548,y
            NOP                ; $efb8: ea        
            NOP                ; $efb9: ea        
            PHP                ; $efba: 08        
            PHA                ; $efbb: 48        
            LDY #$ce           ; $efbc: a0 ce     
            PLA                ; $efbe: 68        
            PLP                ; $efbf: 28        
            JSR __fa81         ; $efc0: 20 81 fa  
            LDA $0647          ; $efc3: ad 47 06  
            CMP #$4a           ; $efc6: c9 4a     
            BEQ __efcc         ; $efc8: f0 02     
            STY $00            ; $efca: 84 00     
__efcc:     LDY #$ff           ; $efcc: a0 ff     
            LDA #$29           ; $efce: a9 29     
            STA $0647          ; $efd0: 8d 47 06  
            JSR __fa8c         ; $efd3: 20 8c fa  
            .hex 1b 48 05      ; $efd6: 1b 48 05  Invalid Opcode - SLO $0548,y
            NOP                ; $efd9: ea        
            NOP                ; $efda: ea        
            PHP                ; $efdb: 08        
            PHA                ; $efdc: 48        
            LDY #$cf           ; $efdd: a0 cf     
            PLA                ; $efdf: 68        
            PLP                ; $efe0: 28        
            JSR __fa91         ; $efe1: 20 91 fa  
            LDA $0647          ; $efe4: ad 47 06  
            CMP #$52           ; $efe7: c9 52     
            BEQ __efed         ; $efe9: f0 02     
            STY $00            ; $efeb: 84 00     
__efed:     LDY #$ff           ; $efed: a0 ff     
            LDA #$37           ; $efef: a9 37     
            STA $0647          ; $eff1: 8d 47 06  
            JSR __fa9e         ; $eff4: 20 9e fa  
            .hex 1b 48 05      ; $eff7: 1b 48 05  Invalid Opcode - SLO $0548,y
            NOP                ; $effa: ea        
            NOP                ; $effb: ea        
            PHP                ; $effc: 08        
            PHA                ; $effd: 48        
            LDY #$d0           ; $effe: a0 d0     
            PLA                ; $f000: 68        
            PLP                ; $f001: 28        
            JSR __faa4         ; $f002: 20 a4 fa  
            LDA $0647          ; $f005: ad 47 06  
            CMP #$6e           ; $f008: c9 6e     
            BEQ __f00e         ; $f00a: f0 02     
            STY $00            ; $f00c: 84 00     
__f00e:     LDY #$d1           ; $f00e: a0 d1     
            LDX #$ff           ; $f010: a2 ff     
            LDA #$a5           ; $f012: a9 a5     
            STA $0647          ; $f014: 8d 47 06  
            JSR __fa7b         ; $f017: 20 7b fa  
            .hex 1f 48 05      ; $f01a: 1f 48 05  Invalid Opcode - SLO $0548,x
            NOP                ; $f01d: ea        
            NOP                ; $f01e: ea        
            NOP                ; $f01f: ea        
            NOP                ; $f020: ea        
            JSR __fa81         ; $f021: 20 81 fa  
            LDA $0647          ; $f024: ad 47 06  
            CMP #$4a           ; $f027: c9 4a     
            BEQ __f02d         ; $f029: f0 02     
            STY $00            ; $f02b: 84 00     
__f02d:     INY                ; $f02d: c8        
            LDA #$29           ; $f02e: a9 29     
            STA $0647          ; $f030: 8d 47 06  
            JSR __fa8c         ; $f033: 20 8c fa  
            .hex 1f 48 05      ; $f036: 1f 48 05  Invalid Opcode - SLO $0548,x
            NOP                ; $f039: ea        
            NOP                ; $f03a: ea        
            NOP                ; $f03b: ea        
            NOP                ; $f03c: ea        
            JSR __fa91         ; $f03d: 20 91 fa  
            LDA $0647          ; $f040: ad 47 06  
            CMP #$52           ; $f043: c9 52     
            BEQ __f049         ; $f045: f0 02     
            STY $00            ; $f047: 84 00     
__f049:     INY                ; $f049: c8        
            LDA #$37           ; $f04a: a9 37     
            STA $0647          ; $f04c: 8d 47 06  
            JSR __fa9e         ; $f04f: 20 9e fa  
            .hex 1f 48 05      ; $f052: 1f 48 05  Invalid Opcode - SLO $0548,x
            NOP                ; $f055: ea        
            NOP                ; $f056: ea        
            NOP                ; $f057: ea        
            NOP                ; $f058: ea        
            JSR __faa4         ; $f059: 20 a4 fa  
            LDA $0647          ; $f05c: ad 47 06  
            CMP #$6e           ; $f05f: c9 6e     
            BEQ __f065         ; $f061: f0 02     
            STY $00            ; $f063: 84 00     
__f065:     RTS                ; $f065: 60        

;-------------------------------------------------------------------------------
__f066:     LDA #$ff           ; $f066: a9 ff     
            STA $01            ; $f068: 85 01     
            LDY #$d4           ; $f06a: a0 d4     
            LDX #$02           ; $f06c: a2 02     
            LDA #$47           ; $f06e: a9 47     
            STA $47            ; $f070: 85 47     
            LDA #$06           ; $f072: a9 06     
            STA $48            ; $f074: 85 48     
            LDA #$a5           ; $f076: a9 a5     
            STA $0647          ; $f078: 8d 47 06  
            JSR __fb53         ; $f07b: 20 53 fb  
            .hex 23 45         ; $f07e: 23 45     Invalid Opcode - RLA ($45,x)
            NOP                ; $f080: ea        
            NOP                ; $f081: ea        
            NOP                ; $f082: ea        
            NOP                ; $f083: ea        
            JSR __fb59         ; $f084: 20 59 fb  
            LDA $0647          ; $f087: ad 47 06  
            CMP #$4a           ; $f08a: c9 4a     
            BEQ __f090         ; $f08c: f0 02     
            STY $00            ; $f08e: 84 00     
__f090:     INY                ; $f090: c8        
            LDA #$29           ; $f091: a9 29     
            STA $0647          ; $f093: 8d 47 06  
            JSR __fb64         ; $f096: 20 64 fb  
            .hex 23 45         ; $f099: 23 45     Invalid Opcode - RLA ($45,x)
            NOP                ; $f09b: ea        
            NOP                ; $f09c: ea        
            NOP                ; $f09d: ea        
            NOP                ; $f09e: ea        
            JSR __fb69         ; $f09f: 20 69 fb  
            LDA $0647          ; $f0a2: ad 47 06  
            CMP #$52           ; $f0a5: c9 52     
            BEQ __f0ab         ; $f0a7: f0 02     
            STY $00            ; $f0a9: 84 00     
__f0ab:     INY                ; $f0ab: c8        
            LDA #$37           ; $f0ac: a9 37     
            STA $0647          ; $f0ae: 8d 47 06  
            JSR __fa68         ; $f0b1: 20 68 fa  
            .hex 23 45         ; $f0b4: 23 45     Invalid Opcode - RLA ($45,x)
            NOP                ; $f0b6: ea        
            NOP                ; $f0b7: ea        
            NOP                ; $f0b8: ea        
            NOP                ; $f0b9: ea        
            JSR __fa6e         ; $f0ba: 20 6e fa  
            LDA $0647          ; $f0bd: ad 47 06  
            CMP #$6f           ; $f0c0: c9 6f     
            BEQ __f0c6         ; $f0c2: f0 02     
            STY $00            ; $f0c4: 84 00     
__f0c6:     INY                ; $f0c6: c8        
            LDA #$a5           ; $f0c7: a9 a5     
            STA $47            ; $f0c9: 85 47     
            JSR __fb53         ; $f0cb: 20 53 fb  
            .hex 27 47         ; $f0ce: 27 47     Invalid Opcode - RLA $47
            NOP                ; $f0d0: ea        
            NOP                ; $f0d1: ea        
            NOP                ; $f0d2: ea        
            NOP                ; $f0d3: ea        
            JSR __fb59         ; $f0d4: 20 59 fb  
            LDA $47            ; $f0d7: a5 47     
            CMP #$4a           ; $f0d9: c9 4a     
            BEQ __f0df         ; $f0db: f0 02     
            STY $00            ; $f0dd: 84 00     
__f0df:     INY                ; $f0df: c8        
            LDA #$29           ; $f0e0: a9 29     
            STA $47            ; $f0e2: 85 47     
            JSR __fb64         ; $f0e4: 20 64 fb  
            .hex 27 47         ; $f0e7: 27 47     Invalid Opcode - RLA $47
            NOP                ; $f0e9: ea        
            NOP                ; $f0ea: ea        
            NOP                ; $f0eb: ea        
            NOP                ; $f0ec: ea        
            JSR __fb69         ; $f0ed: 20 69 fb  
            LDA $47            ; $f0f0: a5 47     
            CMP #$52           ; $f0f2: c9 52     
            BEQ __f0f8         ; $f0f4: f0 02     
            STY $00            ; $f0f6: 84 00     
__f0f8:     INY                ; $f0f8: c8        
            LDA #$37           ; $f0f9: a9 37     
            STA $47            ; $f0fb: 85 47     
            JSR __fa68         ; $f0fd: 20 68 fa  
            .hex 27 47         ; $f100: 27 47     Invalid Opcode - RLA $47
            NOP                ; $f102: ea        
            NOP                ; $f103: ea        
            NOP                ; $f104: ea        
            NOP                ; $f105: ea        
            JSR __fa6e         ; $f106: 20 6e fa  
            LDA $47            ; $f109: a5 47     
            CMP #$6f           ; $f10b: c9 6f     
            BEQ __f111         ; $f10d: f0 02     
            STY $00            ; $f10f: 84 00     
__f111:     INY                ; $f111: c8        
            LDA #$a5           ; $f112: a9 a5     
            STA $0647          ; $f114: 8d 47 06  
            JSR __fb53         ; $f117: 20 53 fb  
            .hex 2f 47 06      ; $f11a: 2f 47 06  Invalid Opcode - RLA $0647
            NOP                ; $f11d: ea        
            NOP                ; $f11e: ea        
            NOP                ; $f11f: ea        
            NOP                ; $f120: ea        
            JSR __fb59         ; $f121: 20 59 fb  
            LDA $0647          ; $f124: ad 47 06  
            CMP #$4a           ; $f127: c9 4a     
            BEQ __f12d         ; $f129: f0 02     
            STY $00            ; $f12b: 84 00     
__f12d:     INY                ; $f12d: c8        
            LDA #$29           ; $f12e: a9 29     
            STA $0647          ; $f130: 8d 47 06  
            JSR __fb64         ; $f133: 20 64 fb  
            .hex 2f 47 06      ; $f136: 2f 47 06  Invalid Opcode - RLA $0647
            NOP                ; $f139: ea        
            NOP                ; $f13a: ea        
            NOP                ; $f13b: ea        
            NOP                ; $f13c: ea        
            JSR __fb69         ; $f13d: 20 69 fb  
            LDA $0647          ; $f140: ad 47 06  
            CMP #$52           ; $f143: c9 52     
            BEQ __f149         ; $f145: f0 02     
            STY $00            ; $f147: 84 00     
__f149:     INY                ; $f149: c8        
            LDA #$37           ; $f14a: a9 37     
            STA $0647          ; $f14c: 8d 47 06  
            JSR __fa68         ; $f14f: 20 68 fa  
            .hex 2f 47 06      ; $f152: 2f 47 06  Invalid Opcode - RLA $0647
            NOP                ; $f155: ea        
            NOP                ; $f156: ea        
            NOP                ; $f157: ea        
            NOP                ; $f158: ea        
            JSR __fa6e         ; $f159: 20 6e fa  
            LDA $0647          ; $f15c: ad 47 06  
            CMP #$6f           ; $f15f: c9 6f     
            BEQ __f165         ; $f161: f0 02     
            STY $00            ; $f163: 84 00     
__f165:     LDA #$a5           ; $f165: a9 a5     
            STA $0647          ; $f167: 8d 47 06  
            LDA #$48           ; $f16a: a9 48     
            STA $45            ; $f16c: 85 45     
            LDA #$05           ; $f16e: a9 05     
            STA $46            ; $f170: 85 46     
            LDY #$ff           ; $f172: a0 ff     
            JSR __fb53         ; $f174: 20 53 fb  
            .hex 33 45         ; $f177: 33 45     Invalid Opcode - RLA ($45),y
            NOP                ; $f179: ea        
            NOP                ; $f17a: ea        
            PHP                ; $f17b: 08        
            PHA                ; $f17c: 48        
            LDY #$dd           ; $f17d: a0 dd     
            PLA                ; $f17f: 68        
            PLP                ; $f180: 28        
            JSR __fb59         ; $f181: 20 59 fb  
            LDA $0647          ; $f184: ad 47 06  
            CMP #$4a           ; $f187: c9 4a     
            BEQ __f18d         ; $f189: f0 02     
            STY $00            ; $f18b: 84 00     
__f18d:     LDY #$ff           ; $f18d: a0 ff     
            LDA #$29           ; $f18f: a9 29     
            STA $0647          ; $f191: 8d 47 06  
            JSR __fb64         ; $f194: 20 64 fb  
            .hex 33 45         ; $f197: 33 45     Invalid Opcode - RLA ($45),y
            NOP                ; $f199: ea        
            NOP                ; $f19a: ea        
            PHP                ; $f19b: 08        
            PHA                ; $f19c: 48        
            LDY #$de           ; $f19d: a0 de     
            PLA                ; $f19f: 68        
            PLP                ; $f1a0: 28        
            JSR __fb69         ; $f1a1: 20 69 fb  
            LDA $0647          ; $f1a4: ad 47 06  
            CMP #$52           ; $f1a7: c9 52     
            BEQ __f1ad         ; $f1a9: f0 02     
            STY $00            ; $f1ab: 84 00     
__f1ad:     LDY #$ff           ; $f1ad: a0 ff     
            LDA #$37           ; $f1af: a9 37     
            STA $0647          ; $f1b1: 8d 47 06  
            JSR __fa68         ; $f1b4: 20 68 fa  
            .hex 33 45         ; $f1b7: 33 45     Invalid Opcode - RLA ($45),y
            NOP                ; $f1b9: ea        
            NOP                ; $f1ba: ea        
            PHP                ; $f1bb: 08        
            PHA                ; $f1bc: 48        
            LDY #$df           ; $f1bd: a0 df     
            PLA                ; $f1bf: 68        
            PLP                ; $f1c0: 28        
            JSR __fa6e         ; $f1c1: 20 6e fa  
            LDA $0647          ; $f1c4: ad 47 06  
            CMP #$6f           ; $f1c7: c9 6f     
            BEQ __f1cd         ; $f1c9: f0 02     
            STY $00            ; $f1cb: 84 00     
__f1cd:     LDY #$e0           ; $f1cd: a0 e0     
            LDX #$ff           ; $f1cf: a2 ff     
            LDA #$a5           ; $f1d1: a9 a5     
            STA $47            ; $f1d3: 85 47     
            JSR __fb53         ; $f1d5: 20 53 fb  
            .hex 37 48         ; $f1d8: 37 48     Invalid Opcode - RLA $48,x
            NOP                ; $f1da: ea        
            NOP                ; $f1db: ea        
            NOP                ; $f1dc: ea        
            NOP                ; $f1dd: ea        
            JSR __fb59         ; $f1de: 20 59 fb  
            LDA $47            ; $f1e1: a5 47     
            CMP #$4a           ; $f1e3: c9 4a     
            BEQ __f1e9         ; $f1e5: f0 02     
            STY $00            ; $f1e7: 84 00     
__f1e9:     INY                ; $f1e9: c8        
            LDA #$29           ; $f1ea: a9 29     
            STA $47            ; $f1ec: 85 47     
            JSR __fb64         ; $f1ee: 20 64 fb  
            .hex 37 48         ; $f1f1: 37 48     Invalid Opcode - RLA $48,x
            NOP                ; $f1f3: ea        
            NOP                ; $f1f4: ea        
            NOP                ; $f1f5: ea        
            NOP                ; $f1f6: ea        
            JSR __fb69         ; $f1f7: 20 69 fb  
            LDA $47            ; $f1fa: a5 47     
            CMP #$52           ; $f1fc: c9 52     
            BEQ __f202         ; $f1fe: f0 02     
            STY $00            ; $f200: 84 00     
__f202:     INY                ; $f202: c8        
            LDA #$37           ; $f203: a9 37     
            STA $47            ; $f205: 85 47     
            JSR __fa68         ; $f207: 20 68 fa  
            .hex 37 48         ; $f20a: 37 48     Invalid Opcode - RLA $48,x
            NOP                ; $f20c: ea        
            NOP                ; $f20d: ea        
            NOP                ; $f20e: ea        
            NOP                ; $f20f: ea        
            JSR __fa6e         ; $f210: 20 6e fa  
            LDA $47            ; $f213: a5 47     
            CMP #$6f           ; $f215: c9 6f     
            BEQ __f21b         ; $f217: f0 02     
            STY $00            ; $f219: 84 00     
__f21b:     LDA #$a5           ; $f21b: a9 a5     
            STA $0647          ; $f21d: 8d 47 06  
            LDY #$ff           ; $f220: a0 ff     
            JSR __fb53         ; $f222: 20 53 fb  
            .hex 3b 48 05      ; $f225: 3b 48 05  Invalid Opcode - RLA $0548,y
            NOP                ; $f228: ea        
            NOP                ; $f229: ea        
            PHP                ; $f22a: 08        
            PHA                ; $f22b: 48        
            LDY #$e3           ; $f22c: a0 e3     
            PLA                ; $f22e: 68        
            PLP                ; $f22f: 28        
            JSR __fb59         ; $f230: 20 59 fb  
            LDA $0647          ; $f233: ad 47 06  
            CMP #$4a           ; $f236: c9 4a     
            BEQ __f23c         ; $f238: f0 02     
            STY $00            ; $f23a: 84 00     
__f23c:     LDY #$ff           ; $f23c: a0 ff     
            LDA #$29           ; $f23e: a9 29     
            STA $0647          ; $f240: 8d 47 06  
            JSR __fb64         ; $f243: 20 64 fb  
            .hex 3b 48 05      ; $f246: 3b 48 05  Invalid Opcode - RLA $0548,y
            NOP                ; $f249: ea        
            NOP                ; $f24a: ea        
            PHP                ; $f24b: 08        
            PHA                ; $f24c: 48        
            LDY #$e4           ; $f24d: a0 e4     
            PLA                ; $f24f: 68        
            PLP                ; $f250: 28        
            JSR __fb69         ; $f251: 20 69 fb  
            LDA $0647          ; $f254: ad 47 06  
            CMP #$52           ; $f257: c9 52     
            BEQ __f25d         ; $f259: f0 02     
            STY $00            ; $f25b: 84 00     
__f25d:     LDY #$ff           ; $f25d: a0 ff     
            LDA #$37           ; $f25f: a9 37     
            STA $0647          ; $f261: 8d 47 06  
            JSR __fa68         ; $f264: 20 68 fa  
            .hex 3b 48 05      ; $f267: 3b 48 05  Invalid Opcode - RLA $0548,y
            NOP                ; $f26a: ea        
            NOP                ; $f26b: ea        
            PHP                ; $f26c: 08        
            PHA                ; $f26d: 48        
            LDY #$e5           ; $f26e: a0 e5     
            PLA                ; $f270: 68        
            PLP                ; $f271: 28        
            JSR __fa6e         ; $f272: 20 6e fa  
            LDA $0647          ; $f275: ad 47 06  
            CMP #$6f           ; $f278: c9 6f     
            BEQ __f27e         ; $f27a: f0 02     
            STY $00            ; $f27c: 84 00     
__f27e:     LDY #$e6           ; $f27e: a0 e6     
            LDX #$ff           ; $f280: a2 ff     
            LDA #$a5           ; $f282: a9 a5     
            STA $0647          ; $f284: 8d 47 06  
            JSR __fb53         ; $f287: 20 53 fb  
            .hex 3f 48 05      ; $f28a: 3f 48 05  Invalid Opcode - RLA $0548,x
            NOP                ; $f28d: ea        
            NOP                ; $f28e: ea        
            NOP                ; $f28f: ea        
            NOP                ; $f290: ea        
            JSR __fb59         ; $f291: 20 59 fb  
            LDA $0647          ; $f294: ad 47 06  
            CMP #$4a           ; $f297: c9 4a     
            BEQ __f29d         ; $f299: f0 02     
            STY $00            ; $f29b: 84 00     
__f29d:     INY                ; $f29d: c8        
            LDA #$29           ; $f29e: a9 29     
            STA $0647          ; $f2a0: 8d 47 06  
            JSR __fb64         ; $f2a3: 20 64 fb  
            .hex 3f 48 05      ; $f2a6: 3f 48 05  Invalid Opcode - RLA $0548,x
            NOP                ; $f2a9: ea        
            NOP                ; $f2aa: ea        
            NOP                ; $f2ab: ea        
            NOP                ; $f2ac: ea        
            JSR __fb69         ; $f2ad: 20 69 fb  
            LDA $0647          ; $f2b0: ad 47 06  
            CMP #$52           ; $f2b3: c9 52     
            BEQ __f2b9         ; $f2b5: f0 02     
            STY $00            ; $f2b7: 84 00     
__f2b9:     INY                ; $f2b9: c8        
            LDA #$37           ; $f2ba: a9 37     
            STA $0647          ; $f2bc: 8d 47 06  
            JSR __fa68         ; $f2bf: 20 68 fa  
            .hex 3f 48 05      ; $f2c2: 3f 48 05  Invalid Opcode - RLA $0548,x
            NOP                ; $f2c5: ea        
            NOP                ; $f2c6: ea        
            NOP                ; $f2c7: ea        
            NOP                ; $f2c8: ea        
            JSR __fa6e         ; $f2c9: 20 6e fa  
            LDA $0647          ; $f2cc: ad 47 06  
            CMP #$6f           ; $f2cf: c9 6f     
            BEQ __f2d5         ; $f2d1: f0 02     
            STY $00            ; $f2d3: 84 00     
__f2d5:     RTS                ; $f2d5: 60        

;-------------------------------------------------------------------------------
__f2d6:     LDA #$ff           ; $f2d6: a9 ff     
            STA $01            ; $f2d8: 85 01     
            LDY #$e9           ; $f2da: a0 e9     
            LDX #$02           ; $f2dc: a2 02     
            LDA #$47           ; $f2de: a9 47     
            STA $47            ; $f2e0: 85 47     
            LDA #$06           ; $f2e2: a9 06     
            STA $48            ; $f2e4: 85 48     
            LDA #$a5           ; $f2e6: a9 a5     
            STA $0647          ; $f2e8: 8d 47 06  
            JSR __fb1d         ; $f2eb: 20 1d fb  
            .hex 43 45         ; $f2ee: 43 45     Invalid Opcode - SRE ($45,x)
            NOP                ; $f2f0: ea        
            NOP                ; $f2f1: ea        
            NOP                ; $f2f2: ea        
            NOP                ; $f2f3: ea        
            JSR __fb23         ; $f2f4: 20 23 fb  
            LDA $0647          ; $f2f7: ad 47 06  
            CMP #$52           ; $f2fa: c9 52     
            BEQ __f300         ; $f2fc: f0 02     
            STY $00            ; $f2fe: 84 00     
__f300:     INY                ; $f300: c8        
            LDA #$29           ; $f301: a9 29     
            STA $0647          ; $f303: 8d 47 06  
            JSR __fb2e         ; $f306: 20 2e fb  
            .hex 43 45         ; $f309: 43 45     Invalid Opcode - SRE ($45,x)
            NOP                ; $f30b: ea        
            NOP                ; $f30c: ea        
            NOP                ; $f30d: ea        
            NOP                ; $f30e: ea        
            JSR __fb33         ; $f30f: 20 33 fb  
            LDA $0647          ; $f312: ad 47 06  
            CMP #$14           ; $f315: c9 14     
            BEQ __f31b         ; $f317: f0 02     
            STY $00            ; $f319: 84 00     
__f31b:     INY                ; $f31b: c8        
            LDA #$37           ; $f31c: a9 37     
            STA $0647          ; $f31e: 8d 47 06  
            JSR __fb40         ; $f321: 20 40 fb  
            .hex 43 45         ; $f324: 43 45     Invalid Opcode - SRE ($45,x)
            NOP                ; $f326: ea        
            NOP                ; $f327: ea        
            NOP                ; $f328: ea        
            NOP                ; $f329: ea        
            JSR __fb46         ; $f32a: 20 46 fb  
            LDA $0647          ; $f32d: ad 47 06  
            CMP #$1b           ; $f330: c9 1b     
            BEQ __f336         ; $f332: f0 02     
            STY $00            ; $f334: 84 00     
__f336:     INY                ; $f336: c8        
            LDA #$a5           ; $f337: a9 a5     
            STA $47            ; $f339: 85 47     
            JSR __fb1d         ; $f33b: 20 1d fb  
            .hex 47 47         ; $f33e: 47 47     Invalid Opcode - SRE $47
            NOP                ; $f340: ea        
            NOP                ; $f341: ea        
            NOP                ; $f342: ea        
            NOP                ; $f343: ea        
            JSR __fb23         ; $f344: 20 23 fb  
            LDA $47            ; $f347: a5 47     
            CMP #$52           ; $f349: c9 52     
            BEQ __f34f         ; $f34b: f0 02     
            STY $00            ; $f34d: 84 00     
__f34f:     INY                ; $f34f: c8        
            LDA #$29           ; $f350: a9 29     
            STA $47            ; $f352: 85 47     
            JSR __fb2e         ; $f354: 20 2e fb  
            .hex 47 47         ; $f357: 47 47     Invalid Opcode - SRE $47
            NOP                ; $f359: ea        
            NOP                ; $f35a: ea        
            NOP                ; $f35b: ea        
            NOP                ; $f35c: ea        
            JSR __fb33         ; $f35d: 20 33 fb  
            LDA $47            ; $f360: a5 47     
            CMP #$14           ; $f362: c9 14     
            BEQ __f368         ; $f364: f0 02     
            STY $00            ; $f366: 84 00     
__f368:     INY                ; $f368: c8        
            LDA #$37           ; $f369: a9 37     
            STA $47            ; $f36b: 85 47     
            JSR __fb40         ; $f36d: 20 40 fb  
            .hex 47 47         ; $f370: 47 47     Invalid Opcode - SRE $47
            NOP                ; $f372: ea        
            NOP                ; $f373: ea        
            NOP                ; $f374: ea        
            NOP                ; $f375: ea        
            JSR __fb46         ; $f376: 20 46 fb  
            LDA $47            ; $f379: a5 47     
            CMP #$1b           ; $f37b: c9 1b     
            BEQ __f381         ; $f37d: f0 02     
            STY $00            ; $f37f: 84 00     
__f381:     INY                ; $f381: c8        
            LDA #$a5           ; $f382: a9 a5     
            STA $0647          ; $f384: 8d 47 06  
            JSR __fb1d         ; $f387: 20 1d fb  
            .hex 4f 47 06      ; $f38a: 4f 47 06  Invalid Opcode - SRE $0647
            NOP                ; $f38d: ea        
            NOP                ; $f38e: ea        
            NOP                ; $f38f: ea        
            NOP                ; $f390: ea        
            JSR __fb23         ; $f391: 20 23 fb  
            LDA $0647          ; $f394: ad 47 06  
            CMP #$52           ; $f397: c9 52     
            BEQ __f39d         ; $f399: f0 02     
            STY $00            ; $f39b: 84 00     
__f39d:     INY                ; $f39d: c8        
            LDA #$29           ; $f39e: a9 29     
            STA $0647          ; $f3a0: 8d 47 06  
            JSR __fb2e         ; $f3a3: 20 2e fb  
            .hex 4f 47 06      ; $f3a6: 4f 47 06  Invalid Opcode - SRE $0647
            NOP                ; $f3a9: ea        
            NOP                ; $f3aa: ea        
            NOP                ; $f3ab: ea        
            NOP                ; $f3ac: ea        
            JSR __fb33         ; $f3ad: 20 33 fb  
            LDA $0647          ; $f3b0: ad 47 06  
            CMP #$14           ; $f3b3: c9 14     
            BEQ __f3b9         ; $f3b5: f0 02     
            STY $00            ; $f3b7: 84 00     
__f3b9:     INY                ; $f3b9: c8        
            LDA #$37           ; $f3ba: a9 37     
            STA $0647          ; $f3bc: 8d 47 06  
            JSR __fb40         ; $f3bf: 20 40 fb  
            .hex 4f 47 06      ; $f3c2: 4f 47 06  Invalid Opcode - SRE $0647
            NOP                ; $f3c5: ea        
            NOP                ; $f3c6: ea        
            NOP                ; $f3c7: ea        
            NOP                ; $f3c8: ea        
            JSR __fb46         ; $f3c9: 20 46 fb  
            LDA $0647          ; $f3cc: ad 47 06  
            CMP #$1b           ; $f3cf: c9 1b     
            BEQ __f3d5         ; $f3d1: f0 02     
            STY $00            ; $f3d3: 84 00     
__f3d5:     LDA #$a5           ; $f3d5: a9 a5     
            STA $0647          ; $f3d7: 8d 47 06  
            LDA #$48           ; $f3da: a9 48     
            STA $45            ; $f3dc: 85 45     
            LDA #$05           ; $f3de: a9 05     
            STA $46            ; $f3e0: 85 46     
            LDY #$ff           ; $f3e2: a0 ff     
            JSR __fb1d         ; $f3e4: 20 1d fb  
            .hex 53 45         ; $f3e7: 53 45     Invalid Opcode - SRE ($45),y
            NOP                ; $f3e9: ea        
            NOP                ; $f3ea: ea        
            PHP                ; $f3eb: 08        
            PHA                ; $f3ec: 48        
            LDY #$f2           ; $f3ed: a0 f2     
            PLA                ; $f3ef: 68        
            PLP                ; $f3f0: 28        
            JSR __fb23         ; $f3f1: 20 23 fb  
            LDA $0647          ; $f3f4: ad 47 06  
            CMP #$52           ; $f3f7: c9 52     
            BEQ __f3fd         ; $f3f9: f0 02     
            STY $00            ; $f3fb: 84 00     
__f3fd:     LDY #$ff           ; $f3fd: a0 ff     
            LDA #$29           ; $f3ff: a9 29     
            STA $0647          ; $f401: 8d 47 06  
            JSR __fb2e         ; $f404: 20 2e fb  
            .hex 53 45         ; $f407: 53 45     Invalid Opcode - SRE ($45),y
            NOP                ; $f409: ea        
            NOP                ; $f40a: ea        
            PHP                ; $f40b: 08        
            PHA                ; $f40c: 48        
            LDY #$f3           ; $f40d: a0 f3     
            PLA                ; $f40f: 68        
            PLP                ; $f410: 28        
            JSR __fb33         ; $f411: 20 33 fb  
            LDA $0647          ; $f414: ad 47 06  
            CMP #$14           ; $f417: c9 14     
            BEQ __f41d         ; $f419: f0 02     
            STY $00            ; $f41b: 84 00     
__f41d:     LDY #$ff           ; $f41d: a0 ff     
            LDA #$37           ; $f41f: a9 37     
            STA $0647          ; $f421: 8d 47 06  
            JSR __fb40         ; $f424: 20 40 fb  
            .hex 53 45         ; $f427: 53 45     Invalid Opcode - SRE ($45),y
            NOP                ; $f429: ea        
            NOP                ; $f42a: ea        
            PHP                ; $f42b: 08        
            PHA                ; $f42c: 48        
            LDY #$f4           ; $f42d: a0 f4     
            PLA                ; $f42f: 68        
            PLP                ; $f430: 28        
            JSR __fb46         ; $f431: 20 46 fb  
            LDA $0647          ; $f434: ad 47 06  
            CMP #$1b           ; $f437: c9 1b     
            BEQ __f43d         ; $f439: f0 02     
            STY $00            ; $f43b: 84 00     
__f43d:     LDY #$f5           ; $f43d: a0 f5     
            LDX #$ff           ; $f43f: a2 ff     
            LDA #$a5           ; $f441: a9 a5     
            STA $47            ; $f443: 85 47     
            JSR __fb1d         ; $f445: 20 1d fb  
            .hex 57 48         ; $f448: 57 48     Invalid Opcode - SRE $48,x
            NOP                ; $f44a: ea        
            NOP                ; $f44b: ea        
            NOP                ; $f44c: ea        
            NOP                ; $f44d: ea        
            JSR __fb23         ; $f44e: 20 23 fb  
            LDA $47            ; $f451: a5 47     
            CMP #$52           ; $f453: c9 52     
            BEQ __f459         ; $f455: f0 02     
            STY $00            ; $f457: 84 00     
__f459:     INY                ; $f459: c8        
            LDA #$29           ; $f45a: a9 29     
            STA $47            ; $f45c: 85 47     
            JSR __fb2e         ; $f45e: 20 2e fb  
            .hex 57 48         ; $f461: 57 48     Invalid Opcode - SRE $48,x
            NOP                ; $f463: ea        
            NOP                ; $f464: ea        
            NOP                ; $f465: ea        
            NOP                ; $f466: ea        
            JSR __fb33         ; $f467: 20 33 fb  
            LDA $47            ; $f46a: a5 47     
            CMP #$14           ; $f46c: c9 14     
            BEQ __f472         ; $f46e: f0 02     
            STY $00            ; $f470: 84 00     
__f472:     INY                ; $f472: c8        
            LDA #$37           ; $f473: a9 37     
            STA $47            ; $f475: 85 47     
            JSR __fb40         ; $f477: 20 40 fb  
            .hex 57 48         ; $f47a: 57 48     Invalid Opcode - SRE $48,x
            NOP                ; $f47c: ea        
            NOP                ; $f47d: ea        
            NOP                ; $f47e: ea        
            NOP                ; $f47f: ea        
            JSR __fb46         ; $f480: 20 46 fb  
            LDA $47            ; $f483: a5 47     
            CMP #$1b           ; $f485: c9 1b     
            BEQ __f48b         ; $f487: f0 02     
            STY $00            ; $f489: 84 00     
__f48b:     LDA #$a5           ; $f48b: a9 a5     
            STA $0647          ; $f48d: 8d 47 06  
            LDY #$ff           ; $f490: a0 ff     
            JSR __fb1d         ; $f492: 20 1d fb  
            .hex 5b 48 05      ; $f495: 5b 48 05  Invalid Opcode - SRE $0548,y
            NOP                ; $f498: ea        
            NOP                ; $f499: ea        
            PHP                ; $f49a: 08        
            PHA                ; $f49b: 48        
            LDY #$f8           ; $f49c: a0 f8     
            PLA                ; $f49e: 68        
            PLP                ; $f49f: 28        
            JSR __fb23         ; $f4a0: 20 23 fb  
            LDA $0647          ; $f4a3: ad 47 06  
            CMP #$52           ; $f4a6: c9 52     
            BEQ __f4ac         ; $f4a8: f0 02     
            STY $00            ; $f4aa: 84 00     
__f4ac:     LDY #$ff           ; $f4ac: a0 ff     
            LDA #$29           ; $f4ae: a9 29     
            STA $0647          ; $f4b0: 8d 47 06  
            JSR __fb2e         ; $f4b3: 20 2e fb  
            .hex 5b 48 05      ; $f4b6: 5b 48 05  Invalid Opcode - SRE $0548,y
            NOP                ; $f4b9: ea        
            NOP                ; $f4ba: ea        
            PHP                ; $f4bb: 08        
            PHA                ; $f4bc: 48        
            LDY #$f9           ; $f4bd: a0 f9     
            PLA                ; $f4bf: 68        
            PLP                ; $f4c0: 28        
            JSR __fb33         ; $f4c1: 20 33 fb  
            LDA $0647          ; $f4c4: ad 47 06  
            CMP #$14           ; $f4c7: c9 14     
            BEQ __f4cd         ; $f4c9: f0 02     
            STY $00            ; $f4cb: 84 00     
__f4cd:     LDY #$ff           ; $f4cd: a0 ff     
            LDA #$37           ; $f4cf: a9 37     
            STA $0647          ; $f4d1: 8d 47 06  
            JSR __fb40         ; $f4d4: 20 40 fb  
            .hex 5b 48 05      ; $f4d7: 5b 48 05  Invalid Opcode - SRE $0548,y
            NOP                ; $f4da: ea        
            NOP                ; $f4db: ea        
            PHP                ; $f4dc: 08        
            PHA                ; $f4dd: 48        
            LDY #$fa           ; $f4de: a0 fa     
            PLA                ; $f4e0: 68        
            PLP                ; $f4e1: 28        
            JSR __fb46         ; $f4e2: 20 46 fb  
            LDA $0647          ; $f4e5: ad 47 06  
            CMP #$1b           ; $f4e8: c9 1b     
            BEQ __f4ee         ; $f4ea: f0 02     
            STY $00            ; $f4ec: 84 00     
__f4ee:     LDY #$fb           ; $f4ee: a0 fb     
            LDX #$ff           ; $f4f0: a2 ff     
            LDA #$a5           ; $f4f2: a9 a5     
            STA $0647          ; $f4f4: 8d 47 06  
            JSR __fb1d         ; $f4f7: 20 1d fb  
            .hex 5f 48 05      ; $f4fa: 5f 48 05  Invalid Opcode - SRE $0548,x
            NOP                ; $f4fd: ea        
            NOP                ; $f4fe: ea        
            NOP                ; $f4ff: ea        
            NOP                ; $f500: ea        
            JSR __fb23         ; $f501: 20 23 fb  
            LDA $0647          ; $f504: ad 47 06  
            CMP #$52           ; $f507: c9 52     
            BEQ __f50d         ; $f509: f0 02     
            STY $00            ; $f50b: 84 00     
__f50d:     INY                ; $f50d: c8        
            LDA #$29           ; $f50e: a9 29     
            STA $0647          ; $f510: 8d 47 06  
            JSR __fb2e         ; $f513: 20 2e fb  
            .hex 5f 48 05      ; $f516: 5f 48 05  Invalid Opcode - SRE $0548,x
            NOP                ; $f519: ea        
            NOP                ; $f51a: ea        
            NOP                ; $f51b: ea        
            NOP                ; $f51c: ea        
            JSR __fb33         ; $f51d: 20 33 fb  
            LDA $0647          ; $f520: ad 47 06  
            CMP #$14           ; $f523: c9 14     
            BEQ __f529         ; $f525: f0 02     
            STY $00            ; $f527: 84 00     
__f529:     INY                ; $f529: c8        
            LDA #$37           ; $f52a: a9 37     
            STA $0647          ; $f52c: 8d 47 06  
            JSR __fb40         ; $f52f: 20 40 fb  
            .hex 5f 48 05      ; $f532: 5f 48 05  Invalid Opcode - SRE $0548,x
            NOP                ; $f535: ea        
            NOP                ; $f536: ea        
            NOP                ; $f537: ea        
            NOP                ; $f538: ea        
            JSR __fb46         ; $f539: 20 46 fb  
            LDA $0647          ; $f53c: ad 47 06  
            CMP #$1b           ; $f53f: c9 1b     
            BEQ __f545         ; $f541: f0 02     
            STY $00            ; $f543: 84 00     
__f545:     RTS                ; $f545: 60        

;-------------------------------------------------------------------------------
__f546:     LDA #$ff           ; $f546: a9 ff     
            STA $01            ; $f548: 85 01     
            LDY #$01           ; $f54a: a0 01     
            LDX #$02           ; $f54c: a2 02     
            LDA #$47           ; $f54e: a9 47     
            STA $47            ; $f550: 85 47     
            LDA #$06           ; $f552: a9 06     
            STA $48            ; $f554: 85 48     
            LDA #$a5           ; $f556: a9 a5     
            STA $0647          ; $f558: 8d 47 06  
            JSR __fae9         ; $f55b: 20 e9 fa  
            .hex 63 45         ; $f55e: 63 45     Invalid Opcode - RRA ($45,x)
            NOP                ; $f560: ea        
            NOP                ; $f561: ea        
            NOP                ; $f562: ea        
            NOP                ; $f563: ea        
            JSR __faef         ; $f564: 20 ef fa  
            LDA $0647          ; $f567: ad 47 06  
            CMP #$52           ; $f56a: c9 52     
            BEQ __f570         ; $f56c: f0 02     
            STY $00            ; $f56e: 84 00     
__f570:     INY                ; $f570: c8        
            LDA #$29           ; $f571: a9 29     
            STA $0647          ; $f573: 8d 47 06  
            JSR __fafa         ; $f576: 20 fa fa  
            .hex 63 45         ; $f579: 63 45     Invalid Opcode - RRA ($45,x)
            NOP                ; $f57b: ea        
            NOP                ; $f57c: ea        
            NOP                ; $f57d: ea        
            NOP                ; $f57e: ea        
            JSR __faff         ; $f57f: 20 ff fa  
            LDA $0647          ; $f582: ad 47 06  
            CMP #$14           ; $f585: c9 14     
            BEQ __f58b         ; $f587: f0 02     
            STY $00            ; $f589: 84 00     
__f58b:     INY                ; $f58b: c8        
            LDA #$37           ; $f58c: a9 37     
            STA $0647          ; $f58e: 8d 47 06  
            JSR __fb0a         ; $f591: 20 0a fb  
            .hex 63 45         ; $f594: 63 45     Invalid Opcode - RRA ($45,x)
            NOP                ; $f596: ea        
            NOP                ; $f597: ea        
            NOP                ; $f598: ea        
            NOP                ; $f599: ea        
            JSR __fb10         ; $f59a: 20 10 fb  
            LDA $0647          ; $f59d: ad 47 06  
            CMP #$9b           ; $f5a0: c9 9b     
            BEQ __f5a6         ; $f5a2: f0 02     
            STY $00            ; $f5a4: 84 00     
__f5a6:     INY                ; $f5a6: c8        
            LDA #$a5           ; $f5a7: a9 a5     
            STA $47            ; $f5a9: 85 47     
            JSR __fae9         ; $f5ab: 20 e9 fa  
            .hex 67 47         ; $f5ae: 67 47     Invalid Opcode - RRA $47
            NOP                ; $f5b0: ea        
            NOP                ; $f5b1: ea        
            NOP                ; $f5b2: ea        
            NOP                ; $f5b3: ea        
            JSR __faef         ; $f5b4: 20 ef fa  
            LDA $47            ; $f5b7: a5 47     
            CMP #$52           ; $f5b9: c9 52     
            BEQ __f5bf         ; $f5bb: f0 02     
            STY $00            ; $f5bd: 84 00     
__f5bf:     INY                ; $f5bf: c8        
            LDA #$29           ; $f5c0: a9 29     
            STA $47            ; $f5c2: 85 47     
            JSR __fafa         ; $f5c4: 20 fa fa  
            .hex 67 47         ; $f5c7: 67 47     Invalid Opcode - RRA $47
            NOP                ; $f5c9: ea        
            NOP                ; $f5ca: ea        
            NOP                ; $f5cb: ea        
            NOP                ; $f5cc: ea        
            JSR __faff         ; $f5cd: 20 ff fa  
            LDA $47            ; $f5d0: a5 47     
            CMP #$14           ; $f5d2: c9 14     
            BEQ __f5d8         ; $f5d4: f0 02     
            STY $00            ; $f5d6: 84 00     
__f5d8:     INY                ; $f5d8: c8        
            LDA #$37           ; $f5d9: a9 37     
            STA $47            ; $f5db: 85 47     
            JSR __fb0a         ; $f5dd: 20 0a fb  
            .hex 67 47         ; $f5e0: 67 47     Invalid Opcode - RRA $47
            NOP                ; $f5e2: ea        
            NOP                ; $f5e3: ea        
            NOP                ; $f5e4: ea        
            NOP                ; $f5e5: ea        
            JSR __fb10         ; $f5e6: 20 10 fb  
            LDA $47            ; $f5e9: a5 47     
            CMP #$9b           ; $f5eb: c9 9b     
            BEQ __f5f1         ; $f5ed: f0 02     
            STY $00            ; $f5ef: 84 00     
__f5f1:     INY                ; $f5f1: c8        
            LDA #$a5           ; $f5f2: a9 a5     
            STA $0647          ; $f5f4: 8d 47 06  
            JSR __fae9         ; $f5f7: 20 e9 fa  
            .hex 6f 47 06      ; $f5fa: 6f 47 06  Invalid Opcode - RRA $0647
            NOP                ; $f5fd: ea        
            NOP                ; $f5fe: ea        
            NOP                ; $f5ff: ea        
            NOP                ; $f600: ea        
            JSR __faef         ; $f601: 20 ef fa  
            LDA $0647          ; $f604: ad 47 06  
            CMP #$52           ; $f607: c9 52     
            BEQ __f60d         ; $f609: f0 02     
            STY $00            ; $f60b: 84 00     
__f60d:     INY                ; $f60d: c8        
            LDA #$29           ; $f60e: a9 29     
            STA $0647          ; $f610: 8d 47 06  
            JSR __fafa         ; $f613: 20 fa fa  
            .hex 6f 47 06      ; $f616: 6f 47 06  Invalid Opcode - RRA $0647
            NOP                ; $f619: ea        
            NOP                ; $f61a: ea        
            NOP                ; $f61b: ea        
            NOP                ; $f61c: ea        
            JSR __faff         ; $f61d: 20 ff fa  
            LDA $0647          ; $f620: ad 47 06  
            CMP #$14           ; $f623: c9 14     
            BEQ __f629         ; $f625: f0 02     
            STY $00            ; $f627: 84 00     
__f629:     INY                ; $f629: c8        
            LDA #$37           ; $f62a: a9 37     
            STA $0647          ; $f62c: 8d 47 06  
            JSR __fb0a         ; $f62f: 20 0a fb  
            .hex 6f 47 06      ; $f632: 6f 47 06  Invalid Opcode - RRA $0647
            NOP                ; $f635: ea        
            NOP                ; $f636: ea        
            NOP                ; $f637: ea        
            NOP                ; $f638: ea        
            JSR __fb10         ; $f639: 20 10 fb  
            LDA $0647          ; $f63c: ad 47 06  
            CMP #$9b           ; $f63f: c9 9b     
            BEQ __f645         ; $f641: f0 02     
            STY $00            ; $f643: 84 00     
__f645:     LDA #$a5           ; $f645: a9 a5     
            STA $0647          ; $f647: 8d 47 06  
            LDA #$48           ; $f64a: a9 48     
            STA $45            ; $f64c: 85 45     
            LDA #$05           ; $f64e: a9 05     
            STA $46            ; $f650: 85 46     
            LDY #$ff           ; $f652: a0 ff     
            JSR __fae9         ; $f654: 20 e9 fa  
            .hex 73 45         ; $f657: 73 45     Invalid Opcode - RRA ($45),y
            NOP                ; $f659: ea        
            NOP                ; $f65a: ea        
            PHP                ; $f65b: 08        
            PHA                ; $f65c: 48        
            LDY #$0a           ; $f65d: a0 0a     
            PLA                ; $f65f: 68        
            PLP                ; $f660: 28        
            JSR __faef         ; $f661: 20 ef fa  
            LDA $0647          ; $f664: ad 47 06  
            CMP #$52           ; $f667: c9 52     
            BEQ __f66d         ; $f669: f0 02     
            STY $00            ; $f66b: 84 00     
__f66d:     LDY #$ff           ; $f66d: a0 ff     
            LDA #$29           ; $f66f: a9 29     
            STA $0647          ; $f671: 8d 47 06  
            JSR __fafa         ; $f674: 20 fa fa  
            .hex 73 45         ; $f677: 73 45     Invalid Opcode - RRA ($45),y
            NOP                ; $f679: ea        
            NOP                ; $f67a: ea        
            PHP                ; $f67b: 08        
            PHA                ; $f67c: 48        
            LDY #$0b           ; $f67d: a0 0b     
            PLA                ; $f67f: 68        
            PLP                ; $f680: 28        
            JSR __faff         ; $f681: 20 ff fa  
            LDA $0647          ; $f684: ad 47 06  
            CMP #$14           ; $f687: c9 14     
            BEQ __f68d         ; $f689: f0 02     
            STY $00            ; $f68b: 84 00     
__f68d:     LDY #$ff           ; $f68d: a0 ff     
            LDA #$37           ; $f68f: a9 37     
            STA $0647          ; $f691: 8d 47 06  
            JSR __fb0a         ; $f694: 20 0a fb  
            .hex 73 45         ; $f697: 73 45     Invalid Opcode - RRA ($45),y
            NOP                ; $f699: ea        
            NOP                ; $f69a: ea        
            PHP                ; $f69b: 08        
            PHA                ; $f69c: 48        
            LDY #$0c           ; $f69d: a0 0c     
            PLA                ; $f69f: 68        
            PLP                ; $f6a0: 28        
            JSR __fb10         ; $f6a1: 20 10 fb  
            LDA $0647          ; $f6a4: ad 47 06  
            CMP #$9b           ; $f6a7: c9 9b     
            BEQ __f6ad         ; $f6a9: f0 02     
            STY $00            ; $f6ab: 84 00     
__f6ad:     LDY #$0d           ; $f6ad: a0 0d     
            LDX #$ff           ; $f6af: a2 ff     
            LDA #$a5           ; $f6b1: a9 a5     
            STA $47            ; $f6b3: 85 47     
            JSR __fae9         ; $f6b5: 20 e9 fa  
            .hex 77 48         ; $f6b8: 77 48     Invalid Opcode - RRA $48,x
            NOP                ; $f6ba: ea        
            NOP                ; $f6bb: ea        
            NOP                ; $f6bc: ea        
            NOP                ; $f6bd: ea        
            JSR __faef         ; $f6be: 20 ef fa  
            LDA $47            ; $f6c1: a5 47     
            CMP #$52           ; $f6c3: c9 52     
            BEQ __f6c9         ; $f6c5: f0 02     
            STY $00            ; $f6c7: 84 00     
__f6c9:     INY                ; $f6c9: c8        
            LDA #$29           ; $f6ca: a9 29     
            STA $47            ; $f6cc: 85 47     
            JSR __fafa         ; $f6ce: 20 fa fa  
            .hex 77 48         ; $f6d1: 77 48     Invalid Opcode - RRA $48,x
            NOP                ; $f6d3: ea        
            NOP                ; $f6d4: ea        
            NOP                ; $f6d5: ea        
            NOP                ; $f6d6: ea        
            JSR __faff         ; $f6d7: 20 ff fa  
            LDA $47            ; $f6da: a5 47     
            CMP #$14           ; $f6dc: c9 14     
            BEQ __f6e2         ; $f6de: f0 02     
            STY $00            ; $f6e0: 84 00     
__f6e2:     INY                ; $f6e2: c8        
            LDA #$37           ; $f6e3: a9 37     
            STA $47            ; $f6e5: 85 47     
            JSR __fb0a         ; $f6e7: 20 0a fb  
            .hex 77 48         ; $f6ea: 77 48     Invalid Opcode - RRA $48,x
            NOP                ; $f6ec: ea        
            NOP                ; $f6ed: ea        
            NOP                ; $f6ee: ea        
            NOP                ; $f6ef: ea        
            JSR __fb10         ; $f6f0: 20 10 fb  
            LDA $47            ; $f6f3: a5 47     
            CMP #$9b           ; $f6f5: c9 9b     
            BEQ __f6fb         ; $f6f7: f0 02     
            STY $00            ; $f6f9: 84 00     
__f6fb:     LDA #$a5           ; $f6fb: a9 a5     
            STA $0647          ; $f6fd: 8d 47 06  
            LDY #$ff           ; $f700: a0 ff     
            JSR __fae9         ; $f702: 20 e9 fa  
            .hex 7b 48 05      ; $f705: 7b 48 05  Invalid Opcode - RRA $0548,y
            NOP                ; $f708: ea        
            NOP                ; $f709: ea        
            PHP                ; $f70a: 08        
            PHA                ; $f70b: 48        
            LDY #$10           ; $f70c: a0 10     
            PLA                ; $f70e: 68        
            PLP                ; $f70f: 28        
            JSR __faef         ; $f710: 20 ef fa  
            LDA $0647          ; $f713: ad 47 06  
            CMP #$52           ; $f716: c9 52     
            BEQ __f71c         ; $f718: f0 02     
            STY $00            ; $f71a: 84 00     
__f71c:     LDY #$ff           ; $f71c: a0 ff     
            LDA #$29           ; $f71e: a9 29     
            STA $0647          ; $f720: 8d 47 06  
            JSR __fafa         ; $f723: 20 fa fa  
            .hex 7b 48 05      ; $f726: 7b 48 05  Invalid Opcode - RRA $0548,y
            NOP                ; $f729: ea        
            NOP                ; $f72a: ea        
            PHP                ; $f72b: 08        
            PHA                ; $f72c: 48        
            LDY #$11           ; $f72d: a0 11     
            PLA                ; $f72f: 68        
            PLP                ; $f730: 28        
            JSR __faff         ; $f731: 20 ff fa  
            LDA $0647          ; $f734: ad 47 06  
            CMP #$14           ; $f737: c9 14     
            BEQ __f73d         ; $f739: f0 02     
            STY $00            ; $f73b: 84 00     
__f73d:     LDY #$ff           ; $f73d: a0 ff     
            LDA #$37           ; $f73f: a9 37     
            STA $0647          ; $f741: 8d 47 06  
            JSR __fb0a         ; $f744: 20 0a fb  
            .hex 7b 48 05      ; $f747: 7b 48 05  Invalid Opcode - RRA $0548,y
            NOP                ; $f74a: ea        
            NOP                ; $f74b: ea        
            PHP                ; $f74c: 08        
            PHA                ; $f74d: 48        
            LDY #$12           ; $f74e: a0 12     
            PLA                ; $f750: 68        
            PLP                ; $f751: 28        
            JSR __fb10         ; $f752: 20 10 fb  
            LDA $0647          ; $f755: ad 47 06  
            CMP #$9b           ; $f758: c9 9b     
            BEQ __f75e         ; $f75a: f0 02     
            STY $00            ; $f75c: 84 00     
__f75e:     LDY #$13           ; $f75e: a0 13     
            LDX #$ff           ; $f760: a2 ff     
            LDA #$a5           ; $f762: a9 a5     
            STA $0647          ; $f764: 8d 47 06  
            JSR __fae9         ; $f767: 20 e9 fa  
            .hex 7f 48 05      ; $f76a: 7f 48 05  Invalid Opcode - RRA $0548,x
            NOP                ; $f76d: ea        
            NOP                ; $f76e: ea        
            NOP                ; $f76f: ea        
            NOP                ; $f770: ea        
            JSR __faef         ; $f771: 20 ef fa  
            LDA $0647          ; $f774: ad 47 06  
            CMP #$52           ; $f777: c9 52     
            BEQ __f77d         ; $f779: f0 02     
            STY $00            ; $f77b: 84 00     
__f77d:     INY                ; $f77d: c8        
            LDA #$29           ; $f77e: a9 29     
            STA $0647          ; $f780: 8d 47 06  
            JSR __fafa         ; $f783: 20 fa fa  
            .hex 7f 48 05      ; $f786: 7f 48 05  Invalid Opcode - RRA $0548,x
            NOP                ; $f789: ea        
            NOP                ; $f78a: ea        
            NOP                ; $f78b: ea        
            NOP                ; $f78c: ea        
            JSR __faff         ; $f78d: 20 ff fa  
            LDA $0647          ; $f790: ad 47 06  
            CMP #$14           ; $f793: c9 14     
            BEQ __f799         ; $f795: f0 02     
            STY $00            ; $f797: 84 00     
__f799:     INY                ; $f799: c8        
            LDA #$37           ; $f79a: a9 37     
            STA $0647          ; $f79c: 8d 47 06  
            JSR __fb0a         ; $f79f: 20 0a fb  
            .hex 7f 48 05      ; $f7a2: 7f 48 05  Invalid Opcode - RRA $0548,x
            NOP                ; $f7a5: ea        
            NOP                ; $f7a6: ea        
            NOP                ; $f7a7: ea        
            NOP                ; $f7a8: ea        
            JSR __fb10         ; $f7a9: 20 10 fb  
            LDA $0647          ; $f7ac: ad 47 06  
            CMP #$9b           ; $f7af: c9 9b     
            BEQ __f7b5         ; $f7b1: f0 02     
            STY $00            ; $f7b3: 84 00     
__f7b5:     RTS                ; $f7b5: 60        

;-------------------------------------------------------------------------------
__f7b6:     CLC                ; $f7b6: 18        
            LDA #$ff           ; $f7b7: a9 ff     
            STA $01            ; $f7b9: 85 01     
            BIT $01            ; $f7bb: 24 01     
            LDA #$55           ; $f7bd: a9 55     
            RTS                ; $f7bf: 60        

;-------------------------------------------------------------------------------
__f7c0:     BCS __f7cb         ; $f7c0: b0 09     
            BPL __f7cb         ; $f7c2: 10 07     
            CMP #$ff           ; $f7c4: c9 ff     
            BNE __f7cb         ; $f7c6: d0 03     
            BVC __f7cb         ; $f7c8: 50 01     
            RTS                ; $f7ca: 60        

;-------------------------------------------------------------------------------
__f7cb:     STY $00            ; $f7cb: 84 00     
            RTS                ; $f7cd: 60        

;-------------------------------------------------------------------------------
__f7ce:     SEC                ; $f7ce: 38        
            CLV                ; $f7cf: b8        
            LDA #$00           ; $f7d0: a9 00     
            RTS                ; $f7d2: 60        

;-------------------------------------------------------------------------------
__f7d3:     BNE __f7dc         ; $f7d3: d0 07     
            BVS __f7dc         ; $f7d5: 70 05     
            BCC __f7dc         ; $f7d7: 90 03     
            BMI __f7dc         ; $f7d9: 30 01     
            RTS                ; $f7db: 60        

;-------------------------------------------------------------------------------
__f7dc:     STY $00            ; $f7dc: 84 00     
            RTS                ; $f7de: 60        

;-------------------------------------------------------------------------------
__f7df:     CLC                ; $f7df: 18        
            BIT $01            ; $f7e0: 24 01     
            LDA #$55           ; $f7e2: a9 55     
            RTS                ; $f7e4: 60        

;-------------------------------------------------------------------------------
__f7e5:     BNE __f7ee         ; $f7e5: d0 07     
            BVC __f7ee         ; $f7e7: 50 05     
            BCS __f7ee         ; $f7e9: b0 03     
            BMI __f7ee         ; $f7eb: 30 01     
            RTS                ; $f7ed: 60        

;-------------------------------------------------------------------------------
__f7ee:     STY $00            ; $f7ee: 84 00     
            RTS                ; $f7f0: 60        

;-------------------------------------------------------------------------------
__f7f1:     SEC                ; $f7f1: 38        
            CLV                ; $f7f2: b8        
            LDA #$f8           ; $f7f3: a9 f8     
            RTS                ; $f7f5: 60        

;-------------------------------------------------------------------------------
__f7f6:     BCC __f801         ; $f7f6: 90 09     
            BPL __f801         ; $f7f8: 10 07     
            CMP #$e8           ; $f7fa: c9 e8     
            BNE __f801         ; $f7fc: d0 03     
            BVS __f801         ; $f7fe: 70 01     
            RTS                ; $f800: 60        

;-------------------------------------------------------------------------------
__f801:     STY $00            ; $f801: 84 00     
            RTS                ; $f803: 60        

;-------------------------------------------------------------------------------
__f804:     CLC                ; $f804: 18        
            BIT $01            ; $f805: 24 01     
            LDA #$5f           ; $f807: a9 5f     
            RTS                ; $f809: 60        

;-------------------------------------------------------------------------------
__f80a:     BCS __f815         ; $f80a: b0 09     
            BPL __f815         ; $f80c: 10 07     
            CMP #$f5           ; $f80e: c9 f5     
            BNE __f815         ; $f810: d0 03     
            BVC __f815         ; $f812: 50 01     
            RTS                ; $f814: 60        

;-------------------------------------------------------------------------------
__f815:     STY $00            ; $f815: 84 00     
            RTS                ; $f817: 60        

;-------------------------------------------------------------------------------
__f818:     SEC                ; $f818: 38        
            CLV                ; $f819: b8        
            LDA #$70           ; $f81a: a9 70     
            RTS                ; $f81c: 60        

;-------------------------------------------------------------------------------
__f81d:     BNE __f826         ; $f81d: d0 07     
            BVS __f826         ; $f81f: 70 05     
            BCC __f826         ; $f821: 90 03     
            BMI __f826         ; $f823: 30 01     
            RTS                ; $f825: 60        

;-------------------------------------------------------------------------------
__f826:     STY $00            ; $f826: 84 00     
            RTS                ; $f828: 60        

;-------------------------------------------------------------------------------
__f829:     CLC                ; $f829: 18        
            BIT $01            ; $f82a: 24 01     
            LDA #$00           ; $f82c: a9 00     
            RTS                ; $f82e: 60        

;-------------------------------------------------------------------------------
__f82f:     BMI __f83a         ; $f82f: 30 09     
            BCS __f83a         ; $f831: b0 07     
            CMP #$69           ; $f833: c9 69     
            BNE __f83a         ; $f835: d0 03     
            BVS __f83a         ; $f837: 70 01     
            RTS                ; $f839: 60        

;-------------------------------------------------------------------------------
__f83a:     STY $00            ; $f83a: 84 00     
            RTS                ; $f83c: 60        

;-------------------------------------------------------------------------------
__f83d:     SEC                ; $f83d: 38        
            BIT $01            ; $f83e: 24 01     
            LDA #$00           ; $f840: a9 00     
            RTS                ; $f842: 60        

;-------------------------------------------------------------------------------
__f843:     BMI __f84e         ; $f843: 30 09     
            BCS __f84e         ; $f845: b0 07     
            CMP #$6a           ; $f847: c9 6a     
            BNE __f84e         ; $f849: d0 03     
            BVS __f84e         ; $f84b: 70 01     
            RTS                ; $f84d: 60        

;-------------------------------------------------------------------------------
__f84e:     STY $00            ; $f84e: 84 00     
            RTS                ; $f850: 60        

;-------------------------------------------------------------------------------
__f851:     SEC                ; $f851: 38        
            CLV                ; $f852: b8        
            LDA #$7f           ; $f853: a9 7f     
            RTS                ; $f855: 60        

;-------------------------------------------------------------------------------
__f856:     BPL __f861         ; $f856: 10 09     
            BCS __f861         ; $f858: b0 07     
            CMP #$ff           ; $f85a: c9 ff     
            BNE __f861         ; $f85c: d0 03     
            BVC __f861         ; $f85e: 50 01     
            RTS                ; $f860: 60        

;-------------------------------------------------------------------------------
__f861:     STY $00            ; $f861: 84 00     
            RTS                ; $f863: 60        

;-------------------------------------------------------------------------------
__f864:     CLC                ; $f864: 18        
            BIT $01            ; $f865: 24 01     
            LDA #$7f           ; $f867: a9 7f     
            RTS                ; $f869: 60        

;-------------------------------------------------------------------------------
__f86a:     BPL __f875         ; $f86a: 10 09     
            BCS __f875         ; $f86c: b0 07     
            CMP #$ff           ; $f86e: c9 ff     
            BNE __f875         ; $f870: d0 03     
            BVS __f875         ; $f872: 70 01     
            RTS                ; $f874: 60        

;-------------------------------------------------------------------------------
__f875:     STY $00            ; $f875: 84 00     
            RTS                ; $f877: 60        

;-------------------------------------------------------------------------------
__f878:     SEC                ; $f878: 38        
            CLV                ; $f879: b8        
            LDA #$7f           ; $f87a: a9 7f     
            RTS                ; $f87c: 60        

;-------------------------------------------------------------------------------
__f87d:     BNE __f886         ; $f87d: d0 07     
            BMI __f886         ; $f87f: 30 05     
            BVS __f886         ; $f881: 70 03     
            BCC __f886         ; $f883: 90 01     
            RTS                ; $f885: 60        

;-------------------------------------------------------------------------------
__f886:     STY $00            ; $f886: 84 00     
            RTS                ; $f888: 60        

;-------------------------------------------------------------------------------
__f889:     BIT $01            ; $f889: 24 01     
            LDA #$40           ; $f88b: a9 40     
            RTS                ; $f88d: 60        

;-------------------------------------------------------------------------------
__f88e:     BMI __f897         ; $f88e: 30 07     
            BCC __f897         ; $f890: 90 05     
            BNE __f897         ; $f892: d0 03     
            BVC __f897         ; $f894: 50 01     
            RTS                ; $f896: 60        

;-------------------------------------------------------------------------------
__f897:     STY $00            ; $f897: 84 00     
            RTS                ; $f899: 60        

;-------------------------------------------------------------------------------
__f89a:     CLV                ; $f89a: b8        
            RTS                ; $f89b: 60        

;-------------------------------------------------------------------------------
__f89c:     BEQ __f8a5         ; $f89c: f0 07     
            BMI __f8a5         ; $f89e: 30 05     
            BCC __f8a5         ; $f8a0: 90 03     
            BVS __f8a5         ; $f8a2: 70 01     
            RTS                ; $f8a4: 60        

;-------------------------------------------------------------------------------
__f8a5:     STY $00            ; $f8a5: 84 00     
            RTS                ; $f8a7: 60        

;-------------------------------------------------------------------------------
__f8a8:     BEQ __f8af         ; $f8a8: f0 05     
            BPL __f8af         ; $f8aa: 10 03     
            BPL __f8af         ; $f8ac: 10 01     
            RTS                ; $f8ae: 60        

;-------------------------------------------------------------------------------
__f8af:     STY $00            ; $f8af: 84 00     
            RTS                ; $f8b1: 60        

;-------------------------------------------------------------------------------
__f8b2:     LDA #$80           ; $f8b2: a9 80     
            RTS                ; $f8b4: 60        

;-------------------------------------------------------------------------------
__f8b5:     BEQ __f8bc         ; $f8b5: f0 05     
            BPL __f8bc         ; $f8b7: 10 03     
            BCC __f8bc         ; $f8b9: 90 01     
            RTS                ; $f8bb: 60        

;-------------------------------------------------------------------------------
__f8bc:     STY $00            ; $f8bc: 84 00     
            RTS                ; $f8be: 60        

;-------------------------------------------------------------------------------
__f8bf:     BNE __f8c6         ; $f8bf: d0 05     
            BMI __f8c6         ; $f8c1: 30 03     
            BCC __f8c6         ; $f8c3: 90 01     
            RTS                ; $f8c5: 60        

;-------------------------------------------------------------------------------
__f8c6:     STY $00            ; $f8c6: 84 00     
            RTS                ; $f8c8: 60        

;-------------------------------------------------------------------------------
__f8c9:     BCS __f8d0         ; $f8c9: b0 05     
__f8cb:     BEQ __f8d0         ; $f8cb: f0 03     
            BPL __f8d0         ; $f8cd: 10 01     
            RTS                ; $f8cf: 60        

;-------------------------------------------------------------------------------
__f8d0:     STY $00            ; $f8d0: 84 00     
            RTS                ; $f8d2: 60        

;-------------------------------------------------------------------------------
__f8d3:     BCC __f8da         ; $f8d3: 90 05     
            BEQ __f8da         ; $f8d5: f0 03     
            BMI __f8da         ; $f8d7: 30 01     
            RTS                ; $f8d9: 60        

;-------------------------------------------------------------------------------
__f8da:     STY $00            ; $f8da: 84 00     
            RTS                ; $f8dc: 60        

;-------------------------------------------------------------------------------
__f8dd:     BIT $01            ; $f8dd: 24 01     
            LDY #$40           ; $f8df: a0 40     
            RTS                ; $f8e1: 60        

;-------------------------------------------------------------------------------
__f8e2:     BMI __f8eb         ; $f8e2: 30 07     
            BCC __f8eb         ; $f8e4: 90 05     
            BNE __f8eb         ; $f8e6: d0 03     
            BVC __f8eb         ; $f8e8: 50 01     
            RTS                ; $f8ea: 60        

;-------------------------------------------------------------------------------
__f8eb:     STX $00            ; $f8eb: 86 00     
            RTS                ; $f8ed: 60        

;-------------------------------------------------------------------------------
__f8ee:     CLV                ; $f8ee: b8        
            RTS                ; $f8ef: 60        

;-------------------------------------------------------------------------------
__f8f0:     BEQ __f8f9         ; $f8f0: f0 07     
            BMI __f8f9         ; $f8f2: 30 05     
            BCC __f8f9         ; $f8f4: 90 03     
            BVS __f8f9         ; $f8f6: 70 01     
            RTS                ; $f8f8: 60        

;-------------------------------------------------------------------------------
__f8f9:     STX $00            ; $f8f9: 86 00     
            RTS                ; $f8fb: 60        

;-------------------------------------------------------------------------------
__f8fc:     BEQ __f903         ; $f8fc: f0 05     
            BPL __f903         ; $f8fe: 10 03     
            BPL __f903         ; $f900: 10 01     
            RTS                ; $f902: 60        

;-------------------------------------------------------------------------------
__f903:     STX $00            ; $f903: 86 00     
            RTS                ; $f905: 60        

;-------------------------------------------------------------------------------
__f906:     LDY #$80           ; $f906: a0 80     
            RTS                ; $f908: 60        

;-------------------------------------------------------------------------------
__f909:     BEQ __f910         ; $f909: f0 05     
            BPL __f910         ; $f90b: 10 03     
            BCC __f910         ; $f90d: 90 01     
            RTS                ; $f90f: 60        

;-------------------------------------------------------------------------------
__f910:     STX $00            ; $f910: 86 00     
            RTS                ; $f912: 60        

;-------------------------------------------------------------------------------
__f913:     BNE __f91a         ; $f913: d0 05     
            BMI __f91a         ; $f915: 30 03     
            BCC __f91a         ; $f917: 90 01     
            RTS                ; $f919: 60        

;-------------------------------------------------------------------------------
__f91a:     STX $00            ; $f91a: 86 00     
            RTS                ; $f91c: 60        

;-------------------------------------------------------------------------------
__f91d:     BCS __f924         ; $f91d: b0 05     
            BEQ __f924         ; $f91f: f0 03     
            BPL __f924         ; $f921: 10 01     
            RTS                ; $f923: 60        

;-------------------------------------------------------------------------------
__f924:     STX $00            ; $f924: 86 00     
            RTS                ; $f926: 60        

;-------------------------------------------------------------------------------
__f927:     BCC __f92e         ; $f927: 90 05     
            BEQ __f92e         ; $f929: f0 03     
            BMI __f92e         ; $f92b: 30 01     
            RTS                ; $f92d: 60        

;-------------------------------------------------------------------------------
__f92e:     STX $00            ; $f92e: 86 00     
            RTS                ; $f930: 60        

;-------------------------------------------------------------------------------
__f931:     BIT $01            ; $f931: 24 01     
            LDA #$40           ; $f933: a9 40     
            SEC                ; $f935: 38        
            RTS                ; $f936: 60        

;-------------------------------------------------------------------------------
__f937:     BMI __f944         ; $f937: 30 0b     
            BCC __f944         ; $f939: 90 09     
            BNE __f944         ; $f93b: d0 07     
            BVS __f944         ; $f93d: 70 05     
            CMP #$00           ; $f93f: c9 00     
            BNE __f944         ; $f941: d0 01     
            RTS                ; $f943: 60        

;-------------------------------------------------------------------------------
__f944:     STY $00            ; $f944: 84 00     
            RTS                ; $f946: 60        

;-------------------------------------------------------------------------------
__f947:     CLV                ; $f947: b8        
            SEC                ; $f948: 38        
            LDA #$40           ; $f949: a9 40     
            RTS                ; $f94b: 60        

;-------------------------------------------------------------------------------
__f94c:     BEQ __f959         ; $f94c: f0 0b     
            BMI __f959         ; $f94e: 30 09     
            BCC __f959         ; $f950: 90 07     
            BVS __f959         ; $f952: 70 05     
            CMP #$01           ; $f954: c9 01     
            BNE __f959         ; $f956: d0 01     
            RTS                ; $f958: 60        

;-------------------------------------------------------------------------------
__f959:     STY $00            ; $f959: 84 00     
            RTS                ; $f95b: 60        

;-------------------------------------------------------------------------------
__f95c:     LDA #$40           ; $f95c: a9 40     
            SEC                ; $f95e: 38        
            BIT $01            ; $f95f: 24 01     
            RTS                ; $f961: 60        

;-------------------------------------------------------------------------------
__f962:     BCS __f96f         ; $f962: b0 0b     
            BEQ __f96f         ; $f964: f0 09     
            BPL __f96f         ; $f966: 10 07     
            BVS __f96f         ; $f968: 70 05     
            CMP #$ff           ; $f96a: c9 ff     
            BNE __f96f         ; $f96c: d0 01     
            RTS                ; $f96e: 60        

;-------------------------------------------------------------------------------
__f96f:     STY $00            ; $f96f: 84 00     
            RTS                ; $f971: 60        

;-------------------------------------------------------------------------------
__f972:     CLC                ; $f972: 18        
            LDA #$80           ; $f973: a9 80     
            RTS                ; $f975: 60        

;-------------------------------------------------------------------------------
__f976:     BCC __f97d         ; $f976: 90 05     
            CMP #$7f           ; $f978: c9 7f     
            BNE __f97d         ; $f97a: d0 01     
            RTS                ; $f97c: 60        

;-------------------------------------------------------------------------------
__f97d:     STY $00            ; $f97d: 84 00     
            RTS                ; $f97f: 60        

;-------------------------------------------------------------------------------
__f980:     SEC                ; $f980: 38        
            LDA #$81           ; $f981: a9 81     
            RTS                ; $f983: 60        

;-------------------------------------------------------------------------------
__f984:     BVC __f98d         ; $f984: 50 07     
            BCC __f98d         ; $f986: 90 05     
            CMP #$02           ; $f988: c9 02     
            BNE __f98d         ; $f98a: d0 01     
            RTS                ; $f98c: 60        

;-------------------------------------------------------------------------------
__f98d:     STY $00            ; $f98d: 84 00     
            RTS                ; $f98f: 60        

;-------------------------------------------------------------------------------
__f990:     LDX #$55           ; $f990: a2 55     
            LDA #$ff           ; $f992: a9 ff     
            STA $01            ; $f994: 85 01     
            NOP                ; $f996: ea        
            BIT $01            ; $f997: 24 01     
            SEC                ; $f999: 38        
            LDA #$01           ; $f99a: a9 01     
            RTS                ; $f99c: 60        

;-------------------------------------------------------------------------------
__f99d:     BCC __f9ba         ; $f99d: 90 1b     
            BNE __f9ba         ; $f99f: d0 19     
            BMI __f9ba         ; $f9a1: 30 17     
            BVC __f9ba         ; $f9a3: 50 15     
            CMP #$00           ; $f9a5: c9 00     
            BNE __f9ba         ; $f9a7: d0 11     
            CLV                ; $f9a9: b8        
            LDA #$aa           ; $f9aa: a9 aa     
            RTS                ; $f9ac: 60        

;-------------------------------------------------------------------------------
__f9ad:     BCS __f9ba         ; $f9ad: b0 0b     
            BEQ __f9ba         ; $f9af: f0 09     
            BMI __f9ba         ; $f9b1: 30 07     
            BVS __f9ba         ; $f9b3: 70 05     
            CMP #$55           ; $f9b5: c9 55     
            BNE __f9ba         ; $f9b7: d0 01     
            RTS                ; $f9b9: 60        

;-------------------------------------------------------------------------------
__f9ba:     STY $00            ; $f9ba: 84 00     
            RTS                ; $f9bc: 60        

;-------------------------------------------------------------------------------
__f9bd:     BIT $01            ; $f9bd: 24 01     
            SEC                ; $f9bf: 38        
            LDA #$80           ; $f9c0: a9 80     
            RTS                ; $f9c2: 60        

;-------------------------------------------------------------------------------
__f9c3:     BCC __f9e1         ; $f9c3: 90 1c     
            BNE __f9e1         ; $f9c5: d0 1a     
            BMI __f9e1         ; $f9c7: 30 18     
            BVC __f9e1         ; $f9c9: 50 16     
            CMP #$00           ; $f9cb: c9 00     
            BNE __f9e1         ; $f9cd: d0 12     
            CLV                ; $f9cf: b8        
            LDA #$55           ; $f9d0: a9 55     
            SEC                ; $f9d2: 38        
            RTS                ; $f9d3: 60        

;-------------------------------------------------------------------------------
__f9d4:     BCS __f9e1         ; $f9d4: b0 0b     
            BEQ __f9e1         ; $f9d6: f0 09     
            BPL __f9e1         ; $f9d8: 10 07     
            BVS __f9e1         ; $f9da: 70 05     
            CMP #$aa           ; $f9dc: c9 aa     
            BNE __f9e1         ; $f9de: d0 01     
            RTS                ; $f9e0: 60        

;-------------------------------------------------------------------------------
__f9e1:     STY $00            ; $f9e1: 84 00     
            RTS                ; $f9e3: 60        

;-------------------------------------------------------------------------------
__f9e4:     BIT $01            ; $f9e4: 24 01     
            SEC                ; $f9e6: 38        
            LDA #$01           ; $f9e7: a9 01     
            RTS                ; $f9e9: 60        

;-------------------------------------------------------------------------------
__f9ea:     BCC __fa08         ; $f9ea: 90 1c     
            BEQ __fa08         ; $f9ec: f0 1a     
            BPL __fa08         ; $f9ee: 10 18     
            BVC __fa08         ; $f9f0: 50 16     
            CMP #$80           ; $f9f2: c9 80     
            BNE __fa08         ; $f9f4: d0 12     
            CLV                ; $f9f6: b8        
            CLC                ; $f9f7: 18        
            LDA #$55           ; $f9f8: a9 55     
            RTS                ; $f9fa: 60        

;-------------------------------------------------------------------------------
__f9fb:     BCC __fa08         ; $f9fb: 90 0b     
            BEQ __fa08         ; $f9fd: f0 09     
            BMI __fa08         ; $f9ff: 30 07     
            BVS __fa08         ; $fa01: 70 05     
            CMP #$2a           ; $fa03: c9 2a     
            BNE __fa08         ; $fa05: d0 01     
            RTS                ; $fa07: 60        

;-------------------------------------------------------------------------------
__fa08:     STY $00            ; $fa08: 84 00     
__fa0a:     BIT $01            ; $fa0a: 24 01     
            SEC                ; $fa0c: 38        
            LDA #$80           ; $fa0d: a9 80     
            RTS                ; $fa0f: 60        

;-------------------------------------------------------------------------------
__fa10:     BCC __fa2e         ; $fa10: 90 1c     
            BEQ __fa2e         ; $fa12: f0 1a     
            BMI __fa2e         ; $fa14: 30 18     
            BVC __fa2e         ; $fa16: 50 16     
            CMP #$01           ; $fa18: c9 01     
            BNE __fa2e         ; $fa1a: d0 12     
            CLV                ; $fa1c: b8        
            CLC                ; $fa1d: 18        
            LDA #$55           ; $fa1e: a9 55     
            RTS                ; $fa20: 60        

;-------------------------------------------------------------------------------
__fa21:     BCS __fa2e         ; $fa21: b0 0b     
            BEQ __fa2e         ; $fa23: f0 09     
            BPL __fa2e         ; $fa25: 10 07     
            BVS __fa2e         ; $fa27: 70 05     
            CMP #$aa           ; $fa29: c9 aa     
            BNE __fa2e         ; $fa2b: d0 01     
            RTS                ; $fa2d: 60        

;-------------------------------------------------------------------------------
__fa2e:     STY $00            ; $fa2e: 84 00     
            RTS                ; $fa30: 60        

;-------------------------------------------------------------------------------
__fa31:     BIT $01            ; $fa31: 24 01     
            CLC                ; $fa33: 18        
            LDA #$40           ; $fa34: a9 40     
            RTS                ; $fa36: 60        

;-------------------------------------------------------------------------------
__fa37:     BVC __fa65         ; $fa37: 50 2c     
            BCS __fa65         ; $fa39: b0 2a     
            BMI __fa65         ; $fa3b: 30 28     
            CMP #$40           ; $fa3d: c9 40     
            BNE __fa65         ; $fa3f: d0 24     
            RTS                ; $fa41: 60        

;-------------------------------------------------------------------------------
__fa42:     CLV                ; $fa42: b8        
            SEC                ; $fa43: 38        
            LDA #$ff           ; $fa44: a9 ff     
            RTS                ; $fa46: 60        

;-------------------------------------------------------------------------------
__fa47:     BVS __fa65         ; $fa47: 70 1c     
            BNE __fa65         ; $fa49: d0 1a     
            BMI __fa65         ; $fa4b: 30 18     
            BCC __fa65         ; $fa4d: 90 16     
            CMP #$ff           ; $fa4f: c9 ff     
            BNE __fa65         ; $fa51: d0 12     
            RTS                ; $fa53: 60        

;-------------------------------------------------------------------------------
__fa54:     BIT $01            ; $fa54: 24 01     
            LDA #$f0           ; $fa56: a9 f0     
            RTS                ; $fa58: 60        

;-------------------------------------------------------------------------------
__fa59:     BVC __fa65         ; $fa59: 50 0a     
            BEQ __fa65         ; $fa5b: f0 08     
            BPL __fa65         ; $fa5d: 10 06     
            BCC __fa65         ; $fa5f: 90 04     
            CMP #$f0           ; $fa61: c9 f0     
            BEQ __fa67         ; $fa63: f0 02     
__fa65:     STY $00            ; $fa65: 84 00     
__fa67:     RTS                ; $fa67: 60        

;-------------------------------------------------------------------------------
__fa68:     BIT $01            ; $fa68: 24 01     
            SEC                ; $fa6a: 38        
            LDA #$75           ; $fa6b: a9 75     
            RTS                ; $fa6d: 60        

;-------------------------------------------------------------------------------
__fa6e:     BVC __fae6         ; $fa6e: 50 76     
            BEQ __fae6         ; $fa70: f0 74     
            BMI __fae6         ; $fa72: 30 72     
            BCS __fae6         ; $fa74: b0 70     
            CMP #$65           ; $fa76: c9 65     
            BNE __fae6         ; $fa78: d0 6c     
            RTS                ; $fa7a: 60        

;-------------------------------------------------------------------------------
__fa7b:     BIT $01            ; $fa7b: 24 01     
            CLC                ; $fa7d: 18        
            LDA #$b3           ; $fa7e: a9 b3     
            RTS                ; $fa80: 60        

;-------------------------------------------------------------------------------
__fa81:     BVC __fae6         ; $fa81: 50 63     
            BCC __fae6         ; $fa83: 90 61     
            BPL __fae6         ; $fa85: 10 5f     
            CMP #$fb           ; $fa87: c9 fb     
            BNE __fae6         ; $fa89: d0 5b     
            RTS                ; $fa8b: 60        

;-------------------------------------------------------------------------------
__fa8c:     CLV                ; $fa8c: b8        
            CLC                ; $fa8d: 18        
            LDA #$c3           ; $fa8e: a9 c3     
            RTS                ; $fa90: 60        

;-------------------------------------------------------------------------------
__fa91:     BVS __fae6         ; $fa91: 70 53     
            BEQ __fae6         ; $fa93: f0 51     
            BPL __fae6         ; $fa95: 10 4f     
            BCS __fae6         ; $fa97: b0 4d     
            CMP #$d3           ; $fa99: c9 d3     
            BNE __fae6         ; $fa9b: d0 49     
            RTS                ; $fa9d: 60        

;-------------------------------------------------------------------------------
__fa9e:     BIT $01            ; $fa9e: 24 01     
            SEC                ; $faa0: 38        
            LDA #$10           ; $faa1: a9 10     
            RTS                ; $faa3: 60        

;-------------------------------------------------------------------------------
__faa4:     BVC __fae6         ; $faa4: 50 40     
            BEQ __fae6         ; $faa6: f0 3e     
            BMI __fae6         ; $faa8: 30 3c     
            BCS __fae6         ; $faaa: b0 3a     
            CMP #$7e           ; $faac: c9 7e     
            BNE __fae6         ; $faae: d0 36     
            RTS                ; $fab0: 60        

;-------------------------------------------------------------------------------
__fab1:     BIT $01            ; $fab1: 24 01     
            CLC                ; $fab3: 18        
            LDA #$40           ; $fab4: a9 40     
            RTS                ; $fab6: 60        

;-------------------------------------------------------------------------------
__fab7:     BVS __fae6         ; $fab7: 70 2d     
            BCS __fae6         ; $fab9: b0 2b     
            BMI __fae6         ; $fabb: 30 29     
            CMP #$53           ; $fabd: c9 53     
            BNE __fae6         ; $fabf: d0 25     
            RTS                ; $fac1: 60        

;-------------------------------------------------------------------------------
__fac2:     CLV                ; $fac2: b8        
            SEC                ; $fac3: 38        
            LDA #$ff           ; $fac4: a9 ff     
            RTS                ; $fac6: 60        

;-------------------------------------------------------------------------------
__fac7:     BVS __fae6         ; $fac7: 70 1d     
            BEQ __fae6         ; $fac9: f0 1b     
            BPL __fae6         ; $facb: 10 19     
            BCC __fae6         ; $facd: 90 17     
            CMP #$ff           ; $facf: c9 ff     
            BNE __fae6         ; $fad1: d0 13     
            RTS                ; $fad3: 60        

;-------------------------------------------------------------------------------
__fad4:     BIT $01            ; $fad4: 24 01     
            SEC                ; $fad6: 38        
            LDA #$f0           ; $fad7: a9 f0     
            RTS                ; $fad9: 60        

;-------------------------------------------------------------------------------
__fada:     BVS __fae6         ; $fada: 70 0a     
            BEQ __fae6         ; $fadc: f0 08     
            BPL __fae6         ; $fade: 10 06     
            BCC __fae6         ; $fae0: 90 04     
            CMP #$b8           ; $fae2: c9 b8     
            BEQ __fae8         ; $fae4: f0 02     
__fae6:     STY $00            ; $fae6: 84 00     
__fae8:     RTS                ; $fae8: 60        

;-------------------------------------------------------------------------------
__fae9:     BIT $01            ; $fae9: 24 01     
            CLC                ; $faeb: 18        
            LDA #$b2           ; $faec: a9 b2     
            RTS                ; $faee: 60        

;-------------------------------------------------------------------------------
__faef:     BVS __fb1b         ; $faef: 70 2a     
            BCC __fb1b         ; $faf1: 90 28     
            BMI __fb1b         ; $faf3: 30 26     
            CMP #$05           ; $faf5: c9 05     
            BNE __fb1b         ; $faf7: d0 22     
            RTS                ; $faf9: 60        

;-------------------------------------------------------------------------------
__fafa:     CLV                ; $fafa: b8        
            CLC                ; $fafb: 18        
            LDA #$42           ; $fafc: a9 42     
            RTS                ; $fafe: 60        

;-------------------------------------------------------------------------------
__faff:     BVS __fb1b         ; $faff: 70 1a     
            BMI __fb1b         ; $fb01: 30 18     
            BCS __fb1b         ; $fb03: b0 16     
            CMP #$57           ; $fb05: c9 57     
            BNE __fb1b         ; $fb07: d0 12     
            RTS                ; $fb09: 60        

;-------------------------------------------------------------------------------
__fb0a:     BIT $01            ; $fb0a: 24 01     
            SEC                ; $fb0c: 38        
            LDA #$75           ; $fb0d: a9 75     
            RTS                ; $fb0f: 60        

;-------------------------------------------------------------------------------
__fb10:     BVS __fb1b         ; $fb10: 70 09     
            BMI __fb1b         ; $fb12: 30 07     
            BCC __fb1b         ; $fb14: 90 05     
            CMP #$11           ; $fb16: c9 11     
            BNE __fb1b         ; $fb18: d0 01     
            RTS                ; $fb1a: 60        

;-------------------------------------------------------------------------------
__fb1b:     STA $00            ; $fb1b: 85 00     
__fb1d:     BIT $01            ; $fb1d: 24 01     
            CLC                ; $fb1f: 18        
            LDA #$b3           ; $fb20: a9 b3     
            RTS                ; $fb22: 60        

;-------------------------------------------------------------------------------
__fb23:     BVC __fb75         ; $fb23: 50 50     
            BCC __fb75         ; $fb25: 90 4e     
            BPL __fb75         ; $fb27: 10 4c     
            CMP #$e1           ; $fb29: c9 e1     
            BNE __fb75         ; $fb2b: d0 48     
            RTS                ; $fb2d: 60        

;-------------------------------------------------------------------------------
__fb2e:     CLV                ; $fb2e: b8        
            CLC                ; $fb2f: 18        
            LDA #$42           ; $fb30: a9 42     
            RTS                ; $fb32: 60        

;-------------------------------------------------------------------------------
__fb33:     BVS __fb75         ; $fb33: 70 40     
            BEQ __fb75         ; $fb35: f0 3e     
            BMI __fb75         ; $fb37: 30 3c     
            BCC __fb75         ; $fb39: 90 3a     
            CMP #$56           ; $fb3b: c9 56     
            BNE __fb75         ; $fb3d: d0 36     
            RTS                ; $fb3f: 60        

;-------------------------------------------------------------------------------
__fb40:     BIT $01            ; $fb40: 24 01     
            SEC                ; $fb42: 38        
            LDA #$75           ; $fb43: a9 75     
            RTS                ; $fb45: 60        

;-------------------------------------------------------------------------------
__fb46:     BVC __fb75         ; $fb46: 50 2d     
            BEQ __fb75         ; $fb48: f0 2b     
            BMI __fb75         ; $fb4a: 30 29     
            BCC __fb75         ; $fb4c: 90 27     
            CMP #$6e           ; $fb4e: c9 6e     
            BNE __fb75         ; $fb50: d0 23     
            RTS                ; $fb52: 60        

;-------------------------------------------------------------------------------
__fb53:     BIT $01            ; $fb53: 24 01     
            CLC                ; $fb55: 18        
            LDA #$b3           ; $fb56: a9 b3     
            RTS                ; $fb58: 60        

;-------------------------------------------------------------------------------
__fb59:     BVC __fb75         ; $fb59: 50 1a     
            BCC __fb75         ; $fb5b: 90 18     
            BMI __fb75         ; $fb5d: 30 16     
            CMP #$02           ; $fb5f: c9 02     
            BNE __fb75         ; $fb61: d0 12     
            RTS                ; $fb63: 60        

;-------------------------------------------------------------------------------
__fb64:     CLV                ; $fb64: b8        
            CLC                ; $fb65: 18        
            LDA #$42           ; $fb66: a9 42     
            RTS                ; $fb68: 60        

;-------------------------------------------------------------------------------
__fb69:     BVS __fb75         ; $fb69: 70 0a     
            BEQ __fb75         ; $fb6b: f0 08     
            BMI __fb75         ; $fb6d: 30 06     
            BCS __fb75         ; $fb6f: b0 04     
            CMP #$42           ; $fb71: c9 42     
            BEQ __fb77         ; $fb73: f0 02     
__fb75:     STY $00            ; $fb75: 84 00     
__fb77:     RTS                ; $fb77: 60        

;-------------------------------------------------------------------------------
            BRK                ; $fb78: 00        
            BRK                ; $fb79: 00        
            BRK                ; $fb7a: 00        
            BRK                ; $fb7b: 00        
            BRK                ; $fb7c: 00        
            BRK                ; $fb7d: 00        
            BRK                ; $fb7e: 00        
            BRK                ; $fb7f: 00        
            BRK                ; $fb80: 00        
            BRK                ; $fb81: 00        
            BRK                ; $fb82: 00        
            BRK                ; $fb83: 00        
            BRK                ; $fb84: 00        
            BRK                ; $fb85: 00        
            BRK                ; $fb86: 00        
            BRK                ; $fb87: 00        
            .hex 80 80         ; $fb88: 80 80     Invalid Opcode - NOP #$80
            .hex ff 80 80      ; $fb8a: ff 80 80  Invalid Opcode - ISC $8080,x
            BRK                ; $fb8d: 00        
            BRK                ; $fb8e: 00        
            BRK                ; $fb8f: 00        
            BRK                ; $fb90: 00        
            BRK                ; $fb91: 00        
            .hex ff 00 00      ; $fb92: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $fb95: 00        
            BRK                ; $fb96: 00        
            BRK                ; $fb97: 00        
            ORA ($01,x)        ; $fb98: 01 01     
            .hex ff 01 01      ; $fb9a: ff 01 01  Invalid Opcode - ISC $0101,x
__fb9d:     BRK                ; $fb9d: 00        
            BRK                ; $fb9e: 00        
            BRK                ; $fb9f: 00        
            BRK                ; $fba0: 00        
            BRK                ; $fba1: 00        
            BRK                ; $fba2: 00        
            BRK                ; $fba3: 00        
            BRK                ; $fba4: 00        
            BRK                ; $fba5: 00        
            BRK                ; $fba6: 00        
            BRK                ; $fba7: 00        
            .hex 7c fe 00      ; $fba8: 7c fe 00  Bad Addr Mode - NOP $00fe,x
            CPY #$c0           ; $fbab: c0 c0     
            .hex fe 7c 00      ; $fbad: fe 7c 00  Bad Addr Mode - INC $007c,x
            .hex fe fe 00      ; $fbb0: fe fe 00  Bad Addr Mode - INC $00fe,x
            BEQ __fb75         ; $fbb3: f0 c0     
            .hex fe fe 00      ; $fbb5: fe fe 00  Bad Addr Mode - INC $00fe,x
            DEC $c6            ; $fbb8: c6 c6     
            .hex 02            ; $fbba: 02        Invalid Opcode - KIL 
            INC __c6c6,x       ; $fbbb: fe c6 c6  
            DEC $00            ; $fbbe: c6 00     
            .hex cc d8 00      ; $fbc0: cc d8 00  Bad Addr Mode - CPY $00d8
            BEQ __fb9d         ; $fbc3: f0 d8     
            .hex cc c6 00      ; $fbc5: cc c6 00  Bad Addr Mode - CPY $00c6
            DEC $ee            ; $fbc8: c6 ee     
            .hex 02            ; $fbca: 02        Invalid Opcode - KIL 
            DEC $c6,x          ; $fbcb: d6 c6     
            DEC $c6            ; $fbcd: c6 c6     
            BRK                ; $fbcf: 00        
            DEC $c6            ; $fbd0: c6 c6     
            .hex 02            ; $fbd2: 02        Invalid Opcode - KIL 
            DEC $ce,x          ; $fbd3: d6 ce     
            DEC $c6            ; $fbd5: c6 c6     
            BRK                ; $fbd7: 00        
            .hex 7c fe 02      ; $fbd8: 7c fe 02  Invalid Opcode - NOP $02fe,x
            DEC $c6            ; $fbdb: c6 c6     
            .hex fe 7c 00      ; $fbdd: fe 7c 00  Bad Addr Mode - INC $007c,x
            .hex fc fe 02      ; $fbe0: fc fe 02  Invalid Opcode - NOP $02fe,x
            .hex fc c0 c0      ; $fbe3: fc c0 c0  Invalid Opcode - NOP __c0c0,x
            CPY #$00           ; $fbe6: c0 00     
            .hex cc cc 00      ; $fbe8: cc cc 00  Bad Addr Mode - CPY $00cc
            SEI                ; $fbeb: 78        
            BMI __fc1e         ; $fbec: 30 30     
            BMI __fbf0         ; $fbee: 30 00     
__fbf0:     CLC                ; $fbf0: 18        
            CLC                ; $fbf1: 18        
            CLC                ; $fbf2: 18        
            CLC                ; $fbf3: 18        
            CLC                ; $fbf4: 18        
            CLC                ; $fbf5: 18        
            CLC                ; $fbf6: 18        
            BRK                ; $fbf7: 00        
            .hex fc fe 02      ; $fbf8: fc fe 02  Invalid Opcode - NOP $02fe,x
            ASL $1c            ; $fbfb: 06 1c     
__fbfd:     BVS __fbfd         ; $fbfd: 70 fe     
            BRK                ; $fbff: 00        
            .hex fc fe 02      ; $fc00: fc fe 02  Invalid Opcode - NOP $02fe,x
            .hex 3c 3c 02      ; $fc03: 3c 3c 02  Invalid Opcode - NOP $023c,x
            INC $1800,x        ; $fc06: fe 00 18  
            CLC                ; $fc09: 18        
            CLD                ; $fc0a: d8        
            CLD                ; $fc0b: d8        
            INC $1818,x        ; $fc0c: fe 18 18  
            BRK                ; $fc0f: 00        
            .hex fe fe 00      ; $fc10: fe fe 00  Bad Addr Mode - INC $00fe,x
            .hex 80 fc         ; $fc13: 80 fc     Invalid Opcode - NOP #$fc
            ASL $fe            ; $fc15: 06 fe     
            BRK                ; $fc17: 00        
            .hex 7c fe 00      ; $fc18: 7c fe 00  Bad Addr Mode - NOP $00fe,x
            CPY #$fc           ; $fc1b: c0 fc     
            .hex c6            ; $fc1d: c6        Suspected data
__fc1e:     INC __fe00,x       ; $fc1e: fe 00 fe  
            INC $0c06,x        ; $fc21: fe 06 0c  
            CLC                ; $fc24: 18        
            BPL __fc57         ; $fc25: 10 30     
            BRK                ; $fc27: 00        
            BRK                ; $fc28: 00        
            BRK                ; $fc29: 00        
            BRK                ; $fc2a: 00        
            BRK                ; $fc2b: 00        
            BRK                ; $fc2c: 00        
            BRK                ; $fc2d: 00        
            BRK                ; $fc2e: 00        
            BRK                ; $fc2f: 00        
            BRK                ; $fc30: 00        
            BRK                ; $fc31: 00        
            BRK                ; $fc32: 00        
            BRK                ; $fc33: 00        
            BRK                ; $fc34: 00        
            BRK                ; $fc35: 00        
            BRK                ; $fc36: 00        
            BRK                ; $fc37: 00        
            BRK                ; $fc38: 00        
            BRK                ; $fc39: 00        
            BRK                ; $fc3a: 00        
            BRK                ; $fc3b: 00        
            BRK                ; $fc3c: 00        
            BRK                ; $fc3d: 00        
            BRK                ; $fc3e: 00        
            BRK                ; $fc3f: 00        
            BRK                ; $fc40: 00        
            BRK                ; $fc41: 00        
            BRK                ; $fc42: 00        
            BRK                ; $fc43: 00        
            BRK                ; $fc44: 00        
            BRK                ; $fc45: 00        
            BRK                ; $fc46: 00        
            BRK                ; $fc47: 00        
            BRK                ; $fc48: 00        
            BRK                ; $fc49: 00        
            BRK                ; $fc4a: 00        
            BRK                ; $fc4b: 00        
            BRK                ; $fc4c: 00        
            BRK                ; $fc4d: 00        
            BRK                ; $fc4e: 00        
            BRK                ; $fc4f: 00        
            BRK                ; $fc50: 00        
            BRK                ; $fc51: 00        
            BRK                ; $fc52: 00        
            BRK                ; $fc53: 00        
            BRK                ; $fc54: 00        
            BRK                ; $fc55: 00        
            BRK                ; $fc56: 00        
__fc57:     BRK                ; $fc57: 00        
            BRK                ; $fc58: 00        
            BRK                ; $fc59: 00        
            BRK                ; $fc5a: 00        
            BRK                ; $fc5b: 00        
            BRK                ; $fc5c: 00        
            BRK                ; $fc5d: 00        
            BRK                ; $fc5e: 00        
            BRK                ; $fc5f: 00        
            BRK                ; $fc60: 00        
            BRK                ; $fc61: 00        
            BRK                ; $fc62: 00        
            BRK                ; $fc63: 00        
            BRK                ; $fc64: 00        
            BRK                ; $fc65: 00        
            BRK                ; $fc66: 00        
            BRK                ; $fc67: 00        
            CLC                ; $fc68: 18        
            CLC                ; $fc69: 18        
            CLC                ; $fc6a: 18        
            .hex ff ff 18      ; $fc6b: ff ff 18  Invalid Opcode - ISC $18ff,x
            CLC                ; $fc6e: 18        
            CLC                ; $fc6f: 18        
            CLC                ; $fc70: 18        
            CLC                ; $fc71: 18        
            CLC                ; $fc72: 18        
            .hex ff ff 00      ; $fc73: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $fc76: 00        
            BRK                ; $fc77: 00        
            BRK                ; $fc78: 00        
            BRK                ; $fc79: 00        
            BRK                ; $fc7a: 00        
            BRK                ; $fc7b: 00        
            BRK                ; $fc7c: 00        
            BRK                ; $fc7d: 00        
            BRK                ; $fc7e: 00        
            BRK                ; $fc7f: 00        
            CLC                ; $fc80: 18        
            CLC                ; $fc81: 18        
            CLC                ; $fc82: 18        
            CLC                ; $fc83: 18        
            BRK                ; $fc84: 00        
            CLC                ; $fc85: 18        
            CLC                ; $fc86: 18        
            BRK                ; $fc87: 00        
            .hex 33 33         ; $fc88: 33 33     Invalid Opcode - RLA ($33),y
            ROR $00            ; $fc8a: 66 00     
            BRK                ; $fc8c: 00        
            BRK                ; $fc8d: 00        
            BRK                ; $fc8e: 00        
            BRK                ; $fc8f: 00        
            ROR $66            ; $fc90: 66 66     
            .hex ff 66 ff      ; $fc92: ff 66 ff  Invalid Opcode - ISC __ff66,x
            ROR $66            ; $fc95: 66 66     
            BRK                ; $fc97: 00        
            CLC                ; $fc98: 18        
            ROL $3c60,x        ; $fc99: 3e 60 3c  
            ASL $7c            ; $fc9c: 06 7c     
            CLC                ; $fc9e: 18        
            BRK                ; $fc9f: 00        
            .hex 62            ; $fca0: 62        Invalid Opcode - KIL 
            ROR $0c            ; $fca1: 66 0c     
            CLC                ; $fca3: 18        
            BMI __fd0c         ; $fca4: 30 66     
            LSR $00            ; $fca6: 46 00     
            .hex 3c 66 3c      ; $fca8: 3c 66 3c  Invalid Opcode - NOP $3c66,x
            SEC                ; $fcab: 38        
            .hex 67 66         ; $fcac: 67 66     Invalid Opcode - RRA $66
            .hex 3f 00 0c      ; $fcae: 3f 00 0c  Invalid Opcode - RLA $0c00,x
            .hex 0c 18 00      ; $fcb1: 0c 18 00  Bad Addr Mode - NOP $0018
            BRK                ; $fcb4: 00        
            BRK                ; $fcb5: 00        
            BRK                ; $fcb6: 00        
            BRK                ; $fcb7: 00        
            .hex 0c 18 30      ; $fcb8: 0c 18 30  Invalid Opcode - NOP $3018
            BMI __fced         ; $fcbb: 30 30     
            CLC                ; $fcbd: 18        
            .hex 0c 00 30      ; $fcbe: 0c 00 30  Invalid Opcode - NOP $3000
            CLC                ; $fcc1: 18        
            .hex 0c 0c 0c      ; $fcc2: 0c 0c 0c  Invalid Opcode - NOP $0c0c
            CLC                ; $fcc5: 18        
            BMI __fcc8         ; $fcc6: 30 00     
__fcc8:     BRK                ; $fcc8: 00        
            ROR $3c            ; $fcc9: 66 3c     
            .hex ff 3c 66      ; $fccb: ff 3c 66  Invalid Opcode - ISC $663c,x
            BRK                ; $fcce: 00        
            BRK                ; $fccf: 00        
            BRK                ; $fcd0: 00        
            CLC                ; $fcd1: 18        
            CLC                ; $fcd2: 18        
            ROR $1818,x        ; $fcd3: 7e 18 18  
            BRK                ; $fcd6: 00        
            BRK                ; $fcd7: 00        
            BRK                ; $fcd8: 00        
            BRK                ; $fcd9: 00        
            BRK                ; $fcda: 00        
            BRK                ; $fcdb: 00        
            BRK                ; $fcdc: 00        
            CLC                ; $fcdd: 18        
            CLC                ; $fcde: 18        
            BMI __fce1         ; $fcdf: 30 00     
__fce1:     BRK                ; $fce1: 00        
            BRK                ; $fce2: 00        
            .hex 6e 3b 00      ; $fce3: 6e 3b 00  Bad Addr Mode - ROR $003b
            BRK                ; $fce6: 00        
            BRK                ; $fce7: 00        
            BRK                ; $fce8: 00        
            BRK                ; $fce9: 00        
            BRK                ; $fcea: 00        
            BRK                ; $fceb: 00        
            BRK                ; $fcec: 00        
__fced:     CLC                ; $fced: 18        
            CLC                ; $fcee: 18        
            BRK                ; $fcef: 00        
            BRK                ; $fcf0: 00        
            .hex 03 06         ; $fcf1: 03 06     Invalid Opcode - SLO ($06,x)
            .hex 0c 18 30      ; $fcf3: 0c 18 30  Invalid Opcode - NOP $3018
            RTS                ; $fcf6: 60        

;-------------------------------------------------------------------------------
            BRK                ; $fcf7: 00        
            ROL $6763,x        ; $fcf8: 3e 63 67  
            .hex 6b 73         ; $fcfb: 6b 73     Invalid Opcode - ARR #$73
            .hex 63 3e         ; $fcfd: 63 3e     Invalid Opcode - RRA ($3e,x)
            BRK                ; $fcff: 00        
            .hex 0c 1c 0c      ; $fd00: 0c 1c 0c  Invalid Opcode - NOP $0c1c
            .hex 0c 0c 0c      ; $fd03: 0c 0c 0c  Invalid Opcode - NOP $0c0c
            .hex 3f 00 3e      ; $fd06: 3f 00 3e  Invalid Opcode - RLA $3e00,x
            .hex 63 63         ; $fd09: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 0e            ; $fd0b: 0e        Suspected data
__fd0c:     SEC                ; $fd0c: 38        
            .hex 63 7f         ; $fd0d: 63 7f     Invalid Opcode - RRA ($7f,x)
            BRK                ; $fd0f: 00        
            ROL $6363,x        ; $fd10: 3e 63 63  
            ASL $6363          ; $fd13: 0e 63 63  
            ROL $0600,x        ; $fd16: 3e 00 06  
            ASL $261e          ; $fd19: 0e 1e 26  
            .hex 7f 06 06      ; $fd1c: 7f 06 06  Invalid Opcode - RRA $0606,x
            BRK                ; $fd1f: 00        
            .hex 7f 63 60      ; $fd20: 7f 63 60  Invalid Opcode - RRA $6063,x
            ROR $6303,x        ; $fd23: 7e 03 63  
            ROL $3e00,x        ; $fd26: 3e 00 3e  
            .hex 63 60         ; $fd29: 63 60     Invalid Opcode - RRA ($60,x)
            ROR $6363,x        ; $fd2b: 7e 63 63  
            ROL $7f00,x        ; $fd2e: 3e 00 7f  
            .hex 63 06         ; $fd31: 63 06     Invalid Opcode - RRA ($06,x)
            .hex 0c 18 18      ; $fd33: 0c 18 18  Invalid Opcode - NOP $1818
            .hex 3c 00 3e      ; $fd36: 3c 00 3e  Invalid Opcode - NOP $3e00,x
            .hex 63 63         ; $fd39: 63 63     Invalid Opcode - RRA ($63,x)
            ROL $6363,x        ; $fd3b: 3e 63 63  
            ROL $3e00,x        ; $fd3e: 3e 00 3e  
            .hex 63 63         ; $fd41: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 3f 03 63      ; $fd43: 3f 03 63  Invalid Opcode - RLA $6303,x
            .hex 3e 00 00      ; $fd46: 3e 00 00  Bad Addr Mode - ROL $0000,x
            BRK                ; $fd49: 00        
            CLC                ; $fd4a: 18        
            CLC                ; $fd4b: 18        
            BRK                ; $fd4c: 00        
            CLC                ; $fd4d: 18        
            CLC                ; $fd4e: 18        
            BRK                ; $fd4f: 00        
            BRK                ; $fd50: 00        
            BRK                ; $fd51: 00        
            CLC                ; $fd52: 18        
            CLC                ; $fd53: 18        
            BRK                ; $fd54: 00        
            CLC                ; $fd55: 18        
            CLC                ; $fd56: 18        
            BMI __fd67         ; $fd57: 30 0e     
            CLC                ; $fd59: 18        
            BMI __fdbc         ; $fd5a: 30 60     
            BMI __fd76         ; $fd5c: 30 18     
            .hex 0e 00 00      ; $fd5e: 0e 00 00  Bad Addr Mode - ASL $0000
            BRK                ; $fd61: 00        
            ROR $7e00,x        ; $fd62: 7e 00 7e  
            BRK                ; $fd65: 00        
            BRK                ; $fd66: 00        
__fd67:     BRK                ; $fd67: 00        
            BVS __fd82         ; $fd68: 70 18     
            .hex 0c 06 0c      ; $fd6a: 0c 06 0c  Invalid Opcode - NOP $0c06
            CLC                ; $fd6d: 18        
            BVS __fd70         ; $fd6e: 70 00     
__fd70:     ROR $0363,x        ; $fd70: 7e 63 03  
            ASL $1c            ; $fd73: 06 1c     
            BRK                ; $fd75: 00        
__fd76:     CLC                ; $fd76: 18        
            CLC                ; $fd77: 18        
            .hex 7c c6 ce      ; $fd78: 7c c6 ce  Invalid Opcode - NOP __cec6,x
            INC __e6e0         ; $fd7b: ee e0 e6  
            .hex 7c 00 1c      ; $fd7e: 7c 00 1c  Invalid Opcode - NOP $1c00,x
            .hex 36            ; $fd81: 36        Suspected data
__fd82:     .hex 63 7f         ; $fd82: 63 7f     Invalid Opcode - RRA ($7f,x)
            .hex 63 63         ; $fd84: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 63 00         ; $fd86: 63 00     Invalid Opcode - RRA ($00,x)
            ROR $6373          ; $fd88: 6e 73 63  
            ROR $6363,x        ; $fd8b: 7e 63 63  
            ROR $1e00,x        ; $fd8e: 7e 00 1e  
            .hex 33 60         ; $fd91: 33 60     Invalid Opcode - RLA ($60),y
            RTS                ; $fd93: 60        

;-------------------------------------------------------------------------------
            RTS                ; $fd94: 60        

;-------------------------------------------------------------------------------
            .hex 33 1e         ; $fd95: 33 1e     Invalid Opcode - RLA ($1e),y
            BRK                ; $fd97: 00        
            JMP ($6376)        ; $fd98: 6c 76 63  

;-------------------------------------------------------------------------------
            .hex 63 63         ; $fd9b: 63 63     Invalid Opcode - RRA ($63,x)
            ROR $7c            ; $fd9d: 66 7c     
            BRK                ; $fd9f: 00        
            .hex 7f 31 30      ; $fda0: 7f 31 30  Invalid Opcode - RRA $3031,x
            .hex 3c 30 31      ; $fda3: 3c 30 31  Invalid Opcode - NOP $3130,x
            .hex 7f 00 7f      ; $fda6: 7f 00 7f  Invalid Opcode - RRA $7f00,x
            AND ($30),y        ; $fda9: 31 30     
            .hex 3c 30 30      ; $fdab: 3c 30 30  Invalid Opcode - NOP $3030,x
            SEI                ; $fdae: 78        
            BRK                ; $fdaf: 00        
            ASL $6033,x        ; $fdb0: 1e 33 60  
            .hex 67 63         ; $fdb3: 67 63     Invalid Opcode - RRA $63
            .hex 37 1d         ; $fdb5: 37 1d     Invalid Opcode - RLA $1d,x
            BRK                ; $fdb7: 00        
            .hex 63 63         ; $fdb8: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 63 7f         ; $fdba: 63 7f     Invalid Opcode - RRA ($7f,x)
__fdbc:     .hex 63 63         ; $fdbc: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 63 00         ; $fdbe: 63 00     Invalid Opcode - RRA ($00,x)
            .hex 3c 18 18      ; $fdc0: 3c 18 18  Invalid Opcode - NOP $1818,x
            CLC                ; $fdc3: 18        
            CLC                ; $fdc4: 18        
            CLC                ; $fdc5: 18        
            .hex 3c 00 1f      ; $fdc6: 3c 00 1f  Invalid Opcode - NOP $1f00,x
            ASL $06            ; $fdc9: 06 06     
            ASL $06            ; $fdcb: 06 06     
            ROR $3c            ; $fdcd: 66 3c     
            BRK                ; $fdcf: 00        
            ROR $66            ; $fdd0: 66 66     
            JMP ($6c78)        ; $fdd2: 6c 78 6c  

;-------------------------------------------------------------------------------
            .hex 67 63         ; $fdd5: 67 63     Invalid Opcode - RRA $63
            BRK                ; $fdd7: 00        
            SEI                ; $fdd8: 78        
            BMI __fe3b         ; $fdd9: 30 60     
            RTS                ; $fddb: 60        

;-------------------------------------------------------------------------------
            .hex 63 63         ; $fddc: 63 63     Invalid Opcode - RRA ($63,x)
            ROR $6300,x        ; $fdde: 7e 00 63  
            .hex 77 7f         ; $fde1: 77 7f     Invalid Opcode - RRA $7f,x
            .hex 6b 63         ; $fde3: 6b 63     Invalid Opcode - ARR #$63
            .hex 63 63         ; $fde5: 63 63     Invalid Opcode - RRA ($63,x)
            BRK                ; $fde7: 00        
            .hex 63 73         ; $fde8: 63 73     Invalid Opcode - RRA ($73,x)
            .hex 7b 6f 67      ; $fdea: 7b 6f 67  Invalid Opcode - RRA $676f,y
            .hex 63 63         ; $fded: 63 63     Invalid Opcode - RRA ($63,x)
            BRK                ; $fdef: 00        
            .hex 1c 36 63      ; $fdf0: 1c 36 63  Invalid Opcode - NOP $6336,x
            .hex 63 63         ; $fdf3: 63 63     Invalid Opcode - RRA ($63,x)
            ROL $1c,x          ; $fdf5: 36 1c     
            BRK                ; $fdf7: 00        
            ROR $6373          ; $fdf8: 6e 73 63  
            ROR $6060,x        ; $fdfb: 7e 60 60  
            RTS                ; $fdfe: 60        

;-------------------------------------------------------------------------------
            BRK                ; $fdff: 00        
__fe00:     .hex 1c 36 63      ; $fe00: 1c 36 63  Invalid Opcode - NOP $6336,x
            .hex 6b 67         ; $fe03: 6b 67     Invalid Opcode - ARR #$67
            ROL $1d,x          ; $fe05: 36 1d     
            BRK                ; $fe07: 00        
            ROR $6373          ; $fe08: 6e 73 63  
            ROR $676c,x        ; $fe0b: 7e 6c 67  
            .hex 63 00         ; $fe0e: 63 00     Invalid Opcode - RRA ($00,x)
            ROL $6063,x        ; $fe10: 3e 63 60  
            ROL $6303,x        ; $fe13: 3e 03 63  
            ROL $7e00,x        ; $fe16: 3e 00 7e  
            .hex 5a            ; $fe19: 5a        Invalid Opcode - NOP 
            CLC                ; $fe1a: 18        
            CLC                ; $fe1b: 18        
            CLC                ; $fe1c: 18        
            CLC                ; $fe1d: 18        
            .hex 3c 00 73      ; $fe1e: 3c 00 73  Invalid Opcode - NOP $7300,x
            .hex 33 63         ; $fe21: 33 63     Invalid Opcode - RLA ($63),y
            .hex 63 63         ; $fe23: 63 63     Invalid Opcode - RRA ($63,x)
            ROR $3c,x          ; $fe25: 76 3c     
            BRK                ; $fe27: 00        
            .hex 73 33         ; $fe28: 73 33     Invalid Opcode - RRA ($33),y
            .hex 63 63         ; $fe2a: 63 63     Invalid Opcode - RRA ($63,x)
            ROR $3c            ; $fe2c: 66 3c     
            CLC                ; $fe2e: 18        
            BRK                ; $fe2f: 00        
            .hex 73 33         ; $fe30: 73 33     Invalid Opcode - RRA ($33),y
            .hex 63 6b         ; $fe32: 63 6b     Invalid Opcode - RRA ($6b,x)
            .hex 7f 77 63      ; $fe34: 7f 77 63  Invalid Opcode - RRA $6377,x
            BRK                ; $fe37: 00        
            .hex 63 63         ; $fe38: 63 63     Invalid Opcode - RRA ($63,x)
            .hex 36            ; $fe3a: 36        Suspected data
__fe3b:     .hex 1c 36 63      ; $fe3b: 1c 36 63  Invalid Opcode - NOP $6336,x
            .hex 63 00         ; $fe3e: 63 00     Invalid Opcode - RRA ($00,x)
            .hex 33 63         ; $fe40: 33 63     Invalid Opcode - RLA ($63),y
            .hex 63 36         ; $fe42: 63 36     Invalid Opcode - RRA ($36,x)
            .hex 1c 78 70      ; $fe44: 1c 78 70  Invalid Opcode - NOP $7078,x
            BRK                ; $fe47: 00        
            .hex 7f 63 06      ; $fe48: 7f 63 06  Invalid Opcode - RRA $0663,x
            .hex 1c 33 63      ; $fe4b: 1c 33 63  Invalid Opcode - NOP $6333,x
            ROR $3c00,x        ; $fe4e: 7e 00 3c  
            BMI __fe83         ; $fe51: 30 30     
            BMI __fe85         ; $fe53: 30 30     
            BMI __fe93         ; $fe55: 30 3c     
            BRK                ; $fe57: 00        
            RTI                ; $fe58: 40        

;-------------------------------------------------------------------------------
            RTS                ; $fe59: 60        

;-------------------------------------------------------------------------------
            BMI __fe74         ; $fe5a: 30 18     
            .hex 0c 06 02      ; $fe5c: 0c 06 02  Invalid Opcode - NOP $0206
            BRK                ; $fe5f: 00        
            .hex 3c 0c 0c      ; $fe60: 3c 0c 0c  Invalid Opcode - NOP $0c0c,x
            .hex 0c 0c 0c      ; $fe63: 0c 0c 0c  Invalid Opcode - NOP $0c0c
            .hex 3c 00 00      ; $fe66: 3c 00 00  Bad Addr Mode - NOP $0000,x
            CLC                ; $fe69: 18        
            .hex 3c 7e 18      ; $fe6a: 3c 7e 18  Invalid Opcode - NOP $187e,x
            CLC                ; $fe6d: 18        
            CLC                ; $fe6e: 18        
            CLC                ; $fe6f: 18        
            BRK                ; $fe70: 00        
            BRK                ; $fe71: 00        
            BRK                ; $fe72: 00        
            BRK                ; $fe73: 00        
__fe74:     BRK                ; $fe74: 00        
            BRK                ; $fe75: 00        
            .hex ff ff 30      ; $fe76: ff ff 30  Invalid Opcode - ISC $30ff,x
            BMI __fe93         ; $fe79: 30 18     
            BRK                ; $fe7b: 00        
            BRK                ; $fe7c: 00        
            BRK                ; $fe7d: 00        
            BRK                ; $fe7e: 00        
            BRK                ; $fe7f: 00        
            BRK                ; $fe80: 00        
            BRK                ; $fe81: 00        
            .hex 3f            ; $fe82: 3f        Suspected data
__fe83:     .hex 63 63         ; $fe83: 63 63     Invalid Opcode - RRA ($63,x)
__fe85:     .hex 67 3b         ; $fe85: 67 3b     Invalid Opcode - RRA $3b
            BRK                ; $fe87: 00        
            RTS                ; $fe88: 60        

;-------------------------------------------------------------------------------
            RTS                ; $fe89: 60        

;-------------------------------------------------------------------------------
            ROR $6373          ; $fe8a: 6e 73 63  
            .hex 63 3e         ; $fe8d: 63 3e     Invalid Opcode - RRA ($3e,x)
            BRK                ; $fe8f: 00        
            BRK                ; $fe90: 00        
            BRK                ; $fe91: 00        
            .hex 3e            ; $fe92: 3e        Suspected data
__fe93:     .hex 63 60         ; $fe93: 63 60     Invalid Opcode - RRA ($60,x)
            .hex 63 3e         ; $fe95: 63 3e     Invalid Opcode - RRA ($3e,x)
            BRK                ; $fe97: 00        
            .hex 03 03         ; $fe98: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 3b 67 63      ; $fe9a: 3b 67 63  Invalid Opcode - RLA $6367,y
            .hex 63 3e         ; $fe9d: 63 3e     Invalid Opcode - RRA ($3e,x)
            BRK                ; $fe9f: 00        
            BRK                ; $fea0: 00        
            BRK                ; $fea1: 00        
            ROL $7f61,x        ; $fea2: 3e 61 7f  
            RTS                ; $fea5: 60        

;-------------------------------------------------------------------------------
            ROL $0e00,x        ; $fea6: 3e 00 0e  
            CLC                ; $fea9: 18        
            CLC                ; $feaa: 18        
            .hex 3c 18 18      ; $feab: 3c 18 18  Invalid Opcode - NOP $1818,x
            .hex 3c 00 00      ; $feae: 3c 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $feb1: 00        
            ROL $6360,x        ; $feb2: 3e 60 63  
            .hex 63 3d         ; $feb5: 63 3d     Invalid Opcode - RRA ($3d,x)
            BRK                ; $feb7: 00        
            RTS                ; $feb8: 60        

;-------------------------------------------------------------------------------
            RTS                ; $feb9: 60        

;-------------------------------------------------------------------------------
            ROR $6373          ; $feba: 6e 73 63  
            ROR $67            ; $febd: 66 67     
            BRK                ; $febf: 00        
            BRK                ; $fec0: 00        
            BRK                ; $fec1: 00        
            ASL $0c0c,x        ; $fec2: 1e 0c 0c  
            .hex 0c 1e 00      ; $fec5: 0c 1e 00  Bad Addr Mode - NOP $001e
            BRK                ; $fec8: 00        
            BRK                ; $fec9: 00        
            .hex 3f 06 06      ; $feca: 3f 06 06  Invalid Opcode - RLA $0606,x
            ASL $66            ; $fecd: 06 66     
            .hex 3c 60 60      ; $fecf: 3c 60 60  Invalid Opcode - NOP $6060,x
            ROR $6e            ; $fed2: 66 6e     
            .hex 7c 67 63      ; $fed4: 7c 67 63  Invalid Opcode - NOP $6367,x
            BRK                ; $fed7: 00        
            .hex 1c 0c 0c      ; $fed8: 1c 0c 0c  Invalid Opcode - NOP $0c0c,x
            .hex 0c 0c 0c      ; $fedb: 0c 0c 0c  Invalid Opcode - NOP $0c0c
            .hex 1e 00 00      ; $fede: 1e 00 00  Bad Addr Mode - ASL $0000,x
            BRK                ; $fee1: 00        
            ROR $6b7f          ; $fee2: 6e 7f 6b  
            .hex 62            ; $fee5: 62        Invalid Opcode - KIL 
            .hex 67 00         ; $fee6: 67 00     Invalid Opcode - RRA $00
            BRK                ; $fee8: 00        
            BRK                ; $fee9: 00        
            ROR $6373          ; $feea: 6e 73 63  
            ROR $67            ; $feed: 66 67     
            BRK                ; $feef: 00        
            BRK                ; $fef0: 00        
            BRK                ; $fef1: 00        
            ROL $6363,x        ; $fef2: 3e 63 63  
            .hex 63 3e         ; $fef5: 63 3e     Invalid Opcode - RRA ($3e,x)
            BRK                ; $fef7: 00        
            BRK                ; $fef8: 00        
            BRK                ; $fef9: 00        
            ROL $7363,x        ; $fefa: 3e 63 73  
            ROR $6060          ; $fefd: 6e 60 60  
            BRK                ; $ff00: 00        
            BRK                ; $ff01: 00        
            ROL $6763,x        ; $ff02: 3e 63 67  
            .hex 3b 03 03      ; $ff05: 3b 03 03  Invalid Opcode - RLA $0303,y
            BRK                ; $ff08: 00        
            BRK                ; $ff09: 00        
            ROR $6373          ; $ff0a: 6e 73 63  
            .hex 7e 63 00      ; $ff0d: 7e 63 00  Bad Addr Mode - ROR $0063,x
            BRK                ; $ff10: 00        
            BRK                ; $ff11: 00        
            ROL $1c71,x        ; $ff12: 3e 71 1c  
            .hex 47 3e         ; $ff15: 47 3e     Invalid Opcode - SRE $3e
            BRK                ; $ff17: 00        
            ASL $0c            ; $ff18: 06 0c     
            .hex 3f 18 18      ; $ff1a: 3f 18 18  Invalid Opcode - RLA $1818,x
            .hex 1b 0e 00      ; $ff1d: 1b 0e 00  Invalid Opcode - SLO $000e,y
            BRK                ; $ff20: 00        
            BRK                ; $ff21: 00        
            .hex 73 33         ; $ff22: 73 33     Invalid Opcode - RRA ($33),y
            .hex 63 67         ; $ff24: 63 67     Invalid Opcode - RRA ($67,x)
            .hex 3b 00 00      ; $ff26: 3b 00 00  Invalid Opcode - RLA $0000,y
            BRK                ; $ff29: 00        
            .hex 73 33         ; $ff2a: 73 33     Invalid Opcode - RRA ($33),y
            .hex 63 66         ; $ff2c: 63 66     Invalid Opcode - RRA ($66,x)
            .hex 3c 00 00      ; $ff2e: 3c 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $ff31: 00        
            .hex 63 6b         ; $ff32: 63 6b     Invalid Opcode - RRA ($6b,x)
            .hex 7f 77 63      ; $ff34: 7f 77 63  Invalid Opcode - RRA $6377,x
            BRK                ; $ff37: 00        
            BRK                ; $ff38: 00        
            BRK                ; $ff39: 00        
            .hex 63 36         ; $ff3a: 63 36     Invalid Opcode - RRA ($36,x)
            .hex 1c 36 63      ; $ff3c: 1c 36 63  Invalid Opcode - NOP $6336,x
            BRK                ; $ff3f: 00        
            BRK                ; $ff40: 00        
            BRK                ; $ff41: 00        
            .hex 33 63         ; $ff42: 33 63     Invalid Opcode - RLA ($63),y
            .hex 63 3f         ; $ff44: 63 3f     Invalid Opcode - RRA ($3f,x)
            .hex 03 3e         ; $ff46: 03 3e     Invalid Opcode - SLO ($3e,x)
            BRK                ; $ff48: 00        
            BRK                ; $ff49: 00        
            .hex 7f 0e 1c      ; $ff4a: 7f 0e 1c  Invalid Opcode - RRA $1c0e,x
            SEC                ; $ff4d: 38        
            .hex 7f 00 3c      ; $ff4e: 7f 00 3c  Invalid Opcode - RRA $3c00,x
            .hex 42            ; $ff51: 42        Invalid Opcode - KIL 
            STA $a1a1,y        ; $ff52: 99 a1 a1  
            STA $3c42,y        ; $ff55: 99 42 3c  
            BRK                ; $ff58: 00        
            BRK                ; $ff59: 00        
            BRK                ; $ff5a: 00        
            BRK                ; $ff5b: 00        
            BRK                ; $ff5c: 00        
            BRK                ; $ff5d: 00        
            BRK                ; $ff5e: 00        
            BRK                ; $ff5f: 00        
            BRK                ; $ff60: 00        
            BRK                ; $ff61: 00        
            BRK                ; $ff62: 00        
            BRK                ; $ff63: 00        
            BRK                ; $ff64: 00        
            BRK                ; $ff65: 00        
            BRK                ; $ff66: 00        
            BRK                ; $ff67: 00        
            BRK                ; $ff68: 00        
            BRK                ; $ff69: 00        
            BRK                ; $ff6a: 00        
            BRK                ; $ff6b: 00        
            BRK                ; $ff6c: 00        
            BRK                ; $ff6d: 00        
            BRK                ; $ff6e: 00        
            BRK                ; $ff6f: 00        
            BRK                ; $ff70: 00        
            BRK                ; $ff71: 00        
            BRK                ; $ff72: 00        
            BRK                ; $ff73: 00        
            BRK                ; $ff74: 00        
            BRK                ; $ff75: 00        
            BRK                ; $ff76: 00        
            BRK                ; $ff77: 00        
__ff78:     .hex 0f 06 12      ; $ff78: 0f 06 12  Invalid Opcode - SLO $1206
            .hex 33 33         ; $ff7b: 33 33     Invalid Opcode - RLA ($33),y
            ASL $12            ; $ff7d: 06 12     
            .hex 33 38         ; $ff7f: 33 38     Invalid Opcode - RLA ($38),y
            ASL $12            ; $ff81: 06 12     
            .hex 33 3a         ; $ff83: 33 3a     Invalid Opcode - RLA ($3a),y
            ASL $12            ; $ff85: 06 12     
            .hex 33 0f         ; $ff87: 33 0f     Invalid Opcode - RLA ($0f),y
            ASL $12            ; $ff89: 06 12     
            .hex 33 33         ; $ff8b: 33 33     Invalid Opcode - RLA ($33),y
            ASL $12            ; $ff8d: 06 12     
            .hex 33 38         ; $ff8f: 33 38     Invalid Opcode - RLA ($38),y
            ASL $12            ; $ff91: 06 12     
            .hex 33 3a         ; $ff93: 33 3a     Invalid Opcode - RLA ($3a),y
            ASL $12            ; $ff95: 06 12     
            .hex 33 00         ; $ff97: 33 00     Invalid Opcode - RLA ($00),y
            BRK                ; $ff99: 00        
            BRK                ; $ff9a: 00        
            BRK                ; $ff9b: 00        
            BRK                ; $ff9c: 00        
            BRK                ; $ff9d: 00        
            BRK                ; $ff9e: 00        
            BRK                ; $ff9f: 00        
            BRK                ; $ffa0: 00        
            BRK                ; $ffa1: 00        
            BRK                ; $ffa2: 00        
            BRK                ; $ffa3: 00        
            BRK                ; $ffa4: 00        
            BRK                ; $ffa5: 00        
            BRK                ; $ffa6: 00        
            BRK                ; $ffa7: 00        
            BRK                ; $ffa8: 00        
            BRK                ; $ffa9: 00        
            BRK                ; $ffaa: 00        
            BRK                ; $ffab: 00        
            BRK                ; $ffac: 00        
            BRK                ; $ffad: 00        
            BRK                ; $ffae: 00        
            BRK                ; $ffaf: 00        
            BRK                ; $ffb0: 00        
            BRK                ; $ffb1: 00        
            BRK                ; $ffb2: 00        
            BRK                ; $ffb3: 00        
            BRK                ; $ffb4: 00        
            BRK                ; $ffb5: 00        
            BRK                ; $ffb6: 00        
            BRK                ; $ffb7: 00        
            BRK                ; $ffb8: 00        
            BRK                ; $ffb9: 00        
            BRK                ; $ffba: 00        
            BRK                ; $ffbb: 00        
            BRK                ; $ffbc: 00        
            BRK                ; $ffbd: 00        
            BRK                ; $ffbe: 00        
            BRK                ; $ffbf: 00        
            BRK                ; $ffc0: 00        
            BRK                ; $ffc1: 00        
            BRK                ; $ffc2: 00        
            BRK                ; $ffc3: 00        
            BRK                ; $ffc4: 00        
            BRK                ; $ffc5: 00        
            BRK                ; $ffc6: 00        
            BRK                ; $ffc7: 00        
            BRK                ; $ffc8: 00        
            BRK                ; $ffc9: 00        
            BRK                ; $ffca: 00        
            BRK                ; $ffcb: 00        
            BRK                ; $ffcc: 00        
            BRK                ; $ffcd: 00        
            BRK                ; $ffce: 00        
            BRK                ; $ffcf: 00        
            BRK                ; $ffd0: 00        
            BRK                ; $ffd1: 00        
            BRK                ; $ffd2: 00        
            BRK                ; $ffd3: 00        
            BRK                ; $ffd4: 00        
            BRK                ; $ffd5: 00        
            BRK                ; $ffd6: 00        
            BRK                ; $ffd7: 00        
            BRK                ; $ffd8: 00        
            BRK                ; $ffd9: 00        
            BRK                ; $ffda: 00        
            BRK                ; $ffdb: 00        
            BRK                ; $ffdc: 00        
            BRK                ; $ffdd: 00        
            BRK                ; $ffde: 00        
            BRK                ; $ffdf: 00        
            BRK                ; $ffe0: 00        
            BRK                ; $ffe1: 00        
            BRK                ; $ffe2: 00        
            BRK                ; $ffe3: 00        
            BRK                ; $ffe4: 00        
            BRK                ; $ffe5: 00        
            BRK                ; $ffe6: 00        
            BRK                ; $ffe7: 00        
            BRK                ; $ffe8: 00        
            BRK                ; $ffe9: 00        
            BRK                ; $ffea: 00        
            BRK                ; $ffeb: 00        
            BRK                ; $ffec: 00        
            BRK                ; $ffed: 00        
            BRK                ; $ffee: 00        
            BRK                ; $ffef: 00        
            BRK                ; $fff0: 00        
            BRK                ; $fff1: 00        
            BRK                ; $fff2: 00        
            BRK                ; $fff3: 00        
            BRK                ; $fff4: 00        
            BRK                ; $fff5: 00        
            BRK                ; $fff6: 00        
            BRK                ; $fff7: 00        
            BRK                ; $fff8: 00        
            BRK                ; $fff9: 00        

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: af c5     Vector table
            .dw reset                      ; $fffc: 00 c0     Vector table
            .dw irq                        ; $fffe: f4 c5     Vector table
