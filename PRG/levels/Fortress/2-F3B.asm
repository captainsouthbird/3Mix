	.word W2F3CL	; Alternate level layout
	.word W2F3CO	; Alternate object layout
	.byte LEVEL1_SIZE_06 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_300

	.byte $65, $50, $3F, $0F, $60, $00, $3F, $0F, $61, $10, $3F, $0F, $62, $20, $3F, $0F
	.byte $63, $30, $3F, $0F, $64, $40, $3F, $0F, $60, $00, $D1, $0F, $62, $0F, $DF, $00
	.byte $62, $00, $DF, $00, $0B, $03, $E0, $09, $09, $08, $00, $0E, $02, $E0, $02, $0E
	.byte $0B, $E0, $02, $02, $15, $E0, $03, $02, $1A, $E0, $00, $66, $16, $D7, $03, $66
	.byte $10, $D7, $01, $66, $1E, $D7, $01, $06, $14, $E0, $01, $09, $12, $E0, $01, $06
	.byte $1C, $E0, $00, $83, $1A, $1A, $87, $1C, $17, $43, $10, $B2, $00, $43, $1F, $B2
	.byte $00, $0C, $14, $E0, $01, $00, $2C, $E0, $00, $6E, $10, $DF, $00, $6E, $1F, $DF
	.byte $00, $00, $22, $E0, $01, $03, $24, $E0, $07, $06, $22, $E0, $07, $09, $24, $E0
	.byte $01, $87, $28, $1A, $09, $29, $E0, $05, $60, $30, $DB, $00, $60, $3F, $DB, $00
	.byte $01, $3A, $E0, $03, $03, $38, $E0, $01, $06, $35, $E0, $01, $09, $37, $E0, $02
	.byte $6C, $30, $DD, $03, $6C, $3C, $DD, $03, $0D, $34, $E0, $05, $01, $46, $E0, $05
	.byte $04, $44, $E0, $05, $85, $49, $1A, $07, $4A, $E0, $01, $07, $47, $E0, $01, $88
	.byte $47, $1D, $6B, $40, $DD, $05, $6B, $4A, $DD, $05, $09, $56, $E0, $03, $27, $44
	.byte $81, $28, $44, $81, $27, $37, $82, $2E, $2A, $83, $21, $25, $85, $20, $16, $81
	.byte $28, $03, $23, $28, $05, $00, $E0, $58, $10, $09, $15, $09, $FF
