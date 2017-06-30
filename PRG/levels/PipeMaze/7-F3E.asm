	.word W7FBL	; Alternate level layout
	.word W7FBO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $79, $00, $95, $38, $02, $A2, $38, $0B, $A2, $10, $0B, $46, $77, $09, $95, $76
	.byte $08, $97, $74, $08, $F0, $74, $0F, $E0, $6E, $09, $95, $6F, $0A, $93, $6C, $09
	.byte $F0, $6C, $0E, $E0, $2C, $0F, $40, $2D, $0F, $40, $2C, $08, $40, $2D, $08, $40
	.byte $33, $09, $81, $33, $0D, $81, $2B, $0A, $83, $2A, $0C, $0B, $76, $05, $51, $01
	.byte $36, $16, $A4, $75, $14, $95, $74, $13, $97, $52, $15, $31, $50, $19, $33, $33
	.byte $22, $A7, $72, $21, $93, $71, $20, $95, $6F, $25, $E0, $6F, $20, $F0, $71, $1C
	.byte $51, $01, $34, $2C, $A6, $73, $2B, $93, $72, $2A, $95, $6E, $2B, $93, $6D, $2C
	.byte $91, $20, $2C, $DC, $2F, $2A, $85, $30, $2A, $85, $31, $2A, $85, $37, $35, $A3
	.byte $37, $3D, $A3, $76, $34, $9B, $14, $39, $0A, $14, $3A, $0A, $13, $38, $83, $14
	.byte $38, $51, $14, $3B, $51, $E3, $68, $40, $32, $3D, $70, $2E, $10, $41, $FF
