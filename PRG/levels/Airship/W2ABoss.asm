	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $06, $01, $E1, $04, $02, $E1, $03, $04, $E3, $05, $05, $F2, $06, $06, $F0, $04
	.byte $07, $E1, $05, $08, $E1, $04, $0B, $E1, $66, $02, $10, $64, $03, $10, $63, $05
	.byte $10, $64, $08, $10, $65, $09, $10, $64, $0C, $10, $00, $00, $4B, $07, $0F, $45
	.byte $0A, $01, $59, $0A, $04, $62, $0A, $06, $62, $0A, $0B, $62, $0A, $0D, $62, $00
	.byte $01, $1E, $20, $06, $D1, $41, $0B, $B2, $00, $04, $0B, $14, $05, $0B, $14, $06
	.byte $0B, $14, $07, $0E, $42, $FF
