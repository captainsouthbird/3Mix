	.word W6F2BL	; Alternate level layout
	.word W6F2BO	; Alternate object layout
	.byte LEVEL1_SIZE_15 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $40, $00, $0E, $B9, $00, $20, $35, $A0, $00, $2F, $1E, $51, $06, $E6, $51, $09
	.byte $E3, $51, $0C, $E5, $51, $0F, $E1, $51, $12, $E6, $55, $16, $0A, $98, $08, $D1
	.byte $98, $0E, $D1, $A4, $24, $2E, $02, $B3, $21, $25, $06, $35, $20, $0C, $2F, $22
	.byte $F1, $24, $22, $F1, $29, $22, $F1, $A0, $1F, $20, $CF, $A1, $2D, $2F, $02, $42
	.byte $2B, $EF, $52, $2B, $E4, $BA, $37, $40, $89, $A1, $42, $2F, $02, $32, $43, $D1
	.byte $B1, $4C, $22, $08, $A1, $52, $2F, $02, $37, $57, $83, $37, $5D, $83, $35, $64
	.byte $24, $35, $66, $01, $B2, $73, $20, $08, $A1, $88, $2F, $09, $32, $8A, $D1, $32
	.byte $8F, $D1, $14, $8D, $0C, $36, $6E, $83, $36, $79, $83, $36, $83, $83, $B7, $B0
	.byte $20, $08, $B4, $B6, $23, $0A, $74, $B5, $62, $97, $B1, $50, $04, $70, $C0, $63
	.byte $94, $BA, $50, $07, $AE, $C1, $2B, $2D, $2B, $C2, $22, $2B, $C8, $22, $2B, $CE
	.byte $22, $2B, $C9, $00, $2C, $D5, $A1, $2A, $D9, $A3, $28, $DD, $A5, $A1, $ED, $2C
	.byte $01, $2C, $EB, $E4, $EE, $63, $70, $FF
