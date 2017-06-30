	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(5) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE | LEVEL5_TIME_300

	.byte $18, $00, $50, $00, $0D, $00, $60, $10, $0E, $00, $69, $01, $0E, $0F, $69, $01
	.byte $34, $01, $A3, $35, $05, $0B, $35, $06, $0A, $35, $07, $0A, $35, $08, $0A, $FF
