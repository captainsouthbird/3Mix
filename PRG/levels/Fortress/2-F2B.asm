	.word W2F2CL	; Alternate level layout
	.word W2F2CO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $60, $00, $D1, $0F, $62, $02, $3F, $0B, $62, $00, $DF, $01, $62, $0E, $DF, $01
	.byte $6B, $02, $EB, $60, $12, $EB, $22, $07, $D3, $63, $10, $DF, $01, $63, $1E, $DF
	.byte $01, $63, $12, $3F, $0B, $61, $16, $D3, $03, $65, $12, $EB, $22, $12, $83, $69
	.byte $12, $EB, $6A, $16, $D3, $03, $6E, $12, $EB, $2B, $1A, $83, $63, $22, $EB, $64
	.byte $22, $3F, $0B, $64, $20, $DF, $01, $64, $2E, $DF, $01, $64, $26, $D3, $03, $68
	.byte $22, $EB, $25, $2A, $83, $6C, $22, $EB, $6D, $26, $D3, $03, $65, $30, $DF, $01
	.byte $65, $3E, $DF, $01, $65, $32, $3F, $0B, $62, $32, $EB, $66, $32, $EB, $2E, $22
	.byte $83, $24, $34, $87, $62, $40, $D4, $0F, $00, $4B, $00, $E4, $18, $40, $0E, $24
	.byte $08, $FF
