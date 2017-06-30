	.word W6F2CL	; Alternate level layout
	.word W6F2CO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_MUCK | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $B1, $4A, $20, $02, $A0, $00, $20, $7E, $B9, $00, $20, $7E, $A1, $00, $2F, $00
	.byte $B1, $00, $27, $03, $57, $00, $27, $B5, $17, $23, $04, $B7, $1B, $21, $02, $56
	.byte $1D, $92, $0D, $77, $1D, $91, $99, $1F, $60, $01, $B7, $29, $21, $02, $77, $29
	.byte $A1, $B5, $2B, $23, $04, $99, $27, $60, $03, $57, $31, $81, $0D, $B7, $3F, $21
	.byte $04, $36, $33, $89, $32, $18, $83, $32, $2C, $83, $35, $13, $21, $57, $45, $81
	.byte $0D, $35, $15, $00, $51, $4B, $66, $01, $36, $48, $A2, $36, $4E, $A2, $B7, $53
	.byte $21, $04, $15, $24, $0D, $A1, $5A, $23, $0C, $A5, $5A, $2B, $00, $AC, $67, $2C
	.byte $17, $05, $5B, $8C, $0C, $67, $6C, $99, $5B, $60, $0C, $2F, $5C, $D1, $2B, $60
	.byte $D1, $27, $64, $D1, $A1, $7E, $2A, $00, $2A, $7C, $E3, $28, $69, $23, $28, $70
	.byte $23, $28, $72, $00, $28, $6E, $0F, $25, $69, $84, $25, $6F, $84, $26, $69, $84
	.byte $26, $6F, $84, $B4, $41, $22, $00, $E7, $63, $50, $FF
