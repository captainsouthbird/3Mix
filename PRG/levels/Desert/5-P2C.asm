	.word W5PB2L	; Alternate level layout
	.word W5PB2O	; Alternate object layout
	.byte LEVEL1_SIZE_06 | LEVEL1_YSTART_180
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $0F, $00, $6F, $19, $08, $61, $19, $0E, $63, $18, $0F, $62, $18, $09, $60, $19
	.byte $03, $60, $7A, $06, $C1, $7A, $0C, $C1, $7A, $16, $C3, $19, $1A, $63, $18, $1B
	.byte $62, $17, $1C, $61, $16, $1D, $60, $0F, $20, $6F, $10, $26, $64, $11, $27, $63
	.byte $12, $28, $62, $13, $29, $61, $14, $2A, $60, $0F, $40, $6F, $7A, $22, $C3, $10
	.byte $33, $6F, $11, $34, $6F, $12, $35, $6F, $13, $36, $6F, $14, $37, $6F, $15, $38
	.byte $6F, $16, $39, $6F, $10, $53, $66, $11, $54, $65, $12, $55, $65, $13, $56, $64
	.byte $14, $57, $64, $15, $58, $63, $16, $59, $63, $18, $5D, $0B, $77, $3B, $4F, $77
	.byte $4B, $4F, $77, $5B, $44, $E5, $58, $60, $10, $30, $0F, $15, $2B, $63, $74, $2D
	.byte $33, $16, $32, $60, $FF
