	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(12) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0B, $79, $00, $8A, $6F, $00, $8F, $71, $00, $82, $73, $00, $80, $75
	.byte $00, $80, $77, $00, $80, $33, $04, $D2, $6F, $20, $8B, $79, $1C, $81, $78, $1B
	.byte $15, $79, $24, $81, $77, $24, $81, $76, $23, $15, $36, $09, $22, $36, $0A, $00
	.byte $7A, $2B, $1F, $7A, $3B, $14, $51, $3C, $09, $79, $36, $10, $76, $38, $10, $73
	.byte $3A, $10, $69, $36, $84, $6B, $36, $80, $6D, $36, $80, $6A, $26, $88, $6E, $26
	.byte $1F, $6C, $26, $88, $4A, $2E, $FB, $68, $26, $83, $68, $30, $83, $66, $26, $83
	.byte $66, $30, $83, $64, $26, $88, $06, $2F, $0B, $FF
