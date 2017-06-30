	.word W5PB1L	; Alternate level layout
	.word W5PB1O	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $40, $00, $0E, $A0, $00, $2F, $04, $B1, $00, $28, $01, $B9, $00, $20, $64, $0C
	.byte $14, $6C, $99, $08, $50, $0C, $07, $06, $8C, $B1, $03, $21, $01, $36, $03, $00
	.byte $35, $08, $81, $32, $0B, $81, $2F, $0E, $81, $A5, $06, $21, $0A, $A5, $12, $20
	.byte $00, $AC, $15, $2C, $0A, $A8, $17, $22, $00, $A0, $06, $20, $64, $AA, $19, $20
	.byte $00, $2C, $11, $81, $0C, $21, $54, $B0, $21, $20, $02, $B1, $26, $20, $00, $91
	.byte $24, $50, $01, $0C, $33, $6C, $02, $29, $8C, $A2, $27, $2B, $00, $34, $22, $82
	.byte $35, $22, $82, $36, $22, $82, $37, $22, $82, $A6, $1E, $20, $07, $24, $1F, $85
	.byte $23, $1F, $85, $99, $27, $50, $0C, $AC, $34, $2B, $02, $A1, $3E, $24, $02, $A1
	.byte $4C, $2F, $02, $B1, $4C, $27, $02, $A7, $3B, $23, $00, $A7, $3D, $20, $03, $B0
	.byte $38, $21, $0F, $39, $3D, $05, $39, $42, $05, $39, $47, $05, $13, $38, $0E, $B6
	.byte $49, $21, $01, $0E, $46, $0F, $E4, $68, $70, $B4, $4A, $20, $00, $FF
