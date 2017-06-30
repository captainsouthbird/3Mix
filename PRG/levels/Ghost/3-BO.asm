	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(5) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $00, $00, $01, $19, $00, $50, $10, $00, $0D, $27, $00, $0E, $27, $5A, $00, $80
	.byte $0F, $FF
