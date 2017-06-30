
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SpecialObjs_UpdateAndDraw
;
; Updates Special Objects and they draw as they will
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; SB: New -- option flags for special objects

; Definition of "Priority special object": 
; Special objects with important gameplay functions; uses a wide horizontal-off 
; check (+/- $120 pixels), respawn logic, and low priority checking; requires 
; SpecialObj Var3 as X Hi
SOBJFLAG_NOAUTODELV		=	%00000001	; Do not implicitly delete for going vertically off-screen (will set SpecialObj_VisFlags bit 7)
SOBJFLAG_NOAUTODELH	=	%00000010	; Do not implicity delete for going horizontally off-screen (will set SpecialObj_VisFlags bit 6); requires SpecialObj Var3 as X Hi
SOBJFLAG_PRIOSPECOBJ	=	%00000100	; "Priority special object", see definition above; note this overrides both SOBJFLAG_NOAUTODELV and SOBJFLAG_NOAUTODELH

SpecialObj_Flags:
	.byte SOBJFLAG_NOAUTODELV		; SOBJ_HAMMER
	.byte 0		; SOBJ_BOOMERANG
	.byte SOBJFLAG_NOAUTODELV | SOBJFLAG_NOAUTODELH | SOBJFLAG_PRIOSPECOBJ		; SOBJ_ALTLEVELMOD
	.byte 0		; SOBJ_NIPPERFIREBALL
	.byte 0		; SOBJ_PIRANHAFIREBALL
	.byte SOBJFLAG_NOAUTODELV		; SOBJ_MICROGOOMBA
	.byte SOBJFLAG_NOAUTODELV		; SOBJ_SPIKEBALL
	.byte 0		; SOBJ_WANDBLAST
	.byte 0		; SOBJ_KURIBOSHOE
	.byte 0		; SOBJ_WRENCH
	.byte 0		; SOBJ_CANNONBALL
	.byte 0		; SOBJ_FIREBROFIREBALL
	.byte 0		; SOBJ_EXPLOSIONSTAR
	.byte SOBJFLAG_NOAUTODELV		; SOBJ_BUBBLE
	.byte 0		; SOBJ_LAVALOTUSFIRE
	.byte SOBJFLAG_NOAUTODELV | SOBJFLAG_NOAUTODELH | SOBJFLAG_PRIOSPECOBJ		; SOBJ_FENCECTL
	.byte 0		; SOBJ_POPPEDOUTCOIN
	.byte 0		; SOBJ_FIRECHOMPFIRE
	.byte SOBJFLAG_NOAUTODELV		; SOBJ_BRICKDEBRIS
	.byte 0		; SOBJ_BLOOPERKID
	.byte 0		; SOBJ_LASER
	.byte 0		; SOBJ_POOF
	.byte SOBJFLAG_NOAUTODELV | SOBJFLAG_NOAUTODELH | SOBJFLAG_PRIOSPECOBJ		; SOBJ_TOUCHWARP
	.byte SOBJFLAG_NOAUTODELV | SOBJFLAG_NOAUTODELH		; SOBJ_POKEYBODY
	.byte 0		; SOBJ_ALBABOMB

SpecialObjs_UpdateAndDraw:

	; No Microgoomba stuck to Player until we say so...
	LDA #$00	 
	STA Player_Microgoomba

	LDX #$07	 ; X = 7
PRG043_AF1B:
	STX <SlotIndexBackup ; Store current checked index -> SlotIndexBackup

	JSR SpecialObj_UpdateAndDraw	 ; Does the update and draw routines of Special OBjects

	DEX		 ; X--
	BPL PRG043_AF1B	 ; While X >= 0, loop!

SObj_DoNothing:
PRG043_AF23:
	RTS		 ; Return

SpecialObj_UpdateAndDraw:
	LDA SpecialObj_ID,X	 
	BEQ PRG043_AF23	 ; If this special object slot is not in use, jump to PRG043_AF23 (RTS)

	LDA AScrlURDiag_WrapState_Copy
	BEQ PRG043_AF4B	 ; If diagonal scroller is not wrapping, jump to PRG043_AF4B

	LDA <Player_HaltGame
	BNE PRG043_AF4B	 ; If gameplay is halted, jump to PRG043_AF4B

	; Offset special object to compensate for the diagonal autoscroller's wrap
	LDA SpecialObj_XLo,X
	ADD AScrlURDiag_OffsetX
	STA SpecialObj_XLo,X
	LDA SpecialObj_YLo,X
	ADD AScrlURDiag_OffsetY
	STA SpecialObj_YLo,X

	BCC PRG043_AF4B	 ; If no carry, jump to PRG043_AF4B
	INC SpecialObj_YHi,X	 ; Apply carry
PRG043_AF4B:

	LDY <Player_HaltGame
	BNE PRG043_AF57	 ; If gameplay halted, jump to PRG043_AF57

	LDY SpecialObj_Timer,X
	BEQ PRG043_AF57	 ; If SpecialObj_Timer = 0, jump to PRG043_AF57
	DEC SpecialObj_Timer,X	 ; SpecialObj_Timer--
PRG043_AF57:

	; Clear SpecialObj_VisFlags,X
	LDA #0
	STA SpecialObj_VisFlags,X

	; Special priority objects have alternate off-screen checking
	LDY SpecialObj_ID,X
	LDA SpecialObj_Flags-1,Y	; -1 since 0 = empty object...
	AND #SOBJFLAG_PRIOSPECOBJ
	BNE SObj_PrioSpecObj_OffChk	; If object should use the priority special object checks, jump to SObj_PrioSpecObj_OffChk


	; Non-priority special object here...
	
	LDA SpecialObj_Flags-1,Y	; -1 since 0 = empty object...
	AND #SOBJFLAG_NOAUTODELH
	BNE SObj_NoAutoHDel_Chk	; If object uses the "wide", no-auto-delete check, jump to SObj_StandardAutoHDel_Chk
	
	LDA SpecialObj_XLo,X
	SUB <Horz_Scroll
	CMP #248
	BGE SpecialObj_RemoveInd 	; If special object X >= 248, jump to SpecialObj_RemoveInd (remove special object)
	BLT SObj_VertCheck			; Otherwise, jump (technically always) to SObj_VertCheck

SObj_NoAutoHDel_Chk:
	
	; Perform wide checks; sets SpecialObj_VisFlags appropriately
	JSR SObj_DetermineHorzVis
	
SObj_VertCheck:
	LDA SpecialObj_YLo,X
	ADD #16
	PHA		 ; Save Special object Y + 16

	LDA SpecialObj_YHi,X
	ADC #$00	 ; Apply carry
	STA <Temp_Var1	 ; -> Temp_Var1

	PLA		 ; Restore special object Y + 16

	CMP Level_VertScroll

	LDA <Temp_Var1
	SBC Level_VertScrollH
	STA <Temp_Var14	; Temp_Var14 = 0 if special object is on same screen...

	BEQ PRG043_AF9E	 ; If Temp_Var14 = 0 (special object on same screen), jump to PRG043_AF9E

	; A few select special objects can deal with existing on a different screen,
	; otherwise the object will be deleted immediately
	LDY SpecialObj_ID,X
	LDA SpecialObj_Flags-1,Y	; -1 since 0 = empty object...
	AND #SOBJFLAG_NOAUTODELV
	BEQ SpecialObj_RemoveInd	; If object does not need to persist when it goes vertically off-screen, jump to SpecialObj_RemoveInd (remove it!)

	; Set SpecialObj_VisFlags bit 0
	LDA SpecialObj_VisFlags,X
	ORA #%00000001
	STA SpecialObj_VisFlags,X

	LDA <Temp_Var14
	BMI PRG043_AF9E	 ; If this select special object is above, keep it alive, jump to PRG043_AF9E

	; Special objects that fall off the bottom are deleted regardless...
SpecialObj_RemoveInd:
	JMP SpecialObj_Remove	 ; Jump to SpecialObj_Remove

SObj_PrioSpecObj_OffChk:

	; SB: In vertical levels, we'll actually not bother removing Priority Special Objects
	LDA Level_7Vertical
	BNE PRG043_AF9E

	; SB: Priority Special Objects actually have an "X Hi" component because it needs to span the screen
	; This is stored in Var3, so we need to do an alternate "still on-screen" check

	; Semi-randomly jump to PRG043_AF9E (continue with Special Obj processing)
	; That is, only occasionally actually do the off-screen check
	; Keeps down on CPU cycles spent wondering about the object
	TXA		 
	ADD <Counter_1	
	LSR A		 ; A = (object index + Counter_1) >> 1
	BCS PRG043_AF9E	 ; If carry set, jump to PRG043_AF9E

	AND #$01
	STA <Temp_Var2	 ; Temp_Var2 stores bit 0 from above; thus 0 or 1

	; Call special delete routine
	JSR PrioSpecObj_OffScreenChk

	; If negative flag is NOT set, we should NOT delete
	; If negative flag is set, we should delete
	BPL PRG043_AF9E

	; Otherwise, need to flag it so it can spawn again!
	LDY SpecialObj_Var1,X		; Get Var1 value (index into Level_ObjectsSpawned)
	LDA Level_ObjectsSpawned,Y
	AND #~$80	
	STA Level_ObjectsSpawned,Y	; Mark object as not spawned

	JMP SpecialObj_Remove	 ; Jump to SpecialObj_Remove

	; Continue here
	
PRG043_AF9E:	
	LDA SpecialObj_ID,X

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word SObj_DoNothing	; 00: EMPTY / NOT USED (should never get here anyway)
	.word SObj_Hammer	; 01: Hammer Bro hammer
	.word SObj_Boomerang	; 02: Boomerangs
	.word SObj_AltLvlMod	; 03: Alternate level modifier special object (SB)
	.word SObj_Fireball	; 04: Nipper fireball
	.word SObj_Fireball	; 05: Piranha fireball
	.word SObj_Microgoomba	; 06: Micro goombas
	.word SObj_Spikeball	; 07: Spike/Patooie's spike ball
	.word SObj_WandBlast	; 08: Koopaling wand blast
	.word SObj_KuriboShoe	; 09: Lost Kuribo shoe
	.word SObj_Wrench	; 0A: Rocky's Wrench
	.word SObj_Cannonball	; 0B: Cannonball
	.word SObj_Fireball	; 0C: Fire bro bouncing fireball
	.word SObj_ExplodeStar	; 0D: Explosion star
	.word SObj_Bubble	; 0E: Bubble
	.word SObj_LavaLotusFire; 0F: Lava Lotus fire
	.word SObj_FenceCtl		; 10: Rotating fence controller
	.word SObj_CoinOrDebris	; 11: Popped out coin
	.word SObj_Fireball	; 12: Fire Chomp's fire
	.word SObj_CoinOrDebris	; 13: Brick debris (e.g. from Piledriver Microgoomba)
	.word SObj_BlooperKid	; 14: Blooper kid
	.word SObj_Laser	; 15: Laser
	.word SObj_Poof		; 16: Poof
	.word SObj_TouchWarp	; 17: Touch Warp object (SB)
	.word SObj_PokeyBody	; 18: Pokey Body segment
	.word SObj_Albabomb	; 19: Albatoss bomb!

PUpCoin_Patterns:	.byte $49, $4F, $49, $4F	; SB: Formerly $49, $4F, $4D, $4F
PUpCoin_Attributes:	.byte SPR_PAL3, SPR_PAL3 | SPR_HFLIP, SPR_PAL3, SPR_PAL3

SObj_Laser:

	; Load patterns for laser
	LDA #$12
	STA PatTable_BankSel+4

	JSR Laser_PrepSpritesAndHit	 ; Prepare the laser sprites and hurt Player

	LDA <Player_HaltGame
	BNE PRG043_B01F	 ; If gameplay is halted, jump to PRG043_B01F (RTS)

	; Y += 8
	LDA SpecialObj_YLo,X
	ADD #$08
	STA SpecialObj_YLo,X

	; X += 8
	LDA SpecialObj_XLo,X
	SUB #$08
	STA SpecialObj_XLo,X

	JSR SObj_CheckHitSolid
	BCC PRG043_B01F	 ; If laser didn't hit solid, jump to PRG043_B01F (RTS)

	; Laser hit floor!

	; Align Y
	LDA SpecialObj_YLo,X
	AND #$f0
	ADD #$05
	STA SpecialObj_YLo,X

	; Align X
	LDA SpecialObj_XLo,X
	AND #$f0
	ADC #$0b
	STA SpecialObj_XLo,X

	JSR SpecialObj_Remove	 ; Remove laser

	; Generate puff via "brick bust" puff (atypical, but whatever)
	LDY #$01	 ; Y = 1
PRG043_B017:
	LDA BrickBust_En,Y
	BEQ PRG043_B020	 ; If this brick bust slot is free, jump to PRG043_B020

	DEY		 ; Y--
	BPL PRG043_B017	 ; While Y >= 0, loop!

PRG043_B01F:
	RTS		 ; Return


PRG043_B020:

	; Enable this brick bust slot (poof style)
	LDA #$01
	STA BrickBust_En,Y

	; Brick bust (poof) X
	LDA SpecialObj_XLo,X
	SUB #$08
	SUB <Horz_Scroll
	STA BrickBust_X,Y

	; Brick bust (poof) Y
	LDA SpecialObj_YLo,X
	ADD #$04
	SBC Level_VertScroll
	STA BrickBust_YUpr,Y

	; Poof counter
	LDA #$17
	STA BrickBust_HEn,Y

	RTS		 ; Return


Laser_PrepSpritesAndHit:
	JSR SObj_GetSprRAMOffChkVScreen
	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Set laser pattern
	LDA #$b7
	STA Sprite_RAM+$01,Y

	; Use rotating color attributes
	LDA <Counter_1
	LSR A	
	LSR A	
	AND #$03
	STA Sprite_RAM+$02,Y

	JMP SObj_PlayerCollide	 ; Do Player to laser collision and don't come back!

PRG043_B058:
	RTS		 ; Return

BlooperKid_VelAccel:	.byte $01, -$01
BlooperKid_VelLimit:	.byte $10, -$10
BlooperKid_SpriteYOff:	.byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $07, $06, $05, $04, $03, $02, $01

SObj_BlooperKid:
	LDA <Player_HaltGame
	BNE PRG043_B0BC	 ; If gameplay halted, jump to PRG043_B0BC

	LDA <Counter_1
	AND #$07
	BNE PRG043_B0A9	 ; 1:8 ticks proceed, otherwise jump to PRG043_B0A9

	LDA SpecialObj_Data,X
	AND #$01
	TAY		 ; Y = 0 or 1

	; Accelerate Blooper Kid Y
	LDA SpecialObj_YVel,X
	ADD BlooperKid_VelAccel,Y
	STA SpecialObj_YVel,X

	CMP BlooperKid_VelLimit,Y
	BNE PRG043_B091	 ; If Blooper Kid has not hit Y velocity limit, jump to PRG043_B091

	INC SpecialObj_Data,X	 ; Otherwise change direction

PRG043_B091:
	LDA SpecialObj_Var1,X
	AND #$01
	TAY		 ; Y = 0 or 1

	; Accelerate Blooper Kid X
	LDA SpecialObj_XVel,X
	ADD BlooperKid_VelAccel,Y
	STA SpecialObj_XVel,X

	CMP BlooperKid_VelLimit,Y
	BNE PRG043_B0A9	 ; If Blooper Kid has not hit X velocity limit, jump to PRG043_B0A9

	INC SpecialObj_Var1,X	 ; Otherwise change direction

PRG043_B0A9:
	JSR SObj_AddXVelFrac	 ; Apply X Velocity

	LDA SpecialObj_YVel,X
	BPL PRG043_B0B9	 ; If Blooper Kid is moving downward, jump to PRG043_B0B9

	JSR SObj_CheckHitSolid	 ; Check if hit solid

	LDA SObjBlooperKid_OutOfWater,X
	BEQ PRG043_B0BC	 ; If Blooper Kid is still in water, jump to PRG043_B0BC

PRG043_B0B9:
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

PRG043_B0BC:
	LDA SpecialObj_Timer,X
	BEQ PRG043_B0F7	 ; If timer expired, jump to PRG043_B0F7

	CMP #$30
	BGE PRG043_B0C9	 ; If timer >= $30, jump to PRG043_B0C9

	; Blooper Kid flickering away..
	AND #$02
	BNE PRG043_B0F6	 ; 2 ticks on, 2 ticks off; jump to PRG043_B0F6 (RTS)

PRG043_B0C9:
	JSR SObj_GetSprRAMOffChkVScreen

	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	LDA Level_NoStopCnt
	LSR A
	AND #$0f
	TAX		 ; X = 0 to 15

	; Set Sprite Y
	LDA Sprite_RAM+$00,Y
	ADD BlooperKid_SpriteYOff,X
	STA Sprite_RAM+$00,Y

	TXA

	LDX <SlotIndexBackup	; X = special object slot index

	CMP #$08
	LDA #$b5	 ; A = $B5
	BLT PRG043_B0EB	 ; If only halfway through the animation cycle, jump to PRG043_B0EB

	LDA #$b7	 ; A = $B7

PRG043_B0EB:

	; Set Blooper Kid pattern
	STA Sprite_RAM+$01,Y

	; Set Blooper Kid attributes
	LDA #SPR_PAL1
	STA Sprite_RAM+$02,Y

	JMP SObj_PlayerCollide	 ; Do Player to Blooper Kid collision and don't come back!

PRG043_B0F6:
	RTS		 ; Return

PRG043_B0F7:
	JMP SpecialObj_Remove	 ; Remove Blooper kid

SObj_FenceCtl:
	LDA SpecialObj_Data,X
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word SObjFence_WaitForPlayer
	.word SObjFence_Rotating

SObjFence_WaitForPlayer:
	LDA Player_IsClimbing
	BEQ FenceCtl_NotTouching	; If Player is not climbing (on fence), jump to FenceCtl_NotTouching

	BIT <Pad_Input
	BVC FenceCtl_NotTouching	; If Player is not pushing 'B', jump to FenceCtl_NotTouching
	
	JSR SObj_CalcCoarseXDiff
	LDA <Temp_Var15
	CMP #-8
	BLT FenceCtl_NotTouching	; If the coarse X difference is not between -8 and 0, jump to FenceCtl_NotTouching
	
	JSR SObj_CalcCoarseYDiff
	LDA <Temp_Var15
	ADD #4
	CMP #8
	BGE FenceCtl_NotTouching	; If the coarse Y difference is not between -4 and 4, jump to FenceCtl_NotTouching
	
	; Ready to flip...
	INC SpecialObj_Data,X	; Next state
	
	LDA #((SObjFenceRot_TileChngs_End - SObjFenceRot_TileChngs) * 8) + 1
	STA SpecialObj_Timer,X
	
	LDA #SND_LEVELSHOE
	STA Sound_QLevel1
	
	LDA #48
	STA Player_HaltTick

	LDA SpecialObj_XLo,X
	SUB <Player_X
	ADD #16
	STA <Player_XVel

	; No scrolling in vertical level...
	LDA Level_7Vertical
	BNE FenceCtl_NotTouching

	; Set anticipated scrolling direction
	ROL A
	ROL A
	AND #1
	STA <Scroll_LastDir
	
FenceCtl_NotTouching:
	RTS

SObjFenceRot_TileChngs: .byte CHNGTILE_FENCEROT1, CHNGTILE_FENCEROT2, CHNGTILE_FENCEROT3, CHNGTILE_FENCEROT2
SObjFenceRot_TileChngs_End

SObjFence_Rotating:
	LDA SpecialObj_Timer,X
	BNE FenceCtl_StillRotating
	
	; Done rotating...
	LDA #0
	STA SpecialObj_Data,X

	RTS

FenceCtl_StillRotating:
	AND #7
	BNE SObjFenceRot_Nothing
	
	LDA SpecialObj_Timer,X
	SUB #2
	LSR A
	LSR A
	LSR A
	TAY
	
	LDA SpecialObj_XLo,X
	STA Level_BlockChgXLo
	LDA SpecialObj_Var3,X
	STA Level_BlockChgXHi
	LDA SpecialObj_YLo,X
	STA Level_BlockChgYLo
	LDA SpecialObj_YHi,X
	STA Level_BlockChgYHi

	LDA SObjFenceRot_TileChngs,Y
	STA Level_ChgTileEvent

	CPY #(SObjFenceRot_TileChngs_End - SObjFenceRot_TileChngs) / 2
	BNE SObjFenceRot_Nothing
	
	; Fence rotation halfway; put Player on correct side
	LDA Player_Behind
	EOR #1
	STA Player_Behind
	
	; Update Player's displayed climbing frame
	JSR_THUNKA 8, Player_DoClimbAnim
	
	LDA <Player_FlipBits
	EOR #SPR_HFLIP
	STA <Player_FlipBits	
	
SObjFenceRot_Nothing:

	LDA <Player_X
	STA <Temp_Var1

	; Keep on truckin', Player
	JSR_THUNKA 8, Player_ApplyXVelocity
	
	; No scrolling in vertical level...
	LDA Level_7Vertical
	BNE SObjFenceRot_InRange
	
	LDA #0
	STA <Temp_Var2
		
	; Scroll if Player moved...
	LDA <Player_X
	SUB <Temp_Var1
	BEQ SObjFenceRot_InRange	; If no scroll, just jump to SObjFenceRot_InRange (RTS)
	STA <Temp_Var1

	BPL SObjFenceRot_ScrlNeg
	DEC <Temp_Var2
SObjFenceRot_ScrlNeg:
	
	LDA <Horz_Scroll
	ADD <Temp_Var1
	STA <Horz_Scroll
	LDA <Horz_Scroll_Hi
	ADC <Temp_Var2
	STA <Horz_Scroll_Hi
	
	BPL SObjFenceRot_InRange

	LDA #0
	STA <Horz_Scroll
	STA <Horz_Scroll_Hi

SObjFenceRot_InRange:
	RTS


SObj_CoinOrDebris:
	LDA <Player_HaltGame
	BNE PRG043_B11F	 ; If gameplay halted, jump to PRG043_B11F

	INC SpecialObj_Var1,X	 ; Var1++

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity

	LDA SpecialObj_ID,X
	CMP #SOBJ_BRICKDEBRIS
	BNE PRG043_B11F	 ; If this is not brick debris, jump to PRG043_B11F

	; Brick debris only...

	LDA SpecialObj_YVel,X
	BMI PRG043_B114	 ; If brick debris is moving upward, jump to PRG043_B114

	CMP #$70
	BGE PRG043_B11F	 ; If brick debris is falling >= $70, jump to PRG043_B11F

PRG043_B114:
	LDA SpecialObj_Data,X
	BNE PRG043_B11C	 ; If data <> 0, jump to PRG043_B11C (fall slower)

	INC SpecialObj_YVel,X	 ; YVel++

PRG043_B11C:
	INC SpecialObj_YVel,X	 ; YVel++

PRG043_B11F:
	JSR SObj_GetSprRAMOffChkVScreen

	LDA SpecialObj_ID,X
	CMP #SOBJ_BRICKDEBRIS
	BNE PRG043_B169	 ; If this is not brick debris, jump to PRG043_B169

	; Brick debris only...

	LDA SpecialObj_Data,X
	BEQ PRG043_B153	 ; If data = 0 (full giant world style brick rather than chunks), jump to PRG043_B153

	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Brick debris chunk pattern
	LDA #$4b
	STA Sprite_RAM+$01,Y

	; Temp_Var1 = SPR_PAL3
	LDA #SPR_PAL3
	STA <Temp_Var1

	LDA SpecialObj_Timer,X
	BEQ PRG043_B144	 ; If timer expired, jump to PRG043_B144

	; Rotating colors for Ice Brick debris
	LSR A
	AND #$03
	STA <Temp_Var1

PRG043_B144:

	; Rotating effect
	LDA Level_NoStopCnt
	ASL A
	ASL A
	ASL A
	ASL A
	AND #(SPR_HFLIP | SPR_VFLIP)

	; Set attributes
	ORA <Temp_Var1		 ; OR'd with palette
	STA Sprite_RAM+$02,Y

	RTS		 ; Return

PRG043_B153:
	JSR SObj_Draw16x16	 ; Draw full brick

	; Set petterns
	LDA #$75
	STA Sprite_RAM+$01,Y
	STA Sprite_RAM+$05,Y

	; Set attributes on left sprite
	LDA #SPR_PAL3
	STA Sprite_RAM+$02,Y

	; Set attributes on right sprite
	LDA #(SPR_PAL3 | SPR_HFLIP)
	STA Sprite_RAM+$06,Y

	RTS		 ; Return

PRG043_B169:

	; Popped out coin only

	LDA SpecialObj_YVel,X
	CMP #$20
	BMI PRG043_B17E	 ; If Y Velocity < $20, jump to PRG043_B17E

	; Coin fell far enough..

	JSR SpecialObj_Remove	 ; Remove it
	INC Coins_Earned	 ; You get a coin

	JSR Score_FindFreeSlot
	LDA #$89	; Get 1000 pts; $80 just mixes up what sprite it uses
	JMP PRG043_B44B	 ; Jump to PRG043_B44B

PRG043_B17E:
	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Set coin sprite Y
	LDA Sprite_RAM+$03,Y
	ADD #$04
	STA Sprite_RAM+$03,Y

	LDA SpecialObj_Var1,X
	LSR A
	LSR A
	AND #$03
	TAX		 ; X = 0 to 3

	; Set pattern
	LDA PUpCoin_Patterns,X
	STA Sprite_RAM+$01,Y	

	; Set attributes
	LDA PUpCoin_Attributes,X
	STA Sprite_RAM+$02,Y	

	LDX <SlotIndexBackup	 ; X = special object slot index

	RTS		 ; Return

	; Velocity gets applied at different rates (slower as timer decreases)
ExplodeStar_VelMask:
	.byte $07, $03, $01, $00


SObj_ExplodeStar:
	LDA SpecialObj_Data,X
	BNE PRG043_B1DD	 ; If star's data <> 0, jump to PRG043_B1DD (RTS)

	LDA SpecialObj_Timer,X
	BEQ PRG043_B1DE	 ; If timer expired, jump to PRG043_B1DE (RTS)

	LSR A
	LSR A
	LSR A
	LSR A
	AND #$03
	TAY		 ; Y = 0 to 3, by timer

	; Apply velocities at lower rates as timer decreases
	LDA <Counter_1
	AND ExplodeStar_VelMask,Y
	BNE PRG043_B1C3

	JSR SObj_AddXVelFrac	 ; Apply X velocity
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

PRG043_B1C3:
	JSR SObj_GetSprRAMOffChkVScreen
	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Set Explosion Star pattern
	LDA #$73
	STA Sprite_RAM+$01,Y

	; Apply cycling palette attribute
	LDA Level_NoStopCnt
	LSR A
	LSR A
	NOP
	ADD <SlotIndexBackup
	AND #$03	 ; A = 0 to 3 (palette select)
	STA Sprite_RAM+$02,Y

	RTS		 ; Return


PRG043_B1DD:
	RTS		 ; Return

PRG043_B1DE:
	JMP SpecialObj_Remove	 ; Remove special object and don't come back!



SObj_LavaLotusFire:

	; Load Lava Lotus fire patterns
	LDA #$1b
	STA PatTable_BankSel+5

	LDA <Player_HaltGame
	BNE PRG043_B2EE	 ; If gameplay halted, jump to PRG043_B2EE

	LDA SpecialObj_Var2,X
	BEQ PRG043_B2A8	 ; If Var2 (Lava Lotus fire "life" counter) = 0, jump to PRG043_B2A8

	LDA <Counter_1
	LSR A	
	BCC PRG043_B2A8	 ; Every other tick, jump to PRG043_B2A8

	DEC SpecialObj_Var2,X	 ; Var2--

PRG043_B2A8:
	LDA SpecialObj_Data,X
	BEQ PRG043_B2E2	 ; If SpecialObj_Data = 0, jump to PRG043_B2E2

	LDY SpecialObj_Var1,X	 ; Y = Var1 (the parent Lava Lotus index)

	LDA Objects_State,Y
	CMP #OBJSTATE_NORMAL
	BNE PRG043_B2D8	 ; If Lava Lotus is no longer in normal state, jump to PRG043_B2D8

	LDA Level_ObjectID,Y
	CMP #OBJ_LAVALOTUS
	BNE PRG043_B2D8	 ; If this is no longer a Lava Lotus, jump to PRG043_B2D8

	LDA Objects_Var5,Y
	CMP #$4f
	BLT PRG043_B2D8	 ; If Lava Lotus' Var5 < $4F, jump to PRG043_B2D8

	LDA Level_NoStopCnt

	INC SpecialObj_XLo,X	 ; X++
	AND #$02
	BNE PRG043_B2D5	 ; 2 ticks on, 2 ticks off; jump to PRG043_B2D5

	; X -= 2
	DEC SpecialObj_XLo,X
	DEC SpecialObj_XLo,X

PRG043_B2D5:
	JMP PRG043_B2EE	 ; Jump to PRG043_B2EE

PRG043_B2D8:

	; SpecialObj_Data = 0
	LDA #$00
	STA SpecialObj_Data,X

	; Var2 = $C0
	LDA #$c0
	STA SpecialObj_Var2,X

PRG043_B2E2:
	LDA <Counter_1
	AND #$03
	BNE PRG043_B2EE	 ; 1:4 ticks proceed, otherwise jump to PRG043_B2EE

	JSR SObj_AddXVelFrac	 ; Apply X Velocity
	JSR SObj_AddYVelFrac	 ; Apply Y Velocity

PRG043_B2EE:
	LDA SpecialObj_Var2,X
	BNE PRG043_B2F6	 ; If Var2 <> 0 (fire still has life), jump to PRG043_B2F6

	JMP SpecialObj_Remove	 ; Otherwise, remove it and don't come back!

PRG043_B2F6:
	CMP #$30
	BGE PRG043_B303	 ; If Var2 >= 30, jump to PRG043_B303

	TXA		; A = special object slot index
	ASL A		; * 2
	ADC SpecialObj_Var2,X	; Add life counter
	AND #$02		; 0 or 2
	BNE PRG043_B320	 ; 2 ticks on, 2 ticks off; jump to PRG043_B320 (fire flickers away) (RTS)

PRG043_B303:
	JSR SObj_GetSprRAMOffChkVScreen	

	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	LDA Level_NoStopCnt
	LSR A
	LSR A
	LSR A	; 8 ticks on/off

	LDA #$d9	 ; A = $D9
	BCC PRG043_B315	 ; 8 ticks on, 8 ticks off; jump to PRG043_B315
	LDA #$db	 ; A = $DB
PRG043_B315:

	; Store pattern
	STA Sprite_RAM+$01,Y

	; Set attribute
	LDA #SPR_PAL1
	STA Sprite_RAM+$02,Y

	JMP SObj_PlayerCollide	 ; Do Player-to-fire collision and don't come back!

PRG043_B320:
	RTS		 ; Return

SBubble_XOff:		.byte $00, $01, $00, -$01

SObj_Bubble:
	LDA <Player_HaltGame
	BNE PRG043_B364	 ; If gameplay is halted, jump to PRG043_B364

	LDA SpecialObj_Timer,X
	BNE PRG043_B32D	 ; If timer not expired, jump to PRG043_B32D

	JMP SpecialObj_Remove	 ; Otherwise, remove the bubble

PRG043_B32D
	LDA SpecialObj_Data,X
	BNE PRG043_B352	 ; If data <> 0, jump to PRG043_B352

	JSR SObj_AddYVelFrac	 ; Apply Y velocity

	LDA SpecialObj_YVel,X
	BMI PRG043_B344	 ; If bubble is moving upward, jump to  PRG043_B344

	SUB #$07	; Slow down (downward bubble)
	STA SpecialObj_YVel,X
	BPL PRG043_B34F	 ; If bubble is still moving downward, jump to PRG043_B34F
	BMI PRG043_B34C	 ; Otherwise, jump to PRG043_B34C

PRG043_B344:
	ADD #$07	 ; Slow down (upward bubble)
	STA SpecialObj_YVel,X
	BMI PRG043_B34F	 ; If bubble is still moving upward, jump to PRG043_B34F

PRG043_B34C:
	INC SpecialObj_Data,X	 ; Otherwise, set SpecialObj_Data

PRG043_B34F:
	JMP PRG043_B364	 ; Jump to PRG043_B364

PRG043_B352:
	INC SpecialObj_Var1,X	 ; SpecialObj_Var1++

	LDA SpecialObj_Var1,X
	AND #%00110000
	BEQ PRG043_B364	 ; 48 ticks on, 48 ticks off; jump to PRG043_B364

	DEC SpecialObj_YLo,X	 ; Bubble Y --
	BNE PRG043_B364
	DEC SpecialObj_YHi,X	 ; Apply carry
PRG043_B364:

	LDA Level_NoStopCnt
	AND #%00001100
	LSR A
	LSR A
	TAY		 ; Y = 0 or 3

	; Bubble_XOff -> Temp_Var1
	LDA SBubble_XOff,Y
	STA <Temp_Var1

	JSR SObj_GetSprRAMOffChkVScreen
	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Set bubble X
	LDA SpecialObj_XLo,X
	ADD <Temp_Var1	
	SUB <Horz_Scroll
	STA Sprite_RAM+$03,Y

	; Set bubble pattern
	LDA #$17
	STA Sprite_RAM+$01,Y

	; Set bubble attributes
	LDA #SPR_PAL1
	STA Sprite_RAM+$02,Y

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_ApplyXYVelsWithGravity
;
; Apply the special object X and Y velocity with gravity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SObj_ApplyXYVelsWithGravity:
	JSR SObj_AddXVelFrac	 ; Apply X velocity
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

	LDA SpecialObj_YVel,X
	BMI PRG043_B39D	 ; If special object is moving upward, jump to PRG043_B39D

	CMP #$6e
	BGE PRG043_B3A3	 ; If special object Y velocity >= $6E, jump to PRG043_B3A3 (RTS)

PRG043_B39D:

	; Apply gravity
	INC SpecialObj_YVel,X
	INC SpecialObj_YVel,X

PRG043_B3A3:
	RTS		 ; Return

Cannonball_YOffset:	.byte 16, $00
Cannonball_YDiffLimit:	.byte 16, 32

SObj_Cannonball:

	; Load cannonball graphics
	LDA #$36
	STA PatTable_BankSel+4

	LDA <Player_HaltGame
	BNE PRG043_B3C2	 ; If gameplay halted, jump to PRG043_B3C2

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity
	JSR SObj_OffsetYForRaster	 ; Offset the Y by raster effects, if any

	LDA SpecialObj_Data,X
	BNE PRG043_B3C2	 ; If data <> 0 (cannonball is stomped), jump to PRG043_B3C2

	; Otherwise, Y Vel -= 2 (??)
	DEC SpecialObj_YVel,X
	DEC SpecialObj_YVel,X

PRG043_B3C2:
	JSR SObj_GetSprRAMOffChkVScreen
	BNE PRG043_B3A3	 ; If cannonball is vertically off-screen, jump to PRG043_B3A3 (RTS)

	JSR SObj_Draw16x16	; Prep cannonball sprites

	; Set cannon ball sprite attributes
	LDA #SPR_PAL3
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y

	; Set left and right cannonball patterns
	LDA #$af
	STA Sprite_RAM+$05,Y
	LDA #$ad
	STA Sprite_RAM+$01,Y

	LDA SpecialObj_Data,X
	ORA Player_IsDying
	ORA Player_OffScreen
	BNE PRG043_B445	 ; If cannonon ball is already stomped, Player is dying, or Player is off-screen, jump to PRG043_B445 (RTS)

	LDY #$00	 ; Y = 0 (Player is small or ducking)

	LDA <Player_Suit
	BEQ PRG043_B3F3		; If Player is small, jump to PRG043_B3F3

	LDA Player_IsDucking
	BNE PRG043_B3F3		; If Player is ducking, jump to PRG043_B3F3

	INY		 ; Y = 1 (Player not small/ducking)

PRG043_B3F3:
	LDA SpecialObj_YLo,X	; Cannonball Y
	SUB <Player_Y		; Player Y
	SUB Cannonball_YOffset,Y	; Offset
	CMP Cannonball_YDiffLimit,Y
	BGE PRG043_B445	 ; If Player is not close enough to top of cannonball, jump to PRG043_B445 (RTS)

	LDA SpecialObj_XLo,X
	ADD #$08	 ; Cannonball X + 8
	SUB <Player_X	 ; Diff against Player X
	CMP #20
	BGE PRG043_B445	 ; If Player is not close enough horizontally to cannonball, jump to PRG043_B445 (RTS)

	LDA Player_StarInv
	BNE PRG043_B426	 ; If Player is invincible by Star Man, jump to PRG043_B426

	LDA <Player_YVel
	BMI PRG043_B442	 ; If Player is moving upward, jump to PRG043_B442

	LDA SpecialObj_YLo,X
	SUB Level_VertScroll
	SUB #19
	CMP <Player_SpriteY
	BLT PRG043_B442	 ; If Player is close enough to bottom of cannonball, jump to PRG043_B442

PRG043_B426:

	; Flag cannonball as stomped!
	LDA #$01
	STA SpecialObj_Data,X

	; Halt its movements
	LDA #$00
	STA SpecialObj_XVel,X
	STA SpecialObj_YVel,X

	; Player bounces off cannonball
	LDA #-$30
	STA <Player_YVel

	; Cannonball kick sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	JMP PRG043_B446	 ; Jump to PRG043_B446

PRG043_B442:
	JMP PRG043_B805	 ; Jump to PRG043_B805 (remainder of Player hit checks)

PRG043_B445:
	RTS		 ; Return


PRG043_B446:
	JSR Score_FindFreeSlot

	; Set base score and add Kill_Tally
	LDA #$85		; Base 100 points; $80 just mixes up what sprite it uses

PRG043_B44B:
	ADD Kill_Tally
	STA Scores_Value,Y

	INC Kill_Tally	 ; Kill_Tally++

	; Set the score counter
	LDA #$30
	STA Scores_Counter,Y

	LDA SpecialObj_YLo,X
	SUB Level_VertScroll
	SBC #$06
	CMP #192
	BLT PRG043_B469	 ; If score Y < 192, jump to PRG043_B469

	LDA #$05	 ; Otherwise, use Y = 5

PRG043_B469:
	STA Scores_Y,Y	 ; Set score Y

	; Set score X
	LDA SpecialObj_XLo,X
	SUB <Horz_Scroll
	STA Scores_X,Y

	RTS		 ; Return


SObj_OffsetYForRaster:
	LDA Level_AScrlConfig
	BEQ PRG043_B491	 ; If there's no raster effect going on, jump to PRG043_B491 (RTS)

	LDY #$00	 ; Y = $00 (16-bit sign extension)

	LDA Level_ScrollDiffV
	BPL PRG043_B483	 ; If vertical scroll difference is not negative, jump to PRG043_B483

	DEY		 ; Otherwise, Y = $FF (16-bit sign extension)

PRG043_B483:
	ADD SpecialObj_YLo,X
	STA SpecialObj_YLo,X	; Apply raster offset to Special Object Y

	TYA

	ADC SpecialObj_YHi,X
	STA SpecialObj_YHi,X	; Apply sign extension/carry

PRG043_B491:
	RTS		 ; Return

Wrench_Patterns:	.byte $A1, $95, $9F, $95
Wrench_Attributes:	.byte SPR_PAL2, SPR_PAL2 | SPR_VFLIP, SPR_PAL2, SPR_PAL2
	
SObj_Wrench:
	LDA <Player_HaltGame		 
	BNE PRG043_B4AF	 ; If gameplay halted, jump to PRG043_B4AF

	JSR SObj_OffsetYForRaster	; Offset Y with raster effects (if any)
	JSR SObj_AddXVelFrac	 	; Apply X velocity

	LDA SpecialObj_YVel,X
	BEQ PRG043_B4AC	 ; If wrench Y velocity = 0, jump to PRG043_B4AC

	INC SpecialObj_YVel,X	 ; Otherwise, Y Vel++ (fall?)

PRG043_B4AC:
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

PRG043_B4AF:
	JSR SObj_PlayerCollide	 ; Do Player-to-wrench collision

	JSR SObj_GetSprRAMOffChkVScreen
	BNE PRG043_B4EB	 ; If wrench is not vertically on-screen, jump to PRG043_B4EB (RTS)

	; Set Temp_Var1 = $00 or $80, depending on sign bit of X velocity
	LDA SpecialObj_XVel,X
	AND #$80
	STA <Temp_Var1

	LDA Level_NoStopCnt
	LSR A
	ADD <SlotIndexBackup
	AND #$03
	TAX		 ; X = 0 to 3

	; Set wrench pattern
	LDA Wrench_Patterns,X
	STA Sprite_RAM+$01,Y

	; Set wrench attributes
	LDA Wrench_Attributes,X
	EOR <Temp_Var1	
	STA Sprite_RAM+$02,Y

	LDX <SlotIndexBackup	; X = special object slot index

SObj_SetSpriteXYRelative:
	LDA SpecialObj_YLo,X
	SUB Level_VertScroll
	STA Sprite_RAM+$00,Y

	LDA SpecialObj_XLo,X
	SUB <Horz_Scroll
	STA Sprite_RAM+$03,Y

PRG043_B4EB:
	RTS		 ; Return


SObj_WandBlast:
	LDA <Player_HaltGame
	BNE PRG043_B502	 ; If gameplay is halted, jump to PRG043_B502

	JSR SObj_AddXVelFrac	 ; Apply X Velocity
	JSR SObj_AddYVelFrac	 ; Apply Y Velocity

PRG043_B502:
	JSR SObj_GetSprRAMOffChkVScreen

	LDA SpecialObj_Timer,X
	TAX	; Timer -> 'X'

	; Select which pattern to use by timer
	LDA #$fd	 ; A = $FD

	CPX #$e0
	BGE PRG043_B517	 ; If timer >= $E0, jump to PRG043_B517

	LDA #$f9	 ; A = $F9

	CPX #$c0
	BGE PRG043_B517	 ; If timer >= $C0, jump to PRG043_B517

	LDA #$fb	 ; A = $FB

PRG043_B517:
	; Set the wand blast pattern
	STA Sprite_RAM+$01,Y

	LDX <SlotIndexBackup		 ; X = special object slot index

	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	TXA		; Special object slot index -> 'A'
	LSR A		; Shift bit 0 into carry
	ROR A		; Rotate it around to bit 7
	AND #SPR_VFLIP
	STA <Temp_Var1	; Temp_Var1 = VFlip attribute or not

	LDA <Counter_1
	LSR A	
	LSR A	
	LSR A	
	ROR A	
	AND #SPR_VFLIP
	ORA #SPR_PAL1
	EOR <Temp_Var1	 ; Invert VFlip by Temp_Var1

	; Set wand blast attribute
	STA Sprite_RAM+$02,Y

	JMP SObj_PlayerCollide	 ; Do Player-to-wand blast collision and don't come back!

	RTS		 ; Return

SObj_KuriboShoe:
	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity

	JSR SObj_GetSprRAMOffChkVScreen

	; Set left sprite attribute
	LDA #$02	; SB: Hardcoding, no point to useless LUT (LostShoe_Attribute)
	STA Sprite_RAM+$02,Y

	STA Sprite_RAM+$06,Y	 ; Set attributes on right sprite

	; X *= 2 (two patterns per suit, again generally unused in US version)
	TXA
	ASL A
	TAX

	; SB: Hardcoding these, no point to a useless LUT (LostShoe_Pattern)

	; Pattern for left fly off sprite
	LDA #$A9
	STA Sprite_RAM+$01,Y

	; Pattern for right fly off sprite
	LDA #$AB
	STA Sprite_RAM+$05,Y

	LDX <SlotIndexBackup	; X = special object slot index

SObj_Draw16x16:
	JSR SObj_SetSpriteXYRelative

	; Copy sprite Y into right sprite
	LDA Sprite_RAM+$00,Y
	STA Sprite_RAM+$04,Y

	; Right sprite is X + 8
	LDA Sprite_RAM+$03,Y
	ADD #$08
	STA Sprite_RAM+$07,Y

	RTS		 ; Return

	; SB: Draw 16x16 with visibility checks
SObj_Draw16x16WithViz:
	JSR SObj_Draw16x16

	LDA SpecialObj_VisFlags,X
	STA Temp_VarNP0	

	ASL Temp_VarNP0
	BCC SObj16x16_LeftVisible

	; Left side is invisible!
	LDA #$F8
	STA Sprite_RAM+$00,Y

SObj16x16_LeftVisible:

	ASL Temp_VarNP0
	BCC SObj16x16_RightVisible

	; Right side is invisible!
	LDA #$F8
	STA Sprite_RAM+$04,Y

SObj16x16_RightVisible:
	RTS

SObj_Spikeball:
	LDA <Player_HaltGame
	BNE PRG043_B588	 ; If gameplay is halted, jump to PRG043_B588

	LDA SpecialObj_Data,X
	AND #1
	BEQ PRG043_B585	 ; If SpecialObj_Data bit 0 not set (no gravity version, specifically Spike's spike ball), jump to PRG043_B585

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity
	JMP PRG043_B588	 ; Jump to PRG043_B588

PRG043_B585:
	JSR SObj_AddXVelFrac	 ; Apply X velocity only

PRG043_B588:
	JSR SObj_GetSprRAMOffChkVScreen

	LDA SpecialObj_Data,X
	AND #2
	BNE Spikeball_DrawWart
	
	JSR Spikeball_DrawNormal

	LDA SpecialObj_Data,X
	AND #1
	BNE PRG043_B5B1	 ; If SpecialObj_Data bit 0 set (Gravity version, specifically Patooie's spike ball), jump to PRG043_B5B1 (RTS)

Spikeball_WartReturn:
	JMP SObj_PlayerCollide	 ; Do Player to spike ball collision and don't come back!

PRG043_B5B1:
	RTS		 ; Return

Spikeball_DrawNormal:
	
	; Spike ball pattern
	LDA #$95
	STA Sprite_RAM+$01,Y
	STA Sprite_RAM+$05,Y

	JSR SObj_Draw16x16	 ; Draw spike ball

	; Set spike ball left attributes
	LDA Level_NoStopCnt
	LSR A
	LSR A
	LSR A
	ROR A
	AND #SPR_VFLIP	; Toggles which side is going to be vertically flipped
	ORA #SPR_PAL2
	STA Sprite_RAM+$02,Y

	; Set opposite flips on right sprite
	EOR #(SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAM+$06,Y
	
	RTS
	
Spikeball_DrawWart:

	; Spike ball pattern
	LDA #$91
	STA Sprite_RAM+$01,Y
	STA Sprite_RAM+$05,Y

	JSR SObj_Draw16x16	 ; Draw spike ball

	LDA #SPR_PAL3
	STA Sprite_RAM+$02,Y

	; Set opposite flips on right sprite
	EOR #SPR_HFLIP
	STA Sprite_RAM+$06,Y

	BNE Spikeball_WartReturn

Microgoomba_XAccel:	.byte $01, -$01
Microgoomba_XLimit:	.byte $10, -$10

Microgoomba_SprRAMAlt:	.byte $00, $04, $08, $0C, $10, $14, $18, $1C, $20, $24

SObj_Microgoomba:

	; Load Microgoomba's graphics
	LDA #$4f
	STA PatTable_BankSel+5

	LDA <Player_HaltGame
	BEQ PRG043_B5CC	 ; If gameplay is not halted, jump to PRG043_B5CC

	JMP Microgoomba_Draw	 ; Draw Microgoomba and don't come back!

PRG043_B5CC:
	LDA SpecialObj_Data,X
	BNE PRG043_B5D4	 ; If SpecialObj_Data <> 0, jump to PRG043_B5D4

	JMP PRG043_B660	 ; Otherwise, jump to PRG043_B660

PRG043_B5D4:
	BPL PRG043_B5DC	 ; If SpecialObj_Data > 0, jump to PRG043_B5DC

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity
	JMP Microgoomba_Draw	 ; Draw Microgoomba and don't come back

PRG043_B5DC:
	LDY Player_StarInv
	BNE PRG043_B601		; If Player is invincible by Star Man, jump to PRG043_B601

	LDY Player_InWater
	BNE PRG043_B601	 ; If Player is in water, jump to PRG043_B601

	INC Player_UphillSpeedIdx	 ; Player_UphillSpeedIdx = 1 (Microgoomba stuck to Player)

	CMP #$05
	BGE PRG043_B5F6	 ; If Microgoomba is already at his maximum stickiness, jump to PRG043_B5F6

	; Player is trying to shake him...

	LDA <Counter_1
	AND #$0f
	BNE PRG043_B5F6	 ; 1:16 ticks proceed, otherwise, jump to PRG043_B5F6

	INC SpecialObj_Data,X	 ; SpecialObj_Data++ (Increase "stickiness", up to 5)

PRG043_B5F6:
	LDA <Pad_Input
	AND #$ff	 ; This probably was intended to be a specific button rather than "everything"
	BEQ PRG043_B617	 ; If Player is not pressing anything, jump to PRG043_B617

	DEC SpecialObj_Data,X	 ; SpecialObj_Data--
	BNE PRG043_B617	 	; If SpecialObj_Data > 0, jump to PRG043_B617

PRG043_B601:

	; Otherwise, SpecialObj_Data = $FF (Microgoomba's "death" value)
	LDA #$ff
	STA SpecialObj_Data,X

	; Microgoomba flops off
	LDA #-$20
	STA SpecialObj_YVel,X

	LDA #$08	 ; A = $08

	LDY RandomN,X
	BPL PRG043_B614	 ; 50/50 chance we jump to PRG043_B614

	LDA #-$08	 ; A = -$08

PRG043_B614:
	STA SpecialObj_XVel,X	 ; Random X velocity

PRG043_B617:
	INC SpecialObj_Var1,X	 ; SpecialObj_Var1++

	; Set Microgoomba's Y...
	LDA SpecialObj_Var1,X
	LSR A
	LSR A
	AND #%00011111
	CMP #%00010000
	AND #%00001111
	BCC PRG043_B62B	 ; 16 ticks on, 16 ticks off; jump to PRG043_B62B

	EOR #%00001111
	ADC #$00

PRG043_B62B:
	CLC		 ; Clear carry

	LDY Player_IsDucking
	BNE PRG043_B635	 ; If Player is ducking, jump to PRG043_B635

	LDY <Player_Suit
	BNE PRG043_B639	 ; If Player is small, jump to PRG043_B639

PRG043_B635:
	LSR A
	ADD #$08

PRG043_B639:
	ADC <Player_Y
	STA SpecialObj_YLo,X
	LDA <Player_YHi
	ADC #$00
	STA SpecialObj_YHi,X


	; Set Microgoomba's X...
	LDA SpecialObj_Var1,X
	AND #%00011111
	CMP #%00010000
	AND #%00001111
	BLT PRG043_B654	 ; 16 ticks on, 16 ticks off; jump to PRG043_B62B

	EOR #%00001111
	ADC #$00

PRG043_B654:
	SUB #$03
	ADD <Player_X
	STA SpecialObj_XLo,X

	JMP Microgoomba_Draw	 ; Draw Microgoomba and don't come back

PRG043_B660:

	; SpecialObj_Data = 0...

	JSR SObj_AddXVelFrac	 ; Apply X Velocity
	JSR SObj_AddYVelFrac	 ; Apply Y Velocity

	LDA SpecialObj_YVel,X
	CMP #$10
	BGS PRG043_B670	 ; If Microgoomba's Y velocity >= 16, jump to PRG043_B670

	INC SpecialObj_YVel,X	 ; Otherwise, Y Vel++

PRG043_B670:
	LDA <Counter_1
	AND #$00
	BNE Microgoomba_Draw	 ; Technically NEVER jump to Microgoomba_Draw (??)

	LDA SpecialObj_Var1,X
	AND #$01
	TAY		 ; Y = 0 or 1

	; Accelerate Microgoomba
	LDA SpecialObj_XVel,X
	ADD Microgoomba_XAccel,Y
	STA SpecialObj_XVel,X

	CMP Microgoomba_XLimit,Y
	BNE Microgoomba_Draw	 ; If Microgoomba hasn't his X velocity limit, jump to Microgoomba_Draw

	INC SpecialObj_Var1,X	 ; Otherwise, SpecialObj_Var1++ (switch direction)

Microgoomba_Draw:
	JSR SObj_GetSprRAMOffChkVScreen
	BNE PRG043_B6CE	 ; If Microgoomba is not on this vertical screen, jump to PRG043_B6CE (RTS)

	LDA SpecialObj_Data,X
	BEQ PRG043_B6A9
	BMI PRG043_B6A9	 ; If SpecialObj_Data <= 0, jump to PRG043_B6A9

	TXA
	ASL A
	ASL A
	ASL A
	ASL A
	EOR SpecialObj_Var1,X
	AND #%00010000
	BEQ PRG043_B6A9	 ; Every 2 direction changes, jump to PRG043_B6A9

	; Use alternate Sprite RAM offset periodically
	LDY Microgoomba_SprRAMAlt,X	 ; Y = Microgoomba sprite RAM offset

PRG043_B6A9:
	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	; Microgoomba pattern
	LDA #$ff
	STA Sprite_RAM+$01,Y

	LDX #SPR_PAL3

	LDA Level_NoStopCnt
	AND #$08
	BEQ PRG043_B6BC	 ; 8 ticks on, 8 ticks off; jump to PRG043_B6BC

	LDX #(SPR_PAL3 | SPR_HFLIP)

PRG043_B6BC:

	; Store selected attributes
	TXA
	STA Sprite_RAM+$02,Y

	LDX <SlotIndexBackup	 ; X = special object slot

	LDA SpecialObj_Data,X
	BEQ PRG043_B6CF	 ; If SpecialObj_Data = 0, jump to PRG043_B6CF (Player to Microgoomba collision)
	BPL PRG043_B6CE	 ; If SpecialObj_Data > 0 (Microgoomba still alive), jump to PRG043_B6CE (RTS)

	; Microgoomba is dead; vertically flip
	LDA #(SPR_PAL3 | SPR_VFLIP)
	STA Sprite_RAM+$02,Y

PRG043_B6CE:
	RTS		 ; Return

PRG043_B6CF:
	JMP SObj_PlayerCollide	 ; Handle Player to Microgoomba collision and don't come back!

	; The hammer starting X is offset
Hammer_XOff:
	;  Not-HF HF  (HF = Horizontally flipped)
	.byte  8, -8	; Non-Heavy Hammer hold offset
	.byte  8, -8	; Non-Heavy Boomerang hold offset
	.byte 16, -8	; Heavy Bro hold offset
	.byte -4, 28	; Hammer-throwing Bowser

	; The hammer starting Y is offset
Hammer_YOff:
	;  Not-HF HF  (HF = Horizontally flipped)
	.byte  3,  3	; Non-Heavy Hammer hold offset
	.byte  3,  3	; Non-Heavy Boomerang hold offset
	.byte -6, -6	; Heavy Bro hold offset
	.byte 20, 20	; Hammer-throwing Bowser


;	LDA SpecialObj_YLo,X		; Special object Y
;	ADD #$08			; +8
;	SUB <Player_Y			; Subtract Player Y
;	SUB SObjYOff_PlayerSize,Y	; Subtract Player height offset
;	CMP SObj_VLimit,Y

; Relative Y
; +8 (fireballs align at player's head)
; SY + 8 - PY - S
; So "0" up to SObj_VLimit

; "18" for small size since roughly 18 pixels to player's head
; "10" is a nicer fudge factor for not small

; Thus the VLimit of "16" is for the small height
; VLimit of "22" is for the big height, though that's kind of a low fudge IMO

; Reverse gravity just really needs to ditch the Y offset, so there you go

						;     NS  NN  RS  RN (Normal/Small ... Reverse/Not Small)
SObjYOff_PlayerSize:	.byte 18, 10,  0,  0
SObj_VLimit:			.byte 16, 22, 16, 22

PRG043_B6E2:	.byte $00, $10

SObj_Hammer:
	LDA <Player_HaltGame
	BEQ PRG043_B6EB	 ; If gameplay is not halted, jump to PRG043_B6EB

	JMP PRG043_B773	 ; Otherwise, jump to PRG043_B773

PRG043_B6EB:

	; SpecialObj_Data special purposes:
	; Bits 0-3: Decrement to zero
	; Bits 4-7: While lower 4 bits not zero, references an object which, if not in normal state or off-screen, destroys this object

	LDA SpecialObj_Data,X
	AND #%00001111	 ; Consider lowest 4 bits of SpecialObj_Data
	BNE PRG043_B6F2
	JMP PRG043_B76D	 ; If zero, jump to PRG043_B76D

PRG043_B6F2:
	; Lowest 4 bits of SpecialObj_Data is non-zero

	DEC SpecialObj_Data,X	 ; SpecialObj_Data-- (mainly to effect the lowest 4 bits)

	LDA SpecialObj_Data,X
	LSR A
	LSR A
	LSR A
	LSR A
	TAY		 ; Y = the upper 4 bits (an object slot index)
	STY <Temp_Var2	 ; -> Temp_Var2

	LDA Objects_State,Y
	CMP #OBJSTATE_NORMAL
	BNE PRG043_B70D	 ; If this object is not in normal state, jump to PRG043_B70D

	LDA Objects_SprHVis,Y
	AND #%11000000
	BEQ PRG043_B710	 ; If this sprite does not have its two left sprites off-screen, jump to PRG043_B710

PRG043_B70D:

	; Referenced object is not in normal state or it is off-screen; destroy special object
	JMP SpecialObj_Remove

PRG043_B710:
	LDA Objects_FlipBits,Y
	AND #SPR_HFLIP
	STA <Temp_Var3	 ; Catch the horizontal flip bit of the referenced object -> Temp_Var3

	; Temp_Var1 = 0 to 1, based on whether object is horizontally flipped
	ASL A
	ASL A
	ROL A
	AND #$01
	STA <Temp_Var1

	LDA SpecialObj_ID,X
	CMP #SOBJ_HAMMER
	BEQ PRG043_B729	 ; If this is a hammer, jump to PRG043_B729

	; Otherwise, Temp_Var1 += 2
	INC <Temp_Var1
	INC <Temp_Var1

PRG043_B729:
	LDA Level_ObjectID,Y
	CMP #OBJ_HEAVYBRO
	BNE PRG043_B737	 ; If this not a Heavy Bro, jump to PRG043_B737

	; Otherwise, Temp_Var1 += 4
	LDA <Temp_Var1
	ADD #$04
	STA <Temp_Var1

PRG043_B737:
	LDA Level_ObjectID,Y
	CMP #OBJ_BOSS_BOWSER2
	BNE PRG043_BHXX	 ; If this not a hammer-throwing Bowser, jump to PRG043_BHXX

	; Otherwise, Temp_Var1 += 6
	LDA <Temp_Var1
	ADD #$06
	STA <Temp_Var1

PRG043_BHXX:
	; Set hammer starting X
	LDA Objects_X,Y
	LDY <Temp_Var1	
	ADD Hammer_XOff,Y
	STA SpecialObj_XLo,X

	LDY <Temp_Var2		 ; Y = referenced object slot index

	; Set hammer starting Y
	LDA Objects_Y,Y
	CLC
	LDY <Temp_Var1
	ADC Hammer_YOff,Y
	STA SpecialObj_YLo,X

	LDA #$00	; A = 0

	LDY SpecialObj_XVel,X
	BMI PRG043_B75A	 ; If hammer is traveling to the left, jump to PRG043_B75A

	LDA #SPR_HFLIP	; A = SPR_HFLIP

PRG043_B75A:
	CMP <Temp_Var3
	BEQ PRG043_B76A	 ; If hammer is flipped the same way as object, jump to PRG043_B76A

	; Reverse X velocity
	LDA SpecialObj_XVel,X
	JSR Negate
	STA SpecialObj_XVel,X

	INC SpecialObj_Var2,X

PRG043_B76A:
	JMP PRG043_B773	 ; Jump to PRG043_B773

PRG043_B76D:
	INC SpecialObj_Var1,X	; SpecialObj_Var1++

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity

PRG043_B773:
	JSR SObj_GetSprRAMOffChkVScreen	 ; Get a sprite RAM offset
	BEQ PRG043_B779	 ; If object is on the same vertical screen (see Temp_Var14 calculation), jump to PRG043_B779

	RTS		 ; Return

PRG043_B779:
	STY <Temp_Var2	 ; Sprite RAM offset -> 'Y'

	LDA SpecialObj_XVel,X

	LDY SpecialObj_ID,X
	CPY #SOBJ_HAMMER
	BEQ PRG043_B787	 ; If this is a hammer, jump to PRG043_B787

	EOR #$80	 ; Invert sign on X velocity

PRG043_B787:
	LSR A		 ; Shift down the bit
	AND #SPR_HFLIP	 ; Horizontal flip bit
	STA <Temp_Var1	 ; -> Temp_Var1

	CPY #SOBJ_HAMMER
	BNE PRG043_B798	 ; If this is not a hammer, jump to PRG043_B798

	LDY <Temp_Var2	 ; Y = Sprite RAM Offset

	JSR Hammer_Draw	 ; Draw hammer
	JMP PRG043_B7C5	 ; Jump to PRG043_B7C5

PRG043_B798:
	LDY <Temp_Var2	 ; Y = Sprite RAM Offset

	LDA SpecialObj_Var1,X
	AND #%00001100
	LSR A
	LSR A
	TAX		 ; X = 0 to 3

	; Set boomerang sprites attributes
	LDA <Temp_Var1
	EOR Boomerang_Attributes,X
	ORA #SPR_PAL1
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y

	LDA <Temp_Var1
	BEQ PRG043_B7B5	 ; If Temp_Var1 = 0, jump to PRG043_B7B5

	INX
	INX

PRG043_B7B5:
	TXA
	AND #$03
	TAX

	; Set boomerang sprites patterns
	LDA Boomerang_Patterns,X
	STA Sprite_RAM+$01,Y
	LDA Boomerang_Patterns+2,X
	STA Sprite_RAM+$05,Y

PRG043_B7C5:
	LDX <SlotIndexBackup	 ; X = special object slot index

	JSR SObj_Draw16x16	 ; Draw Boomerang

	LDA SpecialObj_Data,X
	AND #%00001111
	BNE PRG043_B826	 ; If lower 4 bits are not zero, jump to PRG043_B826 (RTS)

SObj_PlayerCollideIfViz:
	LDA SpecialObj_VisFlags,X
	BEQ SObj_PlayerCollide	; If not invisible in any way, jump to SObj_PlayerCollide
	
	; Invisible, don't hit player
	RTS

SObj_PlayerCollide:

	; Player to Special Object collision logic...

	TXA		 ; object slot index -> 'A'
	ADD <Counter_1	 ; Keep it interesting
	LSR A
	BCC PRG043_B826	 ; Every other tick, jump to PRG043_B826 (RTS)

	LDA Player_ReverseGrav
	ASL A
	TAY			; Y = 0 or 2 (regular gravity, reverse gravity)

	LDA <Player_Suit
	BEQ PRG043_B7E4	 ; If Player is small, jump to PRG043_B7E4

	LDA Player_IsDucking
	BNE PRG043_B7E4	 ; If Player is ducking, jump to PRG043_B7E4

	INY		 ; Y = 1 (otherwise)

PRG043_B7E4:
	LDA SpecialObj_YLo,X		; Special object Y
	ADD #$08			; +8
	SUB <Player_Y			; Subtract Player Y
	SUB SObjYOff_PlayerSize,Y	; Subtract Player height offset
	CMP SObj_VLimit,Y
	BGE PRG043_B843	 	; If result >= SObj_VLimit, jump to PRG043_B843 (RTS)

	LDA SpecialObj_XLo,X		; Special object X
	ADD #$06			; +6
	SUB <Player_X			; Subtract Player X
	SBC #$00			; Carry?
	CMP #16
	BGE PRG043_B843	 	; If result >= 16, jump to PRG043_B843 (RTS)

PRG043_B805:
	LDA Player_FlashInv	; If Player is flashing from being hit ...
	ORA Player_Statue	; ... if Player is a statue ...
	ORA <Player_HaltGame	; ... if gameplay is halted ...
	ORA Player_IsDying	; ... Player is dying ...
	ORA Player_OffScreen	; ... Player is off-screen ...
	ORA Player_Behind_En	; ... Player is legitimately hidden behind the scenes ...
	ORA <Temp_Var14		; ... or special object is not vertically on-screen ...
	BNE PRG043_B843	 	; ... jump to Player_Behind_En (RTS)

	LDA SpecialObj_ID,X
	CMP #SOBJ_MICROGOOMBA
	BNE PRG043_B827	 ; If this is not a microgoomba, jump to PRG043_B827

	; Microgooma sets to 5
	LDA #$05
	STA SpecialObj_Data,X

PRG043_B826:
	RTS		 ; Return


PRG043_B827:
	LDA Player_StarInv
	BNE PRG043_B844	 ; If Player is Star Man invincible, jump to PRG043_B844

	JSR Player_GetHurt	 ; Hurt Player!
	
	; Set carry
	SEC
	RTS

SpecialObj_Remove:

	; Special priority objects have alternate off-screen checking
	LDY SpecialObj_ID,X
	LDA SpecialObj_Flags-1,Y	; -1 since 0 = empty object...
	AND #SOBJFLAG_PRIOSPECOBJ
	BEQ SObj_NotPriority	; If object not a "priority special object", jump to SObj_NotPriority

	; Priority special objects need to flag so it can spawn again!
	LDY SpecialObj_Var1,X		; Get Var1 value (index into Level_ObjectsSpawned)
	LDA Level_ObjectsSpawned,Y
	AND #~$80	
	STA Level_ObjectsSpawned,Y	; Mark object as not spawned

SObj_NotPriority:

	; Remove special object
	LDA #$00
	STA SpecialObj_ID,X

	RTS		 ; Return

PRG043_B844:

	; Player is invincible; destroy the special object!

	; Play "kick" sound
	LDA #SND_PLAYERKICK
	STA Sound_QPlayer

PRG043_B84C:
	; Change to a "poof"
	LDA #SOBJ_POOF
	STA SpecialObj_ID,X

	; SpecialObj_Data = $1F
	LDA #$1f
	STA SpecialObj_Data,X

PRG043_B843:
	CLC		; Clear carry
	RTS		 ; Return


SObj_Wx16CustomCollide:

	; Some Wx16 thing to Special Object collision logic...
	; Generally intended to hack in fireball / shell hit logic

	; Temp_Var1 = Y
	; Temp_Var2 = X
	; Temp_Var3 = Width

	LDA SpecialObj_YLo,X		; Special object Y
	ADD #$08			; +8
	SUB <Temp_Var1			; Subtract check Y
	;SUB #16		; Subtract height offset 
	CMP #16
	BGE W16CC_NoHitCheck	 	; If result >= 16 (out of range vertically), jump to W16CC_NoHitCheck (RTS)

	LDA SpecialObj_XLo,X		; Special object X
	ADD #$06			; +6
	SUB <Temp_Var2			; Subtract check X
	SBC #$00			; Carry?
	CMP <Temp_Var3
	BGE W16CC_NoHitCheck	 	; If result >= 16, jump to W16CC_NoHitCheck (RTS)

	; Impact...
	SEC
	RTS

W16CC_NoHitCheck:
	CLC
	RTS


SObj_ScorePopUp:
	PHA		 	; Save input value
	STY <Temp_Var15	 	; Backup 'Y' -> Temp_Var15

	JSR Score_FindFreeSlot	; Get free Scores_Value slot

	PLA		 	; Restore input value
	STA Scores_Value,Y	; Store input value

	LDA SpecialObj_YLo,X
	SUB Level_VertScroll
	SUB #16
	CMP #192
	BLT PRG043_C47D	 ; If (sprite's Y - 16) < 192, jump to PRG043_C47D

	LDA #$05	 	 ; A = 5

PRG043_C47D:
	STA Scores_Y,Y	 ; Set score Y

	; Set score X to spawning object
	LDA SpecialObj_XLo,X
	SUB <Horz_Scroll
	STA Scores_X,Y	 

	; Set score counter to $30
	LDA #$30
	STA Scores_Counter,Y

	LDY <Temp_Var15	; Restore 'Y'

	RTS		 ; Return


Hammer_Attributes:	.byte $00, SPR_HFLIP, SPR_HFLIP, SPR_HFLIP | SPR_VFLIP, SPR_HFLIP | SPR_VFLIP, SPR_VFLIP, SPR_VFLIP, $00

Hammer_Patterns:
	.byte $A1, $A3, $B9, $B9, $A3, $A1
	.byte $AF, $AF, $A1, $A3, $B9, $B9

BowserHammer_FlipBits:	.byte SPR_HFLIP, SPR_HFLIP | SPR_VFLIP, SPR_VFLIP, $00
BowserHammer_YOff:	.byte $00 ; NOTE: Next three values overlap into following table)
BowserHammer_XOff:	.byte $06, $06, $00, $00

Hammer_Draw:
	LDA SpecialObj_Var3,X
	BEQ Hammer_DrawRegular

	; If Var3 is set, draw Bowser Hammer
	;LDA #0
	;STA <Temp_Var2
	;STA <Temp_Var3
	
	LDA SpecialObj_Var1,X
	LSR A
	LSR A
	AND #$03
	TAX		 ; X = 0 to 3

	LDA BowserHammer_XOff,X	 ; Get X offset
	BIT <Temp_Var3	 ; Check for horizontal flip
	BVC PRG043_A453	 ; If no flip, jump to PRG043_A453

	EOR #$06	 ; Otherwise, invert X offset

PRG043_A453:
	ADD <Temp_Var2		 ; Apply X offset
	STA Sprite_RAM+$03,Y	 ; Set Hammer X

	LDA BowserHammer_YOff,X	 ; Get Y offset
	ADD Sprite_RAM+$00,Y	 ; Add to Sprite Y
	STA Sprite_RAM+$00,Y	 ; Update Sprite Y

	; Hammer pattern
	LDA #$d7
	STA Sprite_RAM+$01,Y

	LDA <Temp_Var3		; Get horizontal flip bit
	EOR BowserHammer_FlipBits,X	 ; XOR in the hammer flip bits
	
	ORA #SPR_PAL2
	STA Sprite_RAM+$02,Y
	
	LDA #$71
	STA Sprite_RAM+$05,Y
	
	RTS

Hammer_DrawRegular:
	LDA SpecialObj_Var1,X
	AND #%00011100
	LSR A
	LSR A
	TAX		 ; X = 0 to 7 (hammer's current frame)

	; Set upper and lower sprite attributes
	LDA <Temp_Var1
	EOR Hammer_Attributes,X
	ORA #SPR_PAL1
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y

	LDA <Temp_Var1
	BEQ PRG043_B888	 ; If no flip, jump to PRG043_B888

	; Otherwise, X += 4 (4 "frames" ahead on the hammer for the flip)
	INX
	INX
	INX
	INX

PRG043_B888:

	; Cap X 0 to 7
	TXA
	AND #$07
	TAX

	; Set upper sprite pattern
	LDA Hammer_Patterns,X
	STA Sprite_RAM+$01,Y

	; Set bottom sprite pattern
	LDA Hammer_Patterns+4,X
	STA Sprite_RAM+$05,Y

	RTS		 ; Return

Boomerang_XVelDelta:	.byte $01, -$01
Boomerang_XVelLimit:	.byte $20, $E0
Boomerang_YVelAccel:	.byte $01, -$01
Boomerang_YVelLimit:	.byte $12, -$12

Boomerang_Attributes:	.byte SPR_HFLIP | SPR_VFLIP, SPR_HFLIP | SPR_VFLIP, $00, $00

Boomerang_Patterns:
	.byte $8B, $8F, $89, $8D, $8B, $8F


SObj_Boomerang:

	; Load Boomerang's graphics
	LDA #$4e
	STA PatTable_BankSel+4

	LDA <Player_HaltGame
	BEQ PRG043_B8B7	 ; If gameplay is not halted, jump to PRG043_B8B7

	JMP PRG043_B773	 ; Jump to PRG043_B773 (Draw Boomerang)

PRG043_B8B7:
	LDA SpecialObj_Data,X
	AND #%00001111
	BEQ PRG043_B8C1	 ; If lower 4 bits of SpecialObj_Data = 0, jump to PRG043_B8C1

	JMP PRG043_B6F2	 ; Jump to PRG043_B6F2

PRG043_B8C1:
	INC SpecialObj_Var1,X	 ; Var1 ++

	LDA SndCur_Level2
	AND #SND_BOOMERANG
	BNE PRG043_B8D3	 ; If boomerang sound is currently playing, jump to PRG043_B8D3

	; Player boomerang sound
	LDA Sound_QLevel2
	ORA #SND_BOOMERANG
	STA Sound_QLevel2

PRG043_B8D3:
	LDA SpecialObj_Var2,X
	BMI PRG043_B904

	LDA SpecialObj_Timer,X
	BNE PRG043_B904	 ; If timer not expired, jump to PRG043_B904

	LDA SpecialObj_Var2,X
	AND #$01
	TAY		 ; Y = 0 or 1 (Boomerang Direction)

	; Accelerate Boomerang
	LDA SpecialObj_XVel,X
	ADD Boomerang_XVelDelta,Y
	STA SpecialObj_XVel,X

	CMP Boomerang_XVelLimit,Y
	BNE PRG043_B904	 ; If boomerang has not hit limit, jump to PRG043_B904

	; Set boomerang timer
	LDA #$30
	STA SpecialObj_Timer,X

	INC SpecialObj_Var2,X	 ; SpecialObj_Var2++ (change direction)

	LDA SpecialObj_Var3,X
	BEQ PRG043_B904	 ; If SpecialObj_Var3 = 0, jump to PRG043_B904

	; Boomerang is on the return
	LDA #$ff
	STA SpecialObj_Var2,X

PRG043_B904:
	LDA <Counter_1
	LSR A
	BCS PRG043_B92A	 ; Every other tick, jump to PRG043_B92A

	LDA SpecialObj_Var3,X
	CMP #$01
	BLT PRG043_B915

	LDY SpecialObj_YVel,X
	BEQ PRG043_B92A	 ; If Boomerang Y Vel = 0, jump to PRG043_B92A

PRG043_B915:
	AND #$01
	TAY		 ; Y = 0 or 1

	; Accelerate Boomerang Y Velocity
	LDA SpecialObj_YVel,X
	ADD Boomerang_YVelAccel,Y
	STA SpecialObj_YVel,X

	CMP Boomerang_YVelLimit,Y
	BNE PRG043_B92A	 ; If Boomerang Y Velocity is at limit, jump to PRG043_B92A

	INC SpecialObj_Var3,X	 ; SpecialObj_Var3++

PRG043_B92A:
	JSR SObj_AddXVelFrac	; Apply X Velocity
	JSR SObj_AddYVelFrac	; Apply Y Velocity
	JSR PRG043_B773	 	; Draw Boomerang

	LDA SpecialObj_Var2,X
	BPL PRG043_B979	 ; If SpecialObj_Var2 <> $FF, jump to PRG043_B979

	TXA		 ; Keep things interesting
 	ADD <Counter_1	
	LSR A	
	BCS PRG043_B979	 ; Every other tick, jump to PRG043_B979 (RTS)

	LDA SpecialObj_Data,X
	LSR A
	LSR A
	LSR A
	LSR A
	TAY		 ; Y = object slot index of boomerang thrower

	LDA Objects_State,Y
	CMP #OBJSTATE_NORMAL
	BNE PRG043_B979	 ; If thrower's state <> Normal, jump to PRG043_B979 (RTS)

	LDA Level_ObjectID,Y
	CMP #OBJ_BOOMERANGBRO
	BNE PRG043_B979	; If thrower's slot is not a boomerang brother (Anymore), jump to PRG043_B979 (RTS)

	; This is for the Boomerang brother to "catch"

	LDA SpecialObj_YLo,X
	ADD #8
	SUB Objects_Y,Y
	SUB #8
	CMP #16
	BGE PRG043_B979	 ; If boomerang Y diff >= 16, jump to PRG043_B979 (RTS)

	LDA SpecialObj_XLo,X
	ADD #8
	SUB Objects_X,Y
	SBC #0
	CMP #16
	BGE PRG043_B979 ; If boomerang X diff >= 16, jump to PRGO043_B979 (RTS)

	JMP SpecialObj_Remove	 ; Boomerang Bro caught boomerang

PRG043_B979:
	RTS		 ; Return


Fireball_Patterns:	.byte $65, $67, $65, $67
Fireball_Attributes:	.byte SPR_PAL1, SPR_PAL1, SPR_PAL1 | SPR_HFLIP | SPR_VFLIP, SPR_PAL1 | SPR_HFLIP | SPR_VFLIP

SObj_Fireball:
	LDA <Player_HaltGame
	BNE PRG043_BA33	 ; If gameplay halted, jump to PRG043_BA33

	; Gameplay not halted...

	INC SpecialObj_Var1,X	 ; SpecialObj_Var1++

	LDA SpecialObj_ID,X

	CMP #SOBJ_PIRANHAFIREBALL
	BEQ PRG043_BA2D	 ; If this is a piranha's fireball, jump to PRG043_BA2D

	CMP #SOBJ_FIRECHOMPFIRE
	BEQ PRG043_BA2D	 ; If this is a Fire Chomp's fireball, jump to PRG043_BA2D

	; Not a piranha's or Fire Chomp's fireball

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity

	LDA SpecialObj_YVel,X
	CMP #$30
	BPL PRG043_BA1A	 ; If fireball Y vel < $30, jump to PRG043_BA1A

	; Heavier gravity
	INC SpecialObj_YVel,X
	INC SpecialObj_YVel,X

PRG043_BA1A:
	LDA SpecialObj_ID,X
	CMP #SOBJ_FIREBROFIREBALL
	BNE PRG043_BA24	 ; If this is not Fire Bro's fireball, jump to PRG043_BA24

	JSR SObj_CheckHitSolid	 ; Bounce fireball off surfaces

PRG043_BA24:
	JMP PRG043_BA33	 ; Jump to PRG043_BA33

	JSR SObj_ApplyXYVelsWithGravity	 ; Apply X and Y velocities with gravity
	JMP PRG043_BA33	 ; Jump to PRG043_BA33

PRG043_BA2D:
	JSR SObj_AddXVelFrac	 ; Apply X velocity
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

PRG043_BA33:
	JSR SObj_GetSprRAMOffChkVScreen
	BNE PRG043_BA92	 ; If fireball isn't vertically on-screen, jump to PRG043_BA92

	JSR SObj_SetSpriteXYRelative	 ; Special Object X/Y put to sprite, scroll-relative

	LDA SpecialObj_ID,X
	CMP #SOBJ_FIRECHOMPFIRE
	BNE PRG043_BA55	 ; If this is not a Fire Chomp's fireball, jump to PRG043_BA55

	LDA Level_NoStopCnt
	LSR A
	LSR A
	PHP

	LDA PatTable_BankSel+4
	CMP #249
	BNE Chompfire_NotMagiblot

	; Magiblot alternative
	PLP

	LDA #$95	 ; A = $89 (first fireball pattern)
	BCC PRG043_BA4D	 ; 4 ticks on, 4 ticks off; jump to PRG043_BA4D

	LDA #$97	 ; A = $8B (second fireball pattern)
	BNE PRG043_BA4D

Chompfire_NotMagiblot:
	; Fire Chomp's fireball only...
	PLP

	LDA #$89	 ; A = $89 (first fireball pattern)

	BCC PRG043_BA4D	 ; 4 ticks on, 4 ticks off; jump to PRG043_BA4D

	LDA #$8b	 ; A = $8B (second fireball pattern)

PRG043_BA4D:
	STA Sprite_RAM+$01,Y	 ; Set fireball pattern

	LDA #$01	; A = 1
	JMP PRG043_BA6E	 ; Jump to PRG043_BA6E

PRG043_BA55:
	LDA SpecialObj_XVel,X
	LSR A
	AND #SPR_HFLIP	 ; Flip based on X velocity
	PHA		 ; Save flip

	LDA SpecialObj_Var1,X
	LSR A
	LSR A
	AND #$03
	TAX		 ; X = 0 to 3

	; Set fireball pattern
	LDA Fireball_Patterns,X
	STA Sprite_RAM+$01,Y

	PLA		 ; Restore flip
	EOR Fireball_Attributes,X

PRG043_BA6E:

	; Set fireball attributes
	STA Sprite_RAM+$02,Y

	LDX <SlotIndexBackup	 ; X = special object slot index

	LDA <Player_Suit
	CMP #$06
	BNE PRG043_BA8F	 ; If Player is not wearing the Hammer Suit, jump to PRG043_BA8F

	LDA Player_IsDucking
	BEQ PRG043_BA8F	 ; If Player is NOT ducking (immunity to fireballs), jump to PRG043_BA8F

	LDA Player_StarInv
	PHA		 ; Save Player's Star Man invincibility status

	; Collide with it like Player were invincible!  (Visually the shell protects him)
	LDA #$10
	STA Player_StarInv
	JSR SObj_PlayerCollide

	; Restore actual Star Man invincibility
	PLA
	STA Player_StarInv

	RTS		 ; Return

PRG043_BA8F:
	JMP SObj_PlayerCollide	 ; Do Player-to-Fireball collision and don't come back!

PRG043_BA92:
	RTS		 ; Return

Poof_Patterns:	.byte $47, $45, $43, $41

SObj_Poof:
	LDA SpecialObj_Data,X
	BNE PRG043_BA9F	 ; If data > 0, jump to PRG043_BA9F

	JMP SpecialObj_Remove	 ; Otherwise, remove the puff

PRG043_BA9F:
	LDA <Player_HaltGame
	BNE PRG043_BAA6	 ; If gameplay halted, jump to PRG043_BAA6

	DEC SpecialObj_Data,X	 ; Data--

PRG043_BAA6:
	JSR SObj_GetSprRAMOffChkVScreen
	BNE PRG043_BAD6		; If puff is vertically off-screen, jump to PRG043_BAD6

	JSR SObj_Draw16x16	 ; Prep puff sprite

	; Set puff attributes on left sprite
	LDA Level_NoStopCnt
	LSR A
	LSR A
	LSR A
	ROR A
	AND #SPR_VFLIP
	STA <Temp_Var1
	LDA #SPR_PAL1
	ORA <Temp_Var1
	STA Sprite_RAM+$02,Y

	; Set puff attributes on right sprite
	EOR #(SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAM+$06,Y

	LDA SpecialObj_Data,X
	LSR A
	LSR A
	LSR A
	TAX

	; Set poof patterns
	LDA Poof_Patterns,X
	STA Sprite_RAM+$01,Y
	STA Sprite_RAM+$05,Y

	LDX <SlotIndexBackup	; X = special object slot index

PRG043_BAD6:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_GetSprRAMOffChkVScreen
;
; Gets an appropriate sprite RAM offset and also returns zero if
; the object is on the same vertical screen as the Player
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SObj_SprRAMBase:
	.byte $08, $10, $00, $08, $10, $04, $0C, $14, $0C

SObj_GetSprRAMOffChkVScreen:
	LDY #$07	 ; Y = 7

	CPX #$09
	BEQ PRG043_BAED	 ; If special object slot = 9, jump to PRG043_BAED

	CPX #$03
	BLT PRG043_BAED	 ; If special object slot < 3, jump to PRG043_BAED

	LDY #$08	 ; Y = 8

PRG043_BAED:
	LDA SObj_SprRAMBase-1,X
	ADD Object_SprRAM-1,Y
	TAY		 ; Y = Sprite RAM offset

	CPX #$00
	BNE PRG043_BB1A	 ; If special object slot 0, jump to PRG043_BB1A

	JSR Object_GetRandNearUnusedSpr
	BNE PRG043_BB1A	 ; If sprite available, jump to PRG043_BB1A

	LDA SpecialObj_ID,X

	; If this special object is empty, or is a Nipper fireball/Piranha Fireball/Microgoomba, jump to PRG043_BB1A

	CMP #SOBJ_NIPPERFIREBALL
	BEQ PRG043_BB1A

	CMP #SOBJ_PIRANHAFIREBALL
	BEQ PRG043_BB1A

	CMP #SOBJ_MICROGOOMBA
	BEQ PRG043_BB1A

	CMP #$00
	BEQ PRG043_BB1A

	LDA RandomN,X
	AND #$03	; 0 to 3
	ASL A	
	ASL A	
	ASL A		; Multiply by 8
	TAY		; Y = 0, 8, 16, 24

PRG043_BB1A:
	LDA <Temp_Var14	; Return the relative Y Hi value

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_AddXVelFrac
;
; Adds the 4.4FP X velocity to X of special object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SObj_AddXVelFrac:
	LDA SpecialObj_XVel,X		; Get X Velocity  
	ASL A
	ASL A
	ASL A
	ASL A		 		; Fractional part shifted up
	ADD SpecialObj_XVelFrac,X
	STA SpecialObj_XVelFrac,X	; Add to special object's X vel fractional accumulator

	PHP		 ; Save CPU status

	; Basically amounts to an arithmetic shift right 4 places
	LDA SpecialObj_XVel,X	; Get X Velocity
	LSR A
	LSR A
	LSR A
	LSR A		 	; Whole part shifted down (integer)
	CMP #%00001000	; Check the sign bit
	BLT PRG043_BB39 ; If the value was not negatively signed, jump to PRG043_BB39
	ORA #%11110000	; Otherwise, apply a sign extension
PRG043_BB39:

	PLP		 ; Restore CPU status

	ADC SpecialObj_XLo,X
	STA SpecialObj_XLo,X ; Add with carry

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_AddYVelFrac
;
; Adds the 4.4FP Y velocity to Y of special object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SObj_AddYVelFrac:
	LDA SpecialObj_YVel,X		; Get Y Velocity
	ASL A
	ASL A
	ASL A
	ASL A		 		; Fractional part shifted up
	ADD SpecialObj_YVelFrac,X
	STA SpecialObj_YVelFrac,X	; Add to special object's X vel fractional accumulator

	PHP		 ; Save CPU status

	; Basically amounts to an arithmetic shift right 4 places
	LDA SpecialObj_YVel,X	; Get Y Velocity
	LSR A
	LSR A
	LSR A
	LSR A		 	; Whole part shifted down (integer)
	CMP #%00001000	; Check the sign bit
	LDY #$00	 ; Y = $00 (16-bit sign extension)
	BLT PRG043_BB60	 ; If the value was not negatively signed, jump to PRG043_BB60
	ORA #%11110000	; Otherwise, apply a sign extension

	DEY		 ; Y = $FF (16-bit sign extension)

PRG043_BB60:
	PLP		 ; Restore CPU status

	ADC SpecialObj_YLo,X
	STA SpecialObj_YLo,X ; Add with carry

	TYA		 ; Sign extension

	; Apply sign extension
	ADC SpecialObj_YHi,X
	STA SpecialObj_YHi,X

	RTS		 ; Return


	; Sets carry if solid was hit
SObj_CheckHitSolid:

	; Flag Blooper Kid as out of water until determined otherwise
	LDA #$01	 
	STA SObjBlooperKid_OutOfWater,X

	; Temp_Var6 = special object Y + 12
	LDA SpecialObj_YLo,X
	ADD #12
	STA <Temp_Var6

	; Aligned to grid -> Temp_Var3
	AND #$f0
	STA <Temp_Var3

	LDA SpecialObj_YHi,X
	ADC #$00	 ; Apply carry
	PHA		 ; Save Y Hi

	; Special object X + 4 -> Temp_Var5
	LDA SpecialObj_XLo,X
	ADD #$04
	SUB <Horz_Scroll	; -
	ADD <Horz_Scroll	; + ??
	STA <Temp_Var5

	LDA <Horz_Scroll_Hi
	ADC #$00	 ; Apply carry
	ASL A		 ; 2 bytes per screen (for Tile_Mem_Addr)
	TAY		 ; -> 'Y'

	; Low byte of Tile_Mem_Addr -> Temp_Var1
	LDA Tile_Mem_Addr,Y
	STA <Temp_Var1

	PLA		 ; Restore Y Hi

	AND #$01	 ; Only use 0 or 1 (only valid Y His in a non-vertical level)
	ADD Tile_Mem_Addr+1,Y	 ; Add to the high byte of Tile_Mem_Addr
	STA <Temp_Var2		 ; -> Temp_Var2

	; Form a row/column offset -> 'Y'
	LDA <Temp_Var5
	LSR A
	LSR A
	LSR A
	LSR A
	ORA <Temp_Var3
	TAY

	LDA [Temp_Var1],Y ; Get the tile here
	PHA		 ; Save it

	ASL A
	ROL A
	ROL A
	AND #$03
	TAY		 ; Y = tile quadrant
	STY <Temp_Var2	 ; -> Temp_Var2

	PLA		 ; Restore the tile value
	STA <Temp_Var1	 ; -> Temp_Var1
	
	CMP Tile_AttrTable,Y
	BLT PRG043_AEE0	 ; If this tile is not solid on top, jump to PRG043_AEE0

	CMP Tile_AttrTable+4,Y
	BLT PRG043_AECF	 ; If this tile is not solid on the sides/bottom, jump to PRG043_AECF

	; Tile is solid all around

	LDA SpecialObj_ID,X
	CMP #SOBJ_FIREBROFIREBALL
	BEQ PRG043_AEB3	 ; If this a Fire Bro's fireball (the only one that bounces on the floor), jump to PRG043_AEB3

	SEC		 ; Set carry

	RTS		 ; Return

PRG043_AEB3:
	INC SpecialObj_Data,X	 ; SpecialObj_Data++

	LDA SpecialObj_Data,X
	CMP #$02
	BNE PRG043_AEC0	 ; If SpecialObj_Data <> 2, jump to PRG043_AEC0

	JMP PRG043_AF02	 ; Jump to PRG043_AF02

PRG043_AEC0:
	; Fireball's Y -= 3
	DEC SpecialObj_YLo,X
	DEC SpecialObj_YLo,X
	DEC SpecialObj_YLo,X

PRG043_AEC9:
	; Bounce fireball!
	LDA #-$2C
	STA SpecialObj_YVel,X

PRG043_AECE:
	RTS		 ; Return

PRG043_AECF:

	; Tile solid only on top

	LDA SpecialObj_ID,X
	CMP #SOBJ_ALBABOMB
	BEQ PRG043_AECE		; Albatoss bombs want to know if anything's solid!
	
	CMP #SOBJ_FIREBROFIREBALL

	CLC		 ; Clear carry

	BNE PRG043_AECE	 ; If this is not the Fire Bro's fireball, jump to PRG043_AECE

	LDA <Temp_Var6
	AND #$0f	 ; Find Y relative to the tile
	CMP #$05
	BLT PRG043_AEC9	 ; If it's less than 5 pixels from the top, count as hit the floor, and bounce!

	RTS		 ; Return

PRG043_AEE0:

	; Tile not solid on top (literally, but likely assumes not solid on the side/bottom either)

	LDA SpecialObj_ID,X
	CMP #SOBJ_BLOOPERKID

	CLC		 ; Clear carry

	BNE PRG043_AEFC	 ; If this is not a Blooper Kid, jump to PRG043_AEFC

	; Blooper kid only...

	LDA Level_TilesetIdx
	ASL A
	ASL A	; TilesetIdx * 4
	ADD <Temp_Var2	; Add the quadrant
	TAY	; Y = offset into Level_MinTileUWByQuad

	LDA Level_MinTileUWByQuad,Y
	CMP <Temp_Var1
	BLT PRG043_AEFB	 ; If this tile is not considered underwater, jump to PRG043_AEFB (RTS)

	DEC SObjBlooperKid_OutOfWater,X	 ; Otherwise, SObjBlooperKid_OutOfWater = 0 (Blooper Kid is still in water!)

PRG043_AEFB:
	RTS		 ; Return

PRG043_AEFC:

	; SpecialObj_Data = 0
	LDA #$00
	STA SpecialObj_Data,X

	RTS		 ; Return


PRG043_AF02:

	; impact sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERBUMP
	STA Sound_QPlayer


	JMP PRG043_B84C	 ; Jump to PRG043_B84C ("Poof" away the fireball)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_CalcCoarseXDiff
;
; Calculates a "coarse" X difference with the Player,
; returning a one byte value that determines the
; difference in X/XHi coordinates in units of 4 pixels
; in Temp_Var15.  Temp_Var16 is set to $40 and the
; carry flag is set if the difference was negative.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCA2 
SObj_CalcCoarseXDiff:
	LDA SpecialObj_XLo,X	 
	SUB <Player_X	
	STA <Temp_Var15		; Temp_Var15 = difference between Object and Player X

	LDA SpecialObj_Var3,X	; Priority special objects ONLY!
	SBC <Player_XHi		; Calc diff between X His

	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit
	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit

	; Temp_Var15 now holds a difference between the Object and Player
	;  X coordinates in units of 4 pixels (works up to two screen
	; widths; anything greater and object was probably removed anyway)

	; Note the following only works because there is no way that bit 5 and 7
	; could be a part of the actual difference, just the sign factor, since
	; a level cannot be more than 10 screens in width.
	ASL A			; Shift remaining difference left 1; carry set means negative difference
	AND #$40
	STA <Temp_Var16		; Temp_Var16 being $40 also means negative difference

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_CalcCoarseYDiff
;
; Calculates a "coarse" Y difference with the Player,
; returning a one byte value that determines the
; difference in Y/YHi coordinates in units of 8 pixels.
; Returns Temp_Var15 in the format of a crude signed
; value for Y Hi in bit 6 and 7 
; [00 -> Y Hi = 0, 01 -> Y Hi = 1, 11 -> Y Hi = negative]
; and the base Y difference in the bits 0 - 5 (so units 
; of 8 pixels.)
; Temp_Var16 holds the raw difference in "Y Hi"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCB9
SObj_CalcCoarseYDiff
	LDA SpecialObj_YLo,X
	SUB <Player_Y	
	STA <Temp_Var15		 ; Temp_Var15 = difference between object's Y and Player's Y

	LDA SpecialObj_YHi,X
	SBC <Player_YHi	
	STA <Temp_Var16		 ; Temp_Var16 = difference between object's Y Hi and Player's Y Hi

	LSR A		 	; least significant bit of Y Hi -> carry

	ROR <Temp_Var15		; Temp_Var15 takes on the "Hi" value in its most significant bit

	LSR A			; next least significant bit of Y Hi -> carry

	ROR <Temp_Var15		; The new Temp_Var15's least significant bit is pushed into its bit 7

	; So now Temp_Var15 holds the main Y difference in its first 5 bits
	; Bit 6 and 7 form a signed portion of the "hi" value -- 00 -> Y Hi = 0, 01 -> Y Hi = 1, 11 -> Y Hi = negative

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_DetermineHorzVis
;
; Determines how many of the horizontal sprites of a special object 
; are invisible (off-screen)
;
; X = index of on-screen object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Pixel width minus 8 of objects
SObj_Widths:
	.byte  0	; 0
	.byte  8	; 1

	; Respective bit to set per width checked
SObj_WidthFlags:
	.byte %10000000	; 0
	.byte %01000000	; 1

SObj_DetermineHorzVis:
	LDY #1

PRG043_D7BD:
	LDA SpecialObj_XLo,X
	ADD SObj_Widths,Y
	STA <Temp_Var15		; Temp_Var15 = object's X + ??

	LDA SpecialObj_Var3,X
	ADC #$00	 
	STA <Temp_Var16		; Temp_Var16 = Object's X Hi with carry applied

	LDA <Temp_Var15
	CMP <Horz_Scroll
	LDA <Temp_Var16	
	SBC <Horz_Scroll_Hi
	BEQ PRG043_D7DE	 ; If sprite is not horizontally off-screen, jump to PRG043_D7DE

	; This sprite is off left/right of screen...
	LDA SpecialObj_VisFlags,X	 ; Get appropriate invisibility bit
	ORA SObj_WidthFlags,Y	 	; OR it
	STA SpecialObj_VisFlags,X	 ; Store it

PRG043_D7DE:
	DEY		 ; Y--
	BPL PRG043_D7BD	 ; While Y >= 0, loop

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_AltLvlMod
;
; Changes the alternate level to one of the AltLvlMod_List table
; entries when Player is within range of it.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ALMList	.macro
	.byte \1	; Alternate tileset
	.word \2	; Alternate layout
	.word \3	; Alternate objects
	.endm

AltLvlMod_List:
	ALMList 4, W201CL, W201CO		; 1
	ALMList 4, W201AL, W201AO		; 2
	ALMList 13, W102BAL, W102BAO		; 3 
	ALMList 14, W102BBL, W102BBO		; 4
	ALMList 5, GhostExitL, GhostExitO	; 5
	ALMList 6, W1F3CL, W1F3CO	; 6
	ALMList 8, W2F1FL, W2F1FO	; 7
	ALMList 2, W2F1DL, W2F1DO	; 8
	ALMList 2, W2F1EL, W2F1EO	; 9
	ALMList 4, W2G1CL, W2G1CO	; 10
	ALMList 2, W2F2EL, W2F2EO	; 11
	ALMList 2, W2F2CL, W2F2CO	; 12
	ALMList 2, W2F2GL, W2F2GO	; 13
	ALMList 4, W2F2HL, W2F2HO	; 14
	ALMList 10, W2Airship_BossL, W2Airship_BossO	; 15
	ALMList 5, W3BBL, W3BBO	; 16
	ALMList 5, W3BBL, W3BB2O	; 17
	ALMList 5, W3BBL, W3BB3O	; 18
	ALMList 7, W604BL, W604BO	; 19
	ALMList 3, W6F1BossL, W6F1BossO	; 20
	ALMList 5, W6G1AL, W6G1AO	; 21
	ALMList 5, W6G1CL, W6G1CO	; 22
	ALMList 8, W7F2CL, W7F2CO	; 23

	; Based on Object_CalcCoarseXDiff, for priority special objects ONLY!
	; i.e. requires Var3 to be a surrogate "X Hi"
PrioSpecObj_CalcCoarseXDiff:
	; Trigger when close enough X
	LDA SpecialObj_XLo,X	 
	SUB <Player_X	
	STA <Temp_Var15		; Temp_Var15 = difference between Object and Player X

	LDA SpecialObj_Var3,X	; ONLY FOR ALT LEVEL MOD, special X Hi storage!!
	SBC <Player_XHi		; Calc diff between X His

	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit
	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit

	; Temp_Var15 now holds a difference between the Object and Player
	; X coordinates in units of 4 pixels (works up to two screen
	; widths; anything greater and object was probably removed anyway)

	RTS


SObj_AltLvlMod:
	LDA Level_JctCtl
	BNE AltLvlMod_NoChange	; If a junction is occurring, don't allow changes

	JSR PrioSpecObj_CalcCoarseXDiff

	; Activate when Player is >= objX or <= objX+32 (to cover pipes)
	; In coarse units, 4 to -7
	LDA <Temp_Var15
	CMP #4
	BGS AltLvlMod_OutOfRange
	CMP #-7
	BLS AltLvlMod_OutOfRange

	; Player in-range

	; If Var2 = 1, already in range
	LDA SpecialObj_Var2,X
	BNE AltLvlMod_NoChange

	; Var2 = 1
	INC SpecialObj_Var2,X

	; Player is moving in range; swap out alternate into backup
	LDA Level_AltTileset
	STA Level_AltTSBackup

	LDA Level_AltLayout
	STA Level_AltLayBackup
	LDA Level_AltLayout+1
	STA Level_AltLayBackup+1

	LDA Level_AltObjects
	STA Level_AltObjBackup
	LDA Level_AltObjects+1
	STA Level_AltObjBackup+1

	; Pull new alternate info
	LDA SpecialObj_YLo,X		; Object Y is index in this case
	BEQ AltLvlMod_Self		; If zero, this is a self/loopback mod, and jump to AltLvlMod_Self

	; Multiply by 5
	ASL A			; x2
	ASL A			; x4
	ADD SpecialObj_YLo,X	; x5
	SUB #5			; We're always 1 ahead, so backtrack
	TAY			; -> 'Y'

	; Load up new alternates
	LDA AltLvlMod_List,Y
	STA Level_AltTileset

	LDA AltLvlMod_List+1,Y
	STA Level_AltLayout
	LDA AltLvlMod_List+2,Y
	STA Level_AltLayout+1

	LDA AltLvlMod_List+3,Y
	STA Level_AltObjects
	LDA AltLvlMod_List+4,Y
	STA Level_AltObjects+1

AltLvlMod_NoChange:
	RTS

AltLvlMod_Self:

	; Load self
	LDA Level_Tileset
	STA Level_AltTileset

	LDA Level_LayPtrOrig_AddrL
	STA Level_AltLayout
	LDA Level_LayPtrOrig_AddrH
	STA Level_AltLayout+1

	LDA Level_ObjPtrOrig_AddrL
	STA Level_AltObjects
	LDA Level_ObjPtrOrig_AddrH
	STA Level_AltObjects+1

	RTS


AltLvlMod_OutOfRange:

	; If Var2 = 0, already out of range
	LDA SpecialObj_Var2,X
	BEQ AltLvlMod_NoChange

	; Var2 = 0
	DEC SpecialObj_Var2,X

	; Player is moving out of range; swap in alternate from backup
	LDA Level_AltTSBackup
	STA Level_AltTileset

	LDA Level_AltLayBackup
	STA Level_AltLayout
	LDA Level_AltLayBackup+1
	STA Level_AltLayout+1

	LDA Level_AltObjBackup
	STA Level_AltObjects
	LDA Level_AltObjBackup+1
	STA Level_AltObjects+1

	RTS


AltLvlMod_RemSizeL:	.byte $20, $D0
AltLvlMod_RemSizeH:	.byte $01, $FF

	; Based on Object_DeleteOffScreen
PrioSpecObj_OffScreenChk:
	LDA <Temp_Var2
	STA <Temp_Var1	 ; Temp_Var1 = 0 (In Object_DeleteOffScreen, would specify minimum width)
	TAY		 ; -> 'Y'

	LDA <Horz_Scroll
	ADD AltLvlMod_RemSizeL,Y	 ; Horizontal scroll plus offset

	ROL <Temp_Var1		 ; Temp_Var1 is 0/1

	CMP SpecialObj_XLo,X	 ; Compare to special object X
	PHP		 	; Save CPU state

	LDA <Horz_Scroll_Hi	 
	LSR <Temp_Var1		 
	ADC AltLvlMod_RemSizeH,Y	 ; Add high part of offset

	PLP		 	; Restore CPU state

	SBC SpecialObj_Var3,X	 ; Keeping an X Hi here; only works for Alt Level Mod!
	STA <Temp_Var1		 ; Temp_Var1 is X Hi difference

	LDY <Temp_Var2		 ; Y = Temp_Var2
	BEQ PRG043_D42E	 	; If zero, jump to PRG043_D42E

	EOR #$80	 	
	STA <Temp_Var1		; Temp_Var1 ^= $80

PRG043_D42E:
	LDA <Temp_Var1	
	
	; If positive flag is set, we should NOT delete
	; If negative flag is set, we should delete
TouchWarp_NoPurple:
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SObj_TouchWarp
;
; Transitions to the active alternate level to when Player is 
; within range of its effect area.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SObj_TouchWarp:
	LDA Level_TWCoolDown
	BEQ SOTW_Normal

	DEC Level_TWCoolDown
	RTS
	
SOTW_Normal:
	LDA <Player_HaltGame
	BNE TouchWarp_NoPurple	; If gameplay halted, jump to TouchWarp_NoPurple

	LDA <Map_EnterViaID
	CMP #MAPOBJ_PURPLECOMET
	BEQ TouchWarp_NoPurple	; If Purple Comet is active, jump to TouchWarp_NoPurple

	; Only junction once...
	LDA SpecialObj_Var2,X
	BNE TouchWarp_OutOfRange

	; Y = offset into Touch Warp jump table
	LDA SpecialObj_YLo,X
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!! 
	.word TouchWarp_WithinField	; 0
	.word TouchWarp_WithinField	; 1
	.word TouchWarp_Global		; 2
	.word TouchWarp_Global		; 3
	.word TouchWarp_ExitRight	; 4
	.word TouchWarp_ExitLeft	; 5

TouchWarp_ExitRight:
	; "Exit Right" means when Player hits the right edge of the final screen

	LDA <Player_XHi
	CMP <Level_Width
	BNE TouchWarp_OutOfRange	; If Player is not on final screen, jump to TouchWarp_OutOfRange

	LDA <Player_X
	CMP #$E8
	BLT TouchWarp_OutOfRange	; If Player is not close to the right edge of final screen, jump to TouchWarp_OutOfRange

	LDA #0
	STA <Player_XVel
	STA <Player_YVel

	BEQ TouchWarp_Junction		; Close enough; junction!

TouchWarp_ExitLeft:
	; "Exit Left" means when Player hits the left edge of the first screen

	LDA <Player_XHi
	BNE TouchWarp_OutOfRange	; If Player is not on first screen, jump to TouchWarp_OutOfRange

	LDA <Player_X
	CMP #$11
	BGE TouchWarp_OutOfRange	; If Player is not close to the left edge of first screen, jump to TouchWarp_OutOfRange

	LDA #0
	STA <Player_XVel
	STA <Player_YVel

	BEQ TouchWarp_Junction		; Close enough; junction!

TouchWarp_WithinField:

	; "Within field" means the Player is within the 16 pixel range of the object

	; Trigger when close enough X
	JSR PrioSpecObj_CalcCoarseXDiff

	; Activate when Player is >= objX or <= objX+16
	; In coarse units, 4 to -3
	LDA <Temp_Var15
	CMP #4
	BGS TouchWarp_OutOfRange
	CMP #-3
	BLS TouchWarp_OutOfRange

TouchWarp_Global:
	; Bit 0: Unset means top, set means bottom
	LDA SpecialObj_YLo,X
	AND #$01
	BEQ TouchWarp_CheckOffTop

	; Check if Player is off bottom
	LDA Player_AboveTop
	BNE TouchWarp_OutOfRange	; If Player_AboveTop <> 0 (Player is above the top of screen), jump to TouchWarp_OutOfRange

	; Check if Player has fallen low
	LDA <Player_SpriteY
	AND #$F0
	CMP #$B0
	BNE TouchWarp_OutOfRange	 ; If Player_SpriteY < $B0 && Player_SpriteY > $BF, jump to TouchWarp_OutOfRange

	; Player is low; junction to alternate!

TouchWarp_Junction:

	; Junction just like a door!
	LDA #3
	STA Level_JctCtl_Req ; Set appropriate value to Level_JctCtl_Req

	; Don't go again (otherwise causes a double-junction before the spec objs get cleared)
	INC SpecialObj_Var2,X

	LDA #$8
	STA Level_TWCoolDown

TouchWarp_OutOfRange:
	RTS

TouchWarp_CheckOffTop:

	; Check if Player is off top
	LDA <Player_YHi
	BPL TouchWarp_OutOfRange	; If Player_YHi > 0 (Player is NOT above the top of screen), jump to TouchWarp_OutOfRange

	; Player is high; junction to alternate!
	BNE TouchWarp_Junction	; Jump to TouchWarp_Junction

PokeyBody_Draw:
	JSR SObj_GetSprRAMOffChkVScreen
	JSR SObj_Draw16x16WithViz

	; Set petterns
	LDA #$85
	STA Sprite_RAM+$01,Y
	LDA #$87
	STA Sprite_RAM+$05,Y

	; Set attributes on sprites
	LDA #SPR_PAL2
	STA <Temp_Var1
	
	LDA SpecialObj_Data,X
	CMP #$EE
	BNE PokeyBody_NoDrawDead
	
	; Dead segment, vertical flip!
	LDA #(SPR_PAL2 | SPR_VFLIP)
	STA <Temp_Var1
	
PokeyBody_NoDrawDead:

	LDA <Temp_Var1
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y
	RTS

PokeyBody_SwayX:	.byte $00, $01, $00, -$01
PokeyBody_SwayXHi:	.byte $00, $00, $00,  $FF

SObj_PokeyBody:

	LDA Player_HaltGame
	BNE PokeyBody_Draw

	; Var1 = index of object of parent Pokey
	; Var2 = Y offset
	; Var3 = X Hi
	; Data = Segment linkage -- referencing index to special objects, high nibble is prior, low nibble is next; $F means "no prior/next"; $EE - magic value meaning "dying"

	LDA SpecialObj_Data,X
	CMP #$EE
	BEQ PokeyBody_Dying		; If Data = $EE (normally impossible), Body segment is dying, jump to PokeyBody_Dying

	; Get parent Pokey...
	LDY SpecialObj_Var1,X
	LDA Objects_State,Y
	CMP #OBJSTATE_DEADEMPTY
	BNE PokeyBody_NotDead

	; Pokey got deleted somehow... follow suit!
	JMP SpecialObj_Remove

PokeyBody_Frozen:
	JSR PokeyBody_Draw

	LDA #SPR_PAL0
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y
	
	
	RTS


PokeyBody_NotDead:
	CMP #OBJSTATE_KILLED
	BNE PokeyBody_NotKilled

	; Match Pokey's head speed
	LDA Objects_XVel,Y
	STA SpecialObj_XVel,X
	LDA Objects_YVel,Y
	ASR A
	STA SpecialObj_YVel,X
	
	; Set self as dead
	LDA #$EE
	STA SpecialObj_Data,X

PokeyBody_Dying:
	; If Pokey was killed, fall off-screen
	JSR SObj_ApplyXYVelsWithGravity
	
	JMP PokeyBody_Draw

PokeyBody_NotKilled:
	LDA Objects_FrozenTimer,Y
	BNE PokeyBody_Frozen

	JSR PokeyBody_Draw

	LDA <Counter_1
	AND #$08
	BEQ PokeyBody_NoFlip

	LDA Sprite_RAM+$02,Y
	ORA #SPR_HFLIP
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y

	; Swap patterns
	LDA Sprite_RAM+$01,Y
	PHA
	LDA Sprite_RAM+$05,Y
	STA Sprite_RAM+$01,Y
	PLA
	STA Sprite_RAM+$05,Y

PokeyBody_NoFlip:

	JSR SObj_PlayerCollideIfViz
	
	; Body segments are always tied to parent's X and Y...
	LDY SpecialObj_Var1,X
	
	LDA Objects_Y,Y
	SUB SpecialObj_Var2,X
	STA SpecialObj_YLo,X
	LDA Objects_YHi,Y
	SBC #0
	STA SpecialObj_YHi,X

	
	LDA Objects_X,Y
	STA <Temp_Var1
	LDA Objects_XHi,Y
	STA <Temp_Var2

	; Sway
	LDA <Counter_1
	LSR A
	LSR A
	ADD <SlotIndexBackup
	AND #$03
	TAY
	
	LDA <Temp_Var1
	ADD PokeyBody_SwayX,Y
	STA SpecialObj_XLo,X
	LDA <Temp_Var2
	ADC PokeyBody_SwayXHi,Y
	STA SpecialObj_Var3,X

	LDA #8
	STA <Temp_Var3	; Width 8 for projectile
	
	LDY #1
PokeyBody_PProjLoop:

	LDA PlayerProj_ID,Y
	SUB #1
	CMP #2
	BGE PokeyBody_NoPProjHit	; If player projectile is not valid, jump to PokeyBody_NoPProjHit

	LDA PlayerProj_Y,Y
	STA <Temp_Var1
	LDA PlayerProj_X,Y
	STA <Temp_Var2

	JSR SObj_Wx16CustomCollide
	BCC PokeyBody_NoPProjHit

	; Weapon successfully hit!
	; Change to poof if not hammer
	LDA PlayerProj_ID,Y
	CMP #2
	BEQ PokeyBody_HammerHit
	
	LDA #3
	STA PlayerProj_ID,Y
	
PokeyBody_HammerHit:

	LDA <Player_Suit
	CMP #PLAYERSUIT_PENGUIN
	BNE PokeyBody_NotIce

	; Ice of course is a different behavior -- should commit freezing to head
	; which will in turn freeze the body segments
	
	; Get parent's index...
	LDY SpecialObj_Var1,X
	
	LDA #$FE
	STA Objects_FrozenTimer,Y

	RTS

PokeyBody_NotIce:
	JSR PokeyBody_Kill
	
	; Set object's velocity based on Player's velocity (sort of works)
	LDA PlayerProj_XVel,Y
	ASL A
	LDA #$0C
	BCC PRG043_A6EC	 ; If Player's X Velocity is negative, jump to PRG027_A6EC
	LDA #-$0C
PRG043_A6EC:
	STA SpecialObj_XVel,X
	
	
	RTS
	
PokeyBody_NoPProjHit:

	DEY
	BPL PokeyBody_PProjLoop	; While Y >= 0, loop


	; Check for impact of any shelled objects
	LDA #16
	STA <Temp_Var3	; Width 16 for shelled objects
	
	LDY #4
PokeyBody_ShellHit:
	LDA Objects_State,Y
	CMP #OBJSTATE_HELD
	BEQ PokeyBody_HeldHit		; If object is held by Player, jump to PokeyBody_HeldHit
	CMP #OBJSTATE_KICKED
	BNE PokeyBody_ObjNotKicked	; If object is not a kicked shell, jump to PokeyBody_ObjNotKicked
	
	LDA Objects_Timer2,Y
	BNE PokeyBody_ObjNotKicked	; If object is still on dampener mode, jump to PokeyBody_ObjNotKicked
	
PokeyBody_HeldHit:
	; Check for impact!
	LDA Objects_Y,Y
	STA <Temp_Var1
	LDA Objects_X,Y
	STA <Temp_Var2

	JSR SObj_Wx16CustomCollide
	BCC PokeyBody_ObjNotKicked

	; Shell successfully hit!
	JSR PokeyBody_Kill

	; Object will not collide again for 16 ticks (dampener I guess)
	LDA #16
	STA Objects_Timer2,Y

	LDA Objects_KillTally,Y
	ADD #5
	JSR SObj_ScorePopUp

	LDA Objects_State,Y
	CMP #OBJSTATE_HELD
	BNE PokeyBody_HitKickedObject

	; Held object should just die
	TYA
	TAX
	JSR ObjectKill_SetShellKillVars
	LDX <SlotIndexBackup
	RTS

PokeyBody_HitKickedObject:
	; Up the kill tally
	LDA Objects_KillTally,Y
	ADD #1
	STA Objects_KillTally,Y

	RTS

PokeyBody_ObjNotKicked:
	DEY
	BPL PokeyBody_ShellHit	; While Y >= 0, loop

	RTS



PokeyBody_Kill:
	TYA
	PHA

	; Body segment bounces upward a bit
	LDA #-$34
	STA SpecialObj_YVel,X

	; Play "kick" sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer
		
	; Inform parent of one less segment
	LDY SpecialObj_Var1,X
	LDA Objects_Var1,Y
	SUB #16
	STA Objects_Var1,Y


	; Doubly-linked list with indexes in 6502... whee...
	
	; P = Prior, T = This One, N = Next
	
	; P -> T -> N
	; P <- T <- N

	; Need to make Prior's "next" our "next"
	; Need to make Next's "prior" our "prior"

	; Make Prior's "next" our "next"
	LDA SpecialObj_Data,X
	BMI PokeyBody_KillNoPrev	; If there's no prior body segment, jump to PokeyBody_KillNoPrev
	
	PHA
	
	; Store our "next" -> Temp_Var8
	AND #$0F
	STA <Temp_Var8
	
	PLA
	
	; Make "prior" an index
	LSR A
	LSR A
	LSR A
	LSR A	
	TAY		; -> 'Y'

	; Reassign the Prior's "next" to our "next"
	LDA SpecialObj_Data,Y
	AND #$F0		; Clear your next
	ORA <Temp_Var8	; Use ours
	STA SpecialObj_Data,Y
	
PokeyBody_KillNoPrev:

	; Make Next's "prior" our "prior" (don't you love doubly linked lists??)
	LDA SpecialObj_Data,X
	AND #$0F	; Get "next"
	CMP #$0F
	BEQ PokeyBody_KillPushNextDone	; If there is no next, we don't even need to do the following loop, jump to PokeyBody_KillPushNextDone
	
	; Make "next" an index -> 'Y'
	TAY
	
	; Get our "prior" -> Temp_Var8
	LDA SpecialObj_Data,X
	AND #$F0
	STA <Temp_Var8

	; Reassign the Next's "prior" to our "prior"
	LDA SpecialObj_Data,Y
	AND #$0F		; Clear your prior
	ORA <Temp_Var8	; Use ours
	STA SpecialObj_Data,Y


	; Need to push down all "next" segments
PokeyBody_KillPushNextLoop:
	LDA SpecialObj_Data,X
	AND #$0F	; Check next index
	CMP #$0F
	BEQ PokeyBody_KillPushNextDone	; If no next segment, terminate

	; Next -> 'X'
	TAX

	; Decrease height, loop around
	LDA SpecialObj_Var2,X
	SUB #16
	STA SpecialObj_Var2,X	
	
	JMP PokeyBody_KillPushNextLoop

PokeyBody_KillPushNextDone:
	LDX <SlotIndexBackup
	
	; Hit by player projectile!
	LDA #$EE
	STA SpecialObj_Data,X
	
	PLA
	TAY

	RTS


SObj_Albabomb:
	JSR Albabomb_Draw
	
	LDA <Player_HaltGame
	BNE Albabomb_NotInRange

	LDA SpecialObj_Var1,X
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!! 
	.word Albabomb_Carry	; 0
	.word Albabomb_Drop		; 1
	.word Albabomb_Explode	; 2

Albabomb_Carry:
	JSR SObj_PlayerCollide
	BCC Albabomb_CarryCont	; If Player didn't touch bomb, jump to Albabomb_CarryCont
	
	INC SpecialObj_Var1,X
	JMP Albabomb_BlowUp

Albabomb_CarryCont:
	; Not falling...
	JSR SObj_CalcCoarseYDiff
	BPL Albabomb_NotInRange
	
	JSR SObj_CalcCoarseXDiff

	LDA <Temp_Var15
	ADD #2
	CMP #4
	BGE Albabomb_NotInRange	; If not in range to drop, jump to Albabomb_NotInRange

	; Drop!
	LDA #SND_PLAYERKICK
	STA Sound_QPlayer

	LDA #$50
	STA SpecialObj_Timer,X

	INC SpecialObj_Var1,X	; Next state
		
	LDA #0
	STA SpecialObj_YVel,X

	; Let go, Albatoss!
	LDY SpecialObj_Data,X
	LDA #$FF
	STA Objects_Var7,Y
	
Albabomb_NotInRange:
	RTS

Albabomb_Drop:
	JSR SObj_PlayerCollide
	LDA Player_QueueSuit
	BNE Albabomb_BlowUp
	
	LDA SpecialObj_Timer,X
	BEQ Albabomb_BlowUp

Albabomb_Falling:
	INC SpecialObj_YVel,X	 ; YVel++
	JSR SObj_AddYVelFrac	 ; Apply Y velocity

	JSR SObj_CheckHitSolid
	BCS Albabomb_BlowUp

	RTS
	
Albabomb_BlowUp:
	; Time to explode...
	LDA #$10
	STA SpecialObj_Timer,X
	STA RotatingColor_Cnt

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	INC SpecialObj_Var1,X	; Next state

	RTS

Albabomb_Explode:
	JSR SObj_PlayerCollide	 ; Do Player to explosion collision

	LDA SpecialObj_Timer,X
	BNE Albabomb_StillExploding

	; Done exploding
	; Remove special object

	JMP SpecialObj_Remove

Albabomb_StillExploding:
	RTS

Albabomb_Draw:
	JSR SObj_GetSprRAMOffChkVScreen
	JSR SObj_Draw16x16

	; Set patterns
	LDA SpecialObj_Var1,X	; State number
	AND #2		; 0 if state is 0 or 1, or 2
	ASL A
	ADD #$B9
	STA Sprite_RAM+$01,Y
	ADD #2
	STA Sprite_RAM+$05,Y

	; Set attributes on sprites
	LDA #SPR_PAL1
	STA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y

	RTS
