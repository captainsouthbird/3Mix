	.word W103AL	; Alternate level layout
	.word W103AO	; Alternate object layout
	.byte LEVEL1_SIZE_11 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_06 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(4) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $11, $48, $04, $11, $22, $04, $34, $02, $A6, $19, $04, $10, $10, $78, $17, $C0
	.byte $19, $18, $04, $75, $1D, $C6, $16, $21, $04, $70, $20, $C2, $2F, $21, $82, $78
	.byte $26, $C0, $19, $27, $04, $37, $27, $80, $74, $29, $C2, $15, $2B, $04, $2D, $2B
	.byte $81, $70, $2E, $C6, $11, $32, $04, $79, $3A, $C2, $1A, $3C, $04, $31, $3A, $81
	.byte $79, $44, $C2, $1A, $46, $04, $70, $46, $C2, $2F, $46, $84, $36, $44, $00, $79
	.byte $4A, $C2, $1A, $4C, $04, $74, $4F, $C2, $15, $51, $04, $70, $57, $C4, $11, $5A
	.byte $04, $2E, $61, $81, $2E, $66, $81, $2E, $6A, $81, $76, $6B, $C2, $17, $6D, $04
	.byte $72, $72, $C6, $13, $76, $04, $79, $7D, $C2, $1A, $7F, $04, $38, $7E, $82, $75
	.byte $82, $C2, $16, $84, $04, $30, $87, $81, $75, $89, $C2, $16, $8B, $04, $1A, $90
	.byte $10, $1F, $39, $99, $45, $38, $99, $45, $37, $99, $45, $36, $99, $45, $35, $9B
	.byte $43, $34, $9B, $43, $33, $9D, $41, $32, $9D, $41, $51, $A7, $09, $09, $22, $0A
	.byte $0C, $90, $0B, $2D, $90, $80, $2E, $90, $80, $FF
