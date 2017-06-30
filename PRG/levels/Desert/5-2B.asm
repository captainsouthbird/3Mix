	.word W503_EndL	; Alternate level layout
	.word W503_EndO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_000
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $47, $00, $EF, $1E, $6E, $0B, $B1, $64, $13, $B1, $6B, $18, $B1, $62, $23, $B1
	.byte $2D, $0B, $04, $23, $13, $04, $2A, $18, $00, $21, $23, $04, $08, $24, $72, $08
	.byte $20, $60, $09, $20, $60, $06, $30, $73, $08, $30, $73, $24, $2D, $0D, $47, $0B
	.byte $B4, $00, $47, $0F, $B4, $00, $4B, $0C, $B0, $02, $47, $0D, $B0, $01, $27, $0C
	.byte $10, $68, $0C, $B2, $68, $0D, $B2, $68, $0E, $B2, $09, $0D, $0F, $23, $32, $88
	.byte $22, $33, $86, $21, $34, $84, $42, $00, $5F, $43, $00, $5F, $45, $00, $5F, $44
	.byte $00, $5F, $46, $00, $5F, $E3, $71, $20, $24, $3D, $91, $FF
