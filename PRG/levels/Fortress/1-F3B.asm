	.word W1F1AL	; Alternate level layout
	.word W1F1AO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $6B, $00, $3F, $4F, $16, $00, $E1, $20, $79, $00, $41, $31, $32, $05, $00, $56
	.byte $21, $4C, $16, $2E, $E1, $03, $16, $32, $E4, $04, $0B, $2E, $E6, $08, $0B, $37
	.byte $E3, $18, $18, $37, $E2, $18, $15, $2E, $0B, $76, $21, $30, $0C, $FF
