	.word W1F3AL	; Alternate level layout
	.word W1F3AO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_0F0
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(6) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $61, $00, $D1, $C8, $41, $00, $BA, $01, $41, $06, $B2, $14, $48, $06, $B2, $14
	.byte $4B, $02, $B0, $3F, $27, $03, $A4, $41, $1B, $B0, $26, $66, $1E, $80, $68, $27
	.byte $80, $42, $2B, $B1, $03, $49, $2B, $B1, $03, $65, $2C, $81, $66, $38, $80, $42
	.byte $3C, $B8, $05, $08, $33, $D2, $08, $29, $D2, $07, $22, $D3, $09, $1F, $D1, $65
	.byte $3C, $31, $64, $3B, $31, $25, $3E, $E1, $61, $3D, $31, $02, $3D, $0F, $E3, $21
	.byte $7D, $FF
