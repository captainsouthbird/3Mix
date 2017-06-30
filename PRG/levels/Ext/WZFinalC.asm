	.word WZFinalDL	; Alternate level layout
	.word WZFinalDO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_RED | LEVEL5_TIME_UNLIMITED

	.byte $40, $00, $0C, $19, $00, $10, $0E, $00, $00, $19, $0E, $20, $07, $DC, $0B, $00
	.byte $15, $05, $0B, $09, $15, $05, $34, $08, $00, $53, $0E, $0A, $57, $0D, $0A, $53
	.byte $0A, $0A, $57, $0A, $0A, $57, $05, $0A, $53, $05, $0A, $53, $01, $0A, $57, $02
	.byte $0A, $75, $00, $20, $05, $75, $0A, $20, $05, $17, $07, $90, $E0, $02, $10, $FF
