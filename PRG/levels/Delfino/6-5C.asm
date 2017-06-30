	.word W605BL	; Alternate level layout
	.word W605BO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_07 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $79, $00, $81, $50, $36, $02, $A2, $72, $06, $24, $73, $0A, $23, $70, $0F, $26
	.byte $6B, $18, $8F, $14, $60, $00, $80, $50, $35, $11, $23, $35, $13, $01, $31, $14
	.byte $0A, $37, $16, $91, $E1, $02, $49, $61, $18, $89, $14, $36, $2E, $A2, $50, $39
	.byte $09, $72, $31, $24, $FF
