	.word W406AL	; Alternate level layout
	.word W406AO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $40, $00, $0E, $9A, $00, $80, $09, $8E, $00, $B2, $4C, $31, $01, $D4, $1A, $0A
	.byte $04, $39, $0D, $8F, $39, $1D, $8F, $36, $0F, $15, $35, $0F, $15, $36, $19, $15
	.byte $35, $19, $15, $36, $23, $15, $35, $23, $15, $36, $2D, $15, $35, $2D, $15, $36
	.byte $38, $15, $35, $38, $15, $39, $2D, $8F, $39, $3D, $82, $9A, $43, $80, $09, $1A
	.byte $42, $01, $AE, $4D, $2B, $01, $31, $48, $C5, $37, $06, $0D, $E4, $63, $FA, $19
	.byte $44, $0D, $39, $43, $40, $39, $45, $40, $38, $43, $40, $38, $45, $40, $38, $44
	.byte $10, $FF
