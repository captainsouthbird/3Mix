	.word W205CL	; Alternate level layout
	.word W205CO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $27, $05, $A2, $04, $0A, $01, $03, $0D, $00, $6A, $05, $9F, $29, $0D, $82, $69
	.byte $11, $98, $67, $0D, $9C, $6A, $18, $9B, $45, $1A, $C4, $00, $66, $1B, $97, $22
	.byte $19, $82, $43, $22, $C2, $00, $67, $20, $9F, $64, $23, $9F, $42, $31, $C1, $00
	.byte $21, $2D, $82, $46, $33, $C2, $00, $66, $25, $9D, $25, $32, $82, $66, $34, $9F
	.byte $40, $3D, $C5, $00, $68, $34, $95, $68, $28, $98, $69, $22, $9F, $69, $32, $91
	.byte $6B, $23, $9F, $6B, $33, $92, $25, $21, $40, $26, $21, $40, $6A, $3A, $95, $24
	.byte $42, $91, $E4, $F1, $20, $07, $1B, $0A, $4F, $50, $DA, $08, $7A, $50, $9F, $7A
	.byte $60, $9F, $51, $66, $09, $16, $5E, $10, $02, $12, $5F, $10, $02, $FF
