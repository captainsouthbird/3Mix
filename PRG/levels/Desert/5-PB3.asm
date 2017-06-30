	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSS | LEVEL5_TIME_300

	.byte $7A, $00, $CF, $58, $06, $B0, $03, $38, $07, $A2, $56, $0E, $B0, $01, $56, $00
	.byte $B0, $01, $39, $0A, $60, $39, $05, $60, $75, $0E, $31, $75, $00, $31, $3A, $0B
	.byte $60, $3A, $04, $60, $FF
