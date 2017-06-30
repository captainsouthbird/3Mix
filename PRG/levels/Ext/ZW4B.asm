	.word WZW4AL	; Alternate level layout
	.word WZW4AO	; Alternate object layout
	.byte LEVEL1_SIZE_03 | LEVEL1_YSTART_040
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_300

	.byte $59, $00, $81, $0F, $79, $08, $21, $03, $37, $09, $A1, $39, $10, $40, $1A, $10
	.byte $70, $1F, $51, $25, $09, $68, $00, $21, $0A, $60, $0B, $29, $01, $26, $08, $91
	.byte $E0, $51, $20, $FF
