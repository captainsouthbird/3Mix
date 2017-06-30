	.word W701BL	; Alternate level layout
	.word W701BO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(3) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GOODEGG | LEVEL5_TIME_400

	.byte $40, $00, $0F, $80, $00, $08, $89, $00, $2F, $10, $B9, $00, $20, $0F, $B0, $00
	.byte $20, $0B, $A9, $00, $2F, $00, $AD, $0F, $2B, $00, $AC, $04, $20, $0B, $32, $03
	.byte $88, $B5, $05, $23, $00, $B5, $07, $20, $04, $35, $03, $70, $A0, $00, $28, $0F
	.byte $0C, $11, $59, $AD, $32, $25, $11, $73, $3D, $83, $73, $32, $73, $94, $3A, $B2
	.byte $02, $6A, $3D, $53, $6A, $38, $63, $8A, $3A, $83, $02, $18, $3B, $0C, $27, $3A
	.byte $82, $28, $33, $22, $28, $41, $22, $2E, $30, $81, $28, $34, $70, $30, $30, $81
	.byte $32, $30, $81, $2E, $45, $81, $30, $45, $81, $32, $45, $81, $A0, $44, $20, $17
	.byte $A2, $4F, $5A, $07, $A8, $51, $2F, $00, $A1, $4D, $2B, $00, $B0, $49, $20, $12
	.byte $A1, $57, $2B, $00, $49, $59, $83, $0B, $AC, $5B, $23, $00, $AC, $59, $50, $01
	.byte $AD, $5C, $20, $1F, $A9, $65, $23, $16, $25, $67, $23, $25, $69, $70, $24, $56
	.byte $0B, $E7, $28, $60, $96, $11, $54, $09, $B6, $1A, $23, $10, $34, $1C, $8C, $AB
	.byte $05, $7A, $B7, $39, $81, $04, $A8, $39, $81, $04, $AE, $4C, $81, $03, $AE, $56
	.byte $81, $03, $A7, $67, $81, $03, $FF
