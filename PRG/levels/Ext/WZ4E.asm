	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_PURPLE | LEVEL5_TIME_300

	.byte $79, $00, $4F, $50, $12, $09, $76, $03, $72, $37, $01, $A1, $79, $10, $4F, $75
	.byte $04, $73, $74, $05, $74, $73, $06, $75, $72, $07, $76, $71, $08, $77, $70, $09
	.byte $78, $70, $0A, $78, $FF
