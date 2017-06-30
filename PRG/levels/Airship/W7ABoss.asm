	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $05, $01, $F1, $07, $01, $E0, $06, $02, $E0, $04, $03, $F1, $03, $04, $E1, $03
	.byte $07, $F2, $06, $08, $E0, $04, $09, $F1, $03, $0A, $F2, $04, $0C, $E1, $67, $02
	.byte $10, $66, $03, $10, $63, $05, $10, $66, $09, $10, $64, $0D, $10, $00, $00, $4B
	.byte $00, $0F, $4B, $0B, $01, $1D, $00, $01, $1D, $01, $01, $1D, $2B, $07, $A0, $FF
