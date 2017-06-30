	.word W2F2AL	; Alternate level layout
	.word W2F2AO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $6C, $21, $2F, $0D, $62, $01, $2F, $0D, $60, $00, $D1, $0F, $62, $00, $DF, $00
	.byte $62, $0F, $DF, $00, $67, $06, $63, $6A, $04, $67, $6E, $01, $63, $6E, $0B, $53
	.byte $63, $11, $2F, $0D, $63, $10, $DF, $00, $63, $1F, $DF, $00, $63, $15, $65, $67
	.byte $14, $57, $6B, $11, $D7, $00, $6B, $1E, $D7, $00, $6B, $12, $52, $6E, $13, $54
	.byte $64, $22, $27, $0B, $64, $20, $D7, $01, $64, $2E, $D7, $01, $67, $2A, $53, $62
	.byte $28, $63, $06, $24, $C3, $67, $24, $D0, $03, $6B, $25, $65, $60, $33, $69, $6C
	.byte $20, $DF, $00, $6C, $2F, $DF, $00, $64, $38, $65, $68, $33, $59, $6C, $32, $59
	.byte $6D, $31, $2F, $0D, $6D, $30, $DF, $00, $6D, $3F, $DF, $00, $61, $4B, $53, $64
	.byte $42, $69, $68, $41, $63, $6A, $40, $D4, $0F, $E0, $61, $D4, $22, $07, $C1, $0A
	.byte $1E, $09, $FF
