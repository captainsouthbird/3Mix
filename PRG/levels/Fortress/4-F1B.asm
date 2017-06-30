	.word W4F1CL	; Alternate level layout
	.word W4F1CO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_400

	.byte $19, $00, $E1, $64, $69, $00, $3F, $6F, $00, $00, $EB, $6F, $10, $00, $DF, $10
	.byte $10, $DF, $0C, $00, $E3, $6F, $79, $04, $30, $02, $79, $0D, $30, $02, $16, $14
	.byte $F1, $02, $10, $19, $F1, $04, $15, $19, $D1, $15, $14, $C1, $79, $1C, $30, $02
	.byte $16, $22, $F1, $02, $10, $20, $E1, $31, $15, $24, $F1, $03, $12, $28, $F1, $02
	.byte $15, $28, $D1, $79, $2C, $30, $02, $12, $30, $E1, $21, $14, $34, $E0, $0E, $14
	.byte $30, $D3, $15, $34, $DE, $14, $43, $DE, $30, $67, $82, $32, $67, $82, $34, $67
	.byte $82, $36, $67, $82, $E6, $E3, $60, $18, $26, $09, $36, $6C, $92, $30, $6C, $80
	.byte $31, $6D, $80, $32, $6C, $80, $33, $6D, $80, $34, $6C, $80, $35, $6D, $80, $79
	.byte $16, $30, $01, $FF
