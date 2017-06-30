	.word W3BatlL	; Alternate level layout
	.word W3BatlO	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(4) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BATTLE | LEVEL5_TIME_200

	.byte $19, $00, $63, $19, $1C, $63, $E0, $68, $10, $E1, $68, $10, $38, $03, $40, $38
	.byte $1C, $40, $FF
