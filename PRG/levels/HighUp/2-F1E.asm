	.word W2F1CL	; Alternate level layout
	.word W2F1CO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_400

	.byte $2E, $01, $1E, $45, $00, $A3, $0A, $29, $00, $1F, $2B, $00, $1F, $2A, $00, $1F
	.byte $E0, $18, $80, $03, $07, $00, $02, $0A, $01, $29, $10, $1F, $2A, $10, $1F, $2B
	.byte $10, $1F, $45, $18, $4F, $26, $17, $40, $25, $17, $40, $03, $19, $00, $02, $1D
	.byte $01, $45, $28, $4F, $01, $2E, $01, $03, $33, $00, $45, $3A, $44, $02, $3C, $01
	.byte $25, $3F, $40, $26, $3F, $40, $29, $40, $1F, $2A, $40, $1F, $2B, $40, $1F, $18
	.byte $01, $10, $0E, $17, $01, $03, $17, $0F, $02, $2F, $07, $D1, $E4, $42, $70, $2D
	.byte $01, $1E, $2C, $01, $1E, $26, $0C, $00, $FF
