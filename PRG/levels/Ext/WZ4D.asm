	.word WZ4EL	; Alternate level layout
	.word WZ4EO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_PURPLE | LEVEL5_TIME_300

	.byte $37, $02, $A1, $79, $00, $4F, $79, $10, $4F, $79, $20, $4F, $79, $30, $4F, $76
	.byte $07, $4A, $76, $17, $4A, $76, $27, $4A, $72, $0F, $4A, $72, $1F, $4A, $73, $24
	.byte $75, $73, $14, $75, $77, $0C, $71, $77, $1C, $71, $77, $2C, $71, $17, $2B, $0A
	.byte $6E, $17, $4A, $6F, $1C, $76, $0C, $1B, $C0, $18, $35, $80, $E1, $61, $10, $FF
