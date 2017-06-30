	.word W605BL	; Alternate level layout
	.word W605BO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_07 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $79, $00, $81, $0F, $39, $05, $91, $36, $03, $01, $E0, $02, $40, $15, $07, $11
	.byte $00, $15, $08, $21, $05, $12, $0A, $F2, $52, $09, $E2, $16, $0A, $E2, $30, $0A
	.byte $0F, $FF
