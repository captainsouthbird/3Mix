	.word W7AirshipBPL	; Alternate level layout
	.word W7AirshipBPBO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(25) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $80, $00, $09, $80, $00, $08, $78, $01, $60, $98, $03, $80, $09, $99, $00, $51
	.byte $0F, $19, $00, $60, $78, $0D, $50, $19, $0F, $50, $82, $03, $B0, $09, $62, $01
	.byte $70, $62, $0D, $80, $80, $00, $51, $0F, $01, $0F, $80, $01, $00, $70, $E0, $68
	.byte $50, $FF
