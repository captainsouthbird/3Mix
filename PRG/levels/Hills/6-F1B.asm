	.word W6F1AL	; Alternate level layout
	.word W6F1AO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $40, $00, $0E, $B9, $00, $20, $50, $AE, $00, $21, $50, $AF, $00, $29, $00, $AF
	.byte $0E, $29, $06, $57, $02, $21, $37, $0C, $91, $34, $07, $A1, $2E, $07, $D1, $51
	.byte $04, $21, $31, $0A, $F1, $AF, $01, $23, $01, $AF, $0C, $23, $01, $36, $07, $41
	.byte $11, $07, $0D, $31, $08, $80, $32, $07, $81, $36, $09, $02, $E0, $31, $38, $57
	.byte $16, $21, $34, $1A, $A4, $31, $25, $D4, $53, $1C, $21, $35, $23, $F1, $33, $1A
	.byte $41, $34, $1A, $41, $35, $25, $41, $36, $25, $41, $36, $19, $00, $36, $27, $22
	.byte $36, $30, $A2, $34, $32, $A4, $37, $34, $A1, $36, $38, $A2, $34, $3A, $A4, $37
	.byte $3C, $A1, $35, $36, $93, $E3, $32, $8A, $AE, $50, $2B, $08, $56, $4E, $E2, $56
	.byte $4B, $E2, $56, $4C, $E0, $56, $4D, $E0, $17, $4C, $0F, $17, $4D, $0F, $36, $49
	.byte $00, $E4, $68, $10, $FF
