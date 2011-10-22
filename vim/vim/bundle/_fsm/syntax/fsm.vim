
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword fsmState		FETCH0 FETCH1 FETCH2 FETCH3
syn keyword fsmState 		ADD0 ADD1 ADD2 ADD3
syn keyword fsmState 		ADDI0 ADDI1 ADDI2 ADDI3
syn keyword fsmState 		NAND0 NAND1 NAND2 NAND3
syn keyword fsmState 		LW0 LW1 LW2 LW3
syn keyword fsmState 		SW0 SW1 SW2 SW3
syn keyword fsmState 		BEQ0 BEQ1 BEQ2 BEQ3 BEQ4 BEQ5 BEQ6 BEQ7 BEQ8
syn keyword fsmState 		JALR0 JALR1 JALR2 JALR3 JALR4
syn keyword fsmState 		DUMMY DECODE FUTURE RESERVED HALT


syn keyword fsmDrive		DrREG DrMEM DrALU DrPC DrOFF
syn keyword fsmControl 		LdPC LdIR LdMAR LdA LdB LdZ WrREG WrMEM
syn keyword fsmControl 		SelPR RegSelLo RegSelHi ALULo ALUHi

syn keyword fsmkeyword		goto onz else dispatch

" hi default link		fsmState		Identifier
hi default link		fsmState		PreProc
hi default link		fsmControl		Constant
hi default link		fsmDrive		Character
hi default link		fsmkeyword		Statement
