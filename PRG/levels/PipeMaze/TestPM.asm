	.word TestPML	; Alternate level layout
	.word TestPMO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_08 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_UNLIMITED

	.byte $2A, $90, $4F, $04, $90, $31, $04, $9E, $21, $26, $92, $42, $26, $9B, $42, $39
	.byte $00, $4F, $39, $10, $4F, $22, $00, $4F, $2F, $10, $4F, $36, $1E, $40, $10, $0F
	.byte $08, $58, $0E, $0B, $46, $03, $FF, $2F, $07, $48, $34, $13, $94, $30, $08, $C5
	.byte $E0, $51, $31, $E1, $52, $80, $FF
