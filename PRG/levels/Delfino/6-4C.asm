	.word W604L	; Alternate level layout
	.word W604O	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_07 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $79, $00, $81, $20, $6D, $00, $80, $20, $0F, $04, $17, $01, $0F, $08, $27, $10
	.byte $12, $09, $E0, $12, $0E, $01, $0E, $09, $E4, $16, $09, $E1, $16, $15, $E1, $12
	.byte $19, $E0, $17, $11, $00, $37, $01, $91, $E0, $41, $28, $FF
