; For more info about DCC6502, e-mail veilleux@ameth.org
;
; FILENAME: prg031.bin, File Size: 8191, ORG: $E000
;     -> NES mode enabled
;---------------------------------------------------------------------------

; DMC sounds are here!
; Note that due to limitation of the register, these sounds must be aligned on 64-byte ($40) boundaries

DMC01:	.byte $55, $55, $55, $95, $AA, $2A, $95, $E0, $7F, $FC, $C0, $F1, $03, $28, $FE, $FF 
	.byte $FF, $F1, $5F, $3F, $00, $00, $00, $00, $00, $00, $08, $80, $C0, $F1, $FF, $C7 
	.byte $8B, $1F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AB, $6A, $9B, $AA, $92, $52, $25 
	.byte $95, $24, $25, $92, $80, $4A, $50, $05, $00, $00, $80, $20, $42, $04, $08, $E2 
	.byte $FF, $01, $80, $6D, $AB, $6D, $DF, $BB, $77, $7B, $AB, $AF, $DD, $D5, $7D, $DD 
	.byte $BF, $FF, $EF, $B6, $6D, $6F, $BB, $6D, $AF, $2A, $95, $94, $24, $49, $92, $88 
	.byte $42, $84, $48, $88, $04, $09, $49, $92, $24, $51, $22, $A5, $92, $22, $49, $AA 
	.byte $52, $A9, $AA, $5A, $55, $AD, $55, $55, $AD, $6D, $B5, $AD, $6D, $B5, $6D, $DB 
DMC01_End

DMC02:	.byte $55, $60, $6B, $79, $EA, $F8, $FF, $43, $82, $24, $00, $20, $8E, $ED, $C7, $A5 
	.byte $1F, $10, $B7, $7F, $FF, $FF, $4D, $63, $C1, $15, $24, $41, $92, $28, $09, $4D 
	.byte $25, $44, $42, $10, $CA, $BE, $FB, $FF, $7F, $DF, $F5, $EE, $D3, $31, $0E, $FF 
	.byte $41, $10, $00, $21, $92, $20, $00, $F4, $38, $56, $5D, $EB, $F9, $9D, $3C, $BF 
	.byte $ED, $E7, $D7, $AA, $6C, $59, $16, $A2, $00, $61, $83, $F0, $72, $3A, $0B, $81 
	.byte $45, $41, $09, $DA, $F1, $FD, $FF, $FF, $5E, $AF, $C4, $4B, $D3, $C9, $8A, $82 
	.byte $24, $89, $28, $06, $02, $47, $55, $E1, $3D, $AE, $EF, $BC, $F4, $52, $D5, $55 
	.byte $BD, $BC, $7A, $1E, $57, $51, $0A, $25, $29, $A8, $A8, $38, $69, $D3, $88, $AA 
	.byte $18, $78, $6C, $BA, $DE, $7D, $ED, $FB, $43, $E7, $34, $4C, $2C, $25, $AD, $92 
	.byte $A4, $51, $A5, $C8, $62, $E2, $06, $8D, $C7, $F1, $AD, $65, $37, $B4, $AC, $5A 
	.byte $4D, $9F, $3E, $6D, $3C, $A5, $B2, $24, $A9, $A2, $92, $86, $A9, $44, $45, $EE 
	.byte $2C, $5E, $AA, $2D, $AE, $53, $9F, $4A, $9D, $3D, $4E, $8D, $3B, $8A, $A9, $E5 
	.byte $C8, $B2, $2C, $34, $52, $D4, $59, $B1, $D2, $8A, $55, $C3, $5B, $A9, $55, $8B 
	.byte $76, $7C, $79, $6C, $2B, $CE, $F2, $64, $31, $8E, $64, $45, $72, $64, $D1, $92 
	.byte $E3, $54, $AD, $5A, $35, $55, $D7, $58, $1E, $1D, $55, $4E, $1D, $57, $56, $55 
	.byte $CB, $AA, $AA, $2A, $69, $A5, $4A, $AA, $AA, $4A, $4D, $6A, $31, $4D, $D3, $A9 
	.byte $6A, $AD, $7A, $5C, $65, $AB, $AA, $AC, $CA, $72, $AA, $4A, $B5, $D0, $8A, $95 
	.byte $AC, $54, $95, $6C, $D9, $52, $5B, $A5, $AA, $D5, $4A, $B5, $2C, $4B, $B6, $D4 
	.byte $34, $9D, $95, $56, $55, $55, $55, $55, $9A, $2A, $15, $A7, $AA, $52, $2D, $55 
	.byte $69, $95, $B6, $AA, $65, $D5, $6A, $AA, $5A, $EA, $58, $55, $69, $6A, $A9, $96 
	.byte $D2, $34, $95, $53, $A9, $A9, $2A, $35, $55, $D3, $AA, $6A, $55, $B5, $E2, $AA 
	.byte $34, $B5, $9C, $C6, $B1, $95, $AA, $A9, $AA, $B4, $52, $55, $8B, $A9, $9A, $A6 
	.byte $AA, $9A, $5A, $6A, $A5, $56, $56, $65, $55, $55, $AD, $B4, $B2, $AA, $54, $55 
	.byte $2D, $D5, $AA, $AC, $AA, $52, $2B, $4B, $95, $AA, $AA, $B2, $2A, $AB, $AA, $6A 
	.byte $A5, $55, $D5, $B4, $AA, $AA, $AA, $A9, $AA, $AA, $52, $55, $59, $A9, $A5, $AA 
	.byte $56, $5A, $A5, $95, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55 
	.byte $55, $55, $55, $55, $55, $55, $53, $35, $55, $D5, $54, $55, $55, $55, $A9, $A5 
	.byte $AA, $AA, $6A, $59, $69, $55, $55, $B5, $AA, $AA, $B2, $2C, $2B, $55, $55, $55 
DMC02_End


Music_PlayDMC:
	LDA DMC_Queue	 ; Get value queued for DMC
	CMP #$7e	 
	BEQ Music_StopDMC	; If rest value was queued, jump to Music_StopDMC
	LDA DMC_Queue	 	; A = queue value
	BNE PRG063_E2E1	 	; If something was queued, jump to PRG063_E2E1

	; Nothing queued...
	LDA DMC_Current 
	BEQ Music_StopDMC	; If nothing is playing, jump to Music_StopDMC
	DEC DMC_Time	 	; DMC_Time--
	BNE PRG063_E2E0	 	; If time has not expired on DMC, jump to PRG063_E2E0 (RTS)

Music_StopDMC:
	LDA #$00	 
	STA DMC_Current ; Stop any current DMC sound
	LDA #$0f	 
	STA PAPU_EN	 ; Disable DMC

PRG063_E2E0:
	RTS		 ; Return

PRG063_E2E1:
	STA DMC_Current 
	TAY		 ; Y = DMC_Current

	LDA DMC_MODCTL_LUT-1,Y		; Subtract 1 from LUT address since $00 is disabled and $01 is first DMC sound
	STA PAPU_MODCTL	 		; Update PAPU_MODCTL
	STA PAPU_MODCTL_Copy		; ... and it's copy

	LDA DMC_MODADDR_LUT-1,Y	; Subtract 1 from LUT address since $00 is disabled and $01 is first DMC sound
	STA PAPU_MODADDR	 	; Set PAPU_MODADDR (address of sound)

	LDA DMC_MODLEN_LUT-1,Y		; Subtract 1 from LUT address since $00 is disabled and $01 is first DMC sound
	STA PAPU_MODLEN	 		; Set PAPU_MODLEN (length of sound)

	LDA #$a0	 
	STA DMC_Time	 ; DMC_Time = $A0 (always apparently)

	LDA #$0f	 
	STA PAPU_EN	 ; Disable DMC
	LDA #$1f	 
	STA PAPU_EN	 ; Enable DMC
	RTS		 ; Return

	; The address are $C000 | (value << 6)
MADR .func ((\1 & $3FFF) >> 6)

	; The length is (value << 4) + 1 (minimum 1 byte long to $FF1 bytes long)
MLEN .func ((\2 - \1) >> 4)


	; Sample 3: "BAD SAMPLE LENGTH"
	; Seems there is an errorenous, very long/very wrong sample length on
	; Sample 3.  Whether this is a mistake or a "lost DMC sample" I don't
	; know.  In any case, Sample 1 plays DMC02 correctly, Sample 3 would
	; play DMC02 and just continue on through code, which would be noisy.

DMC_MODADDR_LUT:
	.byte MADR(DMC01)	; Sample  0 (DMC01)
	.byte MADR(DMC02)	; Sample  1 (DMC02)
	.byte MADR(DMC03)	; Sample  2 (DMC03)
	.byte MADR(DMC02)	; Sample  3 (DMC02 BAD SAMPLE LENGTH)
	.byte MADR(DMC04)	; Sample  4 (DMC04)
	.byte MADR(DMC05)	; Sample  5 (DMC05)
	.byte MADR(DMC05)	; Sample  6 (DMC05 3/4 length)
	.byte MADR(DMC06)	; Sample  7 (DMC06)
	.byte MADR(DMC06)	; Sample  8 (DMC06 slower)
	.byte MADR(DMC07)	; Sample  9 (DMC07)
	.byte MADR(DMC07)	; Sample 10 (DMC07 slower)
	.byte MADR(DMC05)	; Sample 11 (DMC05 1/2 length)
	.byte MADR(DMC08)	; Sample 12 (DMC08)
	.byte MADR(DMC09)	; Sample 13 (DMC09)
	.byte MADR(DMC09)	; Sample 14 (DMC09 slower)
	.byte MADR(DMC09)	; Sample 15 (DMC09 even slower)

DMC_MODLEN_LUT:
	; these are (value << 4) + 1, that is minimum 1 byte long to FF1 bytes
	.byte MLEN(DMC01, DMC01_End)	; Sample  0 (DMC01)
	.byte MLEN(DMC02, DMC02_End)	; Sample  1 (DMC02)
	.byte MLEN(DMC03, DMC03_End)	; Sample  2 (DMC03)
	.byte MLEN(DMC02, DMC02_End)	; Sample  3 (DMC02 BAD SAMPLE LENGTH / SB: Removed, redundant)
	.byte MLEN(DMC04, DMC04_End)	; Sample  4 (DMC04)
	.byte MLEN(DMC05, DMC05_End)	; Sample  5 (DMC05)
	.byte MLEN(DMC05, DMC05_C)	; Sample  6 (DMC05 3/4 length)
	.byte MLEN(DMC06, DMC06_End)	; Sample  7 (DMC06)
	.byte MLEN(DMC06, DMC06_End)	; Sample  8 (DMC06 slower)
	.byte MLEN(DMC07, DMC07_End)	; Sample  9 (DMC07)
	.byte MLEN(DMC07, DMC07_End)	; Sample 10 (DMC07 slower)
	.byte MLEN(DMC05, DMC05_B)	; Sample 11 (DMC05 1/2 length)
	.byte MLEN(DMC08, DMC08_End)	; Sample 12 (DMC08)
	.byte MLEN(DMC09, DMC09_End)	; Sample 13 (DMC09)
	.byte MLEN(DMC09, DMC09_End)	; Sample 14 (DMC09 slower)
	.byte MLEN(DMC09, DMC09_End)	; Sample 15 (DMC09 even slower)

DMC_MODCTL_LUT:
	.byte $0F	; Sample  0 (DMC01)
	.byte $0F	; Sample  1 (DMC02)
	.byte $0F	; Sample  2 (DMC03)
	.byte $0F	; Sample  3 (DMC02 BAD SAMPLE LENGTH)
	.byte $0F	; Sample  4 (DMC04)
	.byte $0F	; Sample  5 (DMC05)
	.byte $0E	; Sample  6 (DMC05 3/4 length)
	.byte $0F	; Sample  7 (DMC06)
	.byte $0E	; Sample  8 (DMC06 slower)
	.byte $0F	; Sample  9 (DMC07)
	.byte $0E	; Sample 10 (DMC07 slower)
	.byte $0D	; Sample 11 (DMC05 1/2 length)
	.byte $0F	; Sample 12 (DMC08)
	.byte $0F	; Sample 13 (DMC09)
	.byte $0E	; Sample 14 (DMC09 slower)
	.byte $0D	; Sample 15 (DMC09 even slower)

	.byte $60	; ???

Music_GetRestTicks:
	; A is a byte from the music segment, $80-$fe/$ff on non-squares
	; Only the lower 4 bits are used here
	;
	; The rest value returned is:
	; Music_RestH_LUT[Music_RestH_Base + (0 to 15)]
	;
	; Note that Music_RestH_Base is always divisible by $10

	AND #$0f	 	; Get lower 4 bits
	ADD Music_RestH_Base	; Add this to Music_RestH_Base

	TAY			; Y = A
	LDA Music_RestH_LUT,Y 	; Get value from Music_RestH_LUT 
	RTS		 	; Return

SndMus_QueueCommonJ:
	JMP SndMus_QueueCommon

; FIXME: Anybody want to claim this?
; $E34C
	JMP Music_StopAll	 

Sound_PlayMusic:
	LDA Sound_QMusic1
	BNE SndMus_QueueCommonJ	; If music from set 1 has been queued, jump to SndMus_QueueCommonJ

	; Music has not been queued from set 1...
	LDA SndCur_Music1	 
	BEQ PRG063_E364	 	; If no music is currently playing in set 1, jump to PRG063_E364

	LDA Sound_QMusic2
	BEQ PRG063_E361	 	; If music from set 2 has NOT been queued, jump to PRG063_E361


	; Music from set 2 has been queued!
	STA Music2_Hold	 	; Store it into the hold until the Set 1 song has expired!

PRG063_E361:
	JMP Music_Sq2Track

SndMus_QueueSet2C:

	; Shift it down 3 bits to make it a 1-31 index
	LSR A
	LSR A
	LSR A

	TAY		 		; Y = A
	DEY

	; SB: Set extended music bank and bring it in
	LDA Music_Set2C_Bank-1,Y
	JSR SndMus_SetExtBank

	LDA Music_Set2C_Starts-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	STA Music_Start	 		; Set Music_Start

	LDA Music_Set2C_Ends-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	ADD #$02	 		; A += 2 (Reason for adding two: The index counter is always one ahead, and the end index is INCLUSIVE!)
	STA Music_End			; Set Music_End

	LDA Music_Set2C_Loops-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	STA Music_Loop	 		; Set Music_Loop

	LDA Music_Start		; A = Music_Start


SndMus2C_NextOrStop:
	STA Music_NextIndex	; Update Music_NextIndex

SndMus2C_Next:

	INC Music_NextIndex	; Music_NextIndex++	(This makes the index always 1 ahead)

	LDY Music_NextIndex	; 
	CPY Music_End		; 
	BNE SndMus2C_LoadNext 	; If Music_NextIndex <> Music_End, jump to SndMus2C_LoadNext

	; We've reached the end of the song!
	LDA Music_Loop		; Reload with the loop start value
	BNE SndMus2C_NextOrStop		; Jump back so we play this index (unless loop = 0, in which case we stop)

	; If loop = 0, stop music
	JMP Music_StopAll

SndMus2C_LoadNext:
	; Load next "index" (Y) of Music Set 2 song...

	; SB: Refactored this so we could have more headers!

	; SB: Y -> 2 byte offset
	TYA
	ASL A
	TAY

	BCC Mus2C_LoadNoCarry

	; Get offset for the current index; it is always one ahead, so -1 from the LUT
	LDA Music_Set2C_HeaderLUT-2+$100,Y
	STA <Temp_Var1
	LDA Music_Set2C_HeaderLUT-1+$100,Y
	STA <Temp_Var2

	JMP SndMus_LoadNext_Cont


Mus2C_LoadNoCarry:
	; Get offset for the current index; it is always one ahead, so -1 from the LUT
	LDA Music_Set2C_HeaderLUT-2,Y
	STA <Temp_Var1
	LDA Music_Set2C_HeaderLUT-1,Y
	STA <Temp_Var2

	JMP SndMus_LoadNext_Cont


PRG063_E364:
	; No music in *Set 1* is currently playing
	; Music from Set 2 MAY have been queued

	; The following check is probably superfluous, as Set 1 should have
	; already been handled above...
	LDA Sound_QMusic1
	BNE SndMus_QueueCommonJ	; If music from set 1 has been queued, jump to SndMus_QueueCommonJ  

	; Set 2 is funny; it uses index in low bit and high bit.  ($01-$0F and $10-$F0)
	; Not really sure what the point of that is, except perhaps to break it up into two sets.
	; Allows 16 values though not all are used ($D0, $E0, $F0)

	; I'm breaking the Set 2 into Set 2A ($01-$0F) and Set 2B ($10-$F0)
	LDA Sound_QMusic2	
	AND #MUS2B_MASK	
	BEQ SndMus_QueueCommonJ	; If music selection is not Set 2B (or none queued), jump to SndMus_QueueCommonJ

	; If you're here, that means that there is a Set 2B queue
	; somewhere between $10 and $F0...
	LDA Sound_QMusic2
	BNE SndMus_QueueSet2B	; Whatever was queued, jump to SndMus_QueueSet2B

	LDA SndCur_Music2	 
	BNE PRG063_E3EB	 ; If something is playing in Set 2, jump to PRG063_E3EB

	RTS		 ; Return

	;;;; 
SndMus_QueueSet2B:
	; For queuing any Set 2B music $10 - $F0
	; SB: New Set 2C, music $18 - $F8

	STA SndCur_Music2	; Store which Set 2 song we're playing

	LDY #$00	 	
	STY SndCur_Music1	; Stop any Set 1 song

	; Save current song request
	PHA

	; SB: To access Set 2C
	AND #$04
	BEQ SndMus_Queue_Not2C	; If not a set 2C song, jump to SndMus_Queue_Not2C

	; Restore song request
	PLA

	JMP SndMus_QueueSet2C	; Otherwise, jump to SndMus_QueueSet2C



SndMus_Queue_Not2C:
	; Restore song request
	PLA

	; Shift it down 4 bits to make it a 1-15 index
	LSR A
	LSR A
	LSR A
	LSR A

	TAY		 		; Y = A

	; SB: Set extended music bank and bring it in
	LDA Music_Set2B_Bank-1,Y
	JSR SndMus_SetExtBank

	LDA Music_Set2B_Starts-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	STA Music_Start	 		; Set Music_Start

	LDA Music_Set2B_Ends-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	ADD #$02	 		; A += 2 (Reason for adding two: The index counter is always one ahead, and the end index is INCLUSIVE!)
	STA Music_End			; Set Music_End

	LDA Music_Set2B_Loops-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	STA Music_Loop	 		; Set Music_Loop

	LDA Music_Start		; A = Music_Start


SndMus2B_NextOrStop:
	STA Music_NextIndex	; Update Music_NextIndex

SndMus2B_Next:
	INC Music_NextIndex	; Music_NextIndex++	(This makes the index always 1 ahead)

	LDY Music_NextIndex	; 
	CPY Music_End		; 
	BNE SndMus2B_LoadNext 	; If Music_NextIndex <> Music_End, jump to SndMus2B_LoadNext

	; We've reached the end of the song!
	LDA Music_Loop		; Reload with the loop start value
	BNE SndMus2B_NextOrStop		; Jump back so we play this index (unless loop = 0, in which case we stop)

	; If loop = 0, stop music
	JMP Music_StopAll

PRG063_E3EB:
	JMP Music_Sq2Track

SndMus2B_LoadNext:
	; Load next "index" (Y) of Music Set 2 song...

	; SB: Refactored this so we could have more headers!

	; SB: Y -> 2 byte offset
	TYA
	ASL A
	TAY

	; Get offset for the current index; it is always one ahead, so -1 from the LUT
	LDA Music_Set2B_HeaderLUT-2,Y
	STA <Temp_Var1
	LDA Music_Set2B_HeaderLUT-1,Y
	STA <Temp_Var2

SndMus_LoadNext_Cont:

	; Clear 'Y'
	LDA #0
	TAY

	; Get and store rest lookup base index for this segment in Music_RestH_Base
	LDA [Temp_Var1],Y
	INY
	STA Music_RestH_Base	

	; Get and store the base address into [Music_Base_H][Music_Base_L]
	LDA [Temp_Var1],Y
	INY
	STA <Music_Base_L
	LDA [Temp_Var1],Y
	INY
	STA <Music_Base_H

	; Get and store triangle track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_TriTrkPos

	; Get and store square 1 track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_Sq1TrkOff

	; Set and store noise track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_NseTrkPos
	STA Music_NseStart	; Retain starting position for possible restoration later

	; Set and store DMC track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_PCMTrkPos
	STA Music_PCMStart	; Retain starting position for possible restoration later

	JMP PRG063_E48C

SndMus_QueueCommon:
	; Music has been queued!

	; This entry point is also used by Music Set 2A, so we
	; need to figure out which one we're doing!
	LDA Sound_QMusic1
	BNE SndMus_Queue1	; Queuing Music Set 1, jump to SndMus_Queue1


	; For queuing any Set 2A music $00 - $0F
	LDA Sound_QMusic2
	BNE PRG063_E401	 	; To queue Music Set 2A, jump to PRG063_E401

	LDA SndCur_Music1
	ORA SndCur_Music2
	BNE PRG063_E3EB	 	; If something is playing in Music Set 1 or Music Set 2A/B, jump to PRG063_E3EB

	; Nothing playing
	RTS		 ; Return

PRG063_E401:
	STA SndCur_Music2	; Store what set 2 song we're playing
	CMP #$09	 	
	BEQ PRG063_E411	 ; If queueing song $09 (coin heaven, sky map, etc.), jump to PRG063_E411
	CMP #$0a
	BEQ PRG063_E411	 ; If queueing song $0A Invincibility, jump to PRG063_E411

	LDY #$00
	STY Music_RestH_Off	 ; Reset the rest lookup offset adjust value

PRG063_E411:
	LDY #$00	
	STY SndCur_Music1 ; Stop any Set 1 song playing

	TAY		  		; Y = A

	LDA Music_Set2A_Bank-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	JSR SndMus_SetExtBank

	LDA Music_Set2A_Starts-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	STA Music_Start	  		; Set Music_Start

	LDA Music_Set2A_Ends-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	ADD #$02	 		; A += 2 (Reason for adding two: The index counter is always one ahead, and the end index is INCLUSIVE!)
	STA Music_End	 		; Set Music_End

	LDA Music_Set2A_Loops-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address 
	STA Music_Loop	 		; Set Music_Loop

	LDA Music_Start	 		; A = Music_Start

SndMus2A_NextOrStop:
	STA Music_NextIndex	 	; Update Music_NextIndex

SndMus2A_Next:
	INC Music_NextIndex	 	; Music_NextIndex++

	LDY Music_NextIndex	 	; 
	CPY Music_End	 		; 
	BNE SndMus2A_LoadNext	 	; If Music_NextIndex <> Music_End, jump to SndMus2A_LoadNext

	; We've reached the end of the song!
	LDA Music_Loop			; Reload with the loop start value
	BNE SndMus2A_NextOrStop		; Jump back so we play this index (unless loop = 0, in which case we stop)

	; If loop = 0, stop music
	JMP Music_StopAll

SndMus_Queue1:
	STA SndCur_Music1	; SndCur_Music1 = queued music
	
	LDY SndCur_Music2	; Y = SndCur_Music2
	STY Music2_Hold	 	; If a "set 2" song is playing, back up which one it is; we'll restart it after this song finishes (only really used for the "time low" song)
	LDY #$00	 	; 
	STY SndCur_Music2	; Stop "set 2" song (if any)
	STY Music_RestH_Off	; Clear the rest lookup base offset value

	; The following loop transforms the queue value into an index value.
	; This is the same basic procedure used for sound effects, and even
	; gives "priority" to different tunes, but that feature is probably
	; not really used at all...
PRG028_E456:
	INY		 ; Y++
	LSR A		 ; 
	BCC PRG028_E456	 ; If we haven't hit a bit, go around again...

	LDA Music_Set1_Bank-1,Y	; Because Y starts at '1', we must subtract 1 from the LUT address
	JSR SndMus_SetExtBank

SndMus2A_LoadNext:
	; Both Set 1 and 2A enter here...
	; The only difference is that Set 1 enters directly with an index in mind
	; Set 2A enters using the index counting system like 2B.  So it works since
	; 2B's lowest index is 08!

	; 'Y' is the next 1/2A index we're going to play
	; SB: Y -> 2 byte offset
	TYA
	ASL A
	TAY

	; Get offset for the current index; it is always one ahead, so -1 from the LUT
	LDA Music_Set1_Set2A_HeaderLUT-2,Y
	STA <Temp_Var1
	LDA Music_Set1_Set2A_HeaderLUT-1,Y
	STA <Temp_Var2

	; Clear 'Y'
	LDA #0
	TAY

	; Get and store rest lookup base index for this segment in Music_RestH_Base
	LDA [Temp_Var1],Y
	INY
	STA Music_RestH_Base	

	; Get and store the base address into [Music_Base_H][Music_Base_L]
	LDA [Temp_Var1],Y
	INY
	STA <Music_Base_L
	LDA [Temp_Var1],Y
	INY
	STA <Music_Base_H

	; Get and store triangle track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_TriTrkPos

	; Get and store square 1 track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_Sq1TrkOff

	; Set and store noise track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_NseTrkPos
	STA Music_NseStart	; Retain starting position for possible restoration later

	; Set and store DMC track offset
	LDA [Temp_Var1],Y
	INY
	STA Music_PCMTrkPos
	STA Music_PCMStart	; Retain starting position for possible restoration later



PRG063_E48C:
	; New index has been loaded

	; Set all rests to 1; this forces them all to update next cycle
	LDA #$01
	STA Music_Sq2Rest
	STA Music_Sq1Rest
	STA Music_TriRest
	STA Music_NoiseRest
	STA Music_DMCRest

	; Square 2's track offset is always assumed to be at zero
	LDA #$00
	STA Music_Sq2TrkOff

	STA Music_Sq1AltRamp	; No alternate ramp on Square 1 yet..
	STA Music_Sq1Bend 	; Clear bend effect on Square 1
	STA Music_Sq2Bend	; Clear bend effect on Square 2

	LDA SndCur_Music1
	CMP #$01
	BNE PRG063_E4BB	 ; If we're not playing Set 1 $01 Player Death, jump to PRG063_E4BB

	; SndCur_Player = 0
	LDA #$00
	STA SndCur_Player

	LDA #$08	 ; Enable only noise channel
	BNE PRG063_E4BD	 ; (technically always) jump to PRG063_E4BD

PRG063_E4BB:
	; Almost all songs enter here...
	LDA #$0b	 ; Both squares + noise only

PRG063_E4BD:
	STA PAPU_EN
	LDA #$0f
	STA PAPU_EN	 ; Enable all channels

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Square 2's music track code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Music_Sq2Track:

	DEC Music_Sq2Rest	; Music_Sq2Rest--
	BEQ PRG063_E4CD	 	; If Music_Sq2Rest = 0, time to update Track Square 2!
	JMP PRG063_E57A	 	; Otherwise, jump to PRG063_E57A

PRG063_E4CD:
	LDY Music_Sq2TrkOff	; Y = Music_Sq2TrkOff

	INC Music_Sq2TrkOff	; Music_Sq2TrkOff++

	LDA [Music_Base_L],Y	; Get next byte from music segment data
	BEQ Music_EndSegment 	; If byte is zero, jump to Music_EndSegment
	BPL Music_Sq2NoteOn	; If byte is $01 - $7f, jump to Music_Sq2NoteOn
	BNE PRG063_E51E	 	; $80 - $ff, jump to PRG063_E51E

Music_EndSegment:
	LDA SndCur_Music1	; Are we playing something from Set 1?
	BEQ PRG063_E4F7		; If not, jump to PRG063_E4F7

	; Set 1 music...
	CMP #$40	 
	BNE Music_StopAll	; If we NOT were playing the "time warning" song, jump to Music_StopAll

	; If we were playing the "time warning" song, we need to restart the song which was playing...
	LDA #$10
	STA Music_RestH_Off	; Set the rest lookup offset to $10 (should play song slightly faster!)
	LDA Music2_Hold	 	; Get which song we ought to be playing right now

	; OF NOTE: Since this jumps straight to SndMus_QueueSet2B, this prevents "time warning" from
	; working on any of the world map songs, music box, king's room, etc., places that normally
	; wouldn't get a time warning anyway.  However, exceptions are made for coin heaven and
	; invincibility, since both sit in Set 2A but ARE subject to time warning.  This behavior
	; could be fixed (and even simplified) with a minor tweak, but oh well...
	CMP #$09
	BEQ PRG063_E51B	 	; If prior song playing was Coin Heaven / Sky / etc., jump to PRG063_E51B
	CMP #$0a
	BEQ PRG063_E51B	 	; If prior song playing was Invincibility, jump to PRG063_E51B
	JMP SndMus_QueueSet2B	; Otherwise, jump to SndMus_QueueSet2B

PRG063_E4F7:
	; Segment ended on a Set 2A/B/C song...
	LDA SndCur_Music2
	AND #$f0	 
	BEQ PRG063_E518	 	; If we're NOT playing something from Set 2B, jump to PRG063_E518 (SndMus2A_Next)

	LDA SndCur_Music2
	AND #$04
	BNE SndMus2C_Next_Jump	; If we're playing something from Set 2C, jump to SndMus2C_Next_Jump (SndMus2C_Next)

	JMP SndMus2B_Next 	; Otherwise, jump to SndMus2B_Next

SndMus2C_Next_Jump:
	JMP SndMus2C_Next

Music_StopAll:
	LDA #$00
	STA SndCur_Music1	; Stop any Set 1 song
	STA SndCur_Music2	; Stop any Set 2 song
	STA Music2_Hold	 	; Clear any hold on a Set 2 song
	STA Music_RestH_Off	; Clear any rest lookup offset
 
	STA PAPU_EN	 ; Disable all tracks
	LDX #$0f	 
	STX PAPU_EN	 ; Enable all tracks
	RTS		 ; Return

PRG063_E518:
	JMP SndMus2A_Next ; Jump to SndMus2A_Next

PRG063_E51B
	JMP PRG063_E401	 ; Jump to PRG063_E401

PRG063_E51E:
	; Music segment byte is $80 - $ff

	; $ff is only valid after a "note on" event!
	; This is not the right time for it, so it is simply skipped over
	CMP #$ff	 
	BNE PRG063_E528	 	; If byte is NOT $ff, jump to PRG063_E528

	INC Music_Sq2TrkOff	; Music_Sq2TrkOff++
	JMP PRG063_E4CD		; Jump to PRG063_E4CD

PRG063_E528:
	TAX			 ; X = A (saving A)

	AND #$f0
	STA Music_Sq2Patch	 ; Music_Sq2Patch is just the upper 4 bits

	TXA			 ; A = X (restoring A)

	JSR Music_GetRestTicks
	STA Music_Sq2RestH	 ; Update Music_Sq2RestH

PRG063_E535:
	LDY Music_Sq2TrkOff	 ; Y = Music_Sq2TrkOff

	INC Music_Sq2TrkOff	 ; Music_Sq2TrkOff++

	LDA [Music_Base_L],Y	; Get next byte from music segment data

Music_Sq2NoteOn:
	TAX			 ; X = A (saving A)
	LDA SndCur_Level1	 ; 
	ORA Sound_IsPaused
	BNE PRG063_E574		 ; If a "level 1" sound is playing or paused (SB), you can't use Square 2!

	; Level 1 sound is not playing...
	TXA			 ; A = X (restoring A)
	JSR Sound_Sq2_NoteOn_NoPAPURAMP	 ; Play this note!

	TAY		 ; Y = A -- NOTE: Sound_Sq2_NoteOn_NoPAPURAMP sets 'A' to zero if a rest note was last played!
	BNE PRG063_E550	 ; If last note was NOT a rest, jump to PRG063_E550

	; Music_LOST4FB ($04FB) apparently was some kind of note length override, but it appears to now be unused
	LDA Music_LOST4FB
	JMP PRG063_E559	 ; Jump to PRG063_E559... 

PRG063_E550:
	LDA Music_Sq2RestH
	LDX Music_LOST4FB 	; X = Music_LOST4FB (Music_CalcNoteLen is going to override it anyway though??)
	JSR Music_CalcNoteLen	; X = $82  A = $3f or $16

PRG063_E559:
	STA Music_Sq2NoteLen	; Set new note length 

	LDY Music_Sq2TrkOff	; Y = Music_Sq2TrkOff
	INC Music_Sq2TrkOff	; Music_Sq2TrkOff++
	LDA [Music_Base_L],Y	; Get next byte from music segment..
	CMP #$ff	 
	BNE PRG063_E571	 	; If value is NOT $FF, jump to PRG063_E571

	; Value was $FF!  This activates the bend effect used on a few songs
	LDA Sound_Sq2_CurFL
	STA Music_Sq2Bend
	JMP PRG063_E535	

PRG063_E571:
	; Value was not $ff, forget it...
	DEC Music_Sq2TrkOff	; Music_Sq2TrkOff--

PRG063_E574:
	LDA Music_Sq2RestH
	STA Music_Sq2Rest	; Music_Sq2Rest = Music_Sq2RestH

PRG063_E57A:
	LDA SndCur_Level1
	BNE PRG063_E5A7	 	; If we're playing any "level 1" sounds, jump to PRG063_E5A7

	LDA Music_Sq2Bend
	BEQ PRG063_E58C	 	; If no bend is active, jump to PRG063_E58C

	LDA Music_Sq2Rest	; A = rest time remaining
	LDX #$04	 	; X = 4 (Square 2)
	JSR Music_UpdateBend 	; Updates bend effects, if any

PRG063_E58C:
	LDY Music_Sq2NoteLen	; Y = Square 2's note length counter
	BEQ PRG063_E594	 	; If note length is zero, jump to PRG063_E594
	DEC Music_Sq2NoteLen	; Music_Sq2NoteLen--

PRG063_E594:
	LDA Music_Sq2RestH	; A = current rest value
	LDX Music_Sq2Patch 	; X = current "patch"
	JSR Music_PatchGetCTL 	; Gets a PAPU_CTLx value for the current patch -> A
	STA PAPU_CTL2		; Store patch value into PAPU_CTL2
	LDX #$7f
	STX PAPU_RAMP2	 	; Everything but the actual ramping
	BNE Music_Sq1Track

PRG063_E5A7:
	LDA #$00	
	STA Music_Sq2Bend	 ; When playing a level 1 sound, prevent bend effects!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Square 1's music track code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Music_Sq1Track:
	DEC Music_Sq1Rest	; Music_Sq1Rest--
	BNE PRG063_E62B	 	; If still resting, jump to PRG063_E62B

PRG063_E5B1:
	; Rest is complete!
	LDY Music_Sq1TrkOff	; Y = Music_Sq1TrkOff
	INC Music_Sq1TrkOff	; Music_Sq1TrkOff++
	LDA [Music_Base_L],Y	; Get next byte from music segment data
	BPL PRG063_E5DA	 	; If byte is $00 - $7f, jump to PRG063_E5DA 
	CMP #$ff	
	BNE PRG063_E5C5	 	; If not $ff, jump to PRG063_E5C5

	; $ff only works after a "note on" event
	INC Music_Sq1TrkOff	; Music_Sq1TrkOff++
	JMP PRG063_E5B1	 	; Get next byte...

PRG063_E5C5:
	; Byte was $80 - $fe ...
	TAX		 	; Save A
	AND #$f0		; A &= $f0 
	STA Music_Sq1Patch	; Result -> Music_Sq1Patch
	TXA		 	; Restore A (current byte of music data)
	JSR Music_GetRestTicks
	STA Music_Sq1RestH	; Store new rest value (returned by Music_GetRestTicks)

PRG063_E5D2:
	LDY Music_Sq1TrkOff	; Y = Music_Sq1TrkOff
	INC Music_Sq1TrkOff	; Music_Sq1TrkOff++
	LDA [Music_Base_L],Y	; Get next byte from music segment...

PRG063_E5DA:
	TAY		 ; Y = A
	BNE Music_Sq1NoteOn	 ; If next byte is NOT $00, jump to Music_Sq1NoteOn

	; Next byte in segment was $00...
	; Activates a ramp effect
	LDA #$83
	STA PAPU_CTL1

	LDA #$94
	STA PAPU_RAMP1
	STA Music_Sq1AltRamp	; Music_Sq1AltRamp holds this alternate ramp value

	BNE PRG063_E5B1	 ; (technically always) jump to PRG063_E5B1

Music_Sq1NoteOn:
	; Value in range $01 - $7f
	TAX
	LDA SndCur_Player
	ORA SndCur_Map	
	ORA Sound_IsPaused
	BNE PRG063_E625	 ; If Player or Map sounds active or paused (SB), you can't play on this track!  Jump to PRG063_E625
	TXA		 ; Restore A

	JSR Sound_Sq1_NoteOn_NoPAPURAMP	; Play note!  Returns 0 if $7e rest was played...
	BNE PRG063_E601	 ; If last note was NOT a rest, jump to PRG063_E601
 
	LDA Music_LOST4FB	; A = Music_LOST4FB
	JMP PRG063_E60A	 	; Jump to PRG063_E60A...

PRG063_E601:
	LDA Music_Sq1RestH
	LDX Music_LOST4FC 	; X = Music_LOST4FC (Music_CalcNoteLen is going to override it anyway though??)
	JSR Music_CalcNoteLen	; X = $82  A = $3f or $16

PRG063_E60A:
	STA Music_Sq1NoteLen	; Set new note length 

	LDY Music_Sq1TrkOff	; Y = Music_Sq1TrkOff
	INC Music_Sq1TrkOff	; Music_Sq1TrkOff++
	LDA [Music_Base_L],Y	; Get next byte from music segment
	CMP #$ff	 
	BNE PRG063_E622	 	; If byte <> $ff, jump to PRG063_E622

	; Activate bend effects on square 1!

	; Music_Sq1Bend = Sound_Sq1_CurFL
	LDA Sound_Sq1_CurFL 
	STA Music_Sq1Bend 

	JMP PRG063_E5D2	 	; Jump to PRG063_E5D2

PRG063_E622:
	DEC Music_Sq1TrkOff	 ; Music_Sq1TrkOff--

PRG063_E625:

	; Restore Music_Sq1Rest from hold value
	LDA Music_Sq1RestH
	STA Music_Sq1Rest

PRG063_E62B:
	LDA SndCur_Player
	ORA SndCur_Map	 
	BNE PRG063_E660	 ; If playing "player" or "map" sounds, jump to PRG063_E660

	LDA Music_Sq1Bend
	BEQ PRG063_E640	 ; If Music_Sq1Bend = 0, jump to PRG063_E640

	LDX #$00	 	; X = 0 (Square 1)
	LDA Music_Sq1Rest	; A = rest time remaining
	JSR Music_UpdateBend	; Update bend effects!

PRG063_E640:
	LDY Music_Sq1NoteLen	; Y = Music_Sq1NoteLen
	BEQ PRG063_E648	 	; If Music_Sq1NoteLen = 0, jump to PRG063_E648
	DEC Music_Sq1NoteLen	; Music_Sq1NoteLen--

PRG063_E648:
	LDA Music_Sq1RestH	; A = current rest value
	LDX Music_Sq1Patch 	; X = current "patch"
	JSR Music_PatchGetCTL 	; Gets a PAPU_CTLx value for the current patch -> A
	STA PAPU_CTL1		; Store patch value into PAPU_CTL1
	LDA Music_Sq1AltRamp	
	BNE PRG063_E65B	 	; If the alternate ramp value is in effect, don't lose it!
	LDA #$7f		; Standard ramp value

PRG063_E65B:
	STA PAPU_RAMP1	 	; Use appropriate ramp value
	BNE Music_TriTrack	; (technically always) jump to Music_TriTrack

PRG063_E660:
	; "Player" or "Map" sound in effect; cancel bend effects
	LDA #$00	 
	STA Music_Sq1Bend

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Triangle's music track code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Music_TriTrack:
	LDA Music_TriTrkPos	; Get triangle track's position
	BEQ Music_NseTrack	; If Music_TriTrkPos = 0 (Disabled!), jump to Music_NseTrack

	DEC Music_TriRest	; Music_TriRest--
	BNE Music_NseTrack	; If not done resting, jump to the noise track

	LDY Music_TriTrkPos	; Y = Music_TriTrkPos
	INC Music_TriTrkPos	; Music_TriTrkPos++
	LDA [Music_Base_L],Y	; Get next byte from triangle track

	BPL Music_TriNoteOn	; Byte $00 - $7f, jump to Music_TriNoteOn

	; Byte $80 - $ff... goes directly to the rest value routine
	; No "patches" available on the triangle track
	JSR Music_GetRestTicks	
	STA Music_TriRestH		; Update rest hold value

	LDA #$1f	 
	STA PAPU_TCR1	 ; $1f written to PAPU_TCR1

	LDY Music_TriTrkPos	; Y = Music_TriTrkPos
	INC Music_TriTrkPos	; Music_TriTrkPos++
	LDA [Music_Base_L],Y	; Get next byte from music segment
	BEQ PRG063_E6B4	 	; If $00 came up, jump to PRG063_E6B4

Music_TriNoteOn:
	; Triangle track, value $00 - $7f
	JSR Sound_Tri_NoteOn	; Play note!  (Will return $00 if $7e rest was played)
	BEQ PRG063_E6B2	 	; If last note was a rest, jump to PRG063_E6B2 

	LDA Music_TriRestH
	CMP #$0a
	BLT PRG063_E6A6	 ; If Music_TriRestH < $0A, jump to PRG063_E6A6 (A = $18)
	CMP #$13
	BLT PRG063_E6AA	 ; If Music_TriRestH < $13, jump to PRG063_E6AA (A = $20)
	CMP #$25
	BGE PRG063_E6AE	 ; If Music_TriRestH >= $25, jump to PRG063_E6AE (A = $ff)

	; Music_TriRestH >= $13 && Music_TriRestH < $25
	LDA #$50
	BNE PRG063_E6B4	 ; (technically always) jump to PRG063_E6B4

PRG063_E6A6:
	LDA #$18
	BNE PRG063_E6B4	 ; (technically always) jump to PRG063_E6B4

PRG063_E6AA:
	LDA #$20
	BNE PRG063_E6B4	 ; (technically always) jump to PRG063_E6B4

PRG063_E6AE:
	LDA #$ff
	BNE PRG063_E6B4	 ; (technically always) jump to PRG063_E6B4

PRG063_E6B2:
	LDA #$80

PRG063_E6B4:
	STA PAPU_TCR1	 	; Start (if note played) or Stop (if $00 after $80-$ff) the triangle sound
	LDX Music_TriRestH
	STX Music_TriRest	; Music_TriRest = Music_TriRestH


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Noise's music track code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Music_NseTrack:
	LDA Music_NseTrkPos	; Music_NseTrack 
	BEQ Music_PCMTrack	; If Music_NseTrack = 0 (disabled), jump to Music_PCMTrack

	DEC Music_NoiseRest	; Music_NoiseRest--
	BNE Music_PCMTrack	; If track is not done resting, just jump to Music_PCMTrack
 
PRG063_E6C7:
	LDY Music_NseTrkPos	; Y = Music_NseTrkPos
	INC Music_NseTrkPos	; Music_NseTrkPos++
	LDA [Music_Base_L],Y	; Get next byte from music segment track

	BEQ PRG063_E700	 	; If next byte is $00, jump to PRG063_E700
	BPL Music_NseNoteOn 	; $01 - $7f is note on, jump to Music_NseNoteOn

	; Byte $80 - $ff... goes directly to the rest value routine
	; No "patches" available on the noise track
	JSR Music_GetRestTicks
	STA Music_NseRestH	 ; Update rest hold

	LDY Music_NseTrkPos	; Y = Music_NseTrkPos
	INC Music_NseTrkPos	; Music_NseTrkPos++
	LDA [Music_Base_L],Y	; Get next byte in music segment track
	BEQ PRG063_E700	 	; If byte $00 comes up, jump to PRG063_E700

Music_NseNoteOn:
	; Noise isn't really a "note" event, but it has a LUT for a "note" value...
	LSR A		 	; Shift in half (because notes are usually a 2-byte index)
	TAY		 	; Y = A

	LDA Sound_IsPaused
	BNE Music_PCMTrack	; SB: If paused, jump straight to Music_PCMTrack

	; Note that the normal $7E Note Off is not implemented here; instead, use $01

	; Plug in appropriate noise values for this "note"
	LDA Music_NoiseLUTA,Y
	STA PAPU_NCTL1	 	
	LDA Music_NoiseLUTB,Y	
	STA PAPU_NFREQ1	 	
	LDA Music_NoiseLUTC,Y	
	STA PAPU_NFREQ2		

	; Reset rest value
	LDA Music_NseRestH
	STA Music_NoiseRest


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DMC's music track code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Music_PCMTrack:
	JMP PRG063_E709

PRG063_E700:
	; When byte $00 read, Reset noise track to start
	LDA Music_NseStart
	STA Music_NseTrkPos
	JMP PRG063_E6C7	 ; Back into the fray...

PRG063_E709:
	LDA Music_PCMTrkPos
	BEQ PRG063_E738	 	; If Music_PCMTrkPos = 0 (disabled), jump to PRG063_E738

	DEC Music_DMCRest	; Music_DMCRest--
	BNE PRG063_E738	 	; If not done resting, jump to PRG063_E738

PRG063_E713:
	LDY Music_PCMTrkPos	; Y = Music_PCMTrkPos
	INC Music_PCMTrkPos	; Music_PCMTrkPos++
	LDA [Music_Base_L],Y	; Get next byte in music segment track

	BEQ PRG063_E741		; If next byte is $00, jump to PRG063_E741
	BPL PRG063_E72F		; If byte is $01 - $7f, jump to PRG063_E72F

	JSR Music_GetRestTicks
	STA Music_DMCRestH	; Update rest hold value

	LDY Music_PCMTrkPos	; Y = Music_PCMTrkPos
	INC Music_PCMTrkPos	; Music_PCMTrkPos++
	LDA [Music_Base_L],Y	; Get next byte in music segment track
	BEQ PRG063_E741	 	; If next byte is $00, jump to PRG063_E741

PRG063_E72F:
	STA DMC_Queue	 	; Store note into DMC queue
	LDA Music_DMCRestH	
	STA Music_DMCRest	; Music_DMCRest = Music_DMCRestH

PRG063_E738:
	JSR Music_PlayDMC	 ; Play DMC sound!

	LDA #$00	 
	STA DMC_Queue	 ; Clear the DMC queue
	RTS		 ; Return

PRG063_E741:
	; When byte $00 read, reset DMC track to start
	LDA Music_PCMStart
	STA Music_PCMTrkPos
	JMP PRG063_E713	 	; Back into the fray...


	; Noise track values per "note"; the note is shifted down by 1,
	; (because for other channels, note is a 2-byte lookup, but here it is
	; only 1.) The first note value is $01 (which shifted becomes zero),
	; so basically $01, $02-$03, $04-$05, $06-$07 are the only valid "notes"
	; $01 (first triple) is used as a "rest" / Note Off
Music_NoiseLUTA:	.byte $10, $1E, $1F, $1F
Music_NoiseLUTB:	.byte $00, $03, $0A, $02
Music_NoiseLUTC:	.byte $00, $18, $18, $58

Music_CalcNoteLen:
	; Just played a note which was not a rest
	; A = current time between events (RestH)

	CMP #19
	BLT PRG063_E75E	 ; If A < 19, jump to PRG063_E75E (use A = $16)
	LDA #$3f	 ; Otherwise, use A = $3F
	BNE PRG063_E760	 ; (technically always) jump to PRG063_E760

PRG063_E75E:
	LDA #$16

PRG063_E760:

	; These values appear to be unused??
	LDX #$82
	LDY #$7f

	RTS		 ; Return


Music_PatchTableLong:	; playing notes greater than 19 in length
	.word PatL1, PatL2, PatL3, PatL4, PatL5, PatL6, PatL2, PatL8

Music_PatchTableShort:	; shorter notes
	.word PatS1, PatS2, PatS3, PatS4, PatS5, PatS6, PatS2, PatS8

Music_PatchGetCTL:
	; A = Rest hold value (< 19 considered "short" patches)
	; X = Patch #
	; Y = Note length

	PHA		 ; Save A

	; X = (X & $70) >> 3
	; This takes the lower 3 bits of the upper nibble in the
	; patch value to make an index into the patch table...
	; This amounts to the value $0, $2, $4, $6, $8, $A, $E, $10
	TXA
	AND #$70
	LSR A
	LSR A
	LSR A
	TAX

	PLA		 ; Restore A

	CMP #19	
	BLT PRG063_E79E	 ; If rest value < 19, jump to PRG063_E79E

	; Music playing not too quickly uses the "long" set

	; Copy address for this patch from the LUT to [Music_PatchAdrH][Music_PatchAdrL]
	LDA Music_PatchTableLong,X
	STA <Music_PatchAdrL
	LDA Music_PatchTableLong+1,X
	STA <Music_PatchAdrH

	BNE PRG063_E7A8	 ; (technically always) jump to PRG063_E7A8

PRG063_E79E:
	; Music playing "rapidly" uses the "short" set

	; Copy address for this patch from the LUT to [<Music_PatchAdrH][<Music_PatchAdrL]
	LDA Music_PatchTableShort,X
	STA <Music_PatchAdrL
	LDA Music_PatchTableShort+1,X
	STA <Music_PatchAdrH

PRG063_E7A8:
	; In any case, current note length selects a value from the patch data...
	LDA [Music_PatchAdrL],Y	
	RTS		 


	; Quick and dirty function that writes X to the CTL and Y to the RAMP of Square 1
Sound1_XCTL_YRAMP:
	STY PAPU_RAMP1
	STX PAPU_CTL1
	RTS		 ; Return

	; Quick and dirty function that writes X to the CTL and Y to the RAMP of Square 2
Sound2_XCTL_YRAMP:
	STX PAPU_CTL2
	STY PAPU_RAMP2
	RTS		 ; Return

Sound_Sq1_NoteOn:
	; Note On event for Square 1
	; 'A' is input note to play
	STX PAPU_CTL1
	STY PAPU_RAMP1

Sound_Sq1_NoteOn_NoPAPURAMP:
	LDX #$00

PRG063_E7C1:
	CMP #$7e	 
	BNE PRG063_E7C8	 ; If note <> $7E, jump to PRG063_E7C8

	; If note is $7E (rest), then we're done!
	LDA #$00	; To alert music system we just played a "rest"
	RTS		; Return

PRG063_E7C8:
	LDY #$01
	STY Sound_Octave ; Sound_Octave = 1 (interestingly, this sets a "center octave", so at 0 everything is lower, at 2 everything is higher...)
	PHA		 ; Save original note
	TAY		 ; Y = Note
	BMI PRG063_37D9	 ; If Note & $80, skip the octave adjust??

	; Note:
	; Notes are stored as double value for convenience here (spares a shift)
	; So "24" is an entire octave for doubled note values, get it?

	; The following loop transforms a note into a relative 
	; "octave lookup" for the note base frequency; essentially,
	; this is (Note MOD 12), just no such instruction available
PRG063_E7D1:
	INC Sound_Octave ; Sound_Octave++ (Sound_Octave will have the octave level after this, essentially Note / 12)
	SUB #24	 	  ; A -= 24 (down an octave)
	BPL PRG063_E7D1	  ; While above zero, loop! 

PRG063_37D9:
	ADD #24	 	  ; A += 24 (recover from last subtraction)
	ADD Music_Invert  ; SB: Makes inverted music possible!
	TAY		  ; Y = A (Y is now the offset into the LUT to get the base frequency for this note)

	; Y should now be a lookup into the note table!
	; Store this resultant frequency into Sound_Sqr_FreqL/H
	LDA Square1_Table_Notes,Y
	STA <Sound_Sqr_FreqL		
	LDA Square1_Table_Notes+1,Y
	STA <Sound_Sqr_FreqH		

	; Sound_Octave now holds the octave level
	; This loops to adjust the base frequency to the proper octave
PRG063_E7E7:
	LSR <Sound_Sqr_FreqH	
	ROR <Sound_Sqr_FreqL	
	DEC Sound_Octave	; Sound_Octave--
	BNE PRG063_E7E7	 ; While Sound_Octave > 0, loop!

	PLA		 ; Retrieve original note
	CMP #56		 ; 
	BCC PRG063_E7F7	 ; If note is less than 56, skip the decrement
	DEC <Sound_Sqr_FreqL	 ; Minor adjustment to resultant frequency?
PRG063_E7F7:
	TXA		 ; A = X  (0 = square 1, 4 = square 2)
	CMP #$04	 ;  
	BNE PRG063_E808	 ; If on Square 1, jump to PRG063_E808

	; Square 2 only...
	LDA Music_Sq1Patch
	CMP #$e0	 ; 
	BEQ PRG063_E818	 ; If Music_Sq1Patch = $E0, jump to PRG063_E818 (some alternate SQ2 routine??)

	LDA Music_Sq1Bend,X	
	BNE PRG063_E851	 	; If bend in effect on this track, jump to PRG063_E851

PRG063_E808:
	; This is used by Square 1/2 or triangle
	; 'X' is 0 (Square 1), 4 (Square 2), 8 (Triangle)

	LDA <Sound_Sqr_FreqL
	STA PAPU_FT1,X	 ; Store low part of frequency in appropriate register
	STA Sound_Sq1_CurFL,X	 ; Store low frequency in appropriate backup variable

	LDA <Sound_Sqr_FreqH
	ORA #$08	 ; Sets sort of a minimal frequency level
	STA PAPU_CT1,X	 ; Store high frequency in appropriate register
	RTS		 ; Return

PRG063_E818:
	; For Square Wave 2 only!
	LDA <Sound_Sqr_FreqL
	SUB #$02	 	; Sound_Sqr_FreqL -= 2
	STA PAPU_FT2	 	; Store low part of frequency in register
	STA Sound_Sq2_CurFL

	LDA <Sound_Sqr_FreqH
	ORA #$08	 ; Sets sort of a minimal frequency level
	STA PAPU_CT2	 ; Store high frequency in register

	RTS		 ; Return

Sound_Sq2_NoteOn:
	; Note On event for Square 2
	; 'A' is input note to play
	STX PAPU_CTL2
	STY PAPU_RAMP2

Sound_Sq2_NoteOn_NoPAPURAMP:
	LDX #$04	 ; Offset from Square 1 regs to Square 2
	BNE PRG063_E7C1	 ; Common waveform routine

Sound_Tri_NoteOn:
	LDX #$08	 ; Offset from Square 1 regs to Triangle
	BNE PRG063_E7C1	 ; Common waveform routine

	; 12 notes LUT for Square Wave channels
Square1_Table_Notes:
	.word $1AB8, $1938, $17CC, $1678, $1534, $1404, $12E4, $11D4, $10D4, $0FE0, $0EFC, $0E24

	; SB: Invert table
	.word $0E24, $0EFC, $0FE0, $10D4, $11D4, $12E4, $1404, $1534, $1678, $17CC, $1938, $1AB8

PRG063_E851:
	; If bend is in effect, this stores the last set frequency
	LDA <Sound_Sqr_FreqL
	STA Sound_Sq1_CurFL,X
	RTS

Music_UpdateBend:
	; A = rest time remaining
	; X = 0 or 4, Square 1 or 2

	; Basically if (rest & 3) <> 3, jump to PRG063_E860
	LSR A
	BCC PRG063_E860
	LSR A	
	BCC PRG063_E860

	; Diminish the bend
	DEC Music_Sq1Bend,X

PRG063_E860:
	LDA Music_Sq1Bend,X 	; Get current bend
	CMP Sound_Sq1_CurFL,X	; Compare to current frequency 
	BGE PRG063_E870		; If bend >= Sound_Sq1_CurFL, jump to PRG063_E870

	LDA #$00	 	
	STA Music_Sq1Bend,X	; Clear/disable bend
	LDA Sound_Sq1_CurFL,X	; Just get current frequency

PRG063_E870:
	STA PAPU_FT1,X	 ; Update PAPU_FT1/2!
	RTS		 ; Return


	; Music_RestH_LUT is indexed by (Music_RestH_Base + [0 to 15])
	; * Music_RestH_Base is always divisible by $10
	;
	; * Offset (0 to 15) comes from the lower 4 bits of $80+ values
	;   (The upper 4 bits set a patch value, unrelated)
	;
	; * Result is a "rest" (in ticks) for the pause between events
	;
	; * Obviously that means a song is "optimized" by selecting the best set, and
	;   must have a correct row +$10 if it plans on being "low time warning compatible"
Music_RestH_LUT:
	.byte $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80, $01, $1F, $00 ; $00 - $0F
	.byte $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78, $05, $00, $00 ; $10 - $1F
	.byte $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70, $01, $04, $00 ; $20 - $2F
	.byte $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60, $04, $02, $16 ; $30 - $3F
	.byte $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50, $03, $01, $13 ; $40 - $4F
	.byte $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48, $1E, $03, $00 ; $50 - $5F
	.byte $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40, $00, $00, $00 ; $60 - $6F
	.byte $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38, $0B, $00, $00 ; $70 - $7F
	.byte $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30, $02, $00, $00 ; $80 - $8F
	.byte $02, $02, $03, $02, $04, $06, $05, $06, $08, $0C, $10, $18, $20		     ; $90 - $9C

	; SB: Align DMC04 to nearest 64 byte boundary
.AlignDMC04:	DMCAlign .AlignDMC04

DMC04:	.byte $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $B5, $82, $DC
	.byte $7F, $00, $E0, $FF, $03, $E8, $FF, $03, $00, $F8, $FF, $00, $F0, $FF, $62, $0B
	.byte $40, $DF, $8B, $EA, $27, $00, $FC, $BF, $00, $14, $FD, $FF, $03, $00, $F6, $FF
	.byte $07, $00, $70, $DF, $FF, $02, $00, $F8, $FF, $07, $00, $E0, $FF, $0F, $00, $D4
	.byte $FE, $FF, $04, $80, $FE, $BF, $04, $00, $EC, $FF, $9F, $00, $80, $FE, $FF, $01
	.byte $00, $FF, $FF, $03, $00, $A0, $FF, $FF, $00, $00, $FF, $7F, $02, $00, $FA, $FF
	.byte $07, $00, $EC, $FF, $0F, $00, $E8, $FE, $9F, $00, $80, $FF, $5F, $01, $A0, $FA
	.byte $FE, $8A, $00, $B4, $FF, $17, $01, $50, $FF, $5F, $02, $A0, $F6, $BF, $02, $41
	.byte $ED, $ED, $56, $02, $52, $F7, $AF, $04, $C8, $F6, $5B, $49, $90, $D5, $DB, $4A
	.byte $92, $AA, $56, $AF, $4A, $90, $ED, $B6, $92, $24, $B5, $5D, $93, $A4, $AA, $AD
	.byte $56, $89, $D4, $B6, $96, $2A, $55, $6A, $AD, $AA, $92, $AA, $B6, $96, $52, $A9
	.byte $56, $AB, $4A, $95, $55, $AB, $AA, $94, $AA, $55, $AB, $54, $AA, $D5, $AA, $52
	.byte $55, $55, $AD, $2A, $55, $55, $AD, $AA, $52, $55, $D5, $AA, $52, $55, $55, $AB
	.byte $4A, $55, $55, $2B, $55, $55, $55, $55, $AB, $54, $55, $2D, $AB, $4A, $55, $55
	.byte $B5, $2A, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55
	.byte $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55
DMC04_End

DMC06:	.byte $55, $55, $55, $55, $55, $55, $D5, $AA, $D5, $37, $02, $00, $F4, $A3, $FF, $FF
	.byte $7F, $00, $2A, $00, $00, $80, $FF, $FF, $FF, $7F, $05, $00, $00, $E0, $FF, $1F
	.byte $C0, $FF, $17, $00, $F0, $FF, $C0, $89, $FF, $00, $00, $E0, $FF, $FF, $FF, $03
	.byte $00, $00, $00, $FA, $FF, $3F, $00, $EC, $FF, $7F, $00, $FF, $7F, $00, $E0, $08
	.byte $00, $F8, $F7, $FF, $07, $0E, $90, $00, $80, $FE, $FF, $7F, $00, $C0, $FE, $7F
	.byte $7F, $01, $FE, $2F, $00, $8C, $00, $80, $FF, $FF, $4F, $00, $C0, $7F, $00, $F8
	.byte $0F, $FC, $07, $F0, $7F, $FF, $A6, $BF, $40, $5B, $00, $C0, $0A, $01, $FB, $8B
	.byte $FE, $04, $00, $FC, $FF, $00, $FC, $04, $FE, $91, $FB, $FF, $1F, $E0, $FF, $03
	.byte $00, $00, $60, $7F, $2B, $48, $C0, $FF, $02, $D0, $FE, $1F, $00, $FE, $09, $FA
	.byte $A5, $FF, $FF, $21, $A2, $FF, $01, $00, $04, $B0, $EF, $17, $81, $1D, $C0, $FE
	.byte $0F, $54, $0B, $AA, $FA, $3F, $00, $FF, $FE, $FF, $00, $F4, $57, $02, $00, $89
	.byte $A4, $3E, $50, $FF, $0F, $80, $FF, $0B, $01, $EA, $C4, $FD, $27, $DA, $B6, $FB
	.byte $2F, $E0, $85, $56, $02, $C0, $0B, $A8, $90, $BA, $FF, $2F, $80, $FD, $07, $C0
	.byte $56, $D2, $FE, $83, $FF, $89, $4F, $A5, $D6, $0A, $24, $01, $FC, $03, $F0, $02
	.byte $F8, $FF, $6B, $52, $BB, $09, $80, $BE, $BD, $84, $F6, $7F, $DF, $09, $00, $FB
	.byte $4B, $00, $D0, $8A, $4A, $55, $49, $FD, $AA, $FA, $AD, $5A, $05, $08, $7B, $B7
	.byte $A2, $52, $FF, $FF, $03, $00, $6D, $2B, $40, $52, $13, $D1, $B6, $EA, $AB, $42
	.byte $ED, $7F, $12, $92, $5A, $51, $9F, $A8, $4B, $DB, $B7, $AF, $40, $4B, $00, $D0
	.byte $2E, $91, $AA, $AA, $FD, $1F, $01, $F6, $BF, $08, $AD, $64, $2B, $95, $FA, $26
	.byte $B5, $A5, $7E, $A9, $2A, $01, $10, $D8, $2B, $B1, $EA, $BE, $7D, $25, $49, $6D
	.byte $15, $A9, $6B, $95, $C8, $EA, $DD, $49, $52, $5B, $2B, $49, $13, $41, $88, $D4
	.byte $F7, $91, $FA, $BE, $6D, $25, $28, $95, $D4, $5E, $55, $85, $B6, $BD, $64, $4B
	.byte $52, $AD, $88, $6A, $25, $08, $6A, $FB, $AA, $55, $6F, $FB, $91, $54, $09, $A8
	.byte $AD, $DA, $AD, $24, $BB, $5D, $05, $A9, $49, $92, $BA, $92, $24, $59, $6D, $57
	.byte $DB, $56, $D3, $2E, $AD, $2A, $08, $B0, $7B, $5B, $49, $DB, $57, $49, $22, $A9
	.byte $92, $64, $2B, $B5, $95, $A4, $B7, $6B, $B5, $6A, $25, $B5, $55, $22, $A4, $B2
	.byte $ED, $4A, $7D, $17, $A9, $89, $D4, $04, $50, $DB, $DB, $15, $EA, $B6, $6A, $9B
	.byte $D4, $96, $A4, $5A, $49, $55, $49, $6C, $AF, $76, $95, $54, $55, $55, $02, $A8
	.byte $56, $DB, $5E, $69, $5F, $A5, $52, $6D, $25, $89, $6A, $5B, $AA, $24, $B5, $55
	.byte $DB, $25, $69, $95, $54, $95, $20, $B5, $6A, $DB, $F6, $6D, $92, $5A, $95, $2A
	.byte $41, $EA, $2B, $B5, $52, $5A, $AB, $52, $6D, $AB, $92, $50, $B5, $52, $25, $A9
	.byte $ED, $6B, $B7, $91, $AD, $24, $95, $24, $A5, $56, $6B, $B5, $B6, $25, $A4, $B6
	.byte $55, $49, $A2, $D5, $4A, $55, $95, $D6, $6D, $6D, $AB, $AA, $44, $29, $95, $54
	.byte $A5, $6A, $DF, $A6, $4A, $A5, $AA, $92, $54, $55, $B5, $2A, $B5, $B5, $AA, $54
	.byte $7D, $AB, $2A, $11, $D5, $54, $92, $AA, $DA, $B6, $D5, $56, $52, $25, $29, $95
	.byte $AA, $56, $A9, $7B, $55, $55, $2A, $DB, $AA, $AA, $A4, $52, $2A, $55, $55, $AD
	.byte $AA, $76, $5B, $49, $15, $52, $55, $A9, $D4, $B6, $B5, $D5, $5A, $A9, $54, $49
	.byte $B5, $9A, $4A, $89, $DA, $4E, $49, $6B, $B5, $AD, $2A, $29, $A9, $92, $CA, $6A
	.byte $AB, $B6, $55, $DB, $54, $4A, $85, $AA, $55, $AA, $AA, $6A, $55, $55, $95, $D5
	.byte $AA, $AA, $55, $09, $95, $AA, $B6, $95, $DA, $B6, $B5, $92, $4A, $49, $95, $A4
	.byte $B6, $AA, $5A, $B5, $6A, $55, $52, $AA, $DA, $56, $92, $54, $B5, $AA, $AA, $B5
	.byte $AD, $56, $A9, $2A, $25, $49, $AA, $5A, $B5, $5A, $B5, $6A, $AD, $24, $A9, $AA
	.byte $B4, $6A, $55, $A5, $6A, $55, $AB, $55, $D5, $CA, $AA, $24, $49, $AA, $DA, $54
	.byte $AD, $6B, $55, $95, $AA, $56, $82, $5A, $D5, $56, $53, $D5, $6A, $55, $A9, $AA
	.byte $6A, $55, $49, $A5, $4A, $A9, $55, $B5, $6D, $55, $55, $55, $95, $A4, $92, $6A
	.byte $AB, $55, $6B, $55, $55, $55, $A9, $4A, $A5, $D6, $4A, $A5, $4A, $55, $6D, $AB
	.byte $AA, $55, $55, $95, $92, $54, $B5, $52, $AB, $6D, $AB, $54, $6A, $2B, $25, $4A
	.byte $55, $AB, $55, $95, $5A, $55, $5A, $B5, $6A, $55, $A5, $52, $95, $4A, $55, $AD
	.byte $B6, $B5, $AA, $54, $55, $95, $24, $55, $55, $AB, $6A, $6B, $A9, $52, $AB, $AA
	.byte $52, $AD, $AA, $52, $A5, $D4, $AA, $D5, $5A, $B5, $AA, $54, $52, $AA, $AA, $52
	.byte $55, $B5, $6D, $95, $AA, $A9, $AA, $4A, $AA, $5A, $55, $55, $55, $55, $A9, $55
	.byte $5B, $B5, $94, $2A, $95, $AA, $54, $55, $AD, $D6, $56, $55, $55, $95, $52, $A9
	.byte $6A, $AA, $5A, $AD, $5A, $29, $55, $AB, $AA, $AA, $AA, $2A, $95, $54, $B5, $AA
	.byte $5A, $AB, $55, $AB, $24, $55, $55, $55, $AA, $6A, $D5, $AA, $55, $55, $AA, $AA
	.byte $54, $55, $AB, $54, $AA, $55, $A9, $AA, $D5, $5A, $55, $55, $A9, $52, $95, $AA
	.byte $AA, $55, $B5, $6A, $55, $55, $4A, $55, $55, $95, $55, $55, $55, $2B, $55, $55
DMC06_End

DMC09:	.byte $DA, $BB, $77, $7B, $B5, $6D, $AD, $5A, $B5, $D5, $54, $B5, $5B, $25, $91, $24
	.byte $21, $49, $A5, $54, $95, $2A, $A5, $AD, $12, $49, $68, $DB, $F7, $6E, $DB, $D6
	.byte $AA, $55, $AB, $55, $DB, $D6, $4A, $12, $09, $92, $94, $54, $AA, $94, $54, $AA
	.byte $2A, $A5, $56, $6B, $DB, $B6, $AD, $B6, $55, $DB, $DA, $AD, $24, $A4, $AA, $AD
	.byte $4A, $92, $84, $54, $A9, $54, $49, $A9, $95, $44, $55, $BB, $B6, $ED, $6D, $4B
	.byte $55, $6B, $DB, $AD, $52, $5B, $55, $25, $48, $92, $2A, $A5, $92, $54, $55, $92
	.byte $24, $54, $7D, $6F, $DB, $6D, $AF, $A4, $6A, $65, $BB, $6D, $2B, $09, $4A, $15
	.byte $49, $52, $55, $A5, $6A, $AB, $24, $A2, $5D, $4B, $52, $6B, $B5, $6A, $7B, $B7
	.byte $A9, $5A, $B5, $52, $DA, $5E, $55, $92, $54, $42, $04, $D1, $6E, $2B, $45, $40
	.byte $ED, $56, $A9, $D5, $B6, $6D, $7B, $AB, $AA, $6D, $B5, $52, $55, $A1, $92, $2A
	.byte $55, $B5, $24, $09, $82, $BA, $D6, $5D, $AB, $56, $92, $52, $D5, $6A, $ED, $76
	.byte $55, $5F, $09, $A2, $6C, $BB, $B5, $2A, $59, $95, $24, $24, $A9, $52, $A5, $B6
	.byte $25, $21, $52, $DB, $B6, $EF, $6D, $55, $55, $D5, $5A, $A9, $DA, $AA, $4A, $A4
	.byte $AA, $52, $12, $A1, $4A, $6D, $57, $A2, $95, $DA, $EE, $5B, $21, $92, $EA, $D6
	.byte $EA, $65, $AB, $4A, $94, $A4, $AD, $ED, $A4, $6E, $97, $24, $80, $DA, $4A, $48
	.byte $93, $DA, $56, $DF, $0A, $50, $DB, $56, $B5, $DB, $B7, $B5, $24, $A5, $A2, $AA
	.byte $AA, $96, $52, $29, $11, $92, $AA, $AA, $DA, $B6, $77, $5B, $49, $EA, $9B, $00
	.byte $52, $AD, $F6, $EF, $92, $48, $54, $9B, $24, $55, $FF, $36, $55, $15, $49, $52
	.byte $AA, $4A, $12, $6A, $F5, $4D, $22, $DA, $ED, $2B, $A9, $B6, $FB, $AA, $6A, $D5
	.byte $44, $40, $AA, $CA, $6E, $AF, $24, $11, $12, $A5, $EA, $55, $B5, $ED, $DB, $0A
	.byte $82, $E4, $5E, $55, $6A, $77, $15, $24, $BB, $AD, $24, $A5, $7D, $FF, $4A, $42
	.byte $92, $24, $91, $A4, $2A, $95, $DC, $2E, $49, $ED, $B6, $6A, $55, $AB, $AD, $5A
	.byte $D5, $B6, $25, $55, $42, $A4, $B6, $B7, $92, $24, $11, $84, $DA, $F6, $BB, $56
	.byte $95, $55, $49, $48, $2A, $B5, $EF, $DB, $54, $49, $A4, $DA, $B6, $DB, $55, $AA
	.byte $24, $54, $55, $2A, $49, $4A, $2B, $49, $52, $AD, $BE, $5F, $84, $CA, $6A, $BB
	.byte $B6, $B6, $BB, $4A, $92, $24, $C9, $B6, $55, $49, $52, $AD, $4A, $92, $94, $AA
	.byte $AA, $AA, $F6, $AA, $6A, $5B, $89, $64, $F5, $B6, $94, $DA, $76, $57, $49, $90
	.byte $54, $BB, $BD, $92, $24, $92, $A4, $AA, $92, $44, $55, $B5, $7A, $B7, $55, $D5
	.byte $56, $55, $55, $D5, $B6, $6D, $55, $92, $50, $55, $B5, $5A, $29, $91, $44, $D5
	.byte $4A, $A5, $2A, $69, $AD, $DE, $6A, $AD, $B6, $A9, $95, $4A, $55, $55, $B5, $6D
	.byte $AD, $34, $95, $24, $49, $6A, $5B, $25, $91, $52, $55, $4A, $55, $B5, $AA, $D5
	.byte $F6, $7D, $25, $21, $AD, $6D, $B5, $AA, $2A, $B5, $AD, $92, $8A, $92, $52, $49
	.byte $95, $2A, $49, $95, $2A, $DB, $76, $BB, $4A, $A9, $D5, $DB, $56, $55, $29, $95
	.byte $A4, $B4, $77, $95, $44, $AA, $55, $49, $A9, $2A, $A9, $AA, $A5, $24, $95, $DA
	.byte $DE, $B5, $54, $55, $6D, $6B, $D5, $AA, $9A, $AA, $6A, $93, $A4, $AA, $95, $4A
	.byte $49, $12, $49, $B5, $9A, $AA, $52, $AD, $56, $AD, $DD, $B6, $AD, $52, $DB, $AA
	.byte $92, $24, $A9, $2A, $B5, $AA, $5A, $55, $92, $52, $55, $55, $55, $55, $B5, $2A
	.byte $25, $49, $6D, $DB, $B6, $5A, $DB, $AA, $AA, $54, $AA, $AA, $5A, $AD, $A4, $AA
	.byte $52, $A5, $54, $4A, $25, $49, $52, $EB, $B6, $AA, $6A, $AB, $B5, $D5, $F6, $AA
	.byte $A5, $4A, $89, $84, $AA, $B6, $52, $A9, $AD, $AA, $54, $AA, $54, $D5, $6A, $55
	.byte $49, $4A, $6B, $DB, $52, $2A, $D5, $6A, $DB, $F6, $AA, $12, $A1, $AA, $55, $A9
	.byte $56, $AB, $2A, $A9, $24, $29, $A9, $54, $D5, $6A, $6B, $AB, $6D, $55, $A9, $6A
	.byte $D5, $DA, $B6, $2A, $25, $91, $A4, $D4, $AA, $94, $5A, $6D, $AB, $54, $AA, $55
	.byte $A5, $AA, $5A, $35, $95, $52, $B5, $56, $55, $AB, $56, $55, $B5, $6D, $2B, $49
	.byte $90, $54, $59, $6D, $DB, $2A, $49, $2A, $55, $A9, $AA, $AA, $56, $AB, $5A, $B5
	.byte $5A, $55, $55, $DB, $2A, $95, $AA, $AA, $92, $84, $24, $AD, $6D, $DB, $B6, $5A
	.byte $49, $92, $52, $B5, $56, $AB, $4A, $52, $6B, $AB, $A9, $94, $56, $AD, $D5, $5A
	.byte $55, $25, $21, $A9, $6A, $D5, $B6, $ED, $AA, $92, $10, $A9, $AA, $AD, $AA, $AA
	.byte $55, $AB, $4A, $55, $55, $B5, $D5, $5A, $A9, $94, $2A, $55, $2A, $4B, $55, $55
	.byte $BB, $6D, $55, $29, $51, $2A, $AB, $AA, $DA, $5A, $95, $94, $54, $B5, $5A, $55
	.byte $55, $D5, $DA, $AA, $92, $A4, $92, $6A, $DB, $B6, $55, $55, $B5, $92, $44, $92
	.byte $54, $B5, $B5, $5A, $55, $55, $A5, $54, $55, $DB, $5E, $55, $AA, $4A, $95, $24
	.byte $55, $B5, $5A, $AB, $B5, $D5, $54, $4A, $A2, $A4, $B2, $6D, $AB, $52, $55, $55
	.byte $49, $55, $B5, $B5, $2A, $D5, $B6, $55, $49, $42, $AD, $F6, $6A, $5B, $55, $92
	.byte $52, $29, $49, $2A, $A9, $6A, $6B, $B5, $6A, $AD, $AA, $4A, $55, $AB, $B5, $5A
	.byte $4B, $49, $92, $B4, $6A, $55, $AB, $B6, $5A, $29, $49, $55, $A9, $52, $55, $D5
	.byte $AA, $55, $35, $55, $2A, $B5, $55, $55, $AB, $B6, $5A, $A5, $AA, $94, $AA, $B6
	.byte $AD, $2A, $A9, $24, $29, $95, $52, $A5, $AA, $5A, $AB, $6D, $5B, $55, $95, $AA
	.byte $D6, $AA, $55, $A9, $AA, $52, $49, $A9, $AA, $D6, $6A, $55, $A9, $AA, $94, $4A
	.byte $55, $AB, $2A, $55, $55, $B5, $56, $AB, $AA, $4A, $AB, $56, $AD, $6A, $55, $A9
	.byte $52, $A9, $6A, $55, $A5, $4A, $55, $49, $49, $55, $55, $55, $AB, $B6, $B6, $5A
	.byte $AB, $55, $95, $4A, $55, $AD, $AA, $4A, $A5, $54, $A9, $AA, $54, $B5, $D5, $56
	.byte $55, $2A, $49, $A9, $AA, $B6, $56, $55, $55, $55, $6B, $55, $4D, $55, $A9, $AA
	.byte $D5, $AA, $AA, $52, $29, $A9, $6A, $D5, $4A, $55, $49, $49, $55, $AB, $56, $D5
	.byte $5A, $6D, $AD, $5A, $A9, $AA, $AA, $4A, $53, $A9, $52, $AB, $AA, $52, $AA, $D4
	.byte $AA, $5A, $55, $55, $AD, $4A, $95, $52, $55, $6D, $AB, $56, $69, $55, $55, $55
	.byte $55, $55, $AA, $AA, $56, $A9, $2A, $55, $A9, $AA, $AA, $AA, $5A, $55, $A9, $52
	.byte $55, $B5, $6A, $D5, $AA, $D5, $5A, $55, $A5, $4A, $95, $95, $2A, $55, $55, $55
	.byte $A9, $AA, $AA, $AA, $AA, $AA, $55, $AD, $54, $55, $55, $A9, $AA, $D5, $5A, $AD
	.byte $AA, $AA, $52, $55, $A9, $52, $AA, $AA, $56, $55, $55, $A9, $6A, $55, $55, $55
	.byte $55, $55, $55, $55, $55, $55, $55, $B5, $D5, $AA, $AA, $AA, $4A, $49, $55, $55
	.byte $55, $55, $A9, $95, $AA, $AA, $AA, $5A, $55, $55, $AB, $AA, $AA, $AA, $54, $55
DMC09_End

DMC05:	.byte $00, $FE, $FF, $5F, $62, $00, $00, $00, $FF, $FF, $FF, $27, $00, $00, $E8, $FF
	.byte $FF, $07, $00, $FC, $FF, $FF, $FF, $00, $00, $00, $F8, $FF, $03, $00, $80, $FD
	.byte $FF, $7F, $00, $00, $B0, $FF, $FF, $01, $00, $00, $FF, $FF, $FF, $0F, $00, $00
	.byte $FE, $FF, $05, $00, $00, $FA, $FF, $5F, $04, $80, $EE, $FF, $FF, $1F, $00, $00
	.byte $00, $FA, $FF, $03, $00, $BA, $FF, $FF, $5F, $00, $00, $D0, $EF, $EF, $08, $00
	.byte $40, $FF, $FF, $FF, $08, $00, $D8, $FF, $FF, $02, $00, $00, $F8, $FF, $6F, $13
	.byte $01, $6A, $FB, $B6, $AA, $00, $40, $B6, $FF, $B7, $12, $24, $B5, $ED, $6B, $49
	.byte $00, $64, $BB, $B7, $93, $44, $A9, $55, $F5, $ED, $AB, $44, $80, $94, $A6, $B7
	.byte $9B, $54, $6A, $95, $56, $B5, $5A, $35, $95, $22, $A4, $B6, $6A, $DB, $6A, $25
	.byte $A9, $AA, $6D, $BB, $15, $04, $A4, $6A, $6F, $AB, $12, $6A, $DB, $B6, $95, $54
	.byte $92, $A2, $D4, $6A, $6F, $A5, $42, $55, $D5, $EA, $5B, $09, $49, $AD, $B6, $56
	.byte $25, $28, $E2, $ED, $7E, $4C, $2B, $41, $92, $6D, $BF, $AB, $24, $00, $52, $6F
	.byte $B7, $B5, $6A, $49, $55, $5B, $AB, $6A, $13, $08, $69, $DB, $5A, $95, $24, $BA
	.byte $6F, $57, $45, $48, $55, $DB, $AD, $85, $24, $42, $D5, $F6, $BD, $AD, $24, $02
	.byte $D5, $F6, $56, $93, $08, $51, $DB, $BE, $AD, $2A, $24, $49, $6F, $B7, $A9, $22
	.byte $08, $B5, $DD, $AB, $A9, $44, $59, $6D, $6F, $25, $91, $94, $AA, $B6, $6D, $A9
DMC05_B:.byte $92, $A8, $DA, $75, $AB, $24, $91, $6A, $BB, $5D, $25, $41, $94, $6D, $D7, $AA
	.byte $52, $29, $55, $6D, $B5, $A9, $52, $49, $B5, $6D, $4B, $A2, $54, $D5, $B6, $5A
	.byte $29, $92, $54, $DB, $6D, $2D, $29, $52, $A5, $B6, $6D, $93, $4A, $52, $6B, $D5
	.byte $92, $AA, $AA, $55, $5B, $55, $91, $54, $59, $B5, $55, $55, $49, $A5, $DA, $B6
DMC05_C:.byte $AB, $8A, $42, $A5, $F6, $B2, $25, $49, $56, $6D, $B5, $A9, $94, $CA, $AA, $6A
	.byte $AB, $4A, $A5, $54, $69, $DB, $2B, $A9, $A4, $AA, $6A, $6D, $25, $49, $AD, $56
	.byte $55, $65, $45, $95, $6B, $D5, $55, $85, $8A, $52, $EF, $B6, $B5, $24, $A0, $AA
	.byte $D5, $55, $95, $52, $55, $B5, $5A, $AB, $A2, $AA, $AA, $B6, $55, $A5, $82, $54
	.byte $DB, $6D, $55, $49, $48, $DB, $DE, $AA, $52, $09, $95, $6A, $5B, $55, $93, $2A
	.byte $55, $6B, $CB, $96, $52, $C9, $EA, $D5, $54, $42, $52, $B5, $6D, $6B, $A9, $42
	.byte $25, $BB, $76, $AD, $54, $88, $AA, $B6, $6D, $55, $09, $69, $6B, $AB, $55, $92
	.byte $24, $55, $7F, $A5, $52, $A5, $54, $6A, $57, $55, $55, $95, $AA, $B5, $55, $51
	.byte $49, $52, $BB, $B7, $25, $24, $A9, $D8, $F5, $55, $95, $48, $92, $DD, $B7, $53
	.byte $22, $01, $69, $DF, $B7, $96, $22, $24, $69, $DF, $5E, $95, $12, $29, $69, $5B
	.byte $AB, $A9, $20, $A9, $6D, $6F, $5B, $51, $2A, $55, $96, $AC, $4A, $B5, $2D, $4B
	.byte $A9, $65, $55, $95, $AD, $2A, $95, $A5, $D4, $6A, $57, $25, $92, $AA, $DA, $6D
DMC05_End



	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; The following two LUTs are used together via Update_Request
	; See index values UPDATERASTER_*
IntNMI_UpdSel_Table:	
	.byte $a0	; UPDATERASTER_32PIXPART (opt. flag UPDATERASTER_32PIXSHOWSPR)
	.byte $40	; UPDATERASTER_SPADEGAME
	.byte $a0	; UPDATERASTER_WATERLINE
	.byte $60	; UPDATERASTER_FIXEDFC (opt. flag UPDATERASTER_32PIXSHOWSPR)

IntNMI_Raster_Table:	
	.byte $40	; UPDATERASTER_32PIXPART (opt. flag UPDATERASTER_32PIXSHOWSPR)
	.byte $60	; UPDATERASTER_SPADEGAME
	.byte $a0	; UPDATERASTER_WATERLINE
	.byte $40	; UPDATERASTER_FIXEDFC (opt. flag UPDATERASTER_32PIXSHOWSPR)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; NMI INTERRUPT
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IntNMI:
	SEI		 ; Prevent further masked Interrupts

	; This pushes all the registers onto the stack
	PHP		 ; Push processor status onto stack
	PHA		 ; Push accumulator onto stack
	TXA		 ; Reg X -> A
	PHA		 ; Push A (X) onto stack
	TYA		 ; Reg Y -> A
	PHA		 ; Push A (Y) onto stack

	; Push the three temp vars onto the stack 
	LDA <Temp_Var1
	PHA
	LDA <Temp_Var2
	PHA
	LDA <Temp_Var3
	PHA

	JMP PRG062_SUB_9F40	 ; Jump to PRG062_SUB_9F40

PRG063_F499:
	BEQ PRG063_F4AB	 ; If Update_Request = 0, goto PRG063_F4AB (no request pending)

	; Since Update_Request must be >= 1, this converts it to a zero-based index
	AND #$7f	 ; Keep lower 7 bits
	TAY		 ; -> 'Y'
	DEY		 ; Y-- (zero base index)

	; Get which update path we're going to follow
	LDA IntNMI_UpdSel_Table,Y
	STA Update_Select

	; Apply Raster_Effect as requested
	LDA IntNMI_Raster_Table,Y
	STA Raster_Effect

PRG063_F4AB:
	LDA UpdSel_Disable
	BEQ PRG063_F4B3	 ; If UpdSel_Disable is not set, jump to PRG063_F4B3 (perform Update_Select activity)
	JMP PRG063_F567	 ; Otherwise, jump to PRG063_F567

PRG063_F4B3:
	; Update_Select activity begin...

	LDA Update_Select	 ; Get the Update_Select value

	; SB: Refactoring this to a jump table so it's easier to work with!
	; Nintendo used a $00, $20, $40... $A0 numbering system with Raster_Effect for some reason
	; So first we must undo that... basically 3 MSb shifted down
	LSR A
	LSR A
	LSR A
	LSR A	; Now we have 0, 2, 4, ... perfect for a jump table!
	TAX
	
	; 6502 trickery here
	LDA IntNMI_BySelect+1,X
	PHA
	LDA IntNMI_BySelect,X
	PHA
	RTS
	
IntNMI_BySelect:
	; Minus 1 required due to 6502 RTS behavior
	.word UpdSel00-1			; $00: ??
	.word UpdSel_Title-1		; $20: Title Screen
	.word UpdSel_Roulette-1		; $40: UpdSel_Roulette (Spade / Roulette game)
	.word UpdSel_32PixPart-1	; $60: Fixed floor/ceiling
	.word UpdSel_Vertical-1		; $80: Purely vertical level
	.word UpdSel_32PixPart-1	; $A0: 32 pixel partition
	.word PRG063_F4E3-1			; $C0: Normal / typical

UpdSel00:
	; MMC3 event
	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #26	 			; Page 26
	STA MMC3_PAGE	 		; Set MMC3 page
	JMP PRG063_F610	 		; 

PRG063_F4E3:

	; "Normal" update ($C0)

	LDA #$00	 ; A = 0
	STA PPU_CTL2	 ; Hide sprites and bg (most importantly)
	STA PPU_SPR_ADDR ; Resets to sprite 0 in memory
	LDA #$02	 ; A = 2
	STA SPR_DMA	 ; DMA sprites from RAM @ $200 (probably trying to blank them out)
	JSR PT2_Full_CHRROM_Switch	 ; Set up PT2 (Sprites) CHRROM

	LDA <VBlank_Tick	
	BNE PRG063_F51D	 	; If VBlank_Tick <> 0, jump to PRG063_F51D

	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #26	 			; Page 26
	STA MMC3_PAGE	 		; Set MMC3 page

	JSR Scroll_Commit_Column ; Update nametable as screen scrolls (differs from call made in UpdSel_Vertical, UpdSel_32PixPart)
	JSR Video_Misc_Updates	 ; Various updates other than scrolling (palettes, status bar, etc.)
	JSR TileChng_VRAMCommit	 ; Commit 16x16 tile change to VRAM

	; Set pages at A000 and C000
	JSR PRGROM_Change_Both

	LDA <Graphics_Queue	
	BNE PRG063_F519	 	; If we don't need to reset the graphics buffer, jump to PRG063_F519

	LDA #$00	 	; Reset the graphics buffer
	STA Graphics_BufCnt	
	STA Graphics_Buffer	

PRG063_F519:
	LDA #$00	 
	STA <Graphics_Queue	 ; Buffer reset (if pending) not needed, we just did it ourselves

PRG063_F51D:

	LDA PPU_STAT	 	; read PPU status to reset the high/low latch

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$3f	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3Fxx
	LDA #$00	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3F00 (palettes?)
	STA PPU_VRAM_ADDR	; 
	STA PPU_VRAM_ADDR	; Now accessing $0000 (Pattern tables?)

	LDA <PPU_CTL2_Copy	; Get current PPU_CTL2 settings in RAM
	ORA #$18	; A | 18 (BG + SPR)
	STA PPU_CTL2	; Sprites/BG are forced to be visible regardless of PPU_CTL2_Copy

	LDA <PPU_CTL1_Mod	
	ORA #%10101000	; In addition to anything else specified by PPU_CTL1_Mod, Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings
	LDA PPU_STAT	; read PPU status to reset the high/low latch

	LDA <Horz_Scroll
	STA PPU_SCROLL	; Horizontal Scroll set
	LDA <Vert_Scroll
	ADD Vert_Scroll_Off	; Apply vertical offset (used for??)
	STA PPU_SCROLL		; Vertical scroll set

	; This sets the status bar scroll fix for everything after the title screen!
	; At scanline 192, the name table scroll is fixed to always display the status bar
	LDA #192		; A = 192
	STA MMC3_IRQCNT		; Store 192 into the IRQ count
	STA MMC3_IRQLATCH	; Store it into the latch (will be used later)
	STA MMC3_IRQENABLE	; Start the IRQ counter
	CLI		; Enable maskable interrupts

PRG063_F55B:
	; This is a common routine used by variants

	LDA <VBlank_TickEn		 ; Check if VBlank occurred
	BEQ PRG063_F567	 ; If A = 0, jump to PRG063_F567

	JSR Randomize	 	; Seed the random number generator
	JSR Read_Joypads	 ; Updates both joypads in RAM

	DEC <VBlank_Tick	 ; Decrement VBlank_Tick

PRG063_F567:
	; Some jump here instead of F55B

	; *** Bring the primary sound engine bank (page 28) into ROM
	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #28	 			; Page 28
	STA MMC3_PAGE	 		; Set MMC3 page

	; Jump to the sound engine, newly inserted at page A000!
	JSR Sound_Engine_Begin

	; Change A000/C000 back to whatever they were before the sound engine 
	JSR PRGROM_Change_Both

	INC <Counter_1	 ; Simply increments every frame, used for timing

	; Not sure what this is for
	LDA PAGE_CMD
	STA MMC3_COMMAND

	; Pull (pop) the three temp vars from the stack 
	PLA
	STA <Temp_Var3
	PLA
	STA <Temp_Var2
	PLA
	STA <Temp_Var1

	; This pulls (pops) all the registers from the stack...
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP

	; Fully cleaned up "NMI" interrupt
	RTI

UpdSel_Vertical:

	; COMPARE TO PRG063_F4E3

	LDA #$00	 ; A = 0
	STA PPU_CTL2	 ; Hide sprites and bg (most importantly)
	STA PPU_SPR_ADDR ; Resets to sprite 0 in memory
	LDA #$02	 ; A = 2
	STA SPR_DMA	 ; DMA sprites from RAM @ $200 (probably trying to blank them out)
	JSR PT2_Full_CHRROM_Switch	 ; Set up PT2 (Sprites) CHRROM

	LDA <VBlank_Tick	 
	BNE PRG063_F5D3	 		; If VBlank_Tick <> 0, jump to PRG063_F5D3

	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #26	 			; Page 26
	STA MMC3_PAGE	 		; Set MMC3 page

	JSR Scroll_ToVRAM_Apply	 ; Applies Scroll_ToVRAMHi and Scroll_ToVRAMHA updates
	JSR Video_Misc_Updates	 ; Various updates other than scrolling (palettes, status bar, etc.)
	JSR TileChng_VRAMCommit	 ; Commit 16x16 tile change to VRAM

	; Set pages at A000 and C000
	JSR PRGROM_Change_Both

	LDA <Graphics_Queue	
	BNE PRG063_F5CF	 	; If we don't need to reset the buffer, jump to PRG063_F5CF

	; Reset graphics buffer
	LDA #$00
	STA Graphics_BufCnt
	STA Graphics_Buffer

PRG063_F5CF:
	LDA #$00	 
	STA <Graphics_Queue	 ; Graphics Buffer reset

PRG063_F5D3:
	LDA PPU_STAT	 	; read PPU status to reset the high/low latch

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$3f	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3Fxx
	LDA #$00	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3F00 (palettes?)
	STA PPU_VRAM_ADDR	; 
	STA PPU_VRAM_ADDR	; Now accessing $0000 (Pattern tables?)

	LDA <PPU_CTL2_Copy	; Get current PPU_CTL2 settings in RAM
	ORA #$18	; A | 18 (BG + SPR)
	STA PPU_CTL2	; Sprites/BG are forced to be visible regardless of PPU_CTL2_Copy

	LDA <Horz_Scroll_Hi	; ?? Can specify bits? (I think this is a mistake, and this will be zero on vertical level anyway)
	ORA #%10101000	; Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings
	LDA PPU_STAT	; read PPU status to reset the high/low latch

	LDA <Horz_Scroll
	STA PPU_SCROLL	 ; Horizontal Scroll set
	LDA <Vert_Scroll
	STA PPU_SCROLL	 ; Vertical Scroll set

	LDA #192	 ; A = 192
	STA MMC3_IRQCNT	 ; Store 192 into the IRQ count
	STA MMC3_IRQLATCH ; Store it into the latch (will be used later)
	STA MMC3_IRQENABLE ; Start the IRQ counter
	CLI		 ; Enable maskable interrupts
	JMP PRG063_F55B	 ; Jump to PRG063_F55B

PRG063_F610:

	; Following the "Normal" Update path...

	LDA #$00	 ; A = 0
	STA PPU_CTL2	 ; Hide sprites and bg (most importantly)
	STA PPU_SPR_ADDR ; Resets to sprite 0 in memory
	LDA #$02	 ; A = 2
	STA SPR_DMA	 ; DMA sprites from RAM @ $200 (probably trying to blank them out)
	JSR PT2_Full_CHRROM_Switch	 ; Set up PT2 (Sprites) CHRROM

	LDA <Map_EnterLevelFX	 
	BEQ PRG063_F631	 ; If Map_EnterLevelFX = 0 (not entering a level), jump to PRG063_F631
	CMP #$01	 ; 
	BNE PRG063_F62E	 ; If Map_EnterLevelFX <> 1 (only other value would be 2, during the level "opening" effect, not used in US version), jump to PRG063_F62E

	; This is being called while level is being entered...
	JSR Map_EnterLevel_Effect 	; World map "entering" effect on page 26

	JMP PRG063_F631	 ; Jump to PRG063_F631

PRG063_F62E:
	JSR Level_Opening_Effect	; Level "opening" effect on page 26 (unused on US release)

PRG063_F631:
	LDA PPU_STAT

	LDA <PPU_CTL1_Mod
	ORA #%10101000	; In addition to anything else specified by PPU_CTL1_Mod, Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings

	LDA <Horz_Scroll
	STA PPU_SCROLL	 ; Horizontal Scroll set
	LDA <Vert_Scroll
	STA PPU_SCROLL	 ; Vertical Scroll set

	LDA PPU_STAT	 	; read PPU status to reset the high/low latch

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$3f	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3Fxx
	LDA #$00	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3F00 (palettes?)
	STA PPU_VRAM_ADDR	; 
	STA PPU_VRAM_ADDR	; Now accessing $0000 (Pattern tables?)

	LDA <PPU_CTL2_Copy	; Get current PPU_CTL2 settings in RAM
	ORA #$18	; A | 18 (BG + SPR)
	STA PPU_CTL2	; Sprites/BG are forced to be visible regardless of PPU_CTL2_Copy

	LDA #%10101000	; Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings

	LDA PPU_STAT

	LDA <Horz_Scroll
	STA PPU_SCROLL	 ; Horizontal Scroll set
	LDA <Vert_Scroll
	STA PPU_SCROLL	 ; Vertical Scroll set

	LDA #192	 ; A = 192
	STA MMC3_IRQCNT	 ; Store 192 into the IRQ count
	STA MMC3_IRQLATCH ; Store it into the latch (will be used later)
	STA MMC3_IRQENABLE ; Start the IRQ counter
	CLI		 ; Enable maskable interrupts
	DEC <VBlank_Tick ; Decrement VBlank_Tick
	JMP PRG063_F567	 ; 

UpdSel_32PixPart:
	LDA #$00	 ; A = 0
	STA PPU_CTL2	 ; Hide sprites and bg (most importantly)
	STA PPU_SPR_ADDR ; Resets to sprite 0 in memory

	LDA #$02	 ; A = 2
	STA SPR_DMA	 ; DMA sprites from RAM @ $200 (probably trying to blank them out)
	JSR PT2_Full_CHRROM_Switch	 ; Set up PT2 (Sprites) CHRROM

	LDA <VBlank_Tick
	BNE PRG063_F6BC	 		; If VBlank_Tick <> 0, jump to PRG063_F6BC

	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #26	 			; Page 26
	STA MMC3_PAGE	 		; Set MMC3 page

	JSR Scroll_Commit_Column ; Update nametable as screen scrolls (differs from call made in UpdSel_Vertical, UpdSel_32PixPart)
	JSR Video_Misc_Updates	 ; Various updates other than scrolling (palettes, status bar, etc.)
	JSR TileChng_VRAMCommit	 ; Commit 16x16 tile change to VRAM

	; Set pages at A000 and C000
	JSR PRGROM_Change_Both

	LDA <Graphics_Queue
	BNE PRG063_F6B8	 ; If we don't need to reset the buffer, jump to PRG063_F6B8

	; Reset graphics buffer
	LDA #$00	 
	STA Graphics_BufCnt
	STA Graphics_Buffer

PRG063_F6B8:
	LDA #$00	 
	STA <Graphics_Queue	; Graphics Buffer reset

PRG063_F6BC:
	LDA PPU_STAT	 	; read PPU status to reset the high/low latch

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$3f	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3Fxx
	LDA #$00	 	; 
	STA PPU_VRAM_ADDR	; Access PPU address #3F00 (palettes?)
	STA PPU_VRAM_ADDR	; 
	STA PPU_VRAM_ADDR	; Now accessing $0000 (Pattern tables?)

	LDA <PPU_CTL2_Copy	; Get current PPU_CTL2 settings in RAM
	ORA #$18	; A | 18 (BG + SPR)
	STA PPU_CTL2	; Sprites/BG are forced to be visible regardless of PPU_CTL2_Copy

	LDA <PPU_CTL1_Mod	; A = PPU_CTL1_Mod
	ORA #%10101000	; In addition to anything else specified by PPU_CTL1_Mod, Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings
	LDA PPU_STAT	; read PPU status to reset the high/low latch

	LDA Update_Select
	CMP #$60
	BNE UpdSel_NotFixedFC

	; Vertical locked at zero for fixed ceiling
	LDA <Horz_Scroll
	STA PPU_SCROLL	; Horizontal Scroll set
	LDA #0
	STA PPU_SCROLL	; Vertical scroll set
	
	LDA #$FF
	STA Raster_State

	; Fixed floor-ceiling has an earlier interrupt
	LDA #30
	BNE UpdSel60A0_Cont

UpdSel_NotFixedFC:
	; SB: Probably a bit "dirty" to use raw offsets like this, but makes it easier to do
	; "large characters" (e.g. Big Boo) without activating unwanted auto-scroll stuff.
	LDA <Horz_Scroll
	ADD Horz_Scroll_Off32PP
	STA PPU_SCROLL	; Horizontal Scroll set
	LDA <Vert_Scroll
	ADD Vert_Scroll_Off
	STA PPU_SCROLL	; Vertical scroll set

	; 32 pixel partition begins at line 160
	LDA #160
	
UpdSel60A0_Cont:
	STA MMC3_IRQCNT		; Store 160 into the IRQ count
	STA MMC3_IRQLATCH	; Store it into the latch (will be used later)
	STA MMC3_IRQENABLE	; Start the IRQ counter
	CLI		; Enable maskable interrupts
	JMP PRG063_F55B	 ; Jump to PRG063_F55B

UpdSel_Title:
	LDA #$00	 ; A = 0
	STA PPU_CTL2	 ; Hide sprites and bg (most importantly)
	STA PPU_SPR_ADDR ; Resets to sprite 0 in memory
	LDA #$02	 ; A = 2
	STA SPR_DMA	 ; DMA sprites from RAM @ $200 (probably trying to blank them out)
	JSR PT2_Full_CHRROM_Switch	 ; Set up PT2 (Sprites) CHRROM

	LDA <VBlank_Tick
	BNE PRG063_F748	 ; If VBlank_Tick <> 0, go to PRG063_F748

	;LDA <Ending2_IntCmd
	;BEQ PRG063_F72B	 ; If Ending2_IntCmd = 0, go to PRG063_F72B

	;LDA #MMC3_8K_TO_PRG_C000	; Changing PRG ROM at C000
	;STA MMC3_COMMAND 		; Set MMC3 command
	;LDA #25	 			; Page 25
	;STA MMC3_PAGE	 		; Set MMC3 page

	;LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	;STA MMC3_COMMAND 		; Set MMC3 command
	;LDA #24	 			; Page 24
	;STA MMC3_PAGE	 		; Set MMC3 page

	;JSR Do_Ending2_IntCmd	; Perform action of Ending2_IntCmd

	;JMP PRG063_F748	 ; Jump to PRG063_F748

;PRG063_F72B:
	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA #26	 			; Page 26
	STA MMC3_PAGE	 		; Set MMC3 page

	JSR Video_Misc_Updates	 ; Various updates other than scrolling (palettes, status bar, etc.)

	LDA <Graphics_Queue
	BNE PRG063_F744	 ; If we don't need to reset the graphics buffer, jump to PRG063_F744

	; Reset graphics buffer
	LDA #$00	 
	STA Graphics_BufCnt
	STA Graphics_Buffer

PRG063_F744:
	LDA #$00	 
	STA <Graphics_Queue	 ; Graphics Buffer reset

PRG063_F748:
	LDA PPU_STAT

	LDA #$00
	STA PPU_VRAM_ADDR	; 
	STA PPU_VRAM_ADDR	; Now accessing $0000 (Pattern tables?)

	LDA <PPU_CTL2_Copy	; Get current PPU_CTL2 settings in RAM
	ORA #$18	; A | 18 (BG + SPR)
	STA PPU_CTL2	; Sprites/BG are forced to be visible regardless of PPU_CTL2_Copy

	LDA <PPU_CTL1_Mod	; A = PPU_CTL1_Mod
	ORA #%10101000	; In addition to anything else specified by PPU_CTL1_Mod, Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA PPU_CTL1	; Set above settings
	LDA PPU_STAT	; read PPU status to reset the high/low latch

	LDA <Horz_Scroll
	STA PPU_SCROLL	; Horizontal Scroll set
	LDA <Vert_Scroll
	STA PPU_SCROLL	; Vertical scroll set

	; NOTE: Different from the typical 192 scanline count!
	LDA #193		; A = 193
	STA MMC3_IRQCNT		; Store 193 into the IRQ count
	STA MMC3_IRQLATCH	; Store it into the latch (will be used later)
	STA MMC3_IRQENABLE	; Start the IRQ counter
	CLI		; Enable maskable interrupts

	LDA <VBlank_TickEn	 ; Check VBlank flag
	BEQ PRG063_F786	 	; If A = 0, jump to PRG063_F786
	JSR Randomize	 	; Shake up the randomizer!
	JSR Read_Joypads	 ; Updates both joypads in RAM

	DEC <VBlank_Tick	 ; Decrement VBlank_Tick

PRG063_F786:
	JMP PRG063_F567	 ; Jump to PRG063_F567

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Set of pages "normal" IRQ sets when tileset is 0 (World Map) or 7 (Toad House)
StatusBarMTCHR_0000	=	$5c	; Standard status bar part 1 ($5C and $5D are loaded)
StatusBarMTCHR_0800	=	$5e	; Standard status bar part 2 ($5E and $5F are loaded)
SpriteMTCHR_1000	=	$48
SpriteMTCHR_1400	=	$49
SpriteMTCHR_1800	=	$05	; Power-up and Toad sprites here
SpriteMTCHR_1C00	=	$4b

; Set of pages "normal" IRQ sets (for status bar I presume)
StatusBarCHR_0000	=	$5c	; Standard status bar part 1 ($5C and $5D are loaded)
StatusBarCHR_0800	=	$5e	; Standard status bar part 2 ($5E and $5F are loaded)
SpriteHideCHR_1000	=	$7e	; ALL BLANK TILES
SpriteHideCHR_1400	=	$7e	; ALL BLANK TILES
SpriteHideCHR_1800	=	$7e	; ALL BLANK TILES
SpriteHideCHR_1C00	=	$7e	; ALL BLANK TILES

StatusBarEnd_0800	= 	146	; Ending alternate font

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IntIRQ:	 ; $F795 IRQ Interrupt (scanline from MMC3)
	SEI		 ; Disable maskable interrupts

	; Save all registers
	PHP		 ; Push processor status onto stack
	PHA		 ; Push accumulator onto stack
	TXA		 ; Reg X -> A
	PHA		 ; Push A (X) onto stack
	TYA		 ; Reg Y -> A
	PHA		 ; Push A (Y) onto stack

	LDA Reset_Latch
	CMP #$5a
	BEQ PRG063_F7B0	 ; If Reset_Latch = $5A, go to PRG063_F7B0

	; Reset_Latch was something other than the magic $5A value... reset!!

	; This gets the address of the Reset entry point -> [Temp_Var2][Temp_Var1]
	LDA Vector_Table+2
	STA <Temp_Var1
	LDA Vector_Table+3
	STA <Temp_Var2

	; Jump to the Reset instead...
	JMP [Temp_Var1]

PRG063_F7B0:
	LDA PAPU_MODCTL_Copy
	PHA		 ; Save A
	AND #$7f	 ; Basically don't disturb DMC, but disable interrupt, if active
	STA PAPU_MODCTL	 ; 

	LDA Raster_Effect

	; SB: Refactoring this to a jump table so it's easier to work with!
	; Nintendo used a $00, $20, $40... $A0 numbering system with Raster_Effect for some reason
	; So first we must undo that... basically 3 MSb shifted down
	LSR A
	LSR A
	LSR A
	LSR A	; Now we have 0, 2, 4, ... perfect for a jump table!
	TAX
	
	; 6502 trickery here
	LDA IntIRQ_ByRaster+1,X
	PHA
	LDA IntIRQ_ByRaster,X
	PHA
	RTS
	
IntIRQ_ByRaster:
	; Minus 1 required due to 6502 RTS behavior
	.word PRG063_F7DF-1				; $00: Standard status bar
	.word IntIRQ_TitleEnding-1		; $20: Title/ending
	.word IntIRQ_32PixelPartition-1	; $40: 32 pixel partition
	.word IntIRQ_SpadeGame-1		; $60: Spade Bonus Game
	.word IntIRQ_Finish-1			; $80: is nothing (e.g. as in 2P versus)
	.word IntIRQ_A0FIXME-1			; $A0: ???

PRG063_F7DF:

	; Flags for vertical World 7 speciality levels
	LDA Level_7Vertical
	BEQ IntIRQ_Vertical	 ; For vertical type levels
	JMP IntIRQ_Standard	 ; Otherwise, just do the standard thing (status bar used in level and map)

IntIRQ_Vertical:
	STA MMC3_IRQENABLE ; Active IRQ
	LDY #$0b	 ; Y = $0B
	LDA Level_Tileset ; A = current tileset
	CMP #17
	BNE PRG063_F7F8	 ; If tileset <> 17 (N-Spade), jump to PRG063_F7F8
	LDY #$03	 ; Y = $03

PRG063_F7F8:
	LDX #$00	 ; X = 0

	CMP #$00	 ; 
	BEQ PRG063_F871	 ; If tileset = 0 (World map), go to PRG063_F871
	;CMP #$07	 ; 
	;BEQ PRG063_F871	 ; If tileset = 7 (Toad house), go to PRG063_F871
	CMP #17
	BEQ PRG063_F871	 ; If tileset = 17 (N-Spade), go to PRG063_F871

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$00
	STA PPU_VRAM_ADDR
	LDA #$00
	STA PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR

	STX PPU_CTL2	 ; Sprites + BG invisible
	LDA PPU_STAT	 ; 

	; Because vertical scroll will not change after frame begins (second write to
	; PPU_SCROLL will always be unused until next frame), the hack for MMC3 split
	; vertical scrolling is to change the nametable address that the PPU is reading
	; at to where we would like it to be...
	STY PPU_VRAM_ADDR	 ; This is $0B unless tileset = $11, which it is then $03
	LDA #$00
	STA PPU_VRAM_ADDR	; ... so now we're reading at $1100 or $0300
	LDA PPU_VRAM_DATA

	; Load status bar graphics and hide any sprites from appearing over the status bar

	; Load two parts of Status Bar
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND

	; Use blank tiles for all sprite graphics
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE

	LDA Player_RescuePrincess
	BEQ Ending_NotEndingStatBar
	
	; Alternate font for ending
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarEnd_0800
	STA MMC3_PAGE

Ending_NotEndingStatBar:	 
	LDA #$18	 ; 
	STA PPU_CTL2	 ; Sprites + BG now visible
	JMP PRG063_F8B3

PRG063_F871:
	; World map / Toad House / N-Spade

	; Load status bar graphics and hide any sprites from appearing over the status bar

	; Load two parts of Status Bar
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarMTCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarMTCHR_0800

	; Load sprite graphics appropriate for World Map / Toad House / N-Spade
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1C00
	STA MMC3_PAGE

PRG063_F8B3:
	LDA <PPU_CTL1_Copy
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Store result into actual register
	LDA PPU_STAT	 ; 

	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal Scroll = 0
	LDA <Vert_Scroll ; 
	STA PPU_SCROLL	 ; Vertical Scroll updated

IntIRQ_Finish:
	STA MMC3_IRQDISABLE ; Disable the IRQ generation

IntIRQ_Finish_NoDis:
	LDA PAGE_CMD	 ; Get old page command
	STA MMC3_COMMAND ; Issue it
	PLA		 ; Restore A (PAPU_MODCTL_Copy)
	STA PAPU_MODCTL	 ; Set DMC back to normal

	; Restore the other registers
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP

	RTI		 ; End of IRQ interrupt!

IntIRQ_Standard:	; $F8DB
	STA MMC3_IRQENABLE ; Enable IRQ generation

	; Some kind of delay loop?
	LDX #$02	 ; X = 2
PRG063_F8E0:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG063_F8E0	 ; While X > 0, loop

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$00
	STA PPU_VRAM_ADDR
	LDX #$00
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR

	STX PPU_CTL2	 ; Hide BG + Sprites
	LDA PPU_STAT	 ; 

	; Because vertical scroll will not change after frame begins (second write to
	; PPU_SCROLL will always be unused until next frame), the hack for MMC3 split
	; vertical scrolling is to change the nametable address that the PPU is reading
	; at to where we would like it to be...
	LDY #$07
	STY PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR	; ... so now we're reading at $0700
	LDA PPU_VRAM_DATA

	; Couple of tilesets have slightly different effects 
	LDA Level_Tileset
	CMP #$00	 ; 
	BEQ PRG063_F955	 ; If A = 0 (On world map), go to PRG063_F955
	;CMP #$07	 ; 
	;BEQ PRG063_F955	 ; If A = 7 (Toad house), go to PRG063_F955 
	; But not N-Spade?

	; Load status bar graphics and hide any sprites from appearing over the status bar

	; Load two parts of Status Bar
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0000
	STA MMC3_PAGE	
 	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND

	; Use blank tiles for all sprite graphics
	LDA #SpriteHideCHR_1000	
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800	
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1C00	
	STA MMC3_PAGE

	JMP PRG063_F997	 ; Jump to PRG063_F997

PRG063_F955:
	; World Map and Toad House alternate (but not N-Spade?)

	; Load status bar graphics and hide any sprites from appearing over the status bar

	; Load two parts of Status Bar
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarMTCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarMTCHR_0800
	STA MMC3_PAGE

	; Load sprite graphics appropriate for World Map / Toad House / N-Spade
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND
	LDA #SpriteMTCHR_1C00
	STA MMC3_PAGE

PRG063_F997:
	LDA #$18	 ; A | 18 (BG + SPR)
	STA PPU_CTL2	 ; Sprites/BG are visible
	LDA <PPU_CTL1_Copy	 ; PPU_CTL1 copy
	ORA #$01	 ; Force $2400 nametable address
	STA PPU_CTL1	 ; Set it in the register
	LDA PPU_STAT	 ; 
	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal scroll = 0
	LDA <Vert_Scroll ; 
	STA PPU_SCROLL	 ; Vertical scroll update as-is
	JMP IntIRQ_Finish	 ; Clean up IRQ

IntIRQ_32PixelPartition:	; $F9B3 


	LDA Raster_State ; Get current state of the Raster op
	BMI IntIRQ_FixedFC
	BEQ PRG063_F9C1	 ; If Raster_State = 0, go to PRG031_F9C1 (at the 32 pixel partition)
	JMP PRG063_FA3F	 ; Otherwise, jump to PRG031_FA3F (below the 32 pixel partition, status bar)

IntIRQ_FixedFC:


	; We can't change vertical scrolling via PPU_SCROLL after the frame has already begun,
	; so we need to fuck with internal PPU counters... credit to ...
	; http://nesdev.parodius.com/bbs/viewtopic.php?p=78593#78593

	; Need to follow this write pattern:
	
	; PPU_VRAM_ADDR/1 	---- NN-- (nametable select)
	; PPU_SCROLL/2 		VV-- -vvv (upper two bits of coarse V scroll, all bits of fine V scroll)
	; PPU_SCROLL/1 		---- -hhh (fine horizontal scrolling) (takes effect immediately)
	; PPU_VRAM_ADDR/2 	VVVH HHHH (lower three bits of coarse V scroll, all bits of coarse H scroll)

	; "Coarse" refers to an entire row/column of patterns, i.e. 8 pixels
	; "Fine" refers to offset within that row/column, 0-7 scroll change within row/column

	; Since we're starting 32 pixels down, we need an offset Vert_Scroll
	LDA <Vert_Scroll
	ADD #48
	TAX

	; Reset latches
	LDA PPU_STAT
	
	; Nametable select -- for our purposes, set bit 3 (NT2) when NMI_VertTemp calc has carried
	LDA #%00001000		; Otherwise, select NT2
	BCS IntIRQ_FixedFC_NT0

	TXA
	SUB #16
	TAX

	LDA #%00000000		; Otherwise, select NT2
	
IntIRQ_FixedFC_NT0:
	STA PPU_VRAM_ADDR	; 1
	STX <NMI_VertTemp

	; Upper 2 bits coarse, all bits fine
	LDA <NMI_VertTemp
	;AND #%11000111		; VV-- -vvv
	STA PPU_SCROLL		; 2

	; Fine H-Scroll
	LDA <Horz_Scroll
	AND #%00000111		; ---- -hhh
	STA PPU_SCROLL		; 1

	; lower 3 bits coarse V, all bits coarse H
	LDA <NMI_VertTemp
	ASL A
	ASL A
	AND #%11100000		; VVV- ----
	STA <NMI_VertTemp
	
	LDA <Horz_Scroll
	LSR A
	LSR A
	LSR A				; ---H HHHH
	ORA <NMI_VertTemp	; VVVH HHHH
	STA PPU_VRAM_ADDR	; 2

	LDA <Horz_Scroll
	STA PPU_SCROLL		; 1

	INC Raster_State ; Raster_State = 0

	LDA #128
	STA MMC3_IRQCNT	 ; Next interrupt in 124 lines
	STA MMC3_IRQDISABLE	 ; Disable IRQ...

	; Cycle delay count
	;LDX #$1
	;JMP IntIRQ_32PixelPartition_Part5	 ; Jump to IntIRQ_32PixelPartition_Part5

	STA MMC3_IRQLATCH ; Latch A (last set to 27!)
	STA MMC3_IRQENABLE ; Enable IRQ again
	JMP IntIRQ_Finish_NoDis	 ; Jump to IntIRQ_Finish_NoDis


PRG063_F9C1:
	; At the 32 pixel partition

	; Some kind of delay loop?
	LDX #$15	 ; X = $15
PRG063_F9C3:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG063_F9C3 ; While X > 0, loop

	LDA #$10	 ; 
	STA PPU_CTL2	 ; Only show sprites (?)
	LDA PPU_STAT	 ; 

	; Because vertical scroll will not change after frame begins (second write to
	; PPU_SCROLL will always be unused until next frame), the hack for MMC3 split
	; vertical scrolling is to change the nametable address that the PPU is reading
	; at to where we would like it to be...
	LDY #$0a	 ; Y = $0A
	LDA #$80	 ; A = $80
	STY PPU_VRAM_ADDR	 ;
	STA PPU_VRAM_ADDR	 ;	... so now we're reading at $0A80
	LDA PPU_VRAM_DATA	 ;

	JMP IntIRQ_32PixelPartition_Part2	; Jump to IntIRQ_32PixelPartition_Part2

IntIRQ_32PixPart_HideSprites:	; $F9E3

	; This part is skippable based on a flag; only loads
	; Pattern Table 2 in this case...
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE


IntIRQ_32PixelPartition_Part3:
	LDA PPU_STAT
	LDA <PPU_CTL1_Copy	
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Stored to the register!

	LDA <Horz_Scroll
	STA PPU_SCROLL	 ; Set horizontal scroll 
	LDA <Vert_Scroll
	STA PPU_SCROLL	 ; Set vertical scroll

	LDA #$18	 ; 
	STA PPU_CTL2	 ; BG + Sprites now visible

	INC Raster_State ; Raster_State = 1

	LDA #27		 ; 
	STA MMC3_IRQCNT	 ; Next interrupt in 27 lines
	STA MMC3_IRQDISABLE	 ; Disable IRQ...

	; Cycle delay count
	LDX #$13	 ; X = $13
	JMP IntIRQ_32PixelPartition_Part5	 ; Jump to IntIRQ_32PixelPartition_Part5


PRG063_FA3C:
	JMP IntIRQ_Finish_NoDis	 ; Jump to IntIRQ_Finish_NoDis

PRG063_FA3F:
	; The part we do when Raster_State = 1 (the 2nd IRQ interrupt split)

	; Some kind of delay loop?
	LDX #$05	 ; X = 5
PRG063_FA41:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG063_FA41 ; While X > 0, loop

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$00
	STA PPU_VRAM_ADDR
	LDX #$00
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR

	STX PPU_CTL2	 ; Sprites + BG hidden
	LDA PPU_STAT	 ; 

	; Because vertical scroll will not change after frame begins (second write to
	; PPU_SCROLL will always be unused until next frame), the hack for MMC3 split
	; vertical scrolling is to change the nametable address that the PPU is reading
	; at to where we would like it to be...
	LDY #$0b
	STY PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR	; ... so now we're reading at $0B00
	LDA PPU_VRAM_DATA

	; This loads graphics into the "BG" side (PT1)
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE

	LDA #$18	 ; 
	STA PPU_CTL2	 ; Sprites + BG now visible
	LDA <PPU_CTL1_Copy
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Update the PPU_CTL1 register..
	LDA PPU_STAT	 ; 

	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal scroll locked at zero
	LDA <Vert_Scroll	
	STA PPU_SCROLL	 ; Vertical scroll as-is
	LDA #$00	 ; 
	STA Raster_State ; Clear Raster_State (no more effects)
	JMP IntIRQ_Finish	 ; Clean up IRQ


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tables used by IntIRQ_SpadeGame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Roulette_RasterDelay:
	.byte $02, $02, $02, $06

	; This table tells how many lines to skip to the next row.
	; Apparently they didn't really take advantage of the potential
	; for this functionality, however, as all values are equal!
Roulette_RasterDiv:	; Raster_State = 0,1,2
	.byte $34, $34, $34

	.byte $00	; Not used, would be Raster_State = 3

IntIRQ_SpadeGame:

	; Disable then enable the IRQ??  Probably to make sure
	; last latch value gets pushed into counter...
	STA MMC3_IRQDISABLE
	STA MMC3_IRQENABLE

	LDY Raster_State ; Get current Raster_State
	CPY #$03	 ;
	BEQ PRG063_FAE7	 ; If Raster_State = 3, jump to PRG063_FAE7

	; Based on the current Raster_State, set next scanline delay
	LDA Roulette_RasterDiv,Y
	STA MMC3_IRQCNT
	STA MMC3_IRQENABLE

PRG063_FAE7:

	; Another of these common delay loops, this time dynamic...
	LDX Roulette_RasterDelay,Y	 ; Get value based on Raster_State
PRG063_FAEA:
	NOP		 ; ? 
	DEX		 ; X--
	BNE PRG063_FAEA	 ; While > 0, loop...

	CPY #$03	 ;
	BNE PRG063_FB34	 ; If Raster_State <> 3, jump to PRG063_FB34

	; Raster_State = 3 (load status bar graphics)

	; This loads graphics into the "BG" side (PT1)
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE

PRG063_FB34:
	LDA PPU_STAT	 ; 

	CPY #$03	 ; 
	BEQ PRG063_FB57	 ; If Raster_State = 3, jump to PRG063_FB57

	; Raster_State < 3...

	LDA Roulette_PosHi,Y	 ; Get position for this row
	AND #$01	 ; Nametable swaps $2000 / $2400 every odd/even unit (??)
	ORA <PPU_CTL1_Copy	; Update PPU_CTL1_Copy
	STA PPU_CTL1	 	; .. and the actual PPU_CTL1 register
	LDA Roulette_Pos,Y	 ; Get horizontal scroll position for this row
	STA PPU_SCROLL	 ; Store the horizontal
	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Vertical = 0
	INY		 ; 
	STY Raster_State ; Raster_State++
	JMP IntIRQ_Finish_NoDis	 ; Cleanup and finish (for THIS Raster_State)

PRG063_FB57:
	; Raster_State = 3 ...
	LDA <PPU_CTL1_Copy	
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Update actual register
	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal Scroll = 0
	LDA <Vert_Scroll ; 
	STA PPU_SCROLL	 ; Vertical Scroll updated (should generally not be moving here :)
	LDA #$00	 ; 
	STA Raster_State	 ; Raster_State = 0
	JMP IntIRQ_Finish	 ; Clean up IRQ, we're done!


	; FIXME: What is this for??
IntIRQ_A0FIXME:
	; Disable then enable the IRQ??  Probably to make sure
	; last latch value gets pushed into counter...
	STA MMC3_IRQDISABLE
	STA MMC3_IRQENABLE

	LDA Raster_State
	BEQ PRG063_FB7E	; If Raster_State = 0, go to PRG063_FB7E
	JMP PRG063_FBE5	; Otherwise, jump to PRG063_FBE5

PRG063_FB7E:
	; Some kind of delay loop?
	LDX #$14	 ; X = $14
PRG063_FB80:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG063_FB80 ; While X > 0, loop

	LDA #$10	 ; 
	STA PPU_CTL2	 ; Only show sprites

	; Only loads Pattern Table 2 in this case...
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE

	LDA PPU_STAT
	LDA <PPU_CTL1_Copy
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Update the actual register

	LDA <Horz_Scroll
	STA PPU_SCROLL	 ; Update Horizontal Scroll
	LDA <Vert_Scroll
	STA PPU_SCROLL	 ; Update Vertical Scroll
	INC Raster_State ; Raster_State++

	LDA #27	 
	STA MMC3_IRQCNT	 ; Next IRQ in 27 lines

	; Some kind of delay loop?
	LDX #$02	 ; X = $14
PRG063_FBD3:
	NOP		 ; ?
	DEX		 ; X--
	BPL PRG063_FBD3 ; While X >= 0, loop

	LDA #$18	 ; 
	STA PPU_CTL2	 ; Sprites + BG now visible

	; Dead code?  Or timing/cycle filler
	NOP
	NOP
	NOP

	; The following JSR does a delay then updates the IRQ
	; counter latch and Resets it
	JSR PRG062_SUB_9F50
	JMP IntIRQ_Finish_NoDis	 ; Clean up for THIS Raster_State...

PRG063_FBE5:
	; Raster_State <> 0...

	; Some kind of delay loop?
	LDX #$03	 ; X = $14
PRG063_FBE7:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG063_FBE7 ; While X > 0, loop

	; Unknown hardware thing?  Is this for synchronization?
	LDA #$00
	STA PPU_VRAM_ADDR
	LDX #$00
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR

	STX PPU_CTL2	 ; Most importantly, hide BG + Sprites
	LDA PPU_STAT	 ; 

	; Because vertical scroll will not change after frame begins (second write to
	; PPU_SCROLL will always be unused until next frame), the hack for MMC3 split
	; vertical scrolling is to change the nametable address that the PPU is reading
	; at to where we would like it to be...
	LDY #$0b
	STY PPU_VRAM_ADDR
	STX PPU_VRAM_ADDR	; ... so now we're reading at $0B00
	LDA PPU_VRAM_DATA

	; This loads graphics into the "BG" side (PT1)
	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0000
	STA MMC3_PAGE
	LDA #MMC3_2K_TO_PPU_0800
	STA MMC3_COMMAND
	LDA #StatusBarCHR_0800
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1000
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1000
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1400
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1400
	STA MMC3_PAGE
	LDA #MMC3_1K_TO_PPU_1800
	STA MMC3_COMMAND
	LDA #SpriteHideCHR_1800
	STA MMC3_PAGE	
	LDA #MMC3_1K_TO_PPU_1C00
	STA MMC3_COMMAND	
	LDA #SpriteHideCHR_1C00
	STA MMC3_PAGE

	LDA #$18	 ; 
	STA PPU_CTL2	 ; Sprites + BG now visible

	LDA <PPU_CTL1_Copy
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Update the actual register
	LDA PPU_STAT	 ; 

	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal Scroll = 0
	LDA <Vert_Scroll ; 
	STA PPU_SCROLL	 ; Update Vertical Scroll
	LDA #$00	 ; 
	STA Raster_State	 ; Raster_State = 0
	JMP IntIRQ_Finish	 ; Clean up IRQ


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRGROM_Change_Both
;
; This subroutine sets both PRG ROM pages A000 and C000 together.
;	C000 is set to the page value found at RAM location PAGE_C000
;	A000 is set to the page value found at RAM location PAGE_A000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PRGROM_Change_Both:	; $FC6F

	; Setting PRG ROM C000 to page specified in PAGE_C000
	LDA #MMC3_8K_TO_PRG_C000	; Changing PRG ROM at C000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA PAGE_C000	 		; Page @ PAGE_C000
	STA MMC3_PAGE	 		; Set MMC3 page
	
	; Setting PRG ROM A000 to page specified in PAGE_A000
	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA PAGE_A000	 		; Page @ PAGE_A000
	STA MMC3_PAGE	 		; Set MMC3 page

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Split arrays defining the vertical screen starting positions
	; (i.e. $000, $0F0, $1E0, $2D0, ...)
VertLevel_ScreenH:	.byte $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E
VertLevel_ScreenL:	.byte $00, $F0, $E0, $D0, $C0, $B0, $A0, $90, $80, $70, $60, $50, $40, $30, $20, $10

; This stores the four tiles which make up a card (or absense of one)
; Order: None, Star Coin, Comet
CardUL:	.byte $FE, $2E, $E2
CardUR:	.byte $FE, $2F, $E3
CardLL:	.byte $FE, $3E, $E4
CardLR:	.byte $FE, $3F, $E6

; Each card's video start offset (lower byte)
CardVStartU:	.byte $36, $39, $3C	; Upper half of card
CardVStartL:	.byte $56, $59, $5C	; Lower half of card


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; StatusBar_Update_Cards
;
; This subroutine prepares the three cards in the Player's
; inventory, storing them into the graphics buffer to be
; drawn when ready...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
StatusBar_Update_Cards:

	LDA #0 ; SB: Inventory offset, former 2P specific offsets removed
	STA <Temp_Var1	 ; Temp_Var1 = A

	LDA #$02	 
	STA <Temp_Var2	 ; Temp_Var2 = 2

PRG063_FCCC:
	LDY <Temp_Var1	 ; Y = Temp_Var1

	JSR StatusBar_DrawCardPiece	 ; Draw part of the card into the status bar

	INC <Temp_Var1
	DEC <Temp_Var2
	BPL PRG063_FCCC	 ; While Temp_Var2 >= 0, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player_GetStarCoinAndUpdate
;
; This subroutine gives Player a card 
; and updates their status bar (see StatusBar_Update_Cards)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Player_GetStarCoinAndUpdate:
	TAY

	LDA #1
	STA Inventory_Cards,Y	 ; Store the new star coin

StatusBar_DrawCardPiece:
	STY <Temp_Var3	 	; Temp_Var3 = Y
	LDX Inventory_Cards,Y	; Get next card

	LDA <Map_EnterViaID
	CMP #MAPOBJ_DAREDEVILCOMET
	BEQ SBDCP_DDComet
	CMP #MAPOBJ_PURPLECOMET
	BNE SBDCP_NotComet
SBDCP_DDComet:
	LDX #2

SBDCP_NotComet:
	LDY Graphics_BufCnt 	; Current position within graphics buffer

	; Store the upper tiles of the card in the buffer
	LDA CardUL,X	 
	STA Graphics_Buffer+3,Y	 
	LDA CardUR,X	 
	STA Graphics_Buffer+4,Y	 

	; Store the lower tiles of the card in the buffer
	LDA CardLL,X	 
	STA Graphics_Buffer+8,Y	 
	LDA CardLR,X	 
	STA Graphics_Buffer+9,Y	 

	LDX #0	; SB: Inventory offset, former 2P specific offsets removed

	LDA <Temp_Var3		; A = Temp_Var3 (offset to current card)
	STX <Temp_Var3		; Temp_Var3 = X
	SUB <Temp_Var3		; A -= Temp_Var3 (offset from start to current card)
	TAX		 	; A = X

	LDA CardVStartU,X
	STA Graphics_Buffer+1,Y	 

	LDA CardVStartL,X
	STA Graphics_Buffer+6,Y

	LDA #$2b	 ; A = $2B (Not vertical)

	LDX Level_7Vertical
	BEQ PRG063_FD1C	 ; If level is not vertical, jump to PRG063_FD1C

	LDA #$27	 ; A = $27 (Vertical)
PRG063_FD1C: 
	LDX Level_Tileset
	CPX #16	 
	BEQ PRG063_FD27	 ; If Level_Tileset = 16 (Spade game), jump to PRG063_FD27

	CPX #17	
	BNE PRG063_FD29	 ; If Level_Tileset = 17 (N-Spade), jump to PRG063_FD29

PRG063_FD27:
	LDA #$23	 ; A = $23 (Spade game)

PRG063_FD29:

	; Configure graphics buffer
	STA Graphics_Buffer,Y
	STA Graphics_Buffer+5,Y

	LDA #$02
	STA Graphics_Buffer+2,Y
	STA Graphics_Buffer+7,Y

	; Terminate
	LDA #$00
	STA Graphics_Buffer+$A,Y

	; Set buffer count
	TYA
	ADD #$0a
	STA Graphics_BufCnt

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player_GetItem
;
; Gives Player an item specified in 'A'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Player_GetItem:
	TAX

	LDA Inventory_Items,X
	CMP #99
	BGE Player_GetItem_Full		; If you already have 99 of this, jump to Player_GetItem_Full (RTS)

	; You got one more!
	INC Inventory_Items,X	 ; Give it to the Player!

Player_GetItem_Full:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sprite_RAM_Clear
;
; This subroutine clears the local copy of OAM by filling
; the X/Y values in with $F8 and $01, essentially making
; them all invisible until actually needed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Sprite_RAM_Clear:	; $FD84
	LDY #$00	 ; Y = 0

PRG063_FD86:
	LDA #$f8	 	; A = $F8 
	STA Sprite_RAM,  Y	; Next X value
	LDA #$01	 	; A = $01
	STA Sprite_RAM+1,Y	; Next Y value
	INY		 ; 
	INY		 ; 
	INY		 ; 
	INY		 ; Y += 4
	BNE PRG063_FD86	 ; While Y does not equal zero (covers all 256 bytes)

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scroll_PPU_Reset
;
; This subroutine Resets the scroll position of the nametable
; and its associated variables back to zero, and also reasserts
; that the PPU is displaying sprites in PT2, but interestingly
; does not set them to 8x16 ??
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Scroll_PPU_Reset:	; $FD97
	LDA #$00	 ; 
	STA PPU_SCROLL	 ; Horizontal scroll = 0
	STA <Horz_Scroll ; Horz_Scroll = 0
	STA PPU_SCROLL	 ; Vertical scroll = 0
	STA <Vert_Scroll ; Vert_Scroll = 0
	LDA #$08	 ; 
	STA PPU_CTL1	 ; Sprites in PT2
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset_PPU_Clear_Nametables
;
; Resets PPU_CTL2 and clears both nametables and also resets
; the graphics buffer in case any updates were pending...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Reset_PPU_Clear_Nametables:	; $FDA9
	; Reset graphics buffer
	LDA #$00	  
	STA Graphics_BufCnt
	STA Graphics_Buffer	 

Reset_PPU_Clear_Nametables2:
	; NMI PPU_CTL2 and clear both nametables
	JSR Clear_PPU_CTL2_Copy	; Clear RAM copy and actual PPU_CTL2
	LDA #$20	 	; Select Nametable 0
	JSR Clear_Nametable	; Clear nametable to all $FC
	LDA #$28	 	; Select Nametable 2
	JSR Clear_Nametable	; Clear nametable to all $FC
	RTS		 	; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear_PPU_CTL2_Copy
;
; Clears the PPU_CTL2_Copy variable and also the
; PPU_CTL2 register itself 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Clear_PPU_CTL2_Copy:	; $FDBF
	LDA #$00	 
	STA <PPU_CTL2_Copy	; Clears PPU_CTL2_Copy (though sprites/BG overridden as visible anyway)
	STA PPU_CTL2	 	; At this point, clearing PPU_CTL2 altogether, though likely it will shortly be updated
	RTS		 	; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear_Nametable
;
; This subroutine clears an entire nametable, specified by
; the initial value of A ($20 for NT 0, $28 for NT2, and 
; technically the other two could be specified as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Clear_Nametable:	; $FDC7:
	STA <Temp_Var1		; Save A

	LDA PPU_STAT	 	; 
	LDA #$00	 	; 
	STA PPU_CTL1		; Most likely most importantly to prevent any more Resets

	LDA <Temp_Var1		; Restore A (from Reset_PPU_Clear_Nametables, this is $20 or $28, Nametable 0 or Nametable 2)
	STA PPU_VRAM_ADDR	; Write this as high byte VRAM address select
	LDA #$00 
	STA PPU_VRAM_ADDR	; $00 as low byte for VRAM address (Reset_PPU_Clear_Nametables selects nametable 1 or 2)

	; This writes over the entire selected name table and attribute table with $FC
	LDX #$04	 ; X = $04
	LDY #$00	 ; Y = $00
	LDA #$fc	 ; A = $FC
PRG063_FDE1:
	STA PPU_VRAM_DATA	 ; Write $FC to NT
	DEY		 ; Y--
	BNE PRG063_FDE1	 ; While <> 0, loop (will write 256 times)
	DEX		 ; X--
	BNE PRG063_FDE1	 ; While <> 0, loop (will write 4 times)

	LDA <Temp_Var1	 ; Retrieve initial A value again
	ADD #$03	 	; A += 3 (moving to attribute table)
	STA PPU_VRAM_ADDR	; Address high byte
	LDA #$c0		; Beginning of attribute table
	STA PPU_VRAM_ADDR	; Address low byte

	; This will write over the attribute table (technically the prior loop does an
	; unnecessary overrun... probably just a simpler loop to code.)
	LDY #$40	 ; Y = $40 
	LDA #$00	 ; A = 0
PRG063_FDFB:
	STA PPU_VRAM_DATA	 ; Write $00 to AT
	DEY		 ; Y--
	BNE PRG063_FDFB	 ; While Y <> 0, loop (will write 64 times)

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear_Nametable_Short
;
; This subroutine sets ClearPattern over half a nametable, which
; is the initial value of A ($20 for NT 0, $28 for NT2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Clear_Nametable_Short:	; $FE02
	LDA PPU_STAT	 	; 
	LDA #$00	 	; 
	STA PPU_CTL1		; Most likely most importantly to prevent any more Resets

	LDA <Temp_Var1		; Restore A (from Reset_PPU_Clear_Nametables, this is $20 or $28, Nametable 0 or Nametable 2)
	STA PPU_VRAM_ADDR	; Write this as high byte VRAM address select
	LDA #$00 
	STA PPU_VRAM_ADDR	; $00 as low byte for VRAM address (Reset_PPU_Clear_Nametables selects nametable 1 or 2)

	LDX #$03	 ; X = 3
	LDY #$c0	 ; Y = $C0
	LDA ClearPattern	 ; A = ClearPattern
PRG063_FE1B:
	STA PPU_VRAM_DATA	; Write this pattern

	DEY		 ; Y--
	BNE PRG063_FE1B	 ; While Y <> 0, loop

	DEX		 ; X--
	BNE PRG063_FE1B	 ; While X <> 0, loop!

	RTS		 ; Return

; FIXME: Anybody want to claim this?
; Seems to clear the screen based on specific Vert_Scroll values
PRG063_FE25:	.byte $00, $30, $70, $B0, $EF

	; High and Low VRAM Addresses
PRG063_FE2A:	.byte $20, $20, $21, $22, $28
PRG063_FE2F:	.byte $00, $C0, $C0, $C0, $00

; $FE34
	LDY #$04	; Y = 4
	LDA <Vert_Scroll
PRG063_FE38:
	CMP PRG063_FE25,Y
	BEQ PRG063_FE40	 ; If Vert_Scroll = this value, jump to PRG063_FE40

	DEY		 ; Y--
	BPL PRG063_FE38	 ; While Y >= 0, loop

PRG063_FE40:

	; Load FIXME values -> Temp_Var1/2
	LDA PRG063_FE2A,Y
	STA <Temp_Var1
	LDA PRG063_FE2F,Y
	STA <Temp_Var2

	LDY #$00	 ; Y = 0
	LDX #$03	 ; X = 3

	LDA <Vert_Scroll
	CMP #$ef
	BEQ PRG063_FE58	 ; If Vert_Scroll = $EF (bottom of horizontal scroll level), jump to PRG063_FE58

	LDY #$20	 ; Y = $20
	LDX #$04	 ; X = 4

PRG063_FE58:
	LDA PPU_STAT

	; Disable display
	LDA #$00
	STA PPU_CTL1
PRG063_FE60:
	; Set VRAM High/Low Addresses
	LDA <Temp_Var1
	STA PPU_VRAM_ADDR
	LDA <Temp_Var2
	STA PPU_VRAM_ADDR

PRG063_FE6A:
	LDA ClearPattern	 ; Get the clearing pattern
	STA PPU_VRAM_DATA	 ; Store it

	DEY		 ; Y--
	BNE PRG063_FE76	 ; If Y <> 0, jump to PRG063_FE76

	DEX		 ; X--
	BEQ PRG063_FE98	 ; If X = 0, jump to PRG063_FE98 (RTS)

PRG063_FE76:

	; Next VRAM byte
	LDA <Temp_Var2
	ADD #$01
	STA <Temp_Var2
	LDA <Temp_Var1
	ADC #$00
	STA <Temp_Var1

	CMP #$23
	BNE PRG063_FE6A	 ; If haven't possibly hit the end of the nametable, jump to PRG063_FE6A

	LDA <Temp_Var2
	CMP #$c0
	BNE PRG063_FE6A	 ; If haven't hit the end of the nametable, jump to PRG063_FE6A

	; Set address to second nametable
	LDA #$28
	STA <Temp_Var1
	LDA #$00
	STA <Temp_Var2

	JMP PRG063_FE60	; Loop!

PRG063_FE98:
	RTS		 ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DynJump
;
; A special subroutine for allowing a dynamic jump
; based on a LUT using the index specified by 'A'.
;
; To setup a dynamic call, the rules are fairly simple:
; Define a hook function which simply JSRs to this function,
; and immediately following that JSR put your LUT based on
; absolute addresses to all functions that should be called:
;
; My_DynJump:
;	JSR DynJump
;	.word $8123, $8456, $8789	; Based on 'A', jump to $8123 (0), $8456 (1), $8789 (2)
;
; This works since the return address is gobbled up by DynJump, so you will
; never return to the "JSR DynJump" line!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DynJump:	; $FE99
	ASL A		; A << 1 (turned into an index)
	TAY		; Y = A

	; The old return address to this call is pulled and stored
	; This will address the bytes that immediately followed the
	; JSR instruction that put us here...
	PLA			; Pull A
	STA <Temp_Var1		; Temp_Var1 = pulled A
	PLA			; Pull A
	STA <Temp_Var2		; Temp_Var2 = pulled A

	; REMEMBER: Since the return address was pulled, the next RTS that
	; we happen to encounter will put us back to the call before the
	; call that put us here at DynJump...

	INY			; Need to increment Y (because the return address is at the last byte of the JSR)
	LDA [Temp_Var1],Y	; Gets the byte here (address high)
	STA <Temp_Var3		; Stored into Temp_Var3
	INY		 	; Y++
	LDA [Temp_Var1],Y	; Gets the byte here (address low)
	STA <Temp_Var4		; Stores the byte into Temp_Var4
	
	JMP [Temp_Var3]	 	; Jump to [Temp_Var4][Temp_Var3]
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ThunkJumpA/C
;
; Cross-bank jump.  Backs up current PAGE_[A/C]000 value, changes
; it to the input value, and jumps to the address provided.
; Restores PAGE_[A/C]000 and bank on return.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ThunkJumpA:
	STA <Thunk_Bank		; Input value -> Thunk_Bank
	
	; Backup existing PAGE_A000 value
	LDA PAGE_A000
	PHA
	
	; Change bank
	LDA <Thunk_Bank
	STA PAGE_A000
	JSR PRGROM_Change_A000
	
	; Do whatever we gotta do
	JSR ThunkJump_Entry
	
	; Store flags -> Thunk_Flags
	PHP
	PLA
	STA <Thunk_Flags
	
	; Restore the bank
	PLA
	STA PAGE_A000
	JSR PRGROM_Change_A000
	
	; Restore flags
	LDA <Thunk_Flags
	PHA
	PLP
	RTS

ThunkJumpC:
	STA <Thunk_Bank		; Input value -> Thunk_Bank

	; Backup existing PAGE_C000 value
	LDA PAGE_C000
	PHA
	
	; Change bank
	LDA <Thunk_Bank
	STA PAGE_C000
	JSR PRGROM_Change_C000
	
	; Do whatever we gotta do
	JSR ThunkJump_Entry

	; Store flags -> Thunk_Flags
	PHP
	PLA
	STA <Thunk_Flags
	
	; Restore the bank
	PLA
	STA PAGE_C000
	JSR PRGROM_Change_C000
	
	; Restore flags
	LDA <Thunk_Flags
	PHA
	PLP
	RTS


ThunkJump_Entry:
	JMP [Thunk_Jump_L]		; There is no indirect JSR...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read_Joypads
;
; This subroutine reads the status of both joypads 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Read_Joypads_UnkTable:
	.byte	$00, $01, $02, $00, $04, $05, $06, $04, $08, $09, $0A, $08, $00, $01, $02, $00

Read_Joypads:

	; Read joypads
	LDY #$01	 ; Joypad 2 then 1

PRG063_FEC0:
	JSR Read_Joypad	 ; Read Joypad Y

	; FIXME: I THINK this is for switch debouncing??
PRG063_FEC3:
	LDA <Temp_Var1	 ; Pull result out of $00 -> A
	PHA		 ; Push A
	JSR Read_Joypad	 ; Read Joypad
	PLA		 ; Pull A
	CMP <Temp_Var1	 ; Check if same
	BNE PRG063_FEC3	 ; If not, do it again

	ORA <Temp_Var2	 ; 
	PHA		 ; Push A
	AND #$0f	 ; A &= $0F
	TAX		 ; A -> X
	PLA		 ; Pull A
	AND #$f0	 ; A &= $F0

	ORA Read_Joypads_UnkTable,X	 ; FIXME: A |= Read_Joypads_UnkTable[X]
	PHA		 	; Save A
	STA <Temp_Var3	 	; Temp_Var3 = A
	EOR Controller1,Y	; 
	AND <Temp_Var3	 	; 
	STA Controller1Press,Y	; Figures which buttons have only been PRESSED this frame as opposed to those which are being held down
	STA <Pad_Input	 	; 
	PLA		 	; Restore A
	STA Controller1,Y	; 
	STA <Pad_Holding	 ; 
	DEY		 ; Y-- 
	BPL PRG063_FEC0	 ; If Y hasn't gone negative (it should just now be 0), Read other joypad

	; Done reading joypads
	LDY Player_Current	 
	BEQ PRG063_FF11	 ; If Player_Curren = 0 (Mario), jump to PRG063_FF11

	LDA <Controller1
	AND #$30
	STA <Temp_Var1
	LDA <Controller2
	AND #$cf
	ORA <Temp_Var1
	STA <Pad_Holding
	LDA <Controller1Press
	AND #$30
	STA <Temp_Var1
	LDA <Controller2Press
	AND #$cf
	ORA <Temp_Var1
	STA <Pad_Input

PRG063_FF11:

	; SB: Reverse gravity up/down reversal!
	LDA Player_ReverseGrav
	BEQ ReadJoypad_NotRev

	LDA <Pad_Input
	JSR Input_ReverseUpDown	
	STA <Pad_Input

	LDA <Pad_Holding
	JSR Input_ReverseUpDown	
	STA <Pad_Holding

ReadJoypad_NotRev:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read_Joypad
;
; This subroutine does some tricky business to read out the joypad
; into Temp_Var1 / Temp_Var2
; Register Y should be 0 for Joypad 1 and 1 for Joypad 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Read_Joypad:	; $FF12

	; Joypad reading is weird, and actually requires 8 accesses to the joypad I/O to get all the buttons:
	; Read #1: A 
	;      #2: B 
	;      #3: Select
	;      #4: Start 
	;      #5: Up    
	;      #6: Down  
	;      #7: Left  
	;      #8: Right 

	; This Resets BOTH controllers
	LDA #$01	 ; A = 1 (strobe)
	STA JOYPAD	 ; Strobe joypad 1 (hi)
	LSR A		 ; A = 0 (clear), 1 -> Carry
	STA JOYPAD	 ; Clear strobe joypad 1

	; Needs cleanup and commentary, but basically this does 8 loops to
	; read all buttons and store the result for return
	LDX #$08	 ; X = 8
Read_Joypad_Loop:
	LDA JOYPAD,Y	 ; Get joypad data
	LSR A
	ROL <Temp_Var1
	LSR A
	ROL <Temp_Var2
	DEX
	BNE Read_Joypad_Loop	 ; Loop until 8 reads complete

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IntReset
; Game begins here...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IntReset:
	SEI		 ; Disable maskable interrupts
	CLD		 ; Clear decimal (no BCD math, not there should be anyway)
	LDA #$00	 ; 
	STA PPU_CTL2	 ; Most likely mainly to make BG and SPRITES invisible
	LDA #$08	 ; 
	STA PPU_CTL1	 ; Sprites in Pattern Table 2
	LDX #$02	 ; X = 2

VBlank_Wait_Loop:
	LDA PPU_STAT
	BPL VBlank_Wait_Loop	; If VBlank NOT reported as occuring, loop around and check again!

	DEX		 	; X--
	BNE VBlank_Wait_Loop	; X starts at 2, and goes to 1; so check once more?

	DEX		 ; Effectively, X = $FF
	TXS		 ; X -> Stack Pointer (NMI stack)

	LDA #MMC3_2K_TO_PPU_0000
	STA MMC3_COMMAND	; Command MMC3 to change out first 2K of PPU
	LDY #$00	 ; Y = 0
	STY PPU_SCROLL	 ; Horizontal scroll = 0
	STY PPU_SCROLL	 ; Vertical scroll = 0
	STY MMC3_SRAM_EN ; Disable MMC3 SRAM (?)
	STY MMC3_IRQDISABLE ; Disable MMC3 IRQ generation

	LDA #%00001111	 ; 
	STA PAPU_EN	 ; Enable rectangle wave 1 & 2, triangle, and noise channels
	LDA #$00	 ; 
	STA PAPU_MODCTL	 ; disable DMC IRQs

	; Any write to $4017 resets both the frame counter, and the clock divider. 
	; Sometimes, games will write to this register in order to synchronize the 
	; sound hardware's internal timing, to the sound routine's timing (usually 
	; tied into the Reset code). The frame IRQ frequency is slightly smaller than 
	; the PPU's vertical retrace frequency, so you can see why games would desire 
	; this syncronization.
	
	LDA #$40	 ; 
	STA FRAMECTR_CTL ; disable APU frame IRQ

	LDA PPU_STAT

	LDA #16		 ; A = 16
	TAX		 ; X = 16

	; The following writes 16 twice to PPU_VRAM_ADDR a total of 16 times
	; Not sure what the point of this is?  Must be some kind of hardware thing??
PRG063_FF80:
	STA PPU_VRAM_ADDR	 ; 
	STA PPU_VRAM_ADDR	 ; 
	EOR #$00	 ; Do nothing??
	DEX		 ; X--
	BNE PRG063_FF80	 ; While X > 0, loop

	LDA #$01	 ; 
	STA MMC3_MIRROR	 ; MMC3 command for Vertical mirroring
	LDA #$80	 ; 
	STA MMC3_SRAM_EN ; Re-enable MMC3 SRAM (?)

	; Clear $07FF - $0000, excluding $01xx
	LDY #$07		 
	JSR Clear_RAM_thru_ZeroPage

	LDA #25
	STA PAGE_C000	 
	LDA #24
	STA PAGE_A000	 
	JSR PRGROM_Change_Both2		; Change A000 to page 25 and C000 to page 24

	; NOPs?
	NOP
	NOP
	NOP

	JMP IntReset_Part2	; Rest of Reset continues in the $8000 bank...

PT2_Full_CHRROM_Switch:	 ; $FFAD
	; This subroutine does a full pattern table switchout
	LDY #$05	 ; Loop Y from 5 to 0, effecting all pattern selections

PT2_Full_CHRROM_Loop:
	TYA		 ; A = Y 
	ORA #$40	 ; A = 5 | $40 = $45 (When 5, MMC3_1K_TO_PPU_1C00; decrements thru other pages)
	STA MMC3_COMMAND ; Set MMC3 command
	LDA PatTable_BankSel,Y ; Offset into the Pattern Table 2 LUT for this page
	STA MMC3_PAGE	 ; Set MMC3 page
	DEY		 ; Y--
	BPL PT2_Full_CHRROM_Loop	 ; While Y >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRGROM_Change_Both2
;
; This subroutine sets both PRG ROM pages A000 and C000 together.
; It also writes to $0721, apparently to allow where it returns to
; reissue the MMC3 command (FIXME reason yet unknown ???)
;	A000 is set to the page value found at RAM location PAGE_A000
;	C000 is set to the page value found at RAM location PAGE_C000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRGROM_Change_Both2:	; $FFBF
	JSR PRGROM_Change_C000		; Change C000 first
	; Continues into PRGROM_Change_A000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRGROM_Change_A000
;
; This subroutine sets the PRG ROM page at C000
;	C000 is set to the page value found at RAM location PAGE_A000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRGROM_Change_A000:			; $FFC2
	LDA #MMC3_8K_TO_PRG_A000	; Changing PRG ROM at A000
	STA PAGE_CMD			; FIXME: Store @ PAGE_CMD
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA PAGE_A000			; Page @ PAGE_A000
	STA MMC3_PAGE	 		; Set MMC3 page
	RTS		 		; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRGROM_Change_C000
;
; This subroutine sets the PRG ROM page at A000
;	A000 is set to the page value found at RAM location PAGE_C000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRGROM_Change_C000:	; $FFD1
	LDA #MMC3_8K_TO_PRG_C000	; Changing PRG ROM at C000
	STA PAGE_CMD			; FIXME: Store @ PAGE_CMD
	STA MMC3_COMMAND 		; Set MMC3 command
	LDA PAGE_C000	 		; Page @ PAGE_C000
	STA MMC3_PAGE			; Set MMC3 page
	RTS				; Return
	
		
	; ASSEMBLER BOUNDARY CHECK, END OF $FFFA
.Bound_FFFA:	BoundCheck .Bound_FFFA, $FFFA, PRG063: Vector space

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VECTORS
; Must appear at $FFFA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $FFFA
Vector_Table:
	.word IntNMI   	; $FFFA - NMI Interrupt (VBlank)
	.word IntReset	; $FFFC - Reset Interrupt (boot up)
	.word IntIRQ	; $FFFE - IRQ Interrupt (scanline from MMC3)

