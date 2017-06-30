	.word W201DL	; Alternate level layout
	.word W201DO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_000
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $49, $40, $B0, $0F, $02, $35, $68, $08, $32, $08, $07, $32, $40, $08, $34, $64
	.byte $07, $26, $64, $00, $28, $62, $03, $27, $61, $0E, $22, $F2, $04, $21, $F2, $01
	.byte $2C, $F2, $0B, $17, $F5, $06, $16, $F3, $04, $1A, $08, $03, $1A, $40, $04, $12
	.byte $F1, $01, $16, $F5, $09, $07, $08, $2D, $0A, $50, $06, $0A, $08, $2D, $05, $50
	.byte $05, $05, $08, $06, $06, $F3, $08, $07, $40, $04, $05, $40, $05, $0A, $40, $02
	.byte $03, $F2, $03, $09, $F2, $00, $07, $08, $6B, $33, $9C, $6B, $30, $91, $E3, $08
	.byte $1A, $E0, $78, $80, $24, $34, $20, $26, $2B, $20, $24, $26, $20, $20, $27, $20
	.byte $65, $3B, $D5, $05, $3B, $63, $6B, $28, $D5, $0B, $28, $64, $6E, $27, $D2, $0E
	.byte $27, $62, $FF
