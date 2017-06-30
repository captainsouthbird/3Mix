	.word W602L	; Alternate level layout
	.word W602O	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_07 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(13) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $79, $00, $21, $06, $79, $14, $21, $02, $79, $23, $21, $02, $79, $33, $21, $02
	.byte $79, $40, $21, $0F, $13, $46, $02, $17, $4A, $09, $36, $49, $82, $38, $49, $82
	.byte $31, $4B, $0B, $50, $4C, $B0, $00, $E0, $08, $45, $E1, $08, $45, $E2, $08, $45
	.byte $E3, $08, $45, $FF
