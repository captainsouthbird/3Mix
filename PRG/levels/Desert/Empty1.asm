	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $14, $0A, $54, $16, $0B, $13, $12, $0B, $04, $55, $02, $C4, $00, $75, $0E, $34
	.byte $12, $05, $F4, $11, $0A, $07, $6F, $05, $51, $0D, $0E, $A1, $27, $08, $A0, $14
	.byte $02, $0D, $16, $07, $0E, $15, $0C, $0F, $56, $15, $04, $36, $19, $70, $FF
