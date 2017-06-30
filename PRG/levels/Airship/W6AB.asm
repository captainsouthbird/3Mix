	.word W6AirshipCL	; Alternate level layout
	.word W6AirshipCO	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_AIRSHIP | LEVEL5_TIME_300

	.byte $00, $10, $0F, $10, $10, $0F, $05, $10, $4F, $15, $10, $45, $05, $1F, $4F, $0F
	.byte $11, $1D, $0E, $11, $1D, $0D, $11, $1D, $16, $00, $1D, $17, $00, $1C, $18, $00
	.byte $1B, $19, $00, $19, $1A, $00, $16, $18, $13, $1B, $19, $13, $41, $16, $15, $41
	.byte $36, $19, $A1, $15, $1F, $45, $00, $10, $44, $00, $1F, $44, $00, $00, $1F, $34
	.byte $0B, $91, $33, $01, $23, $33, $03, $00, $33, $05, $85, $34, $05, $85, $78, $01
	.byte $63, $E0, $61, $30, $FF
