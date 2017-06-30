	.word W606AL	; Alternate level layout
	.word W606AO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_06 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $59, $00, $81, $18, $79, $09, $80, $0F, $34, $02, $A6, $79, $19, $81, $66, $11
	.byte $16, $15, $00, $11, $19, $25, $06, $0D, $1A, $F3, $4D, $19, $E3, $16, $1B, $E1
	.byte $12, $1A, $D2, $14, $2B, $22, $06, $14, $28, $12, $00, $10, $2C, $F3, $50, $2B
	.byte $E3, $14, $2C, $D2, $16, $2D, $E1, $08, $0A, $1E, $00, $08, $0C, $2E, $01, $07
	.byte $0B, $F0, $47, $0A, $E0, $09, $0E, $E0, $0D, $0E, $E0, $11, $0E, $E0, $15, $0E
	.byte $E0, $24, $0C, $0B, $24, $0D, $0A, $30, $29, $80, $2E, $28, $80, $2C, $26, $80
	.byte $2A, $23, $80, $2A, $20, $80, $2B, $1C, $80, $2C, $18, $80, $2A, $16, $80, $28
	.byte $14, $80, $26, $12, $80, $25, $0F, $80, $74, $3A, $84, $02, $72, $3D, $86, $02
	.byte $70, $40, $88, $02, $52, $43, $88, $0C, $70, $50, $84, $02, $72, $53, $83, $02
	.byte $74, $56, $84, $02, $50, $77, $09, $6E, $63, $80, $0B, $59, $62, $81, $07, $4E
	.byte $65, $6B, $01, $2B, $6E, $81, $29, $71, $81, $35, $39, $0E, $35, $59, $0E, $55
	.byte $50, $65, $00, $37, $54, $E1, $E5, $43, $3A, $37, $60, $A1, $76, $00, $80, $01
	.byte $FF
