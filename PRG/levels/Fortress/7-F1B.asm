	.word W7FBL	; Alternate level layout
	.word W7FBO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(26) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $79, $00, $31, $4F, $77, $02, $E4, $75, $09, $E4, $56, $11, $B4, $02, $54, $12
	.byte $31, $75, $17, $E4, $57, $1F, $B3, $02, $55, $20, $31, $57, $26, $B3, $08, $55
	.byte $28, $31, $53, $2D, $33, $34, $2A, $04, $34, $2B, $01, $53, $33, $B7, $08, $E3
	.byte $68, $70, $11, $38, $07, $30, $35, $01, $19, $3E, $0A, $33, $3E, $80, $FF
