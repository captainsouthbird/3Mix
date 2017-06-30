	.word W501L	; Alternate level layout
	.word W501O	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $46, $00, $EF, $05, $48, $30, $B0, $0F, $26, $3C, $91, $E3, $71, $F3, $20, $01
	.byte $D1, $6C, $03, $14, $6C, $0C, $14, $42, $10, $EF, $05, $62, $13, $59, $6B, $03
	.byte $59, $25, $13, $82, $25, $1A, $82, $4D, $10, $E5, $05, $4D, $16, $B5, $09, $68
	.byte $1C, $14, $67, $1C, $50, $04, $29, $A8, $0E, $2F, $A7, $0D, $20, $A0, $26, $23
	.byte $81, $28, $21, $81, $2A, $20, $80, $2A, $2F, $80, $2C, $2D, $81, $2E, $2B, $81
	.byte $21, $39, $81, $23, $37, $81, $26, $31, $85, $04, $3E, $0D, $FF
