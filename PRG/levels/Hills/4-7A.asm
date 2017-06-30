	.word W407BL	; Alternate level layout
	.word W407BO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_14 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $40, $00, $0E, $6F, $18, $69, $99, $06, $51, $45, $99, $00, $81, $05, $04, $24
	.byte $6A, $8F, $1A, $59, $1D, $04, $2D, $5A, $04, $2C, $01, $04, $25, $04, $05, $2C
	.byte $EF, $8F, $26, $2B, $05, $15, $2C, $E5, $65, $25, $EF, $75, $25, $E5, $6F, $38
	.byte $59, $25, $28, $81, $28, $28, $81, $2B, $28, $81, $2E, $28, $81, $31, $28, $81
	.byte $34, $28, $81, $37, $28, $81, $99, $4C, $81, $05, $E2, $08, $18, $15, $4D, $0C
	.byte $2A, $37, $70, $35, $04, $70, $FF
