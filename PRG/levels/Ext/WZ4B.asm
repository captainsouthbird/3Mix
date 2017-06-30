	.word WZ4CL	; Alternate level layout
	.word WZ4CO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_PURPLE | LEVEL5_TIME_300

	.byte $79, $00, $4F, $79, $10, $4F, $79, $20, $4F, $79, $30, $4F, $37, $01, $A1, $73
	.byte $00, $4F, $6F, $0E, $4F, $6F, $2F, $4F, $60, $16, $7A, $60, $34, $79, $68, $1E
	.byte $7B, $6C, $2E, $72, $6C, $1D, $72, $6A, $0C, $49, $6A, $0B, $75, $6F, $04, $46
	.byte $65, $00, $4F, $60, $0F, $74, $60, $10, $45, $6B, $1F, $49, $6F, $23, $4B, $73
	.byte $1F, $49, $78, $23, $49, $0E, $35, $80, $08, $14, $A0, $70, $33, $76, $75, $35
	.byte $49, $6D, $3F, $7B, $77, $26, $45, $E1, $61, $10, $13, $3B, $08, $FF
