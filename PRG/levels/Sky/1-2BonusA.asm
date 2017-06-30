	.word W102AL	; Alternate level layout
	.word W102AO	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(13) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $00, $00, $03, $00, $00, $02, $02, $04, $08, $02, $18, $06, $0C, $02, $07, $08
	.byte $16, $D9, $E1, $08, $45, $27, $12, $80, $28, $12, $80, $29, $12, $80, $2A, $12
	.byte $80, $2B, $12, $80, $45, $03, $B0, $0C, $06, $0E, $0B, $06, $0B, $0B, $06, $08
	.byte $0B, $06, $05, $0B, $03, $02, $0B, $22, $02, $40, $FF
