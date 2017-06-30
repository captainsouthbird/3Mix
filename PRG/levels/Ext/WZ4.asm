	.word WZ4BL	; Alternate level layout
	.word WZ4BO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_PURPLE | LEVEL5_TIME_300

	.byte $79, $00, $4F, $6C, $06, $78, $75, $00, $4F, $79, $10, $4F, $79, $20, $4F, $79
	.byte $30, $4F, $6F, $0B, $4F, $6F, $15, $76, $6A, $21, $78, $73, $1D, $4F, $75, $16
	.byte $44, $69, $1B, $4C, $6B, $00, $4F, $72, $07, $72, $72, $08, $72, $17, $3C, $90
	.byte $12, $24, $80, $6A, $2C, $78, $6E, $29, $74, $6E, $2A, $74, $6E, $2B, $74, $71
	.byte $28, $71, $73, $2D, $4C, $74, $39, $74, $6E, $2D, $74, $6A, $19, $42, $6B, $17
	.byte $42, $E3, $61, $10, $FF
