	.word W201CL	; Alternate level layout
	.word W201CO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $19, $00, $F7, $16, $08, $08, $15, $08, $40, $19, $09, $F7, $19, $11, $F7, $52
	.byte $33, $D8, $09, $4D, $33, $D4, $09, $55, $3D, $D5, $02, $E0, $88, $70, $18, $01
	.byte $0B, $51, $26, $09, $1A, $1B, $10, $0E, $1A, $2A, $10, $08, $16, $20, $F2, $FF
