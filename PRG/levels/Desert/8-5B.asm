	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_RUINS | LEVEL5_TIME_300

	.byte $11, $00, $70, $11, $0C, $70, $0F, $02, $72, $0D, $00, $73, $0B, $02, $72, $09
	.byte $00, $73, $13, $00, $60, $13, $0E, $60, $14, $00, $60, $15, $00, $60, $16, $00
	.byte $60, $17, $00, $60, $18, $00, $60, $19, $00, $60, $14, $0E, $60, $15, $0E, $60
	.byte $16, $0E, $60, $18, $0E, $60, $17, $0E, $60, $19, $0E, $61, $31, $07, $D4, $79
	.byte $02, $36, $36, $02, $0F, $FF
