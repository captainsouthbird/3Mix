Sound_PlayMapSounds:
	LDA Sound_QMap
	BNE MapSound_Queued	 ; If a map sound has been queued, jump to MapSound_Queued
	LDA SndCur_Map
	BNE MapSound_Playing	 ; If a map sound is already playing, jump to MapSound_Playing

	; Nothing to do!
	RTS		 ; Return

MapSound_Queued:
	CMP #SND_MAPENTERLEVEL
	BNE PRG028_A0BD	 ; If not playing Map Entering Level sound, go to PRG028_A0BD

	; Entering level sound only:
	LDX #$00	 ; 
	STX SndCur_Music2	 ; Halt any playing BGM
	STX PAPU_EN	 ; Disable all sound channels
	LDX #$0f	 ; 
	STX PAPU_EN	 ; Enable all sound channels

PRG028_A0BD:
	STA SndCur_Map ; Lock in this sound as playing!

	; Sound_Unused7FF = 0 (but never used again...)
	LDY #$00
	STY Sound_Unused7FF

	; The map sounds are issued by bit ($01, $02, $04, $08, etc.)
	; this loop converts it to a Y value of 1-8
	; Basically you earn a prioritization system; lowest sound plays first!
PRG028_A0C5:
	INY		 ; Y++
	LSR A		 ; Sound >> 1 ... -> Carry
	BCC PRG028_A0C5	 ; Waiting for that bit...!

	LDA Sound_Map_LUT-1,Y	; Unfortunately the index is one off, so we have to access the LUT one prior
	TAY		 	; Y = first byte for this sound from LUT

	; Y is now an offset gleaned from the first 8 bytes of this table...
	LDA Sound_Map_LUT,Y	; A = Offset to sound
	STA <Sound_Map_Off	; Store offset to Sound_Map_Off

	LDA Sound_Map_LUT+1,Y	; Offset for the second track of the sound
	STA Sound_Map_Off2	; Store offset to Sound_Map_Off2

	LDA #$01	 ; 
	STA Sound_Map_Len	 ; Sound_Map_Len = 1, so it updates immediately
	STA Sound_Map_Len2	 ; Sound_Map_Len2 = 1, so it updates immediately

MapSound_Playing:
	DEC Sound_Map_Len	 ; Sound_Map_Len--
	BNE PRG028_A136	 ; If Sound_Map_Len > 0, jump to PRG028_A136

	; Sound_Map_Len = 0 ...
	LDY <Sound_Map_Off	; Y = Sound_Map_Off
	INC <Sound_Map_Off	; Sound_Map_Off++
	LDA SndMap_Data,Y 	; Get next byte of sound data

	BEQ MapSound_Stop 	; If it's $00, sound over!  Jump to MapSound_Stop
	BPL MapSound_PlayFreqL	; $00 - $7f injects a new byte into PAPU_FT1 (low byte frequency)
	BNE MapSound_SetLen	; $80 - $ff, MapSound_SetLen

MapSound_Stop:
	LDA #$08	 ; 
	STA PAPU_EN	 ; Only noise channel left enabled
	LDA #$0f	 ; 
	STA PAPU_EN	 ; All channels enabled
	LDA #$00	 ; 
	STA SndCur_Map ; Release hold, no longer playing a sound
	RTS		 ; Return

MapSound_SetLen:
	JSR AND7F	 	; Just keep the lower 7 bits
	STA Sound_Map_LHold	; Use this as the new length value for any following bytes
	LDY <Sound_Map_Off	; Y = offset into sound data
	INC <Sound_Map_Off	; Sound_Map_Off++
	LDA SndMap_Data,Y	; Get the next (presumably not rest!) byte


MapSound_PlayFreqL:
	STA PAPU_FT1	 ; Byte goes directly into frequency register
	LDA SndCur_Map ; Get the hold value
	BPL PRG028_A120	 ; If $80 not set, jump to PRG028_A120

	LDA #$0e	 ; 
	STA PAPU_CT1	 ; Fairly high frequency, short length
	LDX #%10011111	 ; Square 1's CTL settings: Max volume, envelope decay disabled, 50% duty cycle
	BNE PRG028_A127	 ; (technically always) jump to PRG028_A127

PRG028_A120:
	LDA #$08	 ; 
	STA PAPU_CT1	 ; Short length
	LDX #%10010111	 ; Square 1's CTL settings: Half volume, envelope decay disabled, 50% duty cycle

PRG028_A127:
	LDY #$7f	 ; Ramp settings: Everything except actually enabling the ramp!
	JSR Sound1_XCTL_YRAMP
 
	LDA Sound_Map_LHold	 ; Get the current length hold value
	STA Sound_Map_Len	 ; Reset the length counter with this value!
	LDA #$00	 	 ; 
	STA <Sound_Map_EntrV	 ; Start at index 0 for volume ramping (sound $04, level enter, ONLY!)

PRG028_A136:
	LDA SndCur_Map ; Get current map sound we're playing
	CMP #$04	 ; 
	BNE PRG028_A147	 ; If it's NOT $04 (entering level) jump to PRG028_A147

	; $04 (entering level) specific...
	; The volume is ramped down as the sound plays!
	INC <Sound_Map_EntrV	 ; Sound_Map_EntrV++
	LDY <Sound_Map_EntrV	 ; Y = Sound_Map_EntrV
	LDA SndMap_Entr_VolData-1,Y	 ; because they incremented the pointer FIRST, I have to subtract 1 from the LUT address!
	STA PAPU_CTL1	 ; Set the new volume!

PRG028_A147:
	; For any sound...

	LDY Sound_Map_Off2	; Y = Sound_Map_Off2
	BEQ PRG028_A19B	 	; If Sound_Map_Off2 = 0, jump to PRG028_A19B (do nothing; an offset of zero disables the track)

	DEC Sound_Map_Len2	; Sound_Map_Len2--
	BNE PRG028_A18F	 	; If not zero, jump to PRG028_A18F

	LDY Sound_Map_Off2	; Y = Sound_Map_Off2 (again)
	INC Sound_Map_Off2	; Sound_Map_Off2++

	LDA SndMap_Data,Y 	; Get this byte of sound data
	BPL MapSound_Play2FreqL	; If it is $00-$7f, jump to BPL MapSound_Play2FreqL

	; Otherwise this is a length setting
	JSR AND7F		; & $7F
	STA Sound_Map_L2Hld	; Use this as the new length for following bytes
	LDY Sound_Map_Off2	; Y = Sound_Map_Off2
	INC Sound_Map_Off2	; Sound_Map_Off2++
	LDA SndMap_Data,Y	; Get the next (presumably note!) byte 

MapSound_Play2FreqL:
	CMP #$7e	 ; 
	BNE PRG028_A176	 ; Is the next byte $7e? If not, jump to PRG028_A176
	LDA #%00010000	 ; 
	STA PAPU_CTL2	 ; Disables envelope decay, but that's it
	BNE PRG028_A185	 ; (technically always) jump to PRG028_A185

PRG028_A176:
	; Every other byte...
	STA PAPU_FT2

	LDX #$08	 ; 
	STX PAPU_CT2	 ; Short length
	LDX #%01010101	 ; Square 2's CTL settings: 33% volume, envelope decay disabled, 25% duty cycle
	LDY #$7f	 ; Ramp settings: Everything except actually enabling the ramp!
	JSR Sound2_XCTL_YRAMP

PRG028_A185:
	LDA Sound_Map_L2Hld	 ; Get the current length hold value
	STA Sound_Map_Len2	 ; Reset the length counter with this value!

	; Sound_Map_EntV2 = 0
	LDA #$00
	STA <Sound_Map_EntV2

PRG028_A18F:
	INC <Sound_Map_EntV2	 ; Sound_Map_EntV2++

	LDY <Sound_Map_EntV2	; Y = Sound_Map_EntV2

	LDA SndMap_Entr_VolData-1,Y
	ORA #$50	 ; Envelope decay disable + 25% duty cycle
	STA PAPU_CTL2	 ; Set the register

PRG028_A19B:
	RTS		 ; Return

SndMap_Entr_VolData:
	; This ramps down the volume during the "level enter" sound
	.byte $97, $96, $96, $95, $95, $95, $94, $94, $94, $93, $93, $92, $92, $91, $91, $91


AND7F:	; This seems like a ridiculous subroutine!
	AND #$7f
	RTS		 ; Return

MSHO .func \1-Sound_Map_LUT	; "Map Sound Header Offset"
Sound_Map_LUT:
	; These are offsets from here to the respective SFX data headers
	.byte MSHO(SndMapH_Entrance),	MSHO(SndMapH_Move)
	.byte MSHO(SndMapH_Enter),	MSHO(SndMapH_Flip)
	.byte MSHO(SndMapH_Bonus),	MSHO(SndMapH_Unused)
	.byte MSHO(SndMapH_Unused),	MSHO(SndMapH_Deny)


MSO .func \1-SndMap_Data
	;	Offset1, Offset2
	; Offset1 specifies a first track played on Square 1 at 50% duty cycle
	; Offset2 specifies a second track played on Square 2 at 25% duty cycle, only used by the level entry sound...
SndMapH_Entrance:	.byte MSO(SndMap_Data_WEnt),	$00 ; $01: World begin starry entrance sound
SndMapH_Move:		.byte MSO(SndMap_Data_Move),	$00 ; $02: Path move
SndMapH_Enter:		.byte MSO(SndMap_Data_Entr),	MSO(SndMap_Data_Entr2) ; $04: Enter level
SndMapH_Flip:		.byte MSO(SndMap_Data_Flip),	$00 ; $08: Flip inventory
SndMapH_Bonus:		.byte MSO(SndMap_Data_Bonus),	$00 ; $10: Bonus appears
SndMapH_Deny:		.byte MSO(SndMap_Data_Deny), 	$00 ; $80: Denied
SndMapH_Unused:		.byte MSO(SndMap_Data_Unused),	$00 ; $20/$40: ?? unused ?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Format of Map sound data:
; $00:		Ends sound
; $01-$7F:	Sets PAPU_FT1 to this value (lower = higher pitch)
; $80-$FF:	Removing the high bit, this sets the length of following values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SndMap_Data:
SndMap_Data_WEnt:
	.byte $83, $35, $32, $2F, $2C, $2A, $28, $25, $23, $21, $1F, $1D, $1C, $1A, $18, $16
SndMap_Data_Unused: 
	.byte $00	; NOTE: This is SndMap_Data_WEnt's terminator!

	; NOTE: The SndMap_Data_Entr $04 sound is expected to be synced with volume values
	; specified in the table SndMap_Entr_VolData!
SndMap_Data_Entr:
	.byte $84, $12, $15, $19, $1F, $23, $2A, $32, $3F, $47, $54, $64, $8A, $7F, $00

	; "Second track" of entry sound, played on Square 2, only map sound to do this...
SndMap_Data_Entr2:
	.byte $82, $7E, $84, $12, $15, $19, $1F, $23, $2A, $32, $3F, $47, $54, $64, $8A, $7F, $00

SndMap_Data_Flip:
	.byte $85, $6A, $5F, $87, $47, $00

SndMap_Data_Move:
	.byte $85, $2A, $8A, $23, $00

SndMap_Data_Bonus:
	.byte $85, $54, $47, $3F, $35, $8A, $2A, $00

SndMap_Data_Deny:
	.byte $88, $14, $14, $8A, $14, $00

; End of "Map" sounds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Bytes sent to PAPU_CTL1 for the swim sound
SwimCTL1_LUT:
	.byte $9F, $9B, $98, $96, $95, $94, $92, $90, $90, $9A, $97, $95, $93, $92


PRG028_A21D:
	; Pipe sound comes here
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #$08	 
	STA SFX_Counter1 ; SFX_Counter1 = 8
	BNE PRG028_A22F	 ; (technically always) jump to PRG028_A22F

PRG028_A227:
	; SFX_Counter1 has gone to zero...
	LSR Sound_QPlayer	; Sound_QPlayer >>= 1
	BCS PRG028_A22F	 	; If another bit present (?), jump to PRG028_A22F (seems like a dumb place to go with SFX_Counter1 = 0)
	JMP PlayerSnd_Stop	 	; Otherwise, hop to PlayerSnd_Stop

PRG028_A22F:
	DEC SFX_Counter1 ; SFX_Counter1--
	LDA SFX_Counter1 ; A =  SFX_Counter1
	BEQ PRG028_A23F	 ; If SFX_Counter1 = 0, jump to PRG028_A23F
	CMP #$04	 ; 
	BNE PRG028_A24D	 ; If SFX_Counter1 <> 4, jump to PRG028_A24D (do nothing)
	LDA #110	 ; Note 110
	BNE PRG028_A246	 ; (technically always) jump to PRG028_A246

PRG028_A23F:
	; SFX_Counter1 = 8
	LDA #$08
	STA SFX_Counter1

	LDA #$72

PRG028_A246:
	LDX #%10110100	 ; PAPU_CTL1 - volume 8, envelope decay disabled, looping enable, 50% duty 
	LDY #$7f	 ; PAPU_RAMP - Everything but the ramp enable!
	JSR Sound_Sq1_NoteOn

PRG028_A24D:
	RTS		 ; Return

PlayerSnd_JumpSm:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #66		 ; Slightly higher note, otherwise same as PlayerSnd_Jump
	BNE PRG028_A25A	 ; Jump (technically always) to PRG028_A25A

PlayerSnd_Jump:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #52		 ; Note 52

PRG028_A25A:
	LDX #%10000010	 ; PAPU_CTL1  - 50% duty, envelope decay rate 2
	LDY #%10100111	 ; PAPU_RAMP1 - Max shift amount, rate update 2, enable sweep
	JSR Sound_Sq1_NoteOn	 ; Play sound!

	LDA #$28
	STA SFX_Counter1 ; Load SFX_Counter1 = $28; when this expires, sound ends!

PlayerSnd_JumpSmCont:
	LDA SFX_Counter1 ; A = SFX_Counter1
	CMP #$25	 ; 
	BNE PRG028_A273	 ; If SFX_Counter1 <> $25, go to PRG028_A273

	; When SFX_Counter1 reaches $25...
	LDX #%01011111	 ; PAPU_CTL1  - max decay rate (and disabled), 25% duty
	LDY #%11110110	 ; PAPU_RAMP1 - slower right shift, max sweep rate, and enabled
	BNE PRG028_A27B	 ; (technically always) jump to PRG028_A27B

PRG028_A273:
	; SFX_Counter1 <> $25...
	CMP #$20	 ; 
	BNE PRG028_A2A6	 ; If SFX_Counter1 <> $20, go to PRG028_A2A6

	; When SFX_Counter1 reaches $20...
	LDX #%01001000	 ; PAPU_CTL1  - volume 0, decay disabled, 25% duty
	LDY #%10111100	 ; PAPU_RAMP1 - shift amount 4, decrease wavelength, sweep update 3, sweep enable

PRG028_A27B:
	JSR Sound1_XCTL_YRAMP
	BNE PRG028_A2A6	 ; (technically always) jump to PRG028_A2A6

PlayerSnd_Fire:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #5 	 	; SFX_Counter1 will be 5
	LDY #%10011001	 ; PPU_RAMP1 - right shift minimal, decrease wavelength, sweep rate 1, enable sweep
	BNE PRG028_A290	 ; Jump (technically always) to PRG028_A290

PlayerSnd_Bump:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #10		 ; SFX_Counter1 will be 5
	LDY #%10010011	 ; PPU_RAMP1 - right shift 3, increase wavelength, sweep update 1, enable sweep

PRG028_A290:
	LDX #%10011110	 ; PAPU_CTL1 - volume 14, decay disabled, 50% duty
	STA SFX_Counter1

	LDA #38		 ; Note 38
	JSR Sound_Sq1_NoteOn	 ; Play sound!

PlayerSnd_FirBmpCont:
	LDA SFX_Counter1
	CMP #$06	
	BNE PRG028_A2A6	 ; If SFX_Counter1 <> 6, go to PRG028_A2A6

	; SFX_Counter1 = 6...
	LDA #%10111011	 ; 
	STA PAPU_RAMP1	 ; right shift 3, decrease wavelength, sweep rate 3, enable sweep

PRG028_A2A6:
	BNE PRG028_A325	 ; A <> 0, jump to PRG028_A325

PRG028_A2A8:
	; SFX_Counter1 = 0 is the only point you get down here...
	; or from Sound_QPlayer = $40 (unused)
	JMP PRG028_A227	 ; Jump to  PRG028_A227

Sound_PlayPlayer:
	LDY Sound_QPlayer ; Get sound queue for Player sounds
	BEQ PRG028_A2D0	 ; If 0, nothing's queued; go to PRG028_A2D0

	BMI PlayerSnd_JumpSm 	; If sound $80 Penguin jump, go to PlayerSnd_JumpSm

	; Since the input is a bit value ($01, $02, $04, ...), this will
	; decode it by continuously shifting to the right until we hit
	; a bit; this also incidentally provides a simple priority system.

	LSR Sound_QPlayer
	BCS PlayerSnd_Jump 	; If sound $01 (SND_PLAYERJUMP), go to PlayerSnd_Jump
	LSR Sound_QPlayer
	BCS PlayerSnd_Bump 	; If sound $02 (SND_PLAYERBUMP), go to PlayerSnd_Bump
	LSR Sound_QPlayer
	BCS PlayerSnd_Swim 	; If sound $04 (SND_PLAYERSWIM), go to PlayerSnd_Swim
	LSR Sound_QPlayer
	BCS PlayerSnd_Kick 	; If sound $08 (SND_PLAYERKICK), go to PlayerSnd_Kick
	LSR Sound_QPlayer
	BCS PlayerSnd_Pipe 	; If sound $10 (SND_PLAYERPIPE), go to PlayerSnd_Pipe
	LSR Sound_QPlayer
	BCS PlayerSnd_Fire 	; If sound $20 (SND_PLAYERFIRE), go to PlayerSnd_Fire

PRG028_A2D0:
	LDA SndCur_Player
	BEQ PRG028_A2E9	 ; If no sound playing, jump to PRG028_A2E9

	BMI PlayerSnd_JumpSmCont	 ; If sound $80 (SND_PLAYERJUMPSM), go to PlayerSnd_JumpSmCont
	LSR A		 ; 
	BCS PlayerSnd_JumpCont	 ; If sound $01 (SND_PLAYERJUMP), go to PlayerSnd_JumpCont
	LSR A		 ;
	BCS PlayerSnd_FirBmpCont ; If sound $02 (SND_PLAYERBUMP), go to PlayerSnd_FirBmpCont
	LSR A		 ; 
	BCS PlayerSnd_SwimCont	 ; If sound $04 (SND_PLAYERSWIM), go to PlayerSnd_SwimCont	
	LSR A		 ; 
	BCS PlayerSnd_KickCont	 ; If sound $08 (SND_PLAYERKICK), go to PlayerSnd_KickCont
	LSR A		 ; 
	BCS PlayerSnd_PipeCont	 ; If sound $10 (SND_PLAYERPIPE), go to PlayerSnd_PipeCont
	LSR A		 ; 
	BCS PlayerSnd_FirBmpCont ; If sound $20 (SND_PLAYERFIRE), go to PlayerSnd_FirBmpCont

PRG028_A2E9:
	LDA SndCur_Player
	CMP #SND_PLAYERPOWER
	BEQ PRG028_A2A8	 	; If SndCur_Player = SND_PLAYERPOWER, go to PRG028_A2A8

	LSR Sound_QPlayer	; 
	BCS PRG028_A2FC	 	; If SND_PLAYERJUMP (??) go to PRG028_A2FC (I don't think this will ever happen)
	RTS		 ; Return

PlayerSnd_Pipe:
	JMP PlayerSnd_Pipe2

PlayerSnd_PipeCont:
	JMP PlayerSnd_PipeCont2

PRG028_A2FC:
	JMP PRG028_A21D	 ; Jump to PRG028_A21D

PlayerSnd_JumpCont:	; jump update comes here
	JMP PlayerSnd_JumpSmCont

PlayerSnd_Swim:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #$0e	 
	STA SFX_Counter1 ; SFX_Counter1 = $0e
	LDY #$9c	 ; PAPU_RAMP1 
	LDX #$9e	 ; PAPU_CTL1
	LDA #66		 ; Note 66
	JSR Sound_Sq1_NoteOn	 

PlayerSnd_SwimCont:
	LDY SFX_Counter1 
	LDA SwimCTL1_LUT-1,Y	; SFX_Counter1 is used as an index into SwimCTL1_LUT; we subtract 1 because SFX_Counter1 must be at least 1
	STA PAPU_CTL1	 	; Store next swim CTL1 command
	CPY #$06	 ; 
	BNE PRG028_A325	 ; If SFX_Counter1 <> 6, jump to PRG028_A325
	LDA #$9e	 ;
	STA PAPU_FT1	 ; Update PAPU_FT1

PRG028_A325:
	BNE PlayerSnd_CounterUpd	 ; (technically always) jump to PlayerSnd_CounterUpd

PlayerSnd_Kick:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #$0e	 ; 
	LDY #$cb	 ; PAPU_RAMP1
	LDX #$9f	 ; PAPU_CTL1
	STA SFX_Counter1 ; SFX_Counter1 = $0E
	LDA #68		 ; Note 68
	JSR Sound_Sq1_NoteOn	 ; Play sound!
	BNE PlayerSnd_CounterUpd

PlayerSnd_KickCont:
	LDY SFX_Counter1
	CPY #$08	 ; 
	BNE PRG028_A34A	 ; If SFX_Counter1 <> 8, go to PRG028_A34A

	LDA Kill_Tally
	BEQ KickSnd_NoAdj	; If Kill_Tally = 0, jump to KickSnd_NoAdj

	SUB #1	; Subtract 1 otherwise we always get an off-pitch sound on first stomp
	ASL A
	ASL A
	ASL A
KickSnd_NoAdj:
	STA <Temp_Var1

	LDA #$a0	 ; 
	SUB <Temp_Var1
	STA PAPU_FT1	 ; Update register

	LDA #$9f	 ; 
	BNE PRG028_A34C	 ; (technically always) jump to PRG028_A34C

PRG028_A34A:
	LDA #$90

PRG028_A34C:
	STA PAPU_CTL1

PlayerSnd_CounterUpd:
	DEC SFX_Counter1 ; SFX_Counter1--
	BNE PRG028_A363	 ; If SFX_Counter1 <> 0, go to PRG028_A363 (do nothing)

	; Counter has dropped to zero!
PlayerSnd_Stop:
	LDX #$00	 	;
	STX SndCur_Player	; Clear Player sound hold
	LDX #$1e	 	; 
	STX PAPU_EN	 	; Disable square wave 1
	LDX #$0f	 	; 
	STX PAPU_EN	 	; Enable every channel

PRG028_A363:
	RTS		 ; Return

PlayerSnd_Pipe2:
	STY SndCur_Player	; Mark what Player sound we're playing
	LDA #$2f		
	STA SFX_Counter1	; SFX_Counter1 = $2F

PlayerSnd_PipeCont2:
	LDA SFX_Counter1	 
	LSR A		 ; 
	BCS PRG028_A382	 ; If SFX_Counter1 & 1, jump to PRG028_A382
	LSR A		 ; 
	BCS PRG028_A382	 ; If SFX_Counter1 & 2, jump to PRG028_A382
	AND #$02	 ; 
	BEQ PRG028_A382	 ; If !(SFX_Counter1 & 8), jump to PRG028_A382
	LDY #$91	 ; PAPU_RAMP1
	LDX #$9a	 ; PAPU_CTL1
	LDA #104	 ; Note 104
	JSR Sound_Sq1_NoteOn

PRG028_A382:
	JMP PlayerSnd_CounterUpd

	; the "1-up" sound
SndLev1_1upData:
	.byte $23, $2F, $35, $2A, $47, $54

	; the "power up" sound
SndLev1_PUpData:
	.byte $6A, $74, $6A, $64, $5C, $52, $5C, $52
	.byte $4C, $44, $66, $70, $66, $60, $58, $4E, $58, $4E, $48, $40, $56, $60, $56, $50
	.byte $48, $3E, $48, $3E, $38, $30, $30

SndLev1_PUpRiseData:
	.byte $7E, $3E, $40, $32, $7E, $40, $42, $34, $7E
	.byte $42, $44, $36, $7E, $44, $46, $38, $7E, $46, $48, $3A, $7E, $48, $4A, $3C, $7E
	.byte $4A, $4C, $3E, $7E, $4C, $4E

SndLev1_Coin2:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing
	LDA #$35	 ; SFX_Counter2 value
	LDX #$8d	 ; PAPU_CTL2
	BNE PRG028_A3D9	 ; (technically always) jump to PRG028_A3D9

SndLev1_Text2:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing
	LDA #$06	 ; SFX_Counter2 value
	LDX #$98	 ; PAPU_CTL2

PRG028_A3D9:
	STA SFX_Counter2
	LDY #$7f	 ; PAPU_RAMP2
	LDA #94		 ; Note 94
	JSR Sound_Sq2_NoteOn	 

SndLev1_Coin_Cont2:
	LDA SFX_Counter2
	CMP #$30	 
	BNE PRG028_A3EF	 ; If SFX_Counter2 <> $30, jump to PRG028_A3EF

	LDA #$54
	STA PAPU_FT2

PRG028_A3EF:
	BNE SndLev1_PUp_Cont2	 ; $A3EF 

SndLev1_Boom:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing
	LDA #$20	  
	STA SFX_Counter2	  
	LDY #$94	  
	LDA #$1c	  
	BNE PRG028_A40C	 ; (technically always) jump to PRG028_A40C

SndLev1_Boom_Cont2:
	LDA SFX_Counter2	  
	CMP #$18	  
	BNE SndLev1_PUp_Cont2	  
	LDY #$93	  
	LDA #$34	  
	LDX #$9f	  
PRG028_A40C:
	JMP PRG028_A425	  

SndLev1_PUp:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing
	LDA #$36	 
	STA SFX_Counter2	 ; SFX_Counter2 = $36

SndLev1_PUp_Cont:
	LDA SFX_Counter2
	LSR A		
	BCS SndLev1_PUp_Cont2	 ; If SFX_Counter2 & 1, jump to SndLev1_PUp_Cont2
	TAY		 ; Y = A
	LDA SndLev1_PUpData-1,Y	; As in other parts of sound code, -1 because SFX_Counter2 must be > 0
	LDX #$5d	 ; PAPU_CTL2
	LDY #$7f	 ; PAPU_RAMP2

PRG028_A425:
	JSR Sound_Sq2_NoteOn

SndLev1_PUp_Cont2:
	DEC SFX_Counter2
	BNE PRG028_A43C	 ; If SFX_Counter2 <> 0, jump to PRG028_A43C (RTS)

PRG028_A42D:

	; SndCur_Level1 = 0
	LDX #$00
	STX SndCur_Level1

	; Disable and re-enable square 2
	LDX #$0d
	STX PAPU_EN
	LDX #$0f
	STX PAPU_EN

PRG028_A43C:
	RTS		 ; Return

SndLev1_PUpRise:
	JMP SndLev1_PUpRise2

SndLev1_Coin:
	JMP SndLev1_Coin2

SndLev1_VineRise:
	JMP SndLev1_VineRise2

SndLev1_SuitLost:
	JMP SndLev1_SuitLost2

Sound_PlayLevel1:
	LDA SndCur_Level1
	AND #$40	 ; 
	BNE SndLev1_1upCont	 ; If currently playing level 1 sound is $40 1-up, jump to SndLev1_1up (overrides any new sounds!)

	LDY Sound_QLevel1
	BEQ PRG028_A47A	 ; If no Level 1 sound is queued, jump to PRG028_A47A

	BMI SndLev1_SuitLost	 ; If sound $80 (SND_LEVELPOOF) sound, jump to SndLev1_SuitLost

	; Since the input is a bit value ($01, $02, $04, ...), this will
	; decode it by continuously shifting to the right until we hit
	; a bit; this also incidentally provides a simple priority system.

	LSR Sound_QLevel1
	BCS SndLev1_Coin	 ; If sound $01 (SND_LEVELCOIN), jump to SndLev1_Coin
	LSR Sound_QLevel1
	BCS SndLev1_PUpRise	 ; If sound $02 (SND_LEVELRISE), jump to SndLev1_PUpRise
	LSR Sound_QLevel1
	BCS SndLev1_VineRise	 ; If sound $04 (SND_LEVELVINE), jump to SndLev1_VineRise
	LSR Sound_QLevel1
	BCS SndLev1_Boom	 ; If sound $08 (SND_LEVELBABOOM), jump to SndLev1_Boom
	LSR Sound_QLevel1
	BCS SndLev1_Text	 ; If sound $10 (SND_LEVELBLIP), jump to SndLev1_Text
	LSR Sound_QLevel1
	BCS SndLev1_PUp	 ; If sound $20 (SND_LEVELPOWER), jump to SndLev1_PUp
	LSR Sound_QLevel1
	BCS SndLev1_1up	 ; If sound $40 (SND_LEVEL1UP), jump to SndLev1_1up

PRG028_A47A:
	LDA SndCur_Level1
	BEQ PRG028_A496	 ; If no sound is playing, jump to PRG028_A496 (Do nothing)

	BMI SndLev1_SuitLost_Cont	 ; If sound (SND_LEVELPOOF) "lost suit" sound, jump to SndLev1_SuitLost_Cont
	LSR A		 
	BCS SndLev1_Coin_Cont	 ; If sound $01 (SND_LEVELCOIN), jump to SndLev1_Coin_Cont
	LSR A		
	BCS SndLev1_PUpRise_Cont	 ; If sound $02 (SND_LEVELRISE), jump to SndLev1_PUpRise_Cont
	LSR A		 
	BCS SndLev1_PUpRise_Cont	 ; If sound $04 (SND_LEVELVINE), jump to SndLev1_PUpRise_Cont
	LSR A		
	BCS SndLev1_Boom_Cont	 ; If sound $08 (SND_LEVELBABOOM), jump to SndLev1_Boom_Cont
	LSR A		
	BCS SndLev1_Text_Cont	 ; If sound $10 (SND_LEVELBLIP), jump to SndLev1_Text_Cont
	LSR A		 
	BCS SndLev1_PUp_Cont	 ; If sound $20 (SND_LEVELPOWER), jump to SndLev1_PUp_Cont
	LSR A		 
	BCS SndLev1_1upCont	 ; If sound $40 (SND_LEVEL1UP), jump to SndLev1_1upCont

PRG028_A496:
	RTS		 ; Return

SndLev1_SuitLost_Cont: 
	JMP SndLev1_SuitLost_Cont2

SndLev1_Text:
	JMP SndLev1_Text2

SndLev1_Coin_Cont:
SndLev1_Text_Cont:
	JMP SndLev1_Coin_Cont2

SndLev1_Boom_Cont:
	JMP SndLev1_Boom_Cont2

SndLev1_PUp_1up:
	JMP SndLev1_PUp_Cont2

SndLev1_1up:
	STY SndCur_Level1	 ; Store what level 1 sound we're playing
	LDA #$30
	STA SFX_Counter2	 ; SFX_Counter2 = $30

SndLev1_1upCont:
	LDA SFX_Counter2
	LDX #$03

PRG028_A4B3:	
	LSR A		 
	BCS SndLev1_PUp_1up	 ; If SFX_Counter2 & 1, jump to SndLev1_PUp_1up
	DEX		 ; X--
	BNE PRG028_A4B3	 ; If X > 0, loop

	TAY		 	; Y = A
	LDA SndLev1_1upData-1,Y	; As in other parts of sound code, -1 because SFX_Counter2 must be > 0
	STA PAPU_FT2	 	; Store this into PAPU_FT2

	LDX #$82	 	; PAPU_CTL2
	LDY #$7f	 	; PAPU_RAMP2
	JSR Sound2_XCTL_YRAMP	

	; PAPU_CT2 = 8
	LDA #$08
	STA PAPU_CT2

	JMP SndLev1_PUp_Cont2	 ; Jump to SndLev1_PUp_Cont2

SndLev1_PUpRise2:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing

	LDA #$10
	BNE PRG028_A4DB	 ; Jump (technically always) to PRG028_A4DB

SndLev1_VineRise2:
	STY SndCur_Level1	 ; Mark what "level 1" sound we're playing
	LDA #$20

PRG028_A4DB:
	STA SFX_Counter2	 ; Set SFX_Counter2

	LDA #$7f
	STA PAPU_RAMP2	 ;  [NES] Audio -> Square 2

	; SFX_Counter3 = 0
	LDA #$00
	STA SFX_Counter3

SndLev1_PUpRise_Cont:
	INC SFX_Counter3 ; SFX_Counter3++

	LDA SFX_Counter3
	LSR A	
	TAY		 ; Y = SFX_Counter3 >> 1
	CPY SFX_Counter2
	BEQ PRG028_A501	 ; If SFX_Counter3 / 2 = SFX_Counter2, jump to PRG028_A501 (PRG028_A42D)

	LDA #$9d
	STA PAPU_CTL2	 ;  [NES] Audio -> Square 2

	LDA SndLev1_PUpRiseData-1,Y	 ; As in other parts of sound code, -1 because SFX_Counter2 must be > 0
	JSR Sound_Sq2_NoteOn_NoPAPURAMP

	RTS		 ; Return

PRG028_A501:
	JMP PRG028_A42D	 ; Jump to PRG028_A42D

PRG028_A504:
	JMP PRG028_A47A	 ; Jump to PRG028_A47A

SndLev1_SuitLost2:
	LDY Sound_QLevel1
	CPY #SND_LEVELPOOF
	BNE PRG028_A512	 ; If this is not the "poof" sound, jump to PRG028_A512
 
	; "Poof" sound effect
	LDA #(SndLev1_DataPoof - SndLev1_Data)
	BNE PRG028_A529	 ; Jump (technically always) to PRG028_A529

PRG028_A512:
	CPY #SND_LEVELUNK
	BNE PRG028_A51A	 ; If not unknown / lost sound, jump to PRG028_A51A

	; Unknown / lost sound
	LDA #(SndLev1_DataUnk - SndLev1_Data)
	BEQ PRG028_A529	 ; Jump (technically always) to PRG028_A529

PRG028_A51A:
	CPY #SND_LEVELSHOE
	BNE PRG028_A522	 ; If not these sounds, jump to PRG028_A522

	; Lost shoe sound
	LDA #(SndLev1_DataLostShoe - SndLev1_Data)
	BNE PRG028_A529	 ; Jump (technically always) to PRG028_A529

PRG028_A522:
	LDA SndCur_Level1
	BNE PRG028_A504	 ; If any level 1 sounds are playing, jump to PRG028_A504

	; Tail wag
	LDA #(SndLev1_DataLongWag - SndLev1_Data)

PRG028_A529:
	STA SFX_Counter2	 ; Set SFX_Counter2 appropriately

	; Filter out sound selection
	TYA
	AND #(SND_LEVELPOOF | SND_LEVELTAILWAG | SND_LEVELSHOE)
	STY SndCur_Level1

SndLev1_SuitLost_Cont2:
	INC SFX_Counter2	 ; SFX_Counter2++

	LDY SFX_Counter2	 ; Y = SFX_Counter2

	LDA SndLev1_Data,Y	 ; Get data
	BEQ PRG028_A553	 ; If data = 0, jump to PRG028_A553
	BPL PRG028_A544	 ; If data > 0, jump to PRG028_A544

	; data < 0...

	; Store value -> SFX_Counter3
	STA SFX_Counter3
	BNE SndLev1_SuitLost_Cont2	 ; Jump (technically always) to SndLev1_SuitLost_Cont2

PRG028_A544:
	LDX #$7f
	STX PAPU_RAMP2	 ;  [NES] Audio -> Square 2

	LDX SFX_Counter3
	STX PAPU_CTL2	 ;  [NES] Audio -> Square 2

	JSR Sound_Sq2_NoteOn_NoPAPURAMP

	RTS		 ; Return

PRG028_A553:
	; SFX_Counter2 = 0
	LDA #$00
	STA SFX_Counter2

	JMP PRG028_A42D	 ; Jump to PRG028_A42D


SndLev1_Data:
SndLev1_DataUnk:
	.byte $9F, $30, $34, $36, $38, $9F, $3A, $3C, $3E, $40, $9A, $3A, $3C, $3E, $40, $9C ; $A55B - $A56A
	.byte $3A, $3C, $3E, $40, $96, $3A, $3C, $3E, $40, $98, $3A, $3C, $3E, $40, $00

SndLev1_DataPoof:
	.byte $9F
	.byte $2E, $2A, $26, $22, $9D, $2E, $2A, $7E, $7E, $9F, $30, $2E, $2A, $28, $9D, $30 ; $A57B - $A58A
	.byte $2E, $7E, $7E, $9F, $38, $34, $32, $30, $9D, $38, $34, $32, $30, $9A, $38, $34 ; $A58B - $A59A
	.byte $32, $30, $9C, $38, $34, $32, $30, $97, $38, $34, $32, $30, $98, $38, $34, $32 ; $A59B - $A5AA
	.byte $30, $94, $38, $34, $32, $30, $00

SndLev1_DataLostShoe:
	.byte $9F, $42, $40, $7E, $7E, $9F, $46, $48, $7E ; $A5AB - $A5BA
	.byte $7E, $9A, $4A, $4E, $50, $52, $96, $4E, $52, $54, $56, $00

SndLev1_DataLongWag:
	.byte $90, $7E, $7E, $97 ; $A5BB - $A5CA
	.byte $4C, $4E, $90, $7E, $7E, $95, $52, $54, $56, $58, $94, $52, $54, $56, $58, $93 ; $A5CB - $A5DA
	.byte $52, $54, $56, $58, $00


SndLev2_MarchData:
	.byte $55, $81, $AA, $02, $74, $B7, $A5, $04, $92, $A9, $08 ; $A5DB - $A5EA
	.byte $69, $58, $4A

SndLev2_BoomerangData:
	.byte $11, $61, $21, $51, $81, $21, $61, $A2, $23, $64, $A5, $76

SndLev2_SkidNFreq:
	.byte $01, $0E, $0E, $0D, $0B, $06, $0C, $0F, $0A, $09, $03, $0D, $08, $0D, $06

SndLev2_SkidTFreq:
	.byte $0C, $47, $49, $42, $4A, $43, $4B


SndLev2_Skid:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = 6
	LDA #$06
	STA SFX_Counter4

SndLev2_SkidCont:
	LDA SFX_Counter4
	TAY		 ; Y = SFX_Counter4

	LDA SndLev2_SkidTFreq,Y
	STA PAPU_TFREQ1	 ; [NES] Audio -> Triangle

	LDA #$18
	STA PAPU_TCR1	 ; [NES] Audio -> Triangle
	STA PAPU_TFREQ2	 ; [NES] Audio -> Triangle
	BNE PRG028_A64C	 ; Jump (technically always) to PRG028_A64C

SndLev2_Crumble:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $20
	LDA #$20
	STA SFX_Counter4

SndLev2_CrumbleCont:
	LDA SFX_Counter4
	LSR A	
	BCC PRG028_A64C	 ; Every other tick, jump to PRG028_A64C

	TAY		 ; SFX_Counter4 / 2 -> 'Y'
	LDX SndLev2_SkidNFreq,Y	 ; Get noise frequency
	LDA SndLev2_SkidNCtl,Y	 ; Get noise CTL value

PRG028_A641:

	; Set both
	STA PAPU_NCTL1
	STX PAPU_NFREQ1

	LDA #$18
	STA PAPU_NFREQ2	 ; [NES] Audio -> Noise Frequency reg #2

PRG028_A64C:
	DEC SFX_Counter4 ; SFX_Counter4--
	BNE PRG028_A660	 ; If SFX_Counter4 <> 0, jump to PRG028_A660 (RTS)

	LDA #$f0
	STA PAPU_NCTL1	 ; [NES] Audio -> Noise control reg
	LDA #$00
	STA PAPU_TCR1	 ; [NES] Audio -> Triangle

	; SndCur_Level2 = 0
	LDA #$00
	STA SndCur_Level2

PRG028_A660:
	RTS		 ; Return

Sound_PlayLevel2: 
	LDA SndCur_Level2
	CMP #SND_LEVELAIRSHIP
	BNE PRG028_A66B	 ; If this is not the airship sound, jump to PRG028_A66B

	JMP SndLev2_AirshipCont	 ; Jump to SndLev2_AirshipCont

PRG028_A66B:

	; This is here because sounds $20 and $40 are undefined;
	; if they were to be defined, this could sit down below...
	LDA SndCur_Level2
	BMI SndLev2_SkidCont	 ; If sound $80 (SND_LEVELSKID) is currently playing, jump to SndLev2_SkidCont (overrides queue)

	LDY Sound_QLevel2
	BEQ PRG028_A690	 ; If no level 2 sound is queued, jump to PRG028_A690

	BMI SndLev2_Skid	 ; If sound $80 (SND_LEVELSKID), jump to SndLev2_Skid

	; Since the input is a bit value ($01, $02, $04, ...), this will
	; decode it by continuously shifting to the right until we hit
	; a bit; this also incidentally provides a simple priority system.

	LSR Sound_QLevel2
	BCS SndLev2_Crumble	 ; If sound $01 (SND_LEVELCRUMBLE), jump to SndLev2_Crumble
	LSR Sound_QLevel2
	BCS SndLev2_Flame	 ; If sound $02 (SND_LEVELFLAME), jump to SndLev2_Flame
	LSR Sound_QLevel2
	BCS SndLev2_Boomerang	 ; If sound $04 (SND_BOOMERANG), jump to SndLev2_Boomerang
	LSR Sound_QLevel2
	BCS SndLev2_Airship	 ; If sound $08 (SND_LEVELAIRSHIP), jump to SndLev2_Airship
	LSR Sound_QLevel2
	BCS SndLev2_March	 ; If sound $10 (SND_LEVELMARCH), jump to SndLev2_March
	LSR Sound_QLevel2
	BCS SndLev2_SandFill	; If sound $20 (SND_LEVELSANDFILL), jump to SndLev2_SandFill

	; NOTE: Level 2 set sound $40 are undefined!


PRG028_A690:

	; No sound is queued...

	LDA SndCur_Level2
	BEQ PRG028_A6A4	 ; If no sound is playing, jump to PRG028_A6A4 (RTS)
	LSR A
	BCS SndLev2_CrumbleCont	 ; If sound $01 (SND_LEVELCRUMBLE), jump to SndLev2_CrumbleCont
	LSR A
	BCS SndLev2_FlameCont	 ; If sound $02 (SND_LEVELFLAME), jump to SndLev2_FlameCont
	LSR A
	BCS SndLev2_BoomerangCont	 ; If sound $04 (SND_BOOMERANG), jump to SndLev2_BoomerangCont
	LSR A
	BCS SndLev2_AirshipCont	 ; If sound $08 (SND_LEVELAIRSHIP), jump to SndLev2_AirshipCont
	LSR A
	BCS SndLev2_MarchCont	 ; If sound $10 (SND_LEVELMARCH), jump to SndLev2_MarchCont
	LSR A
	BCS SndLev2_SandFillCont	; If sound $20 (SND_LEVELSANDFILL), jump to SndLev2_SandFillCont

PRG028_A6A4:
	RTS		 ; Return

SndLev2_Flame:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $40
	LDA #$40
	STA SFX_Counter4

SndLev2_FlameCont:
	LDA SFX_Counter4
	LSR A
	TAY		 ; Y = SFX_Counter4 / 2

	LDX #$0f	 ; X = $F
	LDA PRG028_A709-1,Y

PRG028_A6B7:
	BNE PRG028_A641	 ; If data <> 0, jump to PRG028_A641

SndLev2_March:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $E
	LDA #$0e
	STA SFX_Counter4

SndLev2_MarchCont:
	LDA SFX_Counter4
	TAY		 ; Y = SFX_Counter4

	; Lower 4 bits OR'd with $10 -> 'X'
	LDA SndLev2_MarchData,Y
	AND #$0f
	ORA #$10
	TAX

	; Upper 4 bits shifted down, OR'd with $10
	LDA SndLev2_MarchData,Y
	LSR A
	LSR A
	LSR A
	LSR A
	ORA #$10

PRG028_A6D6:
	BNE PRG028_A6B7	 ; Jump (technically always) to PRG028_A6B7

SndLev2_Boomerang:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $C
	LDA #$0c
	STA SFX_Counter4

SndLev2_BoomerangCont:
	LDA SFX_Counter4
	TAY		 ; Y = SFX_Counter4

	; Lower 4 bits OR'd with $10 -> 'X'
	LDA SndLev2_BoomerangData,Y
	AND #$0f
	ORA #$10
	TAX

	; Upper 4 bits shifted down, OR'd with $10
	LDA SndLev2_BoomerangData,Y
	LSR A
	LSR A
	LSR A
	LSR A
	ORA #$10

PRG028_A6F5:
	BNE PRG028_A6D6	 ; Jump (technically always) to PRG028_A6D6

SndLev2_Airship:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $40
	LDA #$40
	STA SFX_Counter4

SndLev2_AirshipCont:
	LDA SFX_Counter4
	LSR A
	LSR A
	TAX		 ; X = SFX_Counter4 >> 2

	ORA #$10	 ; Value OR'd with $10
	BNE PRG028_A6F5	 ; Jump (technically always) to PRG028_A6F5

SndLev2_SandFill:
	STY SndCur_Level2	 ; Mark what "level 2" sound we're playing

	; SFX_Counter4 = $E
	LDA #$0e
	STA SFX_Counter4

SndLev2_SandFillCont:
	; Lower 4 bits OR'd with $10 -> 'X'
	LDX #$15

	; Upper 4 bits shifted down, OR'd with $10
	LDA #$15

	BNE PRG028_A6B7	 ; Jump (technically always) to PRG028_A6B7


PRG028_A709:
	.byte $15, $16, $16, $17, $17, $18, $19, $19, $1A, $1A, $1C, $1D, $1D, $1E, $1E, $1F ; $A709 - $A718
	.byte $1F, $1F, $1F, $1E, $1D, $1C, $1E, $1F, $1F, $1E, $1D, $1C, $1A, $18, $16, $14 ; $A719 - $A728

SndLev2_SkidNCtl:
	.byte $15, $16, $16, $17, $17, $18, $19, $19, $1A, $1A, $1C, $1D, $1D, $1E, $1E, $1F ; SndLev2_SkidNCtl - $A738
	.byte $A5, $8B, $C9, $03, $F0, $10, $C0



MXXSegData00:
	.byte $82, $30, $82, $7E, $8E, $7E, $8D, $36, $8D, $7E, $8E, $7E, $8D, $36, $80, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E, $82, $36, $82, $7E
	.byte $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $32, $82, $7E, $8E, $7E, $82, $2E
	.byte $82, $7E, $8E, $7E, $00, $CC, $30, $8C, $7E, $8C, $30, $8C, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $85, $02, $85, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84
	.byte $7E, $8E, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData01:
	.byte $8D, $30, $8D, $7E, $8E, $7E, $8D, $34, $80, $7E, $82, $36, $82, $7E, $8E, $7E
	.byte $82, $36, $82, $7E, $8E, $7E, $8D, $34, $8D, $7E, $8E, $7E, $8D, $3A, $80, $7E
	.byte $82, $36, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $8D, $34, $8D, $7E
	.byte $8E, $7E, $8D, $30, $80, $7E, $8D, $2C, $8D, $7E, $8E, $7E, $8D, $2A, $80, $7E
	.byte $00, $CC, $30, $8C, $7E, $8B, $36, $8B, $34, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D
	.byte $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData02:
	.byte $82, $28, $82, $7E, $8E, $7E, $82, $36, $82, $36, $8E, $7E, $85, $34, $82, $3A
	.byte $82, $7E, $8E, $7E, $82, $36, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $82, $2C, $82, $7E, $8E, $7E, $00, $C5, $30, $C2
	.byte $36, $C2, $36, $CE, $7E, $C5, $34, $C5, $3A, $C5, $36, $C5, $3E, $CA, $3A, $8B
	.byte $3A, $8B, $3E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $FF, $02, $8C, $7E, $8C
	.byte $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $84
	.byte $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData03:
	.byte $82, $36, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $34, $82, $7E
	.byte $8E, $7E, $82, $2C, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $28
	.byte $82, $7E, $8E, $7E, $82, $36, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E
	.byte $00, $C5, $7E, $C2, $36, $C2, $3A, $CE, $7E, $C5, $3E, $C2, $3A, $C2, $36, $CE
	.byte $7E, $C5, $3A, $C5, $34, $C2, $3A, $C2, $36, $CE, $7E, $C2, $3A, $C2, $44, $8C
	.byte $7E, $8B, $40, $8B, $3A, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D
	.byte $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF
	.byte $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C
	.byte $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData04:
	.byte $85, $30, $82, $40, $82, $3E, $8E, $7E, $82, $3A, $82, $36, $8E, $7E, $82, $3A
	.byte $82, $34, $8E, $7E, $82, $36, $82, $34, $8E, $7E, $82, $30, $82, $28, $8E, $7E
	.byte $85, $26, $85, $2E, $00, $C9, $3E, $CA, $48, $C0, $7E, $C2, $46, $C2, $48, $CE
	.byte $7E, $C2, $4C, $C2, $48, $CE, $7E, $C2, $4C, $C2, $48, $8C, $7E, $8B, $3E, $8B
	.byte $34, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $85, $02, $85, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $84
	.byte $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData05:
	.byte $85, $36, $82, $3E, $82, $3E, $8E, $7E, $85, $3A, $85, $40, $82, $3E, $82, $7E
	.byte $8E, $7E, $82, $40, $8D, $3E, $8E, $7E, $8D, $3A, $8E, $7E, $85, $36, $85, $2E
	.byte $00, $C2, $46, $C2, $40, $CE, $7E, $C2, $3E, $C2, $3A, $CE, $7E, $CB, $36, $C9
	.byte $2E, $8B, $36, $8B, $2E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF
	.byte $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $8C, $7E

MXXSegData06:
	.byte $82, $30, $82, $7E, $8E, $7E, $8D, $36, $8D, $7E, $8E, $7E, $8D, $36, $80, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E, $82, $36, $82, $7E
	.byte $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $85, $34, $82, $2E, $82, $7E, $8E, $7E
	.byte $00, $C5, $30, $C2, $3E, $C2, $3E, $CE, $7E, $C5, $3A, $C5, $40, $C5, $3E, $C5
	.byte $36, $CA, $3A, $8B, $30, $8B, $3A, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $FF
	.byte $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $80, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C
	.byte $7E

MXXSegData07:
	.byte $82, $36, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $34, $82, $7E
	.byte $8E, $7E, $82, $2C, $82, $7E, $8E, $7E, $82, $36, $82, $34, $8E, $7E, $82, $30
	.byte $82, $2C, $8E, $7E, $85, $28, $85, $26, $00, $C5, $7E, $C9, $34, $C9, $30, $CA
	.byte $2C, $8C, $7E, $8C, $3E, $8C, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8F, $7E, $8D, $02, $80
	.byte $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData08:
	.byte $82, $30, $82, $7E, $8E, $7E, $8D, $3E, $8D, $7E, $8E, $7E, $8D, $3E, $80, $7E
	.byte $82, $3A, $82, $7E, $8E, $7E, $82, $40, $82, $7E, $8E, $7E, $82, $3E, $82, $7E
	.byte $8E, $7E, $82, $36, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E, $82, $2C
	.byte $82, $7E, $8E, $7E, $00, $CC, $26, $8C, $7E, $8C, $30, $8C, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $85, $02, $85, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C
	.byte $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84
	.byte $7E, $8E, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData09:
	.byte $82, $36, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $34, $82, $7E
	.byte $8E, $7E, $82, $2C, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $28
	.byte $82, $7E, $8E, $7E, $82, $2C, $82, $7E, $8E, $7E, $82, $26, $82, $7E, $8E, $7E
	.byte $00, $C5, $30, $C2, $36, $C2, $36, $CE, $7E, $C5, $34, $C5, $3A, $C5, $36, $C5
	.byte $30, $C5, $34, $C5, $2C, $8B, $3A, $8C, $3E, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $85, $02, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D
	.byte $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData0A:
	.byte $82, $30, $82, $7E, $8E, $7E, $8D, $3E, $8D, $7E, $8E, $7E, $8D, $3E, $80, $7E
	.byte $82, $3A, $82, $7E, $8E, $7E, $82, $40, $82, $7E, $8E, $7E, $82, $3E, $82, $7E
	.byte $8E, $7E, $82, $36, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E, $82, $2C
	.byte $82, $7E, $8E, $7E, $00, $C2, $30, $C2, $34, $CE, $7E, $C5, $36, $C5, $36, $C2
	.byte $34, $C2, $3A, $CE, $7E, $C5, $36, $C5, $30, $C2, $34, $C2, $30, $CE, $7E, $C2
	.byte $2C, $C2, $2A, $8C, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF
	.byte $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $8C, $7E

MXXSegData0B:
	.byte $82, $30, $82, $7E, $8E, $7E, $8D, $3E, $8D, $7E, $8E, $7E, $8D, $3E, $80, $7E
	.byte $82, $3A, $82, $7E, $8E, $7E, $82, $40, $82, $7E, $8E, $7E, $82, $3E, $82, $7E
	.byte $8E, $7E, $82, $36, $82, $7E, $8E, $7E, $82, $3A, $82, $7E, $8E, $7E, $82, $2C
	.byte $82, $7E, $8E, $7E, $00, $C5, $30, $C2, $36, $C2, $36, $CE, $7E, $C5, $34, $C5
	.byte $3A, $C5, $36, $C5, $3E, $C5, $3A, $C5, $44, $8C, $40, $8C, $7E, $8D, $02, $84
	.byte $7E, $8E, $7E, $8E, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D
	.byte $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData0C:
	.byte $8D, $18, $8D, $1E, $8E, $7E, $8D, $26, $8E, $7E, $8D, $2C, $8E, $7E, $8D, $30
	.byte $8D, $36, $8E, $7E, $8D, $3E, $8E, $7E, $8D, $44, $8E, $7E, $8D, $48, $8D, $44
	.byte $8E, $7E, $8D, $3E, $8E, $7E, $8D, $36, $8E, $7E, $8D, $30, $8D, $2C, $8E, $7E
	.byte $8D, $26, $8E, $7E, $8D, $1E, $8E, $7E, $8B, $18, $00, $CC, $48, $8C, $7E, $8D
	.byte $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C
	.byte $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $8C, $7E

MXXSegData0D:
	.byte $8C, $7E, $8A, $7E, $00, $A9, $46, $A9, $4E, $A9, $46, $A9, $36, $8B, $40, $8B
	.byte $36, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData0E:
	.byte $8C, $7E, $8A, $7E, $00, $A9, $40, $A9, $46, $A9, $4A, $A9, $4E, $8B, $28, $89
	.byte $2E, $89, $36, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData0F:
	.byte $C5, $32, $C2, $38, $C2, $38, $CE, $7E, $C5, $36, $C5, $3C, $C5, $38, $C5, $32
	.byte $C5, $36, $C5, $30, $00, $A9, $4A, $AA, $50, $A0, $7E, $A2, $5E, $A2, $5E, $AE
	.byte $7E, $A9, $58, $8B, $38, $8B, $32, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C
	.byte $7E

MXXSegData10:
	.byte $C2, $32, $C2, $38, $CE, $7E, $C2, $3C, $C2, $40, $CE, $7E, $C2, $32, $C2, $38
	.byte $CE, $7E, $C2, $3C, $C2, $40, $CE, $7E, $C5, $44, $C5, $40, $C9, $3E, $00, $8C
	.byte $7E, $8C, $7E, $8B, $28, $89, $24, $89, $2C, $85, $02, $8C, $7E, $84, $7E, $82
	.byte $02, $8C, $7E

MXXSegData11:
	.byte $99, $10, $99, $06, $99, $08, $99, $06, $00, $95, $30, $92, $36, $92, $36, $9E
	.byte $7E, $95, $38, $95, $32, $95, $36, $92, $40, $92, $40, $9E, $7E, $95, $3C, $95
	.byte $44, $8C, $28, $8C, $7E, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData12:
	.byte $9B, $0C, $9B, $12, $00, $95, $46, $95, $50, $90, $4E, $90, $50, $90, $4E, $92
	.byte $4A, $92, $46, $9E, $7E, $95, $4E, $95, $46, $95, $42, $95, $46, $8B, $3C, $8B
	.byte $2E, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData13:
	.byte $95, $40, $95, $58, $95, $36, $95, $50, $95, $40, $95, $50, $95, $36, $95, $50
	.byte $00, $95, $54, $92, $50, $92, $50, $9E, $7E, $95, $4E, $95, $50, $95, $4E, $92
	.byte $46, $92, $46, $9E, $7E, $95, $44, $95, $46, $8B, $38, $8B, $32, $85, $02, $8C
	.byte $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData14:
	.byte $95, $40, $95, $58, $95, $36, $95, $50, $95, $40, $95, $50, $95, $36, $95, $3A
	.byte $00, $95, $4A, $95, $44, $95, $46, $95, $40, $95, $44, $95, $3E, $95, $40, $95
	.byte $3A, $8C, $36, $8C, $7E, $85, $02, $8C, $7E, $84, $7E, $82, $02, $8C, $7E

MXXSegData15:
	.byte $82, $2E, $82, $7E, $8E, $7E, $8D, $34, $8D, $7E, $8E, $7E, $8D, $34, $80, $7E
	.byte $82, $32, $82, $7E, $8E, $7E, $82, $38, $82, $7E, $8E, $7E, $82, $34, $82, $7E
	.byte $8E, $7E, $82, $2E, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $2C
	.byte $82, $7E, $8E, $7E, $00, $FF, $24, $CC, $7E, $CC, $7E, $CC, $7E, $C5, $7E, $FF
	.byte $2E, $CC, $7E, $CC, $7E, $CC, $7E, $C5, $7E, $FF, $34, $CC, $7E, $CC, $7E, $CC
	.byte $7E, $C5, $7E, $CC, $46, $8C, $7E, $8C, $2E, $8C, $7E, $FF, $02, $8C, $7E, $8C
	.byte $7E, $8C, $7E, $85, $7E, $85, $02, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C
	.byte $7E, $8C, $7E, $85, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData16:
	.byte $8D, $2E, $8D, $7E, $8E, $7E, $8D, $32, $80, $7E, $82, $34, $82, $7E, $8E, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $8D, $32, $8D, $7E, $8E, $7E, $8D, $38, $80, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $82, $2E, $82, $7E, $8E, $7E, $8D, $32, $8D, $7E
	.byte $8E, $7E, $8D, $30, $80, $7E, $82, $2E, $82, $2C, $8E, $7E, $00, $8C, $7E, $8C
	.byte $7E, $8C, $2E, $8C, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $85
	.byte $02, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $8C, $7E

MXXSegData17:
	.byte $82, $2E, $82, $7E, $8E, $7E, $8D, $34, $8D, $7E, $8E, $7E, $8D, $34, $80, $7E
	.byte $82, $32, $82, $7E, $8E, $7E, $82, $38, $82, $7E, $8E, $7E, $82, $34, $82, $7E
	.byte $8E, $7E, $82, $2E, $82, $7E, $8E, $7E, $82, $30, $82, $7E, $8E, $7E, $82, $2C
	.byte $82, $7E, $8E, $7E, $00, $C2, $2E, $C2, $7E, $CE, $7E, $CD, $34, $CD, $7E, $CE
	.byte $7E, $CD, $34, $C0, $7E, $C2, $32, $C2, $7E, $CE, $7E, $C2, $38, $C2, $7E, $CE
	.byte $7E, $C2, $34, $C2, $7E, $CE, $7E, $C2, $2E, $C2, $7E, $CE, $7E, $C2, $30, $C2
	.byte $7E, $CE, $7E, $C2, $2C, $8C, $7E, $8C, $2E, $8C, $7E, $FF, $02, $8C, $7E, $8C
	.byte $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D
	.byte $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8F, $7E, $8D, $02, $80, $7E, $FF
	.byte $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D
	.byte $02, $8D, $7E, $8E, $7E, $8D, $02, $8C, $7E

MXXSegData18:
	.byte $8D, $2E, $8D, $7E, $8E, $7E, $8D, $32, $80, $7E, $82, $34, $82, $7E, $8E, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $8D, $32, $8D, $7E, $8E, $7E, $8D, $38, $80, $7E
	.byte $82, $34, $82, $7E, $8E, $7E, $82, $2E, $82, $7E, $8E, $7E, $8D, $32, $8D, $7E
	.byte $8E, $7E, $8D, $30, $80, $7E, $82, $2E, $82, $2C, $8E, $7E, $00, $CD, $2E, $CD
	.byte $7E, $CE, $7E, $CD, $32, $C0, $7E, $C2, $34, $C2, $7E, $CE, $7E, $C2, $34, $C2
	.byte $7E, $CE, $7E, $CD, $32, $CD, $7E, $CE, $7E, $CD, $38, $C0, $7E, $C2, $34, $C2
	.byte $7E, $CE, $7E, $C2, $2E, $C2, $7E, $CE, $7E, $C2, $28, $C2, $2A, $CE, $7E, $C2
	.byte $2C, $C2, $2E, $8C, $7E, $8C, $2E, $8C, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E
	.byte $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E
	.byte $7E, $8D, $02, $80, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D, $02, $84, $7E, $8E
	.byte $7E, $8E, $7E, $FF, $02, $8C, $7E, $8C, $7E, $8C, $7E, $85, $7E, $8D, $02, $80
	.byte $7E, $8D, $02, $84, $7E, $8E, $7E, $8E, $7E, $8D, $02, $8D, $7E, $8E, $7E, $8D
	.byte $02, $8C, $7E

