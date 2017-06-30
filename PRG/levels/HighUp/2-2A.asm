	.word W202BL	; Alternate level layout
	.word W202BO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $4D, $50, $6F, $0F, $4D, $40, $6F, $0F, $4D, $30, $6F, $0F, $2B, $08, $50, $04
	.byte $08, $08, $05, $0A, $01, $0B, $02, $01, $06, $12, $01, $09, $14, $01, $0E, $1D
	.byte $01, $02, $22, $01, $4D, $20, $6F, $0F, $69, $33, $92, $6C, $33, $92, $60, $47
	.byte $91, $63, $49, $91, $66, $4B, $92, $69, $49, $91, $6C, $47, $91, $60, $54, $91
	.byte $63, $52, $92, $66, $56, $91, $69, $56, $93, $6C, $5A, $92, $60, $6A, $92, $63
	.byte $6A, $92, $66, $67, $93, $49, $6E, $D3, $01, $49, $60, $D3, $05, $6E, $50, $D9
	.byte $06, $60, $64, $03, $60, $63, $0E, $50, $62, $07, $12, $09, $25, $10, $45, $26
	.byte $15, $40, $27, $15, $40, $22, $11, $00, $22, $12, $22, $03, $08, $40, $66, $06
	.byte $91, $66, $09, $91, $20, $06, $C1, $E0, $13, $40, $FF
