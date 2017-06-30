	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSS | LEVEL5_TIME_300

	.byte $6F, $00, $4F, $56, $00, $B0, $02, $56, $0D, $B0, $02, $35, $10, $10, $73, $06
	.byte $33, $54, $06, $B0, $03, $4E, $00, $B0, $0F, $79, $00, $3F, $18, $05, $30, $FF
