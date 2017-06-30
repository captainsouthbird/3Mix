	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_03 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $40, $00, $0E, $99, $00, $81, $20, $B8, $07, $42, $04, $37, $06, $40, $38, $06
	.byte $40, $37, $0C, $40, $38, $0C, $40, $55, $07, $B1, $00, $53, $08, $B1, $00, $51
	.byte $09, $B1, $00, $4F, $0A, $B1, $00, $4D, $0B, $B1, $00, $4B, $0C, $B1, $00, $49
	.byte $0D, $B1, $00, $47, $0E, $B1, $00, $45, $0F, $B1, $00, $57, $10, $B1, $00, $55
	.byte $11, $B1, $00, $54, $12, $B0, $00, $45, $0E, $B1, $00, $45, $0D, $B1, $00, $57
	.byte $15, $B1, $00, $57, $16, $B1, $00, $57, $19, $B1, $00, $55, $1A, $B1, $00, $91
	.byte $00, $DF, $92, $10, $DF, $91, $20, $DF, $FF
