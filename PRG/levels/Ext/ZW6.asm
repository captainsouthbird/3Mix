	.word WZW6BL	; Alternate level layout
	.word WZW6BO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_0B0
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_300

	.byte $40, $00, $0C, $60, $00, $20, $7F, $21, $00, $1F, $21, $10, $1F, $21, $20, $19
	.byte $60, $2A, $2F, $09, $70, $2A, $2A, $09, $7A, $00, $20, $29, $22, $00, $1F, $23
	.byte $00, $1F, $24, $00, $1F, $25, $00, $1F, $26, $00, $1F, $27, $00, $1F, $22, $10
	.byte $1F, $23, $10, $1F, $24, $10, $1F, $25, $10, $1F, $26, $10, $1F, $27, $10, $1F
	.byte $22, $20, $19, $23, $20, $19, $24, $20, $19, $25, $20, $19, $26, $20, $19, $27
	.byte $20, $19, $28, $13, $11, $29, $13, $11, $2A, $13, $11, $2B, $13, $11, $2C, $0E
	.byte $17, $2D, $0E, $17, $2E, $0E, $17, $6D, $0C, $20, $01, $2C, $11, $0D, $2D, $00
	.byte $17, $2E, $00, $18, $2F, $00, $19, $30, $00, $19, $31, $00, $1F, $31, $10, $1F
	.byte $32, $00, $1F, $33, $00, $1F, $34, $00, $1F, $35, $00, $1F, $36, $00, $1F, $37
	.byte $00, $1F, $32, $10, $1F, $33, $10, $1F, $34, $10, $1F, $35, $10, $1F, $36, $10
	.byte $1F, $37, $10, $1F, $31, $20, $19, $32, $20, $19, $33, $20, $19, $34, $20, $19
	.byte $35, $20, $19, $36, $20, $19, $37, $20, $19, $30, $18, $17, $30, $20, $19, $2F
	.byte $20, $19, $2E, $20, $19, $2D, $20, $19, $2C, $20, $19, $2B, $20, $19, $2A, $20
	.byte $19, $29, $20, $19, $28, $20, $19, $2F, $19, $16, $2E, $1A, $15, $2D, $1B, $14
	.byte $0B, $1E, $01, $18, $21, $01, $79, $34, $21, $05, $17, $35, $01, $73, $34, $20
	.byte $05, $71, $39, $21, $00, $1A, $3A, $50, $0D, $76, $3E, $20, $04, $32, $40, $22
	.byte $30, $36, $00, $6E, $44, $20, $03, $61, $48, $2F, $07, $71, $48, $29, $07, $2B
	.byte $46, $A2, $60, $50, $2F, $13, $70, $50, $28, $07, $70, $58, $24, $07, $19, $50
	.byte $10, $1F, $37, $59, $A1, $50, $69, $09, $E1, $68, $82, $E2, $68, $82, $E3, $68
	.byte $D4, $E0, $68, $75, $18, $0A, $08, $12, $43, $09, $FF
