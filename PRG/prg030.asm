	; Overflow bank
	; Splitting some functionality to here

ObjState_Frozen30:

	LDA <Player_Suit
	CMP #PLAYERSUIT_PENGUIN
	BEQ ObjState_FrozenPenguinOK	; As long as Player is still a Penguin, jump to ObjState_FrozenPenguinOK
	
	; Sorry, no non-Penguins allowed
	LDA #0
	STA Objects_FrozenTimer,X
	RTS

ObjState_FrozenPenguinOK:
	; Easier to check here than when the weapon hit since we don't have the group-relative index over there
	; Even though it's wasteful to check this code repeatedly...
	LDY ObjGroupRel_Idx
	LDA ObjectGroup_Attributes4,Y
	AND #OA4_POOFFROZEN
	BEQ ObjFrozen_NoPoof	; If object should not "poof death" when frozen, jump to ObjFrozen_NoPoof

	; Oh, you should "poof" away?
	LDA #0
	STA Objects_FrozenTimer,X
	
	; Set timer to $1F 
	LDA #$1f
	STA Objects_Timer,X
	
	LDA #OBJSTATE_POOFDEATH
	STA Objects_State,X
	
Frozen_Cancel:
	RTS

ObjFrozen_NoPoof:
	LDA Objects_State,X
	CMP #OBJSTATE_KILLED
	BNE ObjFrozen_NotKilled
	
	JMP ObjFrozen_ForceSmash	; If object is in killed state, jump to ObjFrozen_ForceSmash
	
ObjFrozen_NotKilled:
	LDA <Player_HaltGame
	PHA						; Backup Player_HaltGame (in case gameplay actually IS halted!)
	
	INC <Player_HaltGame	; Make sure it's set! (Enemy needs to "believe" that gameplay is halted)

	JSR_THUNKC 0, ObjState_DoState	; Act like gameplay halted (it is for you sucka)

	PLA
	STA <Player_HaltGame	; Restore Player_HaltGame

	; ... you're still frozen, though (if FrozenTimer > 0!)	
	LDA Objects_FrozenTimer,X
	BEQ Frozen_Cancel		; Special exception: Object can cancel frozen behavior (e.g. Fire Snake); jump to Frozen_Cancel (RTS)
	CMP #$FF
	BEQ ObjFrozen_Kicked		; If FrozenTimer = $FF, don't decrement!
	
	DEC Objects_FrozenTimer,X	; Decrement if < $FF
	
	CMP #$30
	BGE ObjFrozen_NotFlickering		; If FrozenTimer >= $30, don't flicker

	AND #2
	BNE ObjFrozen_Flicker	; Otherwise flicker as enemy has almost thawed

ObjFrozen_NotFlickering:
	; By this point we assume the object has been drawn and is using
	; only the standard 6 sprites... if you use more and want to
	; support freezing, you'll have to fix your additional sprites!
	LDY Object_SprRAM,X		; Offset to sprite RAM

	LDA #6
	STA <Temp_Var1			; Temp_Var1 = 6 (loop counter)
	
	; Set all 6 sprites...
ObjFrozen_SetPal0_Loop:
	LDA Sprite_RAM+$02,Y	; Get current attributes
	AND #~SPR_PAL3			; Clear any palette bits (set palette 0)
	STA Sprite_RAM+$02,Y	; Set new attributes
	
	INY
	INY
	INY
	INY						; Y += 4 (next sprite)
	
	DEC <Temp_Var1				; Temp_Var1--
	BNE ObjFrozen_SetPal0_Loop	; While Temp_Var1 > 0, loop!

ObjFrozen_Flicker:

	JSR PlayerFrznObj_Collide

	JMP_THUNKC 0, Object_DeleteOffScreen


ObjFrozen_Kicked:

	JSR_THUNKC 0, Object_MoveNotHalted

	JSR_THUNKC 0, Object_ShellAction
	
	LDA Objects_DetStat,X
	AND #$04
	BEQ ObjFrozen_KickedNotFloor	; If object did not hit floor, jump to ObjFrozen_KickedNotFloor
	
	JSR_THUNKC 0, Object_HitGround
	
ObjFrozen_KickedNotFloor:
	LDA Objects_DetStat,X
	AND #$03
	BEQ ObjFrozen_KickedNotWall		; If object did not hit a wall on either side, jump to ObjFrozen_KickedNotWall

ObjFrozen_ForceSmash:
	; Hit wall... going to take advantage of ice block's default shattering behavior here!
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X
	
	LDA #OBJ_ICEBLOCK
	STA Level_ObjectID,X
	
	LDA #0
	STA Objects_FrozenTimer,X

ObjFrozen_KickedNotWall:
	JMP ObjFrozen_NotFlickering

	; Copy from PRG000 because it's unavailable when we swap out bank 0, duh
	; Copies all brick bust data over to the second bust slots
	; (So up to 2 bricks may be scattering debris at once)
BrickBust_MoveOver30:
	LDA BrickBust_En
	STA BrickBust_En+1

	LDA BrickBust_YUpr
	STA BrickBust_YUpr+1

	LDA BrickBust_YLwr
	STA BrickBust_YLwr+1

	LDA BrickBust_X
	STA BrickBust_X+1

	LDA BrickBust_YVel
	STA BrickBust_YVel+1

	LDA BrickBust_XDist
	STA BrickBust_XDist+1

	LDA BrickBust_HEn
	STA BrickBust_HEn+1

PRG030_BAEE:
	RTS		 ; Return
	
	
	; Performs collision tests against FrznObj and enables Player
	; to stand on the FrznObj, hit head off FrznObj, etc.
	; Carry set if carrying collision occurred
PlayerFrznObj_Collide:
	JSR_THUNKC 0, Object_HitTest	 ; Test if Player is touching object
	BCC PRG030_BAEE	 	; If not, jump to PRG030_BAEE (RTS)

	; Test if Player is standing on top of FrznObj

	LDA <Player_SpriteY
	ADD #24
	CMP <Objects_SpriteY,X
	BGE PRG030_BABE	 ; If Player's bottom is beneath object's top, jump to PRG030_BABE

	LDA <Player_YVel
	BMI PRG030_BABD	 ; If Player is moving upward, jump to PRG030_BABD

	JSR Player_StandOnFrznObj	 ; Stand on FrznObj
	SEC		 ; Set carry (collided)

PRG030_BABD:
	RTS		 ; Return

PRG030_BABE:

	; Check if Player is hitting off bottom of FrznObj

	LDA #-$08	; A = -8 unless small or ducking

	LDY <Player_Suit
	BEQ PRG030_BAC9	 ; If Player is small, jump to PRG030_BAC9

	LDY Player_IsDucking
	BEQ PRG030_BACB	 ; If Player is NOT ducking, jump to PRG030_BACB

PRG030_BAC9:
	LDA #$08	 ; A = 8 if small or ducking

PRG030_BACB:
	ADD <Player_SpriteY
	ADD #8
	CMP <Objects_SpriteY,X
	BLT PRG030_BADC	 ; If Player's Sprite top is near object's top, jump to PRG030_BADC

	LDA <Player_YVel
	BPL PRG030_BADA	 ; If Player is falling, jump to PRG030_BADA

	; Player hits head off FrznObj
	LDA #$10
	STA <Player_YVel

PRG030_BADA:
	CLC		 ; Clear carry (no collision)
	RTS		 ; Return

PRG030_BADC:

	JSR_THUNKC 0, Level_ObjCalcXDiffs

	INY		 ; Y = 1 or 2, depending on Player's relative position

	LDA <Pad_Holding
	AND #(PAD_LEFT | PAD_RIGHT)
	STA <Temp_Var1	 ; Temp_Var1 is non-zero if Player is pressing left/right

	CPY <Temp_Var1	 ; Check if Player is pressing a direction favorable to his position

	CLC		 ; Clear carry (no collision)

	BNE PRG030_BAEF	 ; If Player is pressing against it, jump to PRG030_BAEF (halt Player's movement)

	; Player pushing with FrznObj
	LDA PlayerPushWithFrznObj_XVel-1,Y
	STA <Player_XVel

	RTS		 ; Return

PRG030_BAEF:

	; Halt Player's movement
	LDA #$00
	STA <Player_XVel

	LDY ObjGroupRel_Idx
	LDA ObjectGroup_Attributes4,Y
	AND #OA4_FROZENCANTKICK
	BNE ObjFrozen_CantKick	; If object should not be kickable, jump to ObjFrozen_CantKick

	LDA Objects_FrozenTimer,X
	CMP #$FF
	BEQ ObjFrozen_CantKick	; If object is already kicked, jump to ObjFrozen_CantKick

	; Play kick sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	; Set frozen object to "kicked" mode
	LDA #$FF
	STA Objects_FrozenTimer,X

	; Have Player do kick frame
	LDA #$0c
	STA Player_Kick

	; Make sure Player is facing object he's kicking
	JSR_THUNKC 0, Level_ObjCalcXDiffs
	LDA PlayerKickFlipBits30,Y
	STA <Player_FlipBits

	LDA ObjectKickXVelMoving30,Y	 ; Get appropriate base X velocity for kick
	STA <Objects_XVel,X	 	; -> Object's X velocity

	EOR <Player_XVel
	BMI ObjFrozen_CantKick	 ; If the object's X velocity is the opposite sign of the Player's, jump to ObjFrozen_CantKick

	LDA <Player_XVel 	; Get the Player's X velocity
	STA <Temp_Var1		; -> Temp_Var1 (yyyy xxxx)
	ASL <Temp_Var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	ADD ObjectKickXVelMoving30,Y	 ; Add base "moving" X velocity of object
	STA <Objects_XVel,X	 ; Set as object's X velocity


ObjFrozen_CantKick:
	RTS		 ; Return

	; Set appropriate flip bits based on object's relative position to Player
PlayerKickFlipBits30:	.byte $00, $40

	; X velocities depending on kick direction, added to by half of Player's X velocity
ObjectKickXVelMoving30:	.byte -$30, $30

PlayerPushWithFrznObj_XVel:	.byte $04, -$04

Player_StandOnFrznObj:
	LDA #28
	STA <Temp_Var1

	LDA Level_ObjectID,X
	CMP #OBJ_POKEY
	BNE FrozenObj_NotPokey
	
	; Hack for Pokey: The head is offset by the value in Var1
	LDA <Temp_Var1
	ADD Objects_Var1,X
	STA <Temp_Var1

FrozenObj_NotPokey:
	; Set Player to object's Y - 31
	LDA <Objects_Y,X	 
	SUB <Temp_Var1
	STA <Player_Y
	LDA <Objects_YHi,X
	SBC #$00
	STA <Player_YHi

	; Flag Player as NOT mid-air
	LDY #$00
	STY <Player_InAir

	LDA Objects_FrozenTimer,X
	CMP #$FF
	BNE PRG030_AA85		; If object has not been kicked, jump to PRG030_AA85


	; Only do this part if the object is in kicked mode...

	LDA Object_XVelCarry
	BPL PRG030_AA7B	

	DEY		 ; Y = -1 (provides a sort of carry if Player's X Velocity caused one)

PRG030_AA7B:
	; Add to Player_X, with carry
	ADD <Player_X
	STA <Player_X
	TYA
	ADC <Player_XHi
	STA <Player_XHi

PRG030_AA85:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player_32PP_BumpCheck
;
; When doing the shifting maze, check if Player should be bumped
; up by a floor appearing under his feet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Player_32PP_BumpCheck:
	LDA Level_SlopeEn
	BNE PBC_Sloped

	; Get tile where Player is standing...
	LDA <Temp_Var16
	STA ObjTile_DetXLo
	LDA <Temp_Var15
	STA ObjTile_DetXHi

	LDA <Temp_Var14
	ADD #16
	ADD <Vert_Scroll
	STA ObjTile_DetYLo
	LDA <Temp_Var13
	STA ObjTile_DetYHi

	JSR_THUNKC 0, Object_DetectTileManual
	LDA <Level_Tile
		
	PHA
	ASL A
	ROL A
	ROL A		 ; Upper 2 bits shift right 6, effectively
	AND #%00000011	 ; Keep these bits, i.e. "tile quadrant"
	TAY
	PLA
	CMP Tile_AttrTable,Y
	BLT Player_32PP_NoBumpChk

	; Bump Player up!
	;DEC <Player_Y
	
	; No longer on 32PP floor...
	DEC Temp_VarNP0
	
Player_32PP_NoBumpChk:
	RTS
	
PBC_Sloped:

	; Flag Player as standing on 32PP sloped ground
	INC Level_32PPSlopeFlag

	; Get tile where Player is standing...
	LDA <Temp_Var16
	STA ObjTile_DetXLo
	LDA <Temp_Var15
	STA ObjTile_DetXHi

	LDA <Temp_Var14
	ADD #16
	ADD <Vert_Scroll
	STA ObjTile_DetYLo
	LDA <Temp_Var13
	STA ObjTile_DetYHi

	JSR_THUNKC 0, Object_DetectTileManual
		
	TXA
	PHA
	TYA
	PHA
	LDA <Player_Slopes
	PHA

	LDA #0
	STA <Temp_Var1

	LDA #$FF
	STA <Player_Slopes
	
	LDA Level_Tile
	STA <Temp_Var2
	JSR_THUNKC 0, PGSAT_GetSlope

	LDA <Player_Slopes
	CMP #1
	BLS PBC_NoSlopeFound	; If slope was background slope (0) or no slope ($FF), jump to PBC_NoSlopeFound

	LDA Player_InAir
	BNE PBC_NoSlopeFound
	
	; Slope is rising up behind Player; no longer on 32PP floor
	DEC Level_32PPSlopeFlag

PBC_NoSlopeFound:
	PLA
	STA <Player_Slopes
	PLA
	TAY
	PLA
	TAX

	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_32PP_BumpCheck
;
; When doing the shifting maze, check if object should be bumped
; up by a floor appearing under its feet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_32PP_BumpCheck:
	LDA Level_SlopeEn
	BNE OBC_Sloped

	LDA Level_AScrlSelect
	CMP #4
	BNE Object_32PP_NoBump30	; If not in the shifting maze, jump to Object_32PP_NoBump

	TYA
	AND #$02
	BNE Object_32PP_NoBump30	; If testing a wall, jump to Object_32PP_NoBump

	LDA <Level_Tile
	PHA
	TYA
	PHA

	; One pixel above the 32PP
	LDA ObjTile_DetYLo
	PHA
	LDA #$B0-16
	ADD <Vert_Scroll
	STA ObjTile_DetYLo
	LDA ObjTile_DetYHi
	PHA
	LDA #0
	ADC #0
	STA ObjTile_DetYHi
	
	JSR_THUNKC 0, Object_DetectTileManual
	LDA <Level_Tile
	ASL A
	ROL A
	ROL A		 ; Upper 2 bits shift right 6, effectively
	AND #%00000011	 ; Keep these bits, i.e. "tile quadrant"
	TAY
	LDA <Level_Tile
	CMP Tile_AttrTable,Y
	BLT Object_32PP_NoBumpChk
	
	; No longer on 32PP floor...
	LDA <Objects_DetStat,X
	AND #~$80
	STA <Objects_DetStat,X
	
Object_32PP_NoBumpChk:
	PLA
	STA ObjTile_DetYHi
	PLA
	STA ObjTile_DetYLo

	PLA
	TAY
	PLA
	STA <Level_Tile

Object_32PP_NoBump30:

OBC_Sloped:	; FIXME
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TimeBonus_Score30
;
; Converts your time remaining to score bonus, but only if there
; is no BGM playing!  Also resets 'X' to object slot index.
; "BEQ" branches after this function if the clock is at 000.
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TimeBonus_Score30:
	LDY #$01	 ; Y = 1 (most significant or middle digit of time is non-zero)

	LDA Level_TimerMSD
	ORA Level_TimerMid
	BNE PRG030_C422	 ; If most significant or middle digit of time is non-zero, jump to PRG030_C422

	INY		 ; Y = 2 (most significant and middle digit of time are zero)

PRG030_C422:
	ORA Level_TimerLSD
	BEQ PRG030_C446	 ; If all time digits are zero, jump to PRG030_C446 (RTS)

	TYA		 ; A = Y
	TAX		 ; X = A = 1 or 2

	LDA (TimeBonus_Score - 1),X	 ; Get appropriate score bonus
	STA Score_Earned	 	; Push into score buffer
 
PRG030_C42F:
	DEC Level_TimerMSD,X	; Decrement off middle or least significant digit
	BPL PRG030_C43C	 	; If digit is >= 0, jump to PRG030_C43C

	LDA #$09	 
	STA Level_TimerMSD,X	; Otherwise, reload it with 9

	DEX		 ; X--
	BPL PRG030_C42F	 ; While X >= 0, loop!

PRG030_C43C:
	LDX <SlotIndexBackup	 ; Restore 'X' as object slot index

	; Play tick sound
	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP	
	STA Sound_QLevel1

PRG030_C446:
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_TriggerEndWorld
;
; Object will invalidate the Player checkpoint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_InvalidateCP:
	
	; Invalidate the checkpoint for this Player
	LDY Player_Current
	LDA LevCP_ByPlayer,Y
	TAY		; Y = offset to this Player's checkpoint data
	LDA #$FF
	STA LevCP_ID,Y	; Invalidate checkpoint for this Player
	
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_TriggerEndWorld
;
; Object will trigger the End-of-World sequence
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_TriggerEndWorld:

	JSR Object_InvalidateCP

	LDA #0
	STA Map_ReturnStatus
	STA Cine_ToadKing
	
	LDA #1
	STA Level_ExitToMap

	; Only trigger end-of-world sequence if you haven't already completed this level
	LDA Level_IsComplete
	BNE OBEW_SkipEnder	; If level is already complete, jump to OBEW_SkipEnder
	
	INC Player_FallToKing

OBEW_SkipEnder:
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_InitAction_Do
;
; Performs whatever is requested by the level as an initial action
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_InitAction_JumpTable:
	.word LevelInit_DoNothing	; 0 - Do nothing
	.word LevelInit_StartSliding	; 1 - Start level sliding (if able by power-up)
	.word LevelInit_PipeExitTop	; 2 - Start by exiting top of pipe
	.word LevelInit_PipeExitBottom	; 3 - Start by exiting bottom of pipe
	.word LevelInit_PipeExitRight	; 4 - Start by exiting right of pipe
	.word LevelInit_PipeExitLeft	; 5 - Start by exiting left of pipe
	.word LevelInit_Airship		; 6 - Airship intro run & jump init
	.word LevelInit_Airship_Board	; 7 - Boarding the Airship

Level_InitAction_Do30:
	LDA Level_InitAction
	ASL A		
	TAY		; Y = Level_InitAction << 1 (2 byte index)

	; Copy jump address into Temp_Var1/2
	LDA Level_InitAction_JumpTable,Y
	STA <Temp_Var1
	LDA Level_InitAction_JumpTable+1,Y
	STA <Temp_Var2

	LDA #$00
	STA Level_InitAction	; Level_InitAction = 0 (same memory gets used as Player_Slide after this!)

	JMP [Temp_Var1]		; Jump appropriately...


LevelInit_StartSliding:
	LDY <Player_Suit
	LDA PowerUp_Ability,Y
	AND #$02
	BNE LevelInit_DoNothing	; If this powerup is not able to slide on slopes, jump to LevelInit_DoNothing

	INC Player_Slide	 ; Otherwise, begin sliding...

LevelInit_DoNothing:
	RTS		 ; Return

LevelInit_PipeExitTop:
	LDA #$83	 ; A = $83 (sets Level_PipeMove)
	LDY #$01	 ; Y = 1 (come out pipe from the top, sets Level_PipeExitDir)
	JMP PRG030_C324	 ; Jump to PRG030_C324

LevelInit_PipeExitBottom:
	LDA #$82	 ; A = $82 (sets Level_PipeMove)
	LDY #$02	 ; Y = 2 (come out pipe from the bottom, sets Level_PipeExitDir)
	JMP PRG030_C324	 ; Jump to PRG030_C324

LevelInit_PipeExitRight:
	LDA #$80	 ; A = $80 (sets Level_PipeMove)
	LDY #$03	 ; Y = 3 (come out pipe to the right, sets Level_PipeExitDir)
	JMP PRG030_C324	 ; Jump to PRG030_C324

LevelInit_PipeExitLeft:
	LDA #$81	 ; A = $81 (sets Level_PipeMove)
	LDY #$04	 ; Y = 4 (come out pipe to the left, sets Level_PipeExitDir)
	JMP PRG030_C324	 ; Jump to PRG030_C324

LevelInit_Airship:
	LDA #$01	 
	STA Level_AirshipCtl	 ; Level_AirshipCtl = 1
	STA Update_Request	 ; Update_Request = 1

	LSR A		 	; Essentially, A = 0
	STA <Vert_Scroll	; Vert_Scroll = 0
	RTS			; Return

LevelInit_Airship_Board:
	LDA #$04
	STA Level_AirshipCtl	; Level_AirshipCtl = 4

	LDA #SPR_HFLIP
	STA <Player_FlipBits	; Player face to the right
	STA <Player_InAir	; Flag Player as "in air"

	LDA #$90
	STA <Player_YVel	; Player_YVel = $90	; Throw Player upward
	STA <Player_X		; Player_X = $90

	LDA <Vert_Scroll
	ADD #$80
	STA <Player_Y		; Player_Y = Vert_Scroll + $80

	; Carry into Player_YHi if needed
	LDA #$00	
	ADC #$00	
	STA <Player_YHi

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelInit_EnableSlopes
;
; Enables slope tiles (different solidity set for 
; Hills / Underground styles)
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelInit_EnableSlopes30:
	LDY #$01	 ; Y = 1 (enable slopes)

	LDA Level_Tileset
	CMP #3
	BEQ PRG030_C347	 ; If Level_Tileset = 3 (Hills style), jump to PRG030_C347

	CMP #14
	BEQ PRG030_C347	 ; If Level_Tileset = 14 (Underground style), jump to PRG030_C347

	CMP #$05
	BNE PRG030_C345	 ; If Level_Tileset = 5 (pipe world plant infestation style), jump to PRG030_C345

	; Level_Tileset = 5...

	LDA Level_UnusedSlopesTS5	; Never set, so this is unused...
	CMP #$02
	BEQ PRG030_C347	 ; If Level_UnusedSlopesTS5 = 2, jump to PRG030_C347 (force slopes to be enabled on tileset 5)

PRG030_C345:
	LDY #$00	 ; Y = 0 (do not enable slopes)

PRG030_C347:
	STY Level_SlopeEn
	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_SetPlayerPUpPal
;
; Puts the palette required by the Player's current power-up into
; the graphics buffer.
; (moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Palette colors per power up level -- first byte is never used!
PowerUp_Palettes:
	.byte $00, $16, $36, $0F	; 0 - Mario default palette
	.byte $00, $2A, $36, $0F	; 1 - Luigi default palette
	.byte $00, $27, $36, $16	; 2 - Fire Flower
	.byte $00, $17, $36, $0F	; 3 - Leaf
	.byte $00, $21, $31, $02	; 4 - Penguin Suit
	.byte $00, $20, $36, $0F	; 5 - Bunny Ears
	.byte $00, $30, $27, $0F	; 6 - Hammer Suit
	.byte $00, $16, $36, $0F	; 7 - Toad default palette

Level_SetPlayerPUpPal30:
	LDY #$07	 ; Y = 7 (select statue palette)
	LDA Player_Statue
	BNE PRG030_C55E	 ; If Player is statue, jump to PRG030_C55E

	LDA <Player_Suit
	TAY		 ; Y = Player_Suit
	;CMP #PLAYERSUIT_RABBIT
	;BEQ PRG030_C55B	 ; If Player_Suit = PLAYERSUIT_RABBIT, jump to PRG030_C55B

	CMP #PLAYERSUIT_FIRE	 
	BGS PRG030_C55E	 ; If Player_Suit >= PLAYERSUIT_FIRE, jump to PRG030_C55E

PRG030_C55B:
	; If Player_Suit is 0 (small) or 1 (big), we load the default palette for the Player character
	LDX Player_Current
	LDY Player_Character,X
	CPY #2
	BLT PRG030_C55E	; If Player_Character < 2 (a Toad), jump to PRG030_C55E
	
	; Toad's default palette
	LDY #7

PRG030_C55E:
	LDX Graphics_BufCnt
	TXA
	ADD #$06
	STA Graphics_BufCnt	 ; Graphics_BufCnt += 6 more bytes coming in...

	; Going to send in a palette update

	; PPU Address $3F11 (make sure to match with Palette_Buffer offsets below!)
	LDA #$3f
	STA Graphics_Buffer,X
	LDA #$11
	STA Graphics_Buffer+1,X

	; Run of 3 bytes
	LDA #$03
	STA Graphics_Buffer+2,X

	; Terminator
	LDA #$00
	STA Graphics_Buffer+6,X

	TYA
	ASL A
	ASL A
	TAY	; Y <<= 2 (4 bytes per index)

	LDA PowerUp_Palettes+1,Y
	STA Graphics_Buffer+3,X
	STA Palette_Buffer+$11	 ; Also put into Palette_Buffer

	LDA PowerUp_Palettes+2,Y
	STA Graphics_Buffer+4,X
	STA Palette_Buffer+$12	 ; Also put into Palette_Buffer

	LDA PowerUp_Palettes+3,Y
	STA Graphics_Buffer+5,X
	STA Palette_Buffer+$13	 ; Also put into Palette_Buffer

	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player_WaterSplash
;
; When Player hits water, splash!
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Player_WaterSplash30:
	LDA <Player_SpriteY
	CMP #$b8
	BGE PRG030_C111	 ; If sprite Y >= $B8, jump to PRG030_C111 (RTS)

	LDA Splash_DisTimer
	BNE PRG030_C0F9	 ; If Splash_DisTimer > 0 (Player splashes disabled), jump to PRG030_C0F9

	STA <Temp_Var1	 ; Temp_Var1 = 0

	LDA <Player_Suit
	BEQ PRG030_C0C8	 ; If Player is small, jump to PRG030_C0C8

	LDA Player_IsDucking
	BEQ PRG030_C0CC	 ; If Player is not ducking, jump to PRG030_C0CC

PRG030_C0C8:

	; Player is small or ducking

	LDA #10
	STA <Temp_Var1	 ; Temp_Var1 = 10

PRG030_C0CC:
	LDA #$01
	STA Splash_Counter	 ; Splash_Counter = 1 (begin splash)

	LSR A
	STA Splash_NoScrollY	 ; Splash_NoScrollY = 0 (splash Y is relative to screen scroll)

	LDA Level_AScrlConfig
	BEQ PRG030_C0E7	 ; If no auto scroll effects are occurring, jump to PRG030_C0E7

	; Auto scroll effect active...

	LDA <Player_SpriteY
	CMP #136
	BLT PRG030_C0E7	 ; If Player_SpriteY < 136, jump to PRG030_C0E7

	LDA #147
	STA Splash_NoScrollY	 ; Splash_NoScrollY = 147 (splash Y is not relative to screen scroll, appropriate for fixed water at bottom)

	BNE PRG030_C0F1	 ; Jump (technically always) to PRG030_C0F1

PRG030_C0E7:
	LDA <Player_Y
	ADD <Temp_Var1	; Y offset
	AND #$F0	; align to grid
	ADD #$02	; +2

PRG030_C0F1:
	STA Splash_Y	 ; 147 or above formula -> Splash_Y 

	LDA <Player_X
	STA Splash_X	 ; Splash_X = Player_X

PRG030_C0F9:
	LDA <Player_YVel
	BMI PRG030_C111	 ; If Player Y velocity < 0 (Player traveling up), jump to PRG030_C111 (RTS)

	LDA #$00
	STA <Player_YVel ; Otherwise, halt movement

	LDY <Player_InAir
	BEQ PRG030_C107	 ; If Player is not mid air, jump to PRG030_C107

	STA <Player_XVel ; Otherwise, stop horizontal movement, too

PRG030_C107:

	; When Player hits water, a bubble is made

	LDY #$02	 ; Y = 2 (all bubble slots)

PRG030_C109:
	LDA Bubble_Cnt,Y
	BEQ PRG030_C118	 ; If this bubble slot is free, jump to PRG030_C118

PRG030_C10E:
	DEY		 ; Y--
	BPL PRG030_C109	 ; While Y >= 0, loop!

PRG030_C111:
	RTS		 ; Return


	; Y offsets
SplashBubble_YOff:	.byte 16, 22, 19

	; X offsets
SplashBubble_XOff:	.byte  0,  4, 11

PRG030_C118:
	LDA RandomN,Y	 	; Get random number
	ORA #$10
	STA Bubble_Cnt,Y	; Store into bubble counter

	; Set Bubble Y
	LDA <Player_Y
	ADC SplashBubble_YOff,Y
	STA Bubble_Y,Y
	LDA <Player_YHi
	ADC #$00
	STA Bubble_YHi,Y

	; Set Bubble X
	LDA <Player_X
	ADC SplashBubble_XOff,Y
	STA Bubble_X,Y
	LDA <Player_XHi
	ADC #$00
	STA Bubble_XHi,Y

	JMP PRG030_C10E	 ; Jump to PRG030_C10E


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PipeEnter_XYOffs
;
; X and Y offsets to "correct" Player entering pipe
; NOTE: Y offset only applied when Player is NOT small!
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; X and Y offsets to "correct" Player masking sprite when entering pipe
PipeEnter_XYOffs:
	.byte 16,   0	; right
	.byte  0,   0	; left
	.byte  0,  32	; up	<-- not applied if Player is small (rev grav) [RAS]
	.byte  0, -16	; down	<-- not applied if Player is small (normal grav)


	; Does common stuff to prepare to enter a pipe!
PipeEntryPrepare30:
	; RAS: Reverse gravity support -- reverse pipe up/down if Player is reversed
	LDA Player_ReverseGrav
	BEQ PipeEntry_NoRev

	; Only reversing up/down movements
	TXA
	AND #%00000010
	BEQ PipeEntry_NoRev

	; Up down movement!  Reverse it!
	TXA
	EOR #1
	TAX

PipeEntry_NoRev:
	STX Level_PipeMove	 ; Set appropriate pipe movement

	; Play pipe sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERPIPE
	STA Sound_QPlayer

	; If Y = 3, A = 4
	LDA #$04
	CPY #$03
	BEQ PRG008_BF49

	; If Y = 2, A = 5
	LDA #$05
	CPY #$02
	BEQ PRG008_BF49

	; If Y = 0, A = 2
	LDA #$02
	CPY #$00
	BEQ PRG008_BF49

	; Use A = 1 unless Level_PipeNotExit is set, in which case use A = 3
	LDA #$01	; A = 1 (pipe will exit level)
	LDY Level_PipeNotExit
	BNE PRG008_BF47		; If pipes in this level do NOT exit to map, jump to PRG008_BF47

	LDY LevelJctBQ_Flag
	BEQ PRG008_BF49	 ; If NOT in the Big Question Block area, jump to PRG008_BF49

PRG008_BF47:
	LDA #$03	 ; A = 3 (regular pipe mechanics)

PRG008_BF49:

	; Construct pipe movement
	ASL A
	ASL A
	ORA Level_PipeMove
	STA Level_PipeMove

	; Set timer while in pipe
	LDA #$3c
	LDY Player_Kuribo
	BEQ PlayerPipe_NoYoshi	; If Player is not on Yoshi, jump to PlayerPipe_NoYoshi
	
	; Skipping pipe transition on Yoshi; it's too much work :P
	LDA #$01
	
PlayerPipe_NoYoshi:
	STA Event_Countdown

	; X <<= 1 (pipe movement, shifted left 1)
	TXA
	ASL A
	TAX

	LDA <Player_X
	ADD PipeEnter_XYOffs,X	 ; Add appropriate X offset
	CPX #$04	 
	BGS PRG008_BF65	 	; If pipe movement is up/down, jump to PRG008_BF65

	AND #$F0	 ; Otherwise, align Player_X to grid

PRG008_BF65:
	STA <Pipe_PlayerX	; Update Player_X

	LDA Player_ReverseGrav
	BEQ PipeEntryPrep_NoRev

	; In reverse, we're concerned about going UP the pipe
	LDA <Player_Y
	CPX #$04	
	BNE PRG008_BF71	 ; If not an upward pipe, jump to PRG008_BF71

	LDY <Player_Suit
	BNE PRG008_BF71	 ; If Player is NOT small, jump to PRG008_BF71

	; Player is small / reverse gravity / upward
	ADD #16

	JMP PRG008_BF75	; Otherwise, jump to PipePrep_PlayerSmallChk

PipeEntryPrep_NoRev:
	LDA <Player_Y
	CPX #$06	
	BNE PRG008_BF71	 ; If not a downward pipe, jump to PRG008_BF71

	LDY <Player_Suit
	BEQ PRG008_BF75	 ; If Player is small, jump to PRG008_BF75

PRG008_BF71:
	ADD PipeEnter_XYOffs+1,X ; Add appropriate Y offset

PRG008_BF75:
	AND #$F0	 ; Align Player_Y to grid

	CPX #$04	 
	BLS PRG008_BF7E	 ; If left/right pipe, jump to PRG008_BF7E

	SUB #$01	 ; Move Player up one pixel 

PRG008_BF7E:
	STA <Pipe_PlayerY ; Set Pipe_PlayerY

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_Initialize
; 
; Actual level initialization; the check whether it is needed
; remained in bank 8
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_XStarts:
	.byte $18, $70, $D8, $80

Level_Initialize30:
	LDA #0
	STA Level_ChangeReset ; Set Level_ChangeReset = 0 (trigger scene-change reset)

	LDA #$28
	STA Player_SprOff ; Player sprite rooted at offset $28


	; Set player power up based on current suit on map
	LDX Player_Current
	LDA World_Map_Power,X
	STA <Player_Suit 	

	; Set power up's correct palette
	JSR Level_SetPlayerPUpPal30

	LDA #SPR_HFLIP
	STA <Player_FlipBits	 ; Player_FlipBits = $40 (face right)

	; RAS: Checkpoint override if Level_SelXStart < 0 (means use existing Player_X)
	LDY Level_SelXStart
	BMI Checkpoint_NoSetX

	; Set Player_X based on Level_SelXStart
	LDA Level_XStarts,Y
	STA <Player_X
	
	; If we have a start action (mainly pipe), don't center Player because that causes messes
	LDA Level_InitAction
	CMP #4	; exiting right of pipe
	BEQ LevInit_PipeLRStart_Fix
	CMP #5	; exiting left of pipe
	BNE Checkpoint_NoSetX

	LDA <Player_X
	AND #$F0
	STA <Player_X
	
LevInit_PipeLRStart_Fix:

Checkpoint_NoSetX:
	LDA <Player_X
	STA <Player_XStart	; Also set Player_XStart
	
	JSR Level_InitAction_Do30	; Do whatever action this level wants at the start, if any
	
	LDA Map_Power_Disp
	CMP #$08
	BNE PRG030_C277	 ; If Map_Power_Disp <> 8 (P-Wing), jump to PRG030_C277

	; Max "Power"
	LDA #$7f	
	STA Player_Power ; Player_Power = $7F

	; Infinite flight time
	LDA #$ff
	STA Player_FlyTime ; Player_FlyTime = $FF

PRG030_C277:
	JSR LevelInit_EnableSlopes30	 ; Enable slopes if style calls for it

PRG030_C27A:
	LDA Level_7Vertical
	BEQ PRG030_C29E	 	; If level is not vertical, jump to PRG030_C29E

	LDY <Player_YHi		 ; Y = Player_YHi

	; Stores the vertical screen offset into Level_VertScrollH and Level_VertScroll
	LDA VertLevel_ScreenH,Y
	STA Level_VertScrollH
	LDA VertLevel_ScreenL,Y	
	STA Level_VertScroll	

	LDA <Player_Y
	LDY <Player_YHi
	JSR LevelJct_GetVScreenH2
	STY <Player_YHi
	STA <Player_Y

	RTS		 ; Return

PRG030_C29E:

	LDA <Vert_Scroll
	STA Level_VertScroll	; Level_VertScroll = Vert_Scroll

	LDA <Vert_Scroll_Hi
	STA Level_VertScrollH	; Level_VertScrollH = Vert_Scroll_Hi

	RTS		 ; Return

PRG030_C324:

	; Set as appropriate from entry
	STA Level_PipeMove
	STY Level_PipeExitDir
	JMP PRG008_A38E	 ; Jump to PRG008_A38E



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelJunction_PartialInit
; 
; Performs some re-initialization required after entering a door
; or pipe and handles some airship intro stuff
; (Moved from bank 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelJunction_PartialInit30:
	JSR Level_InitAction_Do30	; Do whatever action this level wants at the start, if any

	LDA #$00
	STA LevelPartialInit	 ; LevelPartialInit = 0

	STA Level_HAutoScroll	 ; Disable auto horizontal scrolling
	STA Level_AScrlConfig	 ; Clear auto scroll configuration (no auto scroll)
	STA Player_SlideRate	 ; No slide
	STA Level_ChangeReset	 ; Do level scene change reset

	JSR Level_SetPlayerPUpPal30  ; Set power up's correct palette
	JSR PRG030_C27A		   ; Partial level initialization (basically continues after setting the power up)
	JSR LevelInit_EnableSlopes30 ; Enable slopes if needed (technically if they just jumped to PRG030_C277 they'd get that too?)

	LDA Level_AirshipCtl
	BEQ PRG030_C379	 ; If Level_AirshipCtl = 0, jump to PRG030_C379

	; While airship opening is occurring...
	LDA #$00	
	STA <Player_XVel		; Player_XVel = 0
	STA Level_InitAction		; Level_InitAction = 0
	JSR LevelInit_Airship_Board	; Board the airship

PRG030_C379:
	LDA Level_InitAction
	CMP #$06
	BNE PRG030_C383	 	; If Level_InitAction <> 6 (Run & Jump for the airship), jump to PRG030_C383

	JSR LevelInit_Airship	 ; Run & Jump for the airship
PRG030_C383:

	JSR PRG008_A38E	 
	
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_JunctionYoshi
;
; If Player was riding a Yoshi, make sure he still gets one!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_JunctionYoshi:
	LDA Player_Kuribo
	BEQ LJPI_NoYoshi
	
	LDX #4
LJPI_YoshiSearch:
	LDA Objects_State,X
	BEQ LJPI_Free

	DEX
	BNE LJPI_YoshiSearch	; While X > 0, loop! (Yoshi will end up in slot 0 if we have no other option)

LJPI_Free:
	; Put Yoshi here!
	JSR_THUNKC 0, Level_PrepareNewObject
	
	LDA #OBJ_YOSHI
	STA Level_ObjectID,X
	
	; Set Yoshi's state to normal
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X
	
	; Put him in ride mode
	LDA #2
	STA <Objects_Var4,X
	
	; Nothing in mouth!
	LDA #$FF
	STA Objects_Var6,X
	
	; Update Player_Kuribo
	INX
	STX Player_Kuribo

LJPI_NoYoshi:
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GhostHouse_Stairs
;
; Ghost House staircase logic
; In this bank just because there wasn't enough space left in PRG008
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GhostHouse_Stairs:

	LDY #0		; Y = 0 (adjusting for stairs, not in front)
	STY <Temp_Var1	; Temp_Var1 = 0 (rightward stair)

	LDA Player_OnStairs
	BNE StairsCont	; If Player already on stairs, jump to StairsCont

	; Check for stairway right based on right ground tile ONLY
	LDA Level_Tile_GndR
	CMP #TILE5_STAIRR1
	BEQ GHS_Under
	CMP #TILE5_STAIRR2
	BEQ GHS_Under

	INC <Temp_Var1	; Temp_Var1 = 1 (leftward stair)

	; Check for stairway left based on left ground tile ONLY
	LDA Level_Tile_GndL
	CMP #TILE5_STAIRL1
	BEQ GHS_Under
	CMP #TILE5_STAIRL2
	BEQ GHS_Under

	LDA <Player_InAir
	BNE GHS_NotStair	; If Player is in mid-air, can't start stairs, jump to GHS_NotStair

	; Check for left stair in front if facing left ONLY
	LDA Level_Tile_InFL
	CMP #TILE5_STAIRL1
	BEQ GHS_Front	; If stair is in front, jump to GHS_Front

	DEC <Temp_Var1	; Temp_Var1 = 0 (rightward stair)

	; Check for right stair in front if facing right ONLY
	LDA Level_Tile_InFL
	CMP #TILE5_STAIRR1
	BEQ GHS_Front	; If stair is in front, jump to GHS_Front

GHS_NotStair:
	; If 'A' is non-zero, assumes stair detection has failed
	LDA #1
	RTS

StairCorrectYLo:	.byte   4,  -1
StairCorrectYHi:	.byte $00, $FF	; 16-bit sign extension

GHS_Front:
	INY	; Y = 1 (Adjusting for stairs, in front)

GHS_Under:
	; Newly touched stairs; correct position 
	LDA <Player_Y
	ADD StairCorrectYLo,Y
	STA <Player_Y
	LDA <Player_YHi
	ADC StairCorrectYHi,Y
	STA <Player_YHi

GHS_DisableTillClear:
	; Store X
	LDA <Player_X
	STA Player_OnStairsX

	; Temp_Var1 should be $00 or $02
	ASL <Temp_Var1

	; On stairs!
	LDA #$80	; Flags on stairs at all
	ORA <Temp_Var1	; $00 or $02 (if leftward stair)
	STA Player_OnStairs

	JMP StairsSkipFeetChk	; Jump to StairsSkipFeetChk (skips check on first round, assume stairs OK)

StairCheckTiles:	.byte TILE5_STAIRR1, TILE5_STAIRR2	; Right stairs
			.byte TILE5_STAIRL1, TILE5_STAIRL2	; Left stairs

StairsCont:
	LDY #$00	 ; Y = 0 (check feet)
	JSR Level_CheckGndLR_TileGTAttr
	BCS Stairs_Discontinue	; If Player's feet are touching solid blocks, discontinue stairs

	; This "boosts" a Player who is standing on one of the stairway inner tiles
	; Creates a momentary bad-looking visual glitch but keeps Player from walking 
	; the stairs at "too low" a level...
	LDA Level_Tile_GndR
	CMP #TILE5_STAIRR2
	BEQ GHS_Low
 
	LDA Level_Tile_GndL
	CMP #TILE5_STAIRL2
	BNE GHS_NotLow

GHS_Low:
	LDA <Player_Y
	AND #$F0
	STA <Player_Y

GHS_NotLow:

	LDA Player_OnStairs
	AND #$02	; If bit 1 is set, we are using leftward stairs
	TAY		; Y = 0 or 2
	BNE StairsLeftXVelChk

	; Stairs right X Vel check
	LDA <Player_XVel
	BMI StairsSkipFeetChk	; Don't check stairs persistence going down
	BPL StairsFeetChk	; Otherwise, check feet

StairsLeftXVelChk:

	; Stairs left X Vel check
	LDA <Player_XVel
	BPL StairsSkipFeetChk	; Don't check stairs persistence going down


StairsFeetChk:
	; Make sure Player is still on staircase
	LDA Level_Tile_GndL
	CMP StairCheckTiles,Y
	BEQ StairsSkipFeetChk

	LDA Level_Tile_GndR
	CMP StairCheckTiles,Y
	BEQ StairsSkipFeetChk

	LDA Level_Tile_InFL
	CMP StairCheckTiles,Y
	BEQ StairsSkipFeetChk

	LDA Level_Tile_GndL
	CMP StairCheckTiles+1,Y
	BEQ StairsSkipFeetChk

	LDA Level_Tile_GndR
	CMP StairCheckTiles+1,Y
	BEQ StairsSkipFeetChk

	LDA Level_Tile_InFL
	CMP StairCheckTiles+1,Y
	BEQ StairsSkipFeetChk

Stairs_Discontinue:
	LDA #0
	STA Player_OnStairs

	JMP GHS_NotStair	; Jump to GHS_NotStair

StairsSkipFeetChk:
	LDA #0
	STA <Player_YVel

	LDA Player_OnStairs
	AND #$40
	BNE Stairs_DisableUntilClear

	; Y = 0 unless the following is negative
	LDY #0

	; Only care about the 8-bit difference; as long as we understand this to be 8-bit signed it works
	LDA <Player_X
	SUB Player_OnStairsX
	STA <Temp_Var1

	LDA Player_OnStairs
	AND #$02
	BEQ GHS_XDiffOK

	; However, negate the result on left stairs
	LDA <Temp_Var1
	NEG
	STA <Temp_Var1

GHS_XDiffOK:

	LDA <Temp_Var1
	BPL GHS_XDiffExtPos
	INY
GHS_XDiffExtPos:

	; Store proper sign extension based on sign
	LDA GhostHouseStairs_XDiffExt,Y 
	STA <Temp_Var2

	LDA <Player_Y
	SUB <Temp_Var1
	STA <Player_Y
	LDA <Player_YHi
	SBC <Temp_Var2
	STA <Player_YHi

	; Update coordinate
	LDA <Player_X
	STA Player_OnStairsX

	LDA #$00	 
	STA <Player_InAir ; Player NOT mid air
	STA Kill_Tally	  ; Reset Kill_Tally

	; If 'A' is zero on return, stairs succeeded
	RTS

Stairs_DisableUntilClear:
	LDA #0
	RTS

GhostHouseStairs_XDiffExt:	.byte $00, $FF	; 16-bit extension



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bobomb_BustBlocks
;
; #...#		Bust blocks around Bob-omb as crudely depicted
; .....		
; ..B..		Will bust TILE1_DIAMOND and TILEA_BRICK
; .....
; #...#		Put here because just not enough room in PRG003
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bobomb_BustOffY:
	.byte       -$18, -$18, -$18
	.byte -$08, -$08, -$08, -$08, -$08
	.byte  $08,  $08,  $08,  $08,  $08
	.byte  $18,  $18,  $18,  $18,  $18
	.byte        $28,  $28,  $28

Bobomb_BustOffX:
	.byte       -$08,  $08,  $18
	.byte -$18, -$08,  $08,  $18,  $28
	.byte -$18, -$08,  $08,  $18,  $28
	.byte -$18, -$08,  $08,  $18,  $28
	.byte       -$08,  $08,  $18

Bobomb_BustBlocks30:
	LDA Objects_Var1,X
	CMP #(Bobomb_BustOffX - Bobomb_BustOffY)
	BGE Bobomb_DoneBusting		; If we've already busted all the blocks, jump to Bobomb_DoneBusting (RTS)

	TAY		; -> 'Y'

	; Calculate where the tile change will happen...

	; Need 16-bit sign extensions, not seeing the point in storing them though!

	; Determine if X needs extension
	LDX #$00	; X = 0 (if positive)

	LDA Bobomb_BustOffX,Y
	BPL Bobomb_BustBlock_PosX
	
	; Negative!
	DEX	; X = $FF (if negative)
	
Bobomb_BustBlock_PosX:
	STX <Temp_Var1		; -> Temp_Var1


	; Determine if Y needs extension
	LDX #$00	; X = 0 (if positive)

	LDA Bobomb_BustOffY,Y
	BPL Bobomb_BustBlock_PosY
	
	; Negative!
	DEX	; X = $FF (if negative)
	
Bobomb_BustBlock_PosY:
	STX <Temp_Var2		; -> Temp_Var2

	LDX <SlotIndexBackup

	; Calculate bust X!
	LDA <Objects_X,X
	ADD Bobomb_BustOffX,Y
	AND #$F0
	STA ObjTile_DetXLo
	LDA <Objects_XHi,X
	ADC <Temp_Var1
	STA Level_BlockChgXHi
	STA ObjTile_DetXHi

	; Calculate bust Y!
	LDA <Objects_Y,X
	ADD Bobomb_BustOffY,Y
	AND #$F0
	STA ObjTile_DetYLo
	LDA <Objects_YHi,X
	ADC <Temp_Var2
	STA ObjTile_DetYHi

	; Check to see if this is a tile we can bust first!
	JSR Bobomb_BustBlock_DetectManual
	
	LDA <Level_Tile
	CMP #TILEA_BRICK
	BEQ Bobomb_BustOK			; If a brick, jump to Bobomb_BustOK
	
	CMP #TILE1_DIAMOND
	BNE Bobomb_SkipBust		; If not a diamond block, jump to Bobomb_SkipBust

Bobomb_BustOK:
	LDA Level_ChgTileEvent
	BNE Bobomb_DoneBusting		; If a tile change event is already going, jump to Bobomb_DoneBusting (RTS)

	; Transfer in for the block change!
	LDA ObjTile_DetXLo
	STA Level_BlockChgXLo
	LDA ObjTile_DetXHi
	STA Level_BlockChgXHi
	LDA ObjTile_DetYLo
	STA Level_BlockChgYLo
	LDA ObjTile_DetYHi
	STA Level_BlockChgYHi
	
	
	; Queue event!
	LDA #CHNGTILE_DELETETOBG
	STA Level_ChgTileEvent

	; Little busting effect (not a lot of slots for this though)
	JSR Bobomb_BustBrickFX

	LDA SndCur_Level2
	AND #SND_LEVELCRUMBLE
	BNE Bobomb_DoneBusting	; If already playing a crumbling sound, jump to Bobomb_DoneBusting
	
	; Otherwise, crumble noise!
	LDA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

Bobomb_SkipBust:

	; Next offset...
	INC Objects_Var1,X

Bobomb_DoneBusting:
	RTS

Bobomb_BustBlock_DetectManual:
	JMP_THUNKC 0, Object_DetectTileManual


Bobomb_BustBrickFX:
	LDA Level_BlockChgXLo
	CMP <Horz_Scroll
	LDA Level_BlockChgXHi
	SBC <Horz_Scroll_Hi
	BNE Bobomb_DoneBusting	; RAS: If tile change is horizontally off-screen, jump to ActSwBB_SoundOnly

	JSR BrickBust_MoveOver30	 ; If a brick is busting in slot 1, move it to slot 2

	LDA #$02
	STA BrickBust_En	 ; Set brick bust enable

	; Y
	LDA Level_BlockChgYLo
	SUB Level_VertScroll
	STA BrickBust_YUpr	 ; Store upper brick segment Y

	ADD #$08
	STA BrickBust_YLwr	 ; Store lower brick segment Y

 	; X
	LDA Level_BlockChgXLo
	SUB <Horz_Scroll
	STA BrickBust_X	 ; Store X base coordinate

	LDA #$00	 
	STA BrickBust_XDist	 ; Reset X fan out distance
	STA BrickBust_HEn	 ; Reset horizontal enablers

	LDA #0
	STA BrickBust_YVel	 ; Y velocity = 0

	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CFire_Gravity
;
; "Cannon Fire" Reverse gravity special object
; In this bank just because there wasn't any space left in PRG030
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CFire_CalcCoarseXDiff:
	; Temp_Var13 is X
	; Temp_Var14 is XHi
	; Calculate coarse X difference -> Temp_Var15 (basically Object_CalcCoarseXDiff)
	LDA CannonFire_X,X	 
	SUB <Temp_Var13
	STA <Temp_Var15		; Temp_Var15 = difference between Object and Player X
	LDA CannonFire_XHi,X
	SBC <Temp_Var14		; Calc diff between X His
	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit
	LSR A			; Push low bit of "hi" difference -> carry
	ROR <Temp_Var15		; Cycle carry into Temp_Var15 at high bit; will be discarding low bit
	RTS

CFire_Gravity30:

	LDA CannonFire_X,X
	CMP <Horz_Scroll
	LDA CannonFire_XHi,X
	SBC <Horz_Scroll_Hi
	ADD #1
	CMP #4
	BGE CFire_Gravity_Delete	; If gravity effect is more than 2 screens away in either direction, jump to CFire_Gravity_Delete

	; Objects can reverse too; to keep down on overhead, only processing one
	; per frame and one off...
	LDA <Counter_1
	AND #$07	; 0 to 7

	TAY	; Y = 0 to 7

	CMP #$07
	BEQ CFire_Gravity_Do	; If value = 0, jump to CFire_Gravity_Do (don't process any object)

	; We're going to process an object
	JSR CFire_Gravity_Do

	; Now process Player in any case
	LDY #0

CFire_Gravity_Do:
	; Determine if Player/object is within the effect area
	LDA Player_X,Y
	STA <Temp_Var13
	LDA Player_XHi,Y
	STA <Temp_Var14
	JSR CFire_CalcCoarseXDiff
	
	; 64 each way, 16 coarse units
	LDA <Temp_Var15
	CMP #16
	BGS CFire_Gravity_NoChange
	CMP #-16
	BLS CFire_Gravity_NoChange


	LDA CannonFire_Y,X
	CMP Player_Y,Y
	LDA CannonFire_YHi,X
	SBC Player_YHi,Y
	BMI CFire_Gravity_Below

	; Player/object is above the gravity line
	; Only do anything if we're a CFIRE_GRAVITY_NORMAL
	LDA CannonFire_ID,X
	CMP #CFIRE_GRAVITY_NORMAL
	BNE CFire_Gravity_NoChange	; If we're not, then do nothing!

	; We're a CFIRE_GRAVITY_NORMAL and Player/object is above our line, so normalize gravity
	LDA #0
	BEQ CFire_Gravity_SetGrav

CFire_Gravity_Below:

	; Player/object is below the gravity line
	; Only do anything if we're a CFIRE_GRAVITY_REVERSE
	LDA CannonFire_ID,X
	CMP #CFIRE_GRAVITY_REVERSE
	BNE CFire_Gravity_NoChange	; If we're not, then do nothing!

	; We're a CFIRE_GRAVITY_REVERSE and Player/object is below our line, so reverse gravity
	LDA #1

CFire_Gravity_SetGrav:
	CMP Player_ReverseGrav,Y
	BEQ CFire_Gravity_NoChange	; If Player/object's gravity is already normal/reversed as it should be, jump to CFire_Gravity_NoChange (RTS)

	PHA	; Save Reverse Gravity result

	; Player/object should be affected by opposite gravity...
	LDA Player_YVel,Y
	NEG
	STA Player_YVel,Y

	PLA	; Restore Reverse Gravity result
	STA Player_ReverseGrav,Y

CFire_Gravity_NoChange:
	RTS

CFire_Gravity_Delete:
	LDY CannonFire_Parent,X
	LDA #0
	STA CannonFire_ID,X
	STA Level_ObjectsSpawned,Y

	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CFire_RockyWrench
;
; Continually re-creates Rocky
; In this bank just because there wasn't any space left in PRG030
; and I may decomission this, we'll see
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CFire_RockyWrench30:
	LDA CannonFire_Timer,X
	BNE PRG030_BF28	 ; If timer not expired, jump to PRG030_BF28 (RTS)

	; Reset cannon timer to $C0
	LDA #$c0
	STA CannonFire_Timer,X

	LDX #$04	  ; X = 4
PRG030_BFCF:
	LDA Objects_State,X
	BEQ PRG030_BFDC	 ; If this object state = 0 (Dead/Empty), jump to PRG030_BFDC

	DEX		 ; X--
	BPL PRG030_BFCF	 ; While X >= 0, loop!

	; No object slots available
	RTS		 ; Return

PRG030_BFDC:
	LDY <SlotIndexBackup	; Y = Cannon Fire slot index

	; This is a Rocky Wrench
	LDA #OBJ_ROCKYWRENCH
	STA Level_ObjectID,X

	; Start at Cannon Fire Y - 6
	LDA CannonFire_Y,Y
	SUB #$06
	STA <Objects_Y,X
	LDA CannonFire_YHi,Y
	SBC #$00
	STA <Objects_YHi,X

	; Set Rocky's X to Cannon Fire's X
	LDA CannonFire_XHi,Y
	STA <Objects_XHi,X
	LDA CannonFire_X,Y
	STA <Objects_X,X

	; Var5 = 0
	LDA #$00
	STA <Objects_Var5,X

	; Set Rocky's timer to $28
	LDA #$28
	STA Objects_Timer,X

	; Set Rocky's attributes
	LDA #SPR_PAL3
	STA Objects_SprAttr,X

	; Set Rocky's initial attributes towards Player
	JSR Level_ObjCalcXDiffs
	LDA Rocky_InitAttr,Y
	STA Objects_FlipBits,X

	LDX <SlotIndexBackup	; X = Cannon Fire slot index

PRG030_BF28:
	RTS		 ; Return





ActionSwitch_Do30:
	LDA Level_ActSwState
	BNE ActSw_NotInit

	; State zero is initialization state; clear all vars
	LDA #0
	STA Level_ActSwVar1
	STA Level_ActSwVar2
	; Level_ActSwVar3 is initialized to tile that activated this

ActSw_NotInit:
	LDA Level_ActSwAction
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!! 
	.word $0000			; 0 (Not valid / unused)
	.word ActSw_BowserBridge	; 1 - Explode Bowser bridge
	.word ActSw_CoinSnake		; 2 - Spawn coin snake
	.word ActSw_RaisePipe		; 3 - Raise Pipe 1
	.word ActSw_RaisePipe		; 4 - Raise Pipe 2
	.word ActSw_RaisePipe		; 5 - Raise Pipe 3
	.word ActSw_RaisePipe		; 6 - Raise Pipe 4
	.word ActSw_Brighten		; 7 - Brighten room (used with darkness controller)
	.word ActSw_StartSandFill	; 8 - Set of all sand traps
	.word ActSw_InfiniteQ		; 9 - Infinite [?]
	.word ActSw_ReverseGrav		; 10 - Flip everyone's gravity

ActSw_BowserBridge:

	; Destroy tiles 2 rows below switch
	; Starting 13 columns left of switch
	; Poof explosion on alternating tiles

	
	; If Level_ActSwState > 0, jump to ActSwBB_Busting
	LDA Level_ActSwState
	BNE ActSwBB_Busting

	; State zero; initialize!

	; Number of tiles left to destroy
	LDA #13
	STA Level_ActSwVar1

	; Calculate the alternate busting position
	LDA Level_ActSwY
	AND #$F0		; Align to nearest grid coordinate
	ADD #32
	STA Level_ActSwY
	LDA Level_ActSwYHi
	ADC #0
	STA Level_ActSwYHi

	LDA Level_ActSwX
	AND #$F0		; Align to nearest grid coordinate
	SUB #(16 * 13)
	STA Level_ActSwX
	LDA Level_ActSwXHi
	SBC #0
	STA Level_ActSwXHi

	; Next state...
	INC Level_ActSwState

ActSwBB_DoNothing:
	RTS

ActSwBB_Busting:
	; Used as a timer; if Level_ActSwVar2 = 0, jump to ActSwBB_BustAnother
	LDA Level_ActSwVar2
	BEQ ActSwBB_BustAnother

	; Decrement timer
	DEC Level_ActSwVar2
	RTS


ActSwBB_BustAnother:
	; If there's already a tile change queued, can't do anything, jump to ActSwBB_DoNothing
	LDA Level_ChgTileEvent
	BNE ActSwBB_DoNothing

	LDA #CHNGTILE_DELETETOBG
	STA Level_ChgTileEvent	 ; Store type of block change!

	; Store change Y Hi and Lo
	LDA Level_ActSwYHi
	STA Level_BlockChgYHi
	LDA Level_ActSwY
	STA Level_BlockChgYLo

	; Store change X Hi and Lo
	LDA Level_ActSwXHi
	STA Level_BlockChgXHi
	LDA Level_ActSwX
	STA Level_BlockChgXLo

	; Reload timer
	LDA #2
	STA Level_ActSwVar2

	; Play sounds / bust debris only on every other bust
	LDA Level_ActSwVar1
	AND #1
	BEQ ActSwBB_SkipSound

	LDA Level_ActSwX
	CMP <Horz_Scroll
	LDA Level_ActSwXHi
	SBC <Horz_Scroll_Hi
	BNE ActSwBB_SoundOnly	; RAS: If tile change is horizontally off-screen, jump to ActSwBB_SoundOnly

	JSR BrickBust_MoveOver30	 ; If a brick is busting in slot 1, move it to slot 2

	LDA #$02
	STA BrickBust_En	 ; Set brick bust enable

	; Y
	LDA Level_ActSwY
	SUB Level_VertScroll
	STA BrickBust_YUpr	 ; Store upper brick segment Y

	ADD #$08
	STA BrickBust_YLwr	 ; Store lower brick segment Y

 	; X
	LDA Level_ActSwX
	SUB <Horz_Scroll
	STA BrickBust_X	 ; Store X base coordinate

	LDA #$00	 
	STA BrickBust_XDist	 ; Reset X fan out distance
	STA BrickBust_HEn	 ; Reset horizontal enablers

	LDA #0
	STA BrickBust_YVel	 ; Y velocity = 0

ActSwBB_SoundOnly:
	; Crumble sound
	LDA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

ActSwBB_SkipSound:

	; Next tile...
	LDA Level_ActSwX
	ADD #16
	STA Level_ActSwX
	LDA Level_ActSwXHi
	ADC #0
	STA Level_ActSwXHi

	DEC Level_ActSwVar1
	BNE ActSwBB_NotDone

	; Action complete
	LDA #0
	STA Level_ActSwAction

ActSwBB_NotDone:
	RTS


ActSw_CoinSnake:

	; Use "power up" object slot
	LDX #5

	; NOTE: I'd like to call Level_PrepareNewObject, but PRG000 isn't in scope, so we'll do it later
	LDA #OBJSTATE_INIT
	STA Objects_State,X

	; Coin Snake!
	LDA #OBJ_COINSNAKE
	STA Level_ObjectID,X

	; Copy coordinates
	LDA Level_ActSwX
	STA <Objects_X,X
	LDA Level_ActSwXHi
	STA <Objects_XHi,X

	LDA Level_ActSwY
	SUB #16
	STA <Objects_Y,X
	LDA Level_ActSwYHi
	SBC #0
	STA <Objects_YHi,X

	; Action complete
	LDA #0
	STA Level_ActSwAction

	RTS

	; Bits set when pipe raise is needed (Level_PipeRaiseData)
ASRP_NeedRaiseBits:		.byte $01, $02, $04, $08

ActSw_RaisePipe:

	LDA Level_ActSwAction
	SUB #3
	TAY		; Y = 0 to 3, based on Level_ActSwAction
	
	; Set pipe that should raise now
	LDA Level_PipeRaiseData
	ORA ASRP_NeedRaiseBits,Y
	STA Level_PipeRaiseData

	; Action complete
	LDA #0
	STA Level_ActSwAction

	RTS

ActSw_FindObject:
	CPX #0
	BLS ActSwSearch_Invalid		; If X < 0, jump to ActSwSearch_Invalid

	STA <Temp_Var1

ActSwSearch_Loop:
	LDA Objects_State,X
	BEQ ActSwSearch_NotFound		; If object slot is dead/empty, jump to ActSwSearch_NotFound
	
	LDA Level_ObjectID,X
	CMP <Temp_Var1
	BEQ ActSwSearch_Found
	
ActSwSearch_NotFound:
	DEX							; X--
	BPL ActSwSearch_Loop		; While Y >= 0, loop!
	
	; If you get here, object not found, so just quit
	LDA #0
	STA Level_ActSwAction

ActSwSearch_Invalid:
	; Do not return to caller
	PLA
	PLA
	
ActSwSearch_Found:
	RTS


ActSw_Brighten:
		
	; Find the darkness controller and tell it to brighten up
	LDX #4
	LDA #OBJ_DARKNESSCTL
	JSR ActSw_FindObject	; If darkness controller is not found, this will not return here
	
	; Make sure no other switch is active, otherwise we need to reset it
	LDA Objects_Var1,X
	CMP #$FF
	BEQ DarknessCtl_DoBright	; If no switch is active, jump to DarknessCtl_DoBright

	; Switch was active; can we reset?
	LDA Level_ChgTileEvent
	BNE DarknessCtl_WaitForTileChng		; If Level_ChgTileEvent is active, jump to DarknessCtl_WaitForTileChng
	
	; We can reset the switch!
	LDA Objects_Var1,X
	STA Level_BlockChgYHi
	LDA Objects_Var2,X
	STA Level_BlockChgYLo
	LDA Objects_Var3,X
	STA Level_BlockChgXHi
	LDA Objects_Var6,X
	STA Level_BlockChgXLo
	
	LDA #CHNGTILE_ACTSWAPPEAR
	STA Level_ChgTileEvent	

DarknessCtl_DoBright:
	; Provide switch coordinates to darkness controller so it can reset the switch
	; FIXME: Fix prior switch!!
	LDA Level_ActSwYHi
	STA Objects_Var1,X
	LDA Level_ActSwY
	AND #$F0
	STA Objects_Var2,X
	LDA Level_ActSwXHi
	STA Objects_Var3,X
	LDA Level_ActSwX
	AND #$F0
	STA Objects_Var6,X

	; Force the darkness controller to state 1.
	LDA #1
	STA <Objects_Var4,X

	LDA #$FF
	STA Objects_Timer,X
	
	LDA #$01
	STA <Objects_Var5,X

	; Action complete
	LDA #0
	STA Level_ActSwAction

DarknessCtl_WaitForTileChng:
	RTS


ActSw_StartSandFill:

	; Find any sand trap and tell it to start filling!
	LDX #4
	JSR ActSw_StartSandFill_Loop
	
	; Action complete
	LDA #0
	STA Level_ActSwAction
	
	RTS
	
ActSw_StartSandFill_Loop:
	LDA #OBJ_SANDFILL_CTL
	JSR ActSw_FindObject	; If sand fill controller is not found, this will not return here

	; Start filling!
	LDA <Objects_Var4,X
	BNE StartSandFill_AlreadyStarted	; Only start filling if not already started, otherwise jump to StartSandFill_AlreadyStarted

	INC <Objects_Var4,X

StartSandFill_AlreadyStarted:
	; Don't check this object again!
	DEX

	JMP ActSw_StartSandFill_Loop	; Always jump; if one is not found, we will not return here!

ActSw_InfiniteQ:
	INC Level_ActSwState
	LDA Level_ActSwState
	CMP #12
	BLT InfiniteQ_WaitForBump

	LDA Level_ChgTileEvent
	BNE InfiniteQ_WaitForBump

	LDA Level_ActSwY
	AND #%11110000
	STA Level_BlockChgYLo
	LDA Level_ActSwYHi
	STA Level_BlockChgYHi

	; Store change X Hi and Lo
	LDA Level_ActSwX
	AND #%11110000
	STA Level_BlockChgXLo
	LDA Level_ActSwXHi
	STA Level_BlockChgXHi

	LDA #CHNGTILE_ACTQBLOCK
	STA Level_ChgTileEvent

	; Action complete
	LDA #0
	STA Level_ActSwAction
	
InfiniteQ_WaitForBump:
	RTS


ActSw_ReverseGrav:
	LDA Level_ActSwState
	BNE ASRG_WaitToReset

	LDA Player_ReverseGrav
	EOR #1
	STA Player_ReverseGrav

	; This was too buggy

;	LDX #4
;ASRG_Loop:
;	LDA Objects_State,X
;	BEQ ASRG_DeadEmpty	; If object is dead/empty, jump to ASRG_DeadEmpty

	; Otherwise, reverse their gravity!
;	LDA Objects_ReverseGrav,X
;	EOR #1
;	STA Objects_ReverseGrav,X

;ASRG_DeadEmpty:
;	DEX				; X--
;	BPL ASRG_Loop	; While X >= 0, loop!

	
ASRG_WaitToReset:
	INC Level_ActSwState
	LDA Level_ActSwState
	CMP #8
	BLT ASRG_DoNothing

	; If there's already a tile change queued, can't do anything, jump to ActSwBB_DoNothing
	LDA Level_ChgTileEvent
	BNE ASRG_DoNothing

	LDA Level_ActSwY
	AND #%11110000
	STA Level_BlockChgYLo
	LDA Level_ActSwYHi
	STA Level_BlockChgYHi

	; Store change X Hi and Lo
	LDA Level_ActSwX
	AND #%11110000
	STA Level_BlockChgXLo
	LDA Level_ActSwXHi
	STA Level_BlockChgXHi

	LDX Level_ActSwVar3
	CPX #TILE8_EXSWITCHR
	BNE ASRG_NotExSwitchR

	LDA #CHNGTILE_ACTSWAPPEAR_R
	BNE ASRG_SetCTE
	
ASRG_NotExSwitchR:
	LDA #CHNGTILE_ACTSWAPPEAR
	
ASRG_SetCTE:
	STA Level_ChgTileEvent

	; Action complete
	LDA #0
	STA Level_ActSwAction

ASRG_DoNothing:
	RTS


PAUSE_Sprites:
	.byte $28, $F1, $03, $60	; P
	.byte $28, $F3, $03, $70	; A
	.byte $28, $F5, $03, $80	; U
	.byte $28, $F7, $03, $90	; S
	.byte $28, $F9, $03, $A0	; E
PAUSE_Sprites_End

PAUSEMenu_Sprites:
	.byte $58, $C1, $03, $60	; C
	.byte $58, $C3, $03, $68	; ON
	.byte $58, $C5, $03, $70	; NT
	.byte $58, $C7, $03, $78	; IN
	.byte $58, $C9, $03, $80	; NU
	.byte $58, $CB, $03, $88	; E

	.byte $68, $CD, $03, $60	; S
	.byte $68, $CF, $03, $68	; A
	.byte $68, $D1, $03, $70	; V
	.byte $68, $DD, $03, $78	; E
	.byte $68, $D9, $03, $88	; &
	.byte $78, $C1, $03, $70	; C
	.byte $78, $C3, $03, $78	; ON
	.byte $78, $C5, $03, $80	; NT
	.byte $78, $C7, $03, $88	; IN
	.byte $78, $C9, $03, $90	; NU
	.byte $78, $CB, $03, $98	; E

	.byte $88, $CD, $03, $60	; S
	.byte $88, $CF, $03, $68	; A
	.byte $88, $D1, $03, $70	; V
	.byte $88, $DD, $03, $78	; E
	.byte $88, $D9, $03, $88	; &
	.byte $98, $D3, $03, $80	; Q
	.byte $98, $D5, $03, $88	; U
	.byte $98, $D7, $03, $90	; I
	.byte $98, $DB, $03, $98	; T
PAUSEMenu_Sprites_End

	.byte $A8, $E1, $03, $60	; S
	.byte $A8, $E3, $03, $68	; TA
	.byte $A8, $E5, $03, $70	; AR
	.byte $A8, $E7, $03, $78	; RR
	.byte $A8, $E9, $03, $80	; RO
	.byte $A8, $EB, $03, $88	; OA
	.byte $A8, $ED, $03, $90	; D
PAUSEMenu_Sprites_EndMap

PAUSEMenu_CursorDelta:	.byte 1, -1
PAUSEMenu_CursorY:		.byte $50, $68, $88, $A8

Game_DoPause30:

	; When game is paused...

	LDA Debug_Flag
	CMP #$80
	BNE Pause_NoDebug

	JSR Debug_PauseStuff

Pause_NoDebug:
	
	LDA #251

	LDY Level_Tileset
	BNE Pause_NotMapBank
	
	; Map uses 252 for better coloring
	LDA #252
	
Pause_NotMapBank:
	STA PatTable_BankSel+5	; Set patterns needed for P A U S E sprites

	JSR Sprite_RAM_Clear	 ; Clear other sprites

	LDA #3
	STA <Temp_Var14		; Maximum menu index
	LDA #0
	STA <Temp_Var15		; Menu Y offset	

	LDY #(PAUSEMenu_Sprites_End - PAUSEMenu_Sprites - 4)

	; Map changes menu a bit
	LDA Level_Tileset
	BNE Pause_NotOnMap

	LDA #4
	STA <Temp_Var14		; Maximum menu index
	LDA #-32
	STA <Temp_Var15		; Menu Y offset	

	LDY #(PAUSEMenu_Sprites_EndMap - PAUSEMenu_Sprites - 4)

Pause_NotOnMap:

	; Copy in the pause menu sprites
PAUSEMenu_SpriteCopyLoop:
	LDA PAUSEMenu_Sprites,Y
	ADD <Temp_Var15
	STA Sprite_RAM+$00,Y
	LDA PAUSEMenu_Sprites+1,Y
	STA Sprite_RAM+$01,Y
	LDA PAUSEMenu_Sprites+2,Y
	STA Sprite_RAM+$02,Y
	LDA PAUSEMenu_Sprites+3,Y
	STA Sprite_RAM+$03,Y
	DEY
	DEY
	DEY
	DEY
	CPY #$FC
	BNE PAUSEMenu_SpriteCopyLoop	 ; While Y >= 0, loop!
	
	
	; P A U S E is not used on map
	LDA Level_Tileset
	BEQ Pause_NoPauseOnMap

	; Copy in the P A U S E sprites
	LDY #(PAUSE_Sprites_End - PAUSE_Sprites - 4)
PRG030_8E9D:
	LDX PAUSE_Sprites,Y
	; Periodically remove sprites...
	LDA <Counter_1
	AND #$20
	BNE PAUSEFlash_NotY

	; Hide!
	LDX #$F8

PAUSEFlash_NotY:
	TXA
	STA Sprite_RAM+(PAUSEMenu_Sprites_End - PAUSEMenu_Sprites),Y
	LDA PAUSE_Sprites+1,Y
	STA Sprite_RAM+(PAUSEMenu_Sprites_End - PAUSEMenu_Sprites)+1,Y
	LDA PAUSE_Sprites+2,Y
	STA Sprite_RAM+(PAUSEMenu_Sprites_End - PAUSEMenu_Sprites)+2,Y
	LDA PAUSE_Sprites+3,Y
	STA Sprite_RAM+(PAUSEMenu_Sprites_End - PAUSEMenu_Sprites)+3,Y

	DEY
	DEY
	DEY
	DEY
	BPL PRG030_8E9D	 ; While Y >= 0, loop!
	
Pause_NoPauseOnMap:
	; Cursor
	LDY #$F8
	
	LDX Level_PauseSelect
	LDA PAUSEMenu_CursorY,X
	ADD <Temp_Var15
	STA Sprite_RAM+$00,Y
	LDA #$FF
	STA Sprite_RAM+$01,Y
	LDA #$03
	STA Sprite_RAM+$02,Y
	LDA #$50
	STA Sprite_RAM+$03,Y
	
	LDA <Pad_Input
	AND #(PAD_UP | PAD_DOWN)
	BEQ PAUSEMenu_NoUD 
	
	LSR A
	LSR A
	LSR A
	TAY
	
	LDA Level_PauseSelect
	ADD PAUSEMenu_CursorDelta,Y
	BPL PAUSEMenu_NotNeg
	
	; Negative
	LDA <Temp_Var14
	SUB #1
	
PAUSEMenu_NotNeg:
	CMP <Temp_Var14
	BLT PAUSEMenu_NotHigh
	
	; Overflow
	LDA #0
	
PAUSEMenu_NotHigh:
	STA Level_PauseSelect

PAUSEMenu_NoUD:
	LDX Player_Current
	LDA <Controller1Press,X
	AND #PAD_START
	BEQ PAUSEMenu_NoStart

	LDA Level_Tileset
	BNE Pause_NotMap
	
	JSR Sprite_RAM_Clear	 ; Clear other sprites
	
	LDA #0
	STA <Map_WarpWind_FX
	
	LDA #149
	STA PatTable_BankSel+5	; Restore map sprites

Pause_NotMap:
	; Resume normal music
	LDA #PAUSE_RESUMEMUSIC
	STA Sound_QPause

	; Clear pause flag
	LDA #0
	STA Level_PauseFlag

	LDA Level_PauseSelect
	BEQ PAUSEMenu_NoStart	; If Level_PauseSelect = 0, do nothing, jump to PAUSEMenu_NoStart
	CMP #3
	BEQ PAUSEMenu_StarRoad	; If Level_PauseSelect = 3, jump to PAUSEMenu_StarRoad
	
	
	; Save data
	JSR Game_SaveData
	
	LDA Level_PauseSelect
	CMP #2
	BNE PAUSEMenu_HandleSelect	; If Level_PauseSelect <> 2, don't quit, jump to PAUSEMenu_NoStart

	; Quit via Reset_Latch
	LDA #0
	STA Reset_Latch

PAUSEMenu_HandleSelect:
	; If level if complete and Player presses SELECT, abort level
	LDA Level_IsComplete
	AND #(MCOMP_COMPLETE | MCOMP_SECRET)
	BEQ PAUSEMenu_NoStart	; If level is not complete, jump to PAUSEMenu_NoStart
	
	
	; Level is already complete...
	LDA <Pad_Input
	AND #PAD_SELECT
	BEQ PAUSEMenu_NoStart	; If Player is not pressing SELECT, jump to PAUSEMenu_NoStart
	
	; Start+Select exit level!
	INC <Level_ExitToMap	; Exit to map
	INC Map_ReturnStatus	; Did not complete level
	INC Map_PlayerLost2PVs	; Don't lose a life over it, though
	
PAUSEMenu_NoStart:
	RTS

PAUSEMenu_StarRoad:
	; But not on world 9...
	LDA World_Num
	CMP #8
	BEQ Map_WZeroDeny

	CMP #9
	BNE Map_NoWZeroDeny		; If not World Zero, jump to Map_NoWZeroDeny
	
	; On World Zero, do not allow return on the upper or lower frings
	LDX Player_Current
	LDA <World_Map_Y,X
	CMP #$21
	BLT Map_WZeroDeny
	CMP #$A0
	BGE Map_WZeroDeny
	
Map_NoWZeroDeny:
	; Continue warp to star road
	LDA #2
	STA <Map_WarpWind_FX

	; Skid sound
	LDA #SND_LEVELVINE
	STA Sound_QLevel1
	RTS

Map_WZeroDeny:
	LDA #SND_MAPDENY
	STA Sound_QMap
	RTS


Debug_PauseStuff:
	LDA <Pad_Holding
	AND #(PAD_UP | PAD_A)
	CMP #(PAD_UP | PAD_A)
	BNE PauseDebug_NoExit2

	; Exit secret
	INC Map_WasAltExit
	BNE PauseDebug_Exit1

PauseDebug_NoExit2:
	LDA <Pad_Holding
	AND #(PAD_DOWN | PAD_A)
	CMP #(PAD_DOWN | PAD_A)
	BNE PauseDebug_NoExit1

PauseDebug_Exit1:

	; Exit normal
	LDA #0
	STA Map_ReturnStatus
	STA Level_PauseFlag
	INC <Level_ExitToMap

PauseDebug_NoExit1:
	RTS


	; Velocities set to X/Y directly to Player for what might be a now-unused debug routine of sorts
PRG030_C3E7:
	.byte $00, $30, -$30

Debug_FreeMovement:
	INC Player_DebugNoHitFlag

	; Some extra niceities for me...
	LDA <Pad_Holding
	AND #PAD_UP
	BNE PFM_NotHoldingUp
	
	;LDA #1
	;STA Player_InAir

	; If Level_FreeVertScroll = 0 and we're at $EF, but
	; Player is holding up, then let's go to $EE to unlock it
	LDA Level_FreeVertScroll
	BNE PFM_NotHoldingUp	
	LDA <Vert_Scroll
	CMP #$EF
	BNE PFM_NotHoldingUp
	
	LDA #$EE
	STA <Vert_Scroll
	
	
PFM_NotHoldingUp:
	; Nintendo's old code starts here...
	LDA <Pad_Holding
	AND #(PAD_LEFT | PAD_RIGHT)
	TAY		 ; Y = 1 or 2

	; Set Player X velocity directly??
	LDA PRG030_C3E7,Y
	STA <Player_XVel

	LDA <Pad_Holding
	LSR A
	LSR A
	AND #((PAD_UP | PAD_DOWN) >> 2)
	TAY		 ; Y = 1 or 2

	; Set Player Y velocity directly??
	LDA PRG030_C3E7,Y
	STA <Player_YVel

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SpecialObj_FindEmptyAbort
; SpecialObj_FindEmptyAbortY
;
; Finds an empty special object slot (returned in 'Y') or "aborts" 
; if no slot is open OR if the object has any invisible sprites.
; "abort" = will not return to caller...
;
; SpecialObj_FindEmptyAbortY just allows a specified range
;
; Copied from PRG000, but it's buggy to call bank 0 from 30
; Disabled viz check because it's used for non-obj spawning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $C447
SpecialObj_FindEmptyAbort30:
	LDY #$05
SpecialObj_FindEmptyAbortY30:
	LDA SpecialObj_ID,Y
	BEQ PRG030_C454	 ; If object slot is dead/empty, jump to PRG030_C454 
	DEY		 ; Y--
	BPL SpecialObj_FindEmptyAbortY30	 ; While Y >= 0, loop!

PRG030_C451:
	; Do not return to caller!!
	PLA
	PLA
	RTS

PRG030_C454:
	;LDA Objects_SprHVis,X
	;ORA Objects_SprVVis,X

	;BNE PRG030_C451	 ; If any sprites are off-screen, jump to PRG030_C451

	; Clear viz flags
	LDA #0
	STA SpecialObj_VisFlags,Y

	RTS		 ; Return


Level_DigSand_Poof30:
	JSR SpecialObj_FindEmptyAbort30	; Find an empty special object slot or don't come back here!

	LDA #SND_BOOMERANG
	STA Sound_QLevel2

	LDA #$10
	STA Player_DigSand

	LDA Level_BlockChgXLo
	AND #$F0
	STA SpecialObj_XLo,Y
	LDA Level_BlockChgYLo
	AND #$F0
	STA SpecialObj_YLo,Y
	LDA Level_BlockChgYHi
	STA SpecialObj_YHi,Y

	LDA #SOBJ_POOF
	STA SpecialObj_ID,Y	 ; Special object "poof"
	LDA #$20	 
	STA SpecialObj_Data,Y	 ; Used as "counter" while poof is in effect

	RTS		 ; Return


Level_EndComet:

	LDA #$FF
	STA Player_HaltTick

	LDA #MUS1_COURSECLEAR
	STA Sound_QMusic1

	LDX #4
LEC_PoofEverythingLoop:

	LDA Objects_State,X
	BEQ LEC_NoNeedPoof	; If object slot not dead/empty, jump to LEC_NoNeedPoof

	; poof timer
	LDA #$1f
	STA Objects_Timer,X

	LDA #OBJSTATE_POOFDEATH	; A = 8 ("Poof" death the object)
	STA Objects_State,X

LEC_NoNeedPoof:
	DEX
	BNE LEC_PoofEverythingLoop

	LDX #7
LEC_PoofEverythingLoop2:

	LDA SpecialObj_ID,X
	BEQ LEC_NoNeedPoof2	; If object slot not dead/empty, jump to LEC_NoNeedPoof

	; poof timer
	LDA #$1f
	STA SpecialObj_Data,X

	LDA #SOBJ_POOF	; A = 8 ("Poof" death the object)
	STA SpecialObj_ID,X

LEC_NoNeedPoof2:
	DEX
	BNE LEC_PoofEverythingLoop2

	LDX #0
	JSR_THUNKC 0, Level_PrepareNewObject

	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

	LDA #OBJ_TREASUREBOX
	STA Level_ObjectID,X

	LDA <Player_X
	STA <Objects_X,X
	LDA <Player_XHi
	STA <Objects_XHi,X

	LDA <Player_Y
	STA <Objects_Y,X
	LDA <Player_YHi
	STA <Objects_YHi,X

	INC <Objects_Var4,X

	LDA #-$30
	STA <Objects_YVel,X

	LDA #10
	STA Level_TreasureItem

	LDA #0
	STA Objects_FlipBits,X

	;JSR Level_EndComet_Poof

	RTS

Level_EndComet_Poof:
	JSR SpecialObj_FindEmptyAbort30	; Find an empty special object slot or don't come back here!

	; The "poof" from when it appears	 
	LDA #SOBJ_POOF
	STA SpecialObj_ID,Y

	; Set the poof where the box will be
	LDA <Objects_X,X
	STA SpecialObj_XLo,Y
	LDA <Objects_Y,X
	STA SpecialObj_YLo,Y
	LDA <Objects_YHi,X
	STA SpecialObj_YHi,Y

	; Set the "poof" counter
	LDA #$1f
	STA SpecialObj_Data,Y

	RTS		 ; Return
	
