	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_NONE | LEVEL5_TIME_UNLIMITED

	.byte $19, $00, $10, $1F, $15, $03, $10, $00, $15, $0B, $10, $00, $15, $13, $10, $00
	.byte $15, $1B, $10, $00, $11, $07, $10, $00, $11, $0F, $10, $00, $11, $17, $10, $00
	.byte $0D, $03, $10, $00, $0D, $0B, $10, $00, $0D, $13, $10, $00, $0D, $1B, $10, $00
	.byte $20, $01, $D1, $10, $1C, $0A, $FF
