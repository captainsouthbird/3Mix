	.word W8BCastlBL	; Alternate level layout
	.word W8BCastlBO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_AIRSHIP | LEVEL5_TIME_400

	.byte $0B, $00, $61, $2F, $08, $11, $60, $01, $08, $1C, $60, $01, $05, $14, $60, $01
	.byte $05, $19, $60, $01, $03, $17, $09, $04, $16, $60, $02, $2B, $06, $A3, $27, $04
	.byte $85, $28, $04, $85, $28, $0B, $0A, $29, $28, $93, $0A, $23, $80, $0A, $23, $90
	.byte $E2, $12, $07, $0B, $7F, $61, $40, $2B, $80, $A3, $09, $84, $61, $2B, $0B, $B0
	.byte $51, $0F, $09, $B0, $48, $09, $B2, $60, $01, $09, $B6, $60, $01, $09, $BA, $60
	.byte $01, $09, $BE, $60, $01, $28, $82, $00, $FF
