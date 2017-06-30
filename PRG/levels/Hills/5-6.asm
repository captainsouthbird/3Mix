	.word W503_EndL	; Alternate level layout
	.word W503_EndO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $40, $00, $0E, $9A, $00, $50, $96, $99, $00, $80, $96, $74, $0B, $09, $73, $17
	.byte $09, $74, $23, $09, $99, $0B, $50, $07, $18, $17, $E0, $78, $1E, $E0, $99, $17
	.byte $50, $07, $99, $23, $50, $07, $40, $00, $B0, $96, $71, $32, $08, $71, $3C, $08
	.byte $A1, $2F, $2F, $16, $74, $37, $09, $99, $37, $50, $07, $35, $12, $85, $35, $20
	.byte $22, $35, $21, $00, $32, $30, $D1, $32, $3A, $D1, $32, $44, $D1, $B6, $4F, $22
	.byte $02, $B5, $52, $23, $02, $B1, $54, $27, $02, $57, $15, $31, $56, $2C, $32, $56
	.byte $58, $82, $32, $47, $63, $6F, $03, $32, $53, $00, $37, $7E, $E1, $E7, $71, $20
	.byte $4F, $17, $B3, $05, $90, $18, $21, $04, $10, $18, $0C, $14, $44, $0D, $10, $67
	.byte $0E, $32, $1D, $40, $33, $7E, $0B, $FF
