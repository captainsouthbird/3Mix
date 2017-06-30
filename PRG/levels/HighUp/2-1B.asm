	.word W201AL	; Alternate level layout
	.word W201AO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $4B, $37, $D4, $0D, $50, $37, $DA, $0D, $59, $2A, $D1, $0C, $4B, $2B, $D2, $0B
	.byte $56, $2A, $D2, $02, $4B, $26, $6F, $03, $08, $2A, $08, $07, $2A, $40, $40, $26
	.byte $6B, $03, $40, $2A, $D4, $0C, $40, $37, $D4, $0D, $49, $3C, $D1, $08, $07, $42
	.byte $05, $40, $21, $D4, $04, $4B, $21, $DF, $04, $48, $1E, $DF, $02, $40, $1F, $D3
	.byte $01, $45, $1A, $DF, $03, $40, $12, $D1, $0C, $40, $00, $DF, $11, $42, $12, $D4
	.byte $06, $4C, $12, $DE, $06, $50, $19, $DA, $00, $47, $12, $D4, $02, $03, $19, $08
	.byte $02, $19, $40, $17, $34, $05, $40, $45, $DF, $0D, $50, $45, $DA, $0D, $E4, $4F
	.byte $B8, $E3, $6F, $F7, $0A, $16, $0A, $36, $30, $21, $FF
