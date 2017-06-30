	.word W2F2CL	; Alternate level layout
	.word W2F2CO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $64, $47, $26, $03, $65, $35, $25, $07, $6D, $25, $25, $07, $60, $25, $25, $07
	.byte $68, $15, $25, $07, $60, $00, $D5, $0F, $66, $00, $D3, $05, $66, $0A, $D4, $05
	.byte $66, $06, $13, $6A, $00, $DC, $08, $6B, $0A, $DB, $05, $66, $09, $FF, $08, $07
	.byte $00, $68, $10, $DF, $04, $68, $1D, $DF, $02, $6E, $15, $D0, $03, $6E, $1A, $D0
	.byte $02, $2A, $15, $83, $2A, $1A, $82, $65, $25, $D0, $03, $65, $2A, $D0, $02, $22
	.byte $25, $83, $22, $2A, $82, $66, $25, $25, $07, $69, $2D, $DF, $02, $69, $20, $DF
	.byte $04, $6C, $25, $D0, $03, $6C, $2A, $D0, $02, $65, $19, $FF, $28, $25, $83, $28
	.byte $2A, $82, $66, $29, $F1, $6A, $29, $F3, $69, $29, $20, $00, $60, $39, $20, $00
	.byte $64, $35, $D0, $03, $64, $3A, $D0, $02, $20, $35, $83, $20, $3A, $82, $61, $39
	.byte $FF, $6B, $35, $D9, $03, $6B, $3A, $D9, $02, $6A, $3D, $DF, $02, $6A, $30, $DF
	.byte $06, $62, $49, $F4, $6A, $40, $D4, $0F, $66, $4B, $D4, $01, $6A, $35, $20, $01
	.byte $27, $35, $83, $27, $3A, $82, $E0, $28, $D5, $FF
