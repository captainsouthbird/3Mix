	.word WZFinalBL	; Alternate level layout
	.word WZFinalBO	; Alternate object layout
	.byte LEVEL1_SIZE_03 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_RED | LEVEL5_TIME_UNLIMITED

	.byte $09, $00, $10, $0A, $09, $20, $10, $0F, $00, $28, $13, $0A, $09, $0C, $49, $00
	.byte $15, $28, $00, $1E, $28, $00, $27, $28, $08, $1F, $00, $08, $16, $00, $08, $0D
	.byte $00, $0A, $21, $10, $0E, $0B, $22, $10, $0D, $0C, $23, $10, $0C, $0D, $24, $10
	.byte $0B, $0E, $25, $10, $0A, $0A, $00, $10, $09, $0B, $00, $10, $08, $0C, $00, $10
	.byte $07, $0D, $00, $10, $06, $E2, $68, $10, $FF
