	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_000
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $00, $00, $0F, $00, $00, $4B, $0A, $01, $41, $0A, $02, $41, $0A, $06, $41, $0A
	.byte $07, $61, $68, $0F, $10, $0A, $03, $61, $0A, $05, $41, $0A, $09, $41, $0A, $0A
	.byte $61, $0A, $0B, $61, $0A, $0E, $61, $0A, $0F, $61, $0A, $0C, $61, $00, $0F, $4B
	.byte $40, $01, $B0, $0D, $2A, $01, $05, $2A, $02, $05, $2A, $03, $05, $2A, $04, $05
	.byte $2A, $05, $05, $2A, $06, $05, $2A, $07, $05, $2A, $08, $05, $2A, $09, $05, $2A
	.byte $0A, $05, $2A, $0B, $05, $2A, $0C, $05, $2A, $0D, $05, $2A, $0E, $05, $20, $01
	.byte $D1, $FF
