	.word W703BL	; Alternate level layout
	.word W703BO	; Alternate object layout
	.byte LEVEL1_SIZE_15 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_12 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(25) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FFGALAXYF | LEVEL5_TIME_300

	.byte $40, $00, $0E, $80, $00, $08, $B6, $00, $63, $04, $B9, $00, $60, $10, $B6, $11
	.byte $63, $04, $B3, $13, $62, $00, $B2, $12, $60, $02, $13, $15, $40, $13, $12, $30
	.byte $6F, $1D, $20, $6F, $1F, $10, $90, $1D, $43, $03, $10, $21, $10, $10, $1C, $20
	.byte $11, $1C, $D1, $71, $21, $D1, $13, $21, $40, $13, $1C, $30, $74, $1F, $40, $74
	.byte $1D, $30, $6F, $26, $20, $6F, $28, $10, $10, $25, $20, $90, $26, $43, $03, $10
	.byte $2A, $10, $11, $25, $D1, $71, $2A, $D1, $13, $25, $30, $13, $2A, $40, $74, $26
	.byte $30, $74, $28, $40, $37, $07, $88, $2D, $1D, $83, $36, $1D, $83, $30, $23, $80
	.byte $31, $23, $80, $32, $23, $80, $33, $23, $80, $30, $2C, $80, $31, $2C, $80, $32
	.byte $2C, $80, $33, $2C, $80, $11, $2E, $D1, $90, $2F, $43, $03, $10, $2E, $20, $6F
	.byte $2F, $20, $6F, $31, $10, $71, $33, $D1, $10, $33, $10, $13, $2E, $30, $13, $33
	.byte $40, $74, $2F, $30, $74, $31, $40, $2D, $2F, $83, $36, $2F, $83, $AB, $37, $23
	.byte $0A, $AC, $42, $2D, $02, $0F, $37, $7B, $2A, $34, $82, $A3, $48, $2F, $08, $B9
	.byte $45, $20, $0D, $29, $46, $81, $2C, $46, $81, $2F, $46, $81, $32, $46, $81, $35
	.byte $46, $81, $38, $46, $81, $36, $49, $00, $4F, $13, $04, $B8, $4B, $20, $00, $73
	.byte $52, $0A, $99, $53, $51, $16, $94, $5A, $56, $08, $B4, $5B, $41, $06, $13, $5A
	.byte $04, $13, $62, $01, $73, $63, $0B, $A0, $3D, $25, $13, $A0, $51, $2C, $06, $A0
	.byte $58, $27, $07, $30, $5B, $81, $30, $61, $81, $2E, $5E, $81, $30, $64, $0A, $B9
	.byte $69, $20, $05, $B0, $6D, $20, $07, $2E, $6E, $86, $2D, $6E, $86, $AA, $6D, $20
	.byte $07, $AB, $70, $24, $01, $4A, $73, $B0, $00, $51, $6F, $B0, $00, $4A, $6F, $B0
	.byte $00, $51, $73, $B0, $00, $34, $71, $0B, $27, $71, $00, $AA, $79, $6F, $06, $0B
	.byte $81, $53, $0F, $85, $53, $13, $89, $53, $13, $85, $73, $0F, $81, $73, $0F, $80
	.byte $13, $13, $84, $13, $17, $88, $13, $93, $80, $47, $03, $97, $84, $43, $03, $17
	.byte $89, $73, $17, $8D, $53, $9A, $90, $80, $05, $0A, $80, $53, $0E, $80, $70, $AD
	.byte $85, $63, $01, $47, $7C, $04, $36, $90, $85, $B4, $9B, $21, $06, $16, $A2, $80
	.byte $16, $9B, $70, $77, $A0, $80, $77, $9C, $70, $BA, $9B, $40, $17, $18, $9E, $E2
	.byte $78, $9F, $E2, $97, $9E, $50, $01, $1A, $96, $04, $B2, $A7, $21, $08, $14, $A7
	.byte $71, $14, $AF, $81, $76, $A9, $70, $76, $AD, $80, $95, $A9, $50, $05, $96, $AB
	.byte $50, $01, $17, $AB, $E3, $77, $AC, $E3, $B8, $99, $20, $00, $19, $99, $E1, $79
	.byte $9A, $E1, $32, $9C, $85, $2F, $A9, $25, $2F, $AD, $00, $0D, $73, $0C, $72, $AD
	.byte $60, $72, $A9, $50, $92, $AB, $20, $01, $9A, $B4, $70, $2F, $93, $AB, $80, $01
	.byte $B8, $B3, $61, $05, $B8, $BE, $61, $05, $1A, $B3, $D0, $B9, $BA, $41, $03, $35
	.byte $B5, $82, $35, $C0, $82, $B8, $A4, $20, $00, $19, $A4, $E1, $79, $A5, $E1, $19
	.byte $A7, $01, $19, $A8, $04, $1A, $A7, $E0, $7A, $A8, $E0, $17, $A8, $0D, $B7, $C4
	.byte $62, $05, $B5, $CA, $64, $05, $33, $CC, $82, $56, $D1, $84, $02, $B5, $D4, $64
	.byte $05, $7A, $D0, $D0, $56, $DB, $84, $02, $B5, $DE, $64, $05, $B1, $E0, $63, $01
	.byte $B0, $DF, $60, $03, $11, $E3, $40, $11, $DF, $30, $2D, $E9, $91, $AF, $E7, $60
	.byte $04, $1A, $D4, $D0, $1A, $DE, $D0, $7A, $DA, $D0, $7A, $E4, $D0, $90, $E8, $4A
	.byte $03, $71, $EB, $D9, $11, $E8, $D9, $2E, $E0, $82, $EE, $52, $40, $B0, $12, $73
	.byte $AC, $1D, $81, $15, $B6, $1D, $81, $15, $A9, $39, $78, $B6, $52, $71, $B4, $54
	.byte $71, $B2, $56, $71, $A8, $6D, $79, $AA, $81, $70, $AB, $82, $70, $AC, $83, $70
	.byte $B1, $88, $70, $B2, $89, $70, $B3, $8A, $70, $B4, $8B, $70, $B5, $8C, $70, $B6
	.byte $8D, $70, $B1, $A9, $71, $B2, $AB, $71, $B1, $AD, $71, $B2, $D4, $81, $06, $AA
	.byte $E7, $81, $05, $BA, $36, $40, $0A, $B9, $34, $20, $00, $B9, $41, $20, $00, $38
	.byte $3C, $0B, $BA, $70, $40, $06, $B9, $77, $20, $00, $FF
