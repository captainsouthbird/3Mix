	.word W601AL	; Alternate level layout
	.word W601AO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_MUCK | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $56, $00, $83, $0F, $4F, $00, $67, $0F, $40, $00, $6F, $0F, $5A, $00, $B0, $0F
	.byte $38, $07, $91, $20, $07, $D1, $45, $02, $B6, $00, $43, $09, $B1, $00, $46, $0B
	.byte $B6, $00, $4C, $01, $B7, $00, $45, $05, $B0, $06, $49, $03, $B0, $05, $4D, $08
	.byte $B0, $03, $52, $05, $B0, $01, $52, $05, $B1, $00, $12, $04, $0D, $37, $0A, $23
	.byte $37, $0E, $0A, $37, $0B, $01, $56, $00, $B3, $00, $56, $0F, $B3, $00, $E0, $21
	.byte $77, $FF
