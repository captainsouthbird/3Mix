	.word W7FBL	; Alternate level layout
	.word W7FBO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $76, $00, $95, $77, $01, $93, $38, $02, $A2, $36, $09, $A4, $75, $08, $93, $74
	.byte $07, $95, $33, $12, $A7, $72, $11, $93, $71, $10, $95, $32, $08, $83, $2F, $11
	.byte $83, $21, $1A, $DF, $40, $00, $B0, $3F, $10, $1A, $02, $50, $1C, $22, $56, $14
	.byte $2E, $37, $22, $A3, $16, $22, $01, $10, $1E, $01, $32, $1E, $D1, $32, $20, $41
	.byte $2F, $28, $83, $30, $28, $83, $34, $29, $A6, $73, $28, $93, $72, $27, $95, $32
	.byte $32, $A8, $71, $31, $93, $70, $30, $95, $2E, $31, $83, $2D, $31, $83, $32, $2F
	.byte $0C, $45, $1C, $2F, $45, $2B, $23, $22, $22, $0A, $02, $1F, $0F, $75, $36, $99
	.byte $36, $37, $A4, $13, $3B, $0A, $13, $3C, $0A, $12, $3A, $83, $13, $3A, $51, $13
	.byte $3D, $51, $E3, $68, $40, $FF
