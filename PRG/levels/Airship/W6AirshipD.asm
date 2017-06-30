	.word W6Airship_BossL	; Alternate level layout
	.word W6Airship_BossO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $10, $00, $4A, $10, $0F, $4A, $1A, $01, $1D, $10, $01, $1D, $38, $02, $A1, $19
	.byte $07, $17, $18, $08, $15, $36, $0A, $91, $34, $0E, $00, $E0, $02, $10, $FF
