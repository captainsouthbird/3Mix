	.word W2F1EL	; Alternate level layout
	.word W2F1EO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_300

	.byte $6B, $00, $3F, $64, $79, $00, $D1, $0B, $76, $00, $D2, $03, $18, $04, $C7, $15
	.byte $07, $E0, $02, $14, $0C, $E0, $01, $13, $0F, $E0, $01, $12, $12, $E0, $01, $12
	.byte $16, $E0, $02, $78, $1A, $D2, $03, $75, $1F, $D5, $01, $73, $22, $D3, $03, $73
	.byte $28, $D2, $02, $73, $2D, $D2, $00, $79, $2C, $D1, $03, $76, $30, $D4, $18, $6F
	.byte $31, $D2, $0F, $6D, $31, $D1, $17, $6D, $49, $DD, $06, $E4, $28, $70, $14, $45
	.byte $07, $14, $18, $0A, $38, $18, $60, $FF
