	.word W603BL	; Alternate level layout
	.word W603BO	; Alternate object layout
	.byte LEVEL1_SIZE_06 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_07 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(13) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $00, $00, $03, $35, $06, $89, $16, $00, $DF, $16, $15, $DF, $16, $29, $DF, $16
	.byte $3D, $DF, $16, $51, $DF, $35, $29, $8F, $35, $3D, $8F, $35, $51, $8F, $35, $15
	.byte $8F, $32, $0F, $81, $30, $11, $82, $32, $14, $81, $32, $24, $81, $30, $25, $83
	.byte $32, $28, $81, $32, $38, $81, $32, $3C, $81, $30, $39, $83, $33, $4C, $81, $33
	.byte $50, $81, $31, $4D, $83, $33, $59, $0B, $11, $59, $0A, $E0, $08, $A7, $E1, $08
	.byte $A7, $E2, $08, $A7, $E3, $08, $A7, $E4, $08, $A7, $E5, $08, $A7, $FF
