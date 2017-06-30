	.word W2F2GL	; Alternate level layout
	.word W2F2GO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_400

	.byte $40, $0E, $BF, $01, $41, $1E, $BF, $01, $45, $0D, $B1, $00, $49, $0C, $B0, $01
	.byte $02, $08, $01, $09, $02, $01, $23, $1B, $40, $07, $0B, $08, $0D, $06, $01, $2D
	.byte $1C, $40, $01, $1C, $08, $00, $1C, $40, $06, $0B, $40, $26, $2B, $40, $0B, $1B
	.byte $08, $0A, $1B, $40, $05, $11, $01, $0C, $15, $01, $06, $18, $00, $42, $2E, $BF
	.byte $01, $09, $21, $01, $23, $3C, $40, $04, $2C, $08, $03, $2C, $40, $43, $3E, $BF
	.byte $01, $03, $26, $01, $05, $36, $01, $23, $4B, $40, $01, $3B, $08, $00, $3B, $40
	.byte $44, $4E, $B6, $01, $00, $4C, $40, $4B, $40, $B3, $0F, $01, $4C, $08, $27, $44
	.byte $35, $28, $44, $35, $29, $44, $35, $2A, $44, $35, $29, $4C, $E1, $23, $45, $00
	.byte $23, $46, $22, $0E, $31, $01, $E4, $F1, $C0, $26, $4D, $08, $FF
