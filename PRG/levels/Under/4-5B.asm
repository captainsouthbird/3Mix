	.word W405AL	; Alternate level layout
	.word W405AO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(3) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0E, $20, $01, $D6, $26, $01, $CF, $99, $00, $81, $08, $19, $09, $04
	.byte $7A, $09, $E0, $BA, $0A, $40, $46, $36, $05, $70, $E0, $71, $3B, $99, $52, $81
	.byte $14, $19, $51, $01, $1A, $51, $E0, $16, $5E, $0E, $36, $60, $0B, $20, $63, $D5
	.byte $25, $63, $CF, $AA, $65, $2F, $14, $A0, $65, $29, $14, $0A, $65, $E0, $E6, $71
	.byte $BA, $FF
