	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC2 | LEVEL5_TIME_300

	.byte $62, $05, $67, $61, $04, $69, $60, $03, $6B, $20, $08, $D5, $27, $08, $81, $28
	.byte $08, $81, $29, $08, $81, $2A, $08, $81, $2B, $08, $81, $2C, $09, $81, $2D, $0A
	.byte $81, $2E, $0A, $81, $2F, $09, $81, $30, $08, $81, $31, $07, $81, $32, $07, $81
	.byte $33, $08, $81, $34, $08, $81, $51, $37, $09, $6D, $0C, $67, $0A, $12, $0F, $39
	.byte $13, $40, $39, $1F, $40, $59, $14, $81, $0A, $79, $28, $20, $79, $03, $20, $79
	.byte $0B, $20, $78, $17, $54, $33, $17, $24, $FF
