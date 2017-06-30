	.word W4F1DL	; Alternate level layout
	.word W4F1DO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_400

	.byte $61, $50, $37, $18, $69, $00, $3F, $9F, $17, $16, $E1, $00, $17, $20, $E1, $02
	.byte $79, $23, $41, $02, $17, $26, $E1, $02, $79, $35, $30, $04, $1A, $35, $C4, $16
	.byte $44, $E2, $04, $79, $51, $30, $04, $1A, $51, $C4, $35, $19, $84, $34, $20, $82
	.byte $34, $26, $82, $33, $44, $84, $34, $43, $80, $34, $49, $80, $35, $42, $80, $35
	.byte $4A, $80, $2F, $5A, $43, $27, $57, $49, $47, $5B, $F8, $16, $57, $E2, $00, $01
	.byte $57, $E5, $00, $01, $60, $E5, $00, $22, $59, $85, $24, $59, $85, $03, $5F, $0A
	.byte $17, $6C, $07, $E6, $68, $10, $35, $69, $01, $FF
