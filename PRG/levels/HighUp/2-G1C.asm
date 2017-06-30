	.word W102AL	; Alternate level layout
	.word W102AO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC2 | LEVEL5_TIME_300

	.byte $09, $40, $67, $05, $48, $67, $00, $40, $67, $0C, $38, $67, $07, $30, $65, $03
	.byte $3A, $65, $6E, $21, $55, $6A, $29, $65, $66, $25, $C4, $07, $28, $04, $0C, $15
	.byte $08, $0C, $1B, $08, $0E, $16, $64, $0B, $15, $40, $0B, $1B, $40, $04, $18, $08
	.byte $66, $10, $97, $66, $19, $96, $03, $18, $40, $25, $1E, $05, $25, $11, $05, $2E
	.byte $04, $88, $20, $14, $88, $21, $14, $88, $0B, $03, $08, $0B, $0D, $08, $0A, $0D
	.byte $40, $0A, $03, $40, $6D, $00, $92, $6D, $04, $98, $6D, $0E, $91, $49, $05, $B2
	.byte $00, $49, $0B, $B2, $00, $49, $06, $B0, $04, $4B, $06, $B0, $04, $65, $07, $92
	.byte $FF
