	.word WZ2BL	; Alternate level layout
	.word WZ2BO	; Alternate object layout
	.byte LEVEL1_SIZE_03 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_300

	.byte $40, $00, $0C, $19, $00, $51, $40, $60, $00, $28, $30, $69, $00, $1F, $71, $03
	.byte $27, $01, $76, $01, $22, $01, $73, $07, $20, $01, $71, $0B, $20, $01, $11, $10
	.byte $F0, $11, $12, $F0, $11, $14, $F0, $11, $16, $F0, $71, $18, $20, $01, $71, $1B
	.byte $20, $01, $71, $1F, $20, $01, $74, $24, $20, $01, $71, $28, $20, $01, $69, $10
	.byte $1F, $69, $20, $1F, $79, $2C, $20, $03, $2E, $2A, $84, $2D, $2D, $80, $2F, $2D
	.byte $80, $30, $2C, $80, $2C, $2C, $80, $E2, $68, $10, $FF
