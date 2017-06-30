	.word W404AL	; Alternate level layout
	.word W404AO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_06 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $20, $00, $4F, $21, $07, $D4, $46, $11, $5D, $23, $10, $4F, $47, $30, $86, $0F
	.byte $2A, $30, $4F, $28, $37, $91, $2E, $0A, $35, $2E, $0C, $0D, $2E, $0D, $0A, $E3
	.byte $42, $F7, $48, $11, $5D, $4A, $11, $5D, $4C, $11, $5D, $4E, $11, $5D, $41, $21
	.byte $5D, $43, $21, $5D, $45, $21, $5D, $47, $21, $5D, $49, $21, $5D, $4B, $21, $5D
	.byte $4D, $21, $5D, $40, $31, $5D, $42, $31, $5D, $44, $31, $5D, $46, $27, $6F, $01
	.byte $46, $17, $6F, $01, $46, $07, $6F, $01, $FF
