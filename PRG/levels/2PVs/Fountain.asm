; Original address was $0002

	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_040
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_12 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(18) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BATTLE | LEVEL5_TIME_300

	.byte $00, $03, $03, $29, $07, $A3, $FF
