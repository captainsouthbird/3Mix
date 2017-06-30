	.word W2F1BL	; Alternate level layout
	.word W2F1BO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $68, $02, $20, $40, $00, $00, $01, $6C, $04, $3C, $25, $79, $00, $D1, $1D, $6C
	.byte $00, $D6, $1D, $73, $00, $D5, $03, $76, $1E, $D4, $14, $74, $21, $D1, $11, $6C
	.byte $1E, $D3, $14, $70, $2A, $D3, $08, $12, $27, $0C, $13, $23, $0B, $E2, $51, $30
	.byte $69, $00, $D2, $4C, $60, $00, $D0, $4C, $61, $00, $D7, $01, $63, $03, $D2, $04
	.byte $63, $0A, $D1, $07, $63, $13, $D2, $08, $63, $1E, $D2, $03, $63, $24, $D2, $02
	.byte $66, $2E, $D0, $04, $65, $2E, $D0, $00, $61, $32, $D4, $00, $04, $31, $00, $65
	.byte $0D, $33, $01, $07, $0F, $F0, $01, $07, $0C, $F0, $01, $05, $0A, $10, $05, $11
	.byte $10, $08, $10, $E0, $01, $08, $0A, $E0, $01, $61, $33, $D2, $19, $64, $43, $D4
	.byte $09, $07, $41, $00, $26, $33, $24, $26, $3B, $00, $E3, $F8, $30, $07, $0D, $0D
	.byte $04, $33, $5F, $06, $03, $54, $05, $0C, $54, $06, $13, $58, $06, $1E, $53, $06
	.byte $24, $52, $07, $2E, $54, $E0, $52, $20, $13, $23, $0C, $61, $12, $F4, $02, $19
	.byte $08, $E4, $58, $43, $FF
