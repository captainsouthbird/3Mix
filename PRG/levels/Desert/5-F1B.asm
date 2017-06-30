	.word W5F1CL	; Alternate level layout
	.word W5F1CO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_300

	.byte $19, $00, $7F, $48, $00, $B8, $17, $71, $04, $4F, $70, $00, $C3, $48, $18, $B6
	.byte $23, $59, $1C, $D1, $0B, $4F, $1E, $B1, $07, $71, $1E, $47, $57, $2A, $B1, $0F
	.byte $76, $2A, $3F, $6F, $2A, $4F, $51, $3D, $B0, $05, $4F, $3B, $B2, $01, $19, $40
	.byte $7B, $4F, $43, $B2, $01, $4F, $45, $B0, $05, $48, $49, $B6, $1D, $4F, $4E, $B6
	.byte $01, $4F, $50, $B5, $01, $4F, $52, $B4, $01, $4F, $54, $B3, $01, $4F, $56, $B2
	.byte $01, $4F, $58, $B1, $01, $76, $4E, $41, $75, $50, $41, $74, $52, $41, $73, $54
	.byte $41, $72, $56, $41, $71, $58, $41, $4F, $5A, $B0, $01, $70, $5A, $41, $6F, $5C
	.byte $49, $49, $67, $BF, $06, $17, $66, $0B, $28, $01, $D8, $E6, $7F, $20, $15, $2A
	.byte $0E, $FF
