	.word W2F1AL	; Alternate level layout
	.word W2F1AO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $00, $00, $E3, $0F, $04, $0E, $E2, $01, $0A, $0E, $E2, $01, $0A, $00, $E0, $06
	.byte $0D, $06, $E0, $09, $0C, $0B, $0B, $01, $10, $E0, $06, $04, $16, $E0, $09, $07
	.byte $10, $E0, $06, $0A, $16, $E0, $09, $0D, $10, $E0, $06, $01, $1E, $E2, $01, $07
	.byte $1E, $E2, $01, $01, $26, $E0, $09, $0D, $1E, $E2, $01, $04, $20, $E0, $06, $07
	.byte $26, $E0, $09, $04, $2E, $E2, $01, $0A, $20, $E0, $06, $0D, $26, $E0, $09, $0A
	.byte $2E, $E2, $01, $01, $30, $E0, $06, $04, $36, $E0, $09, $01, $3E, $E2, $01, $07
	.byte $30, $E0, $06, $07, $3E, $E8, $01, $0A, $30, $E4, $0D, $08, $33, $00, $E3, $18
	.byte $13, $0C, $0B, $0D, $04, $06, $E5, $00, $07, $04, $09, $FF
