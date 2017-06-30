	.word W3G1AL	; Alternate level layout
	.word W3G1AO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(5) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERWATER | LEVEL5_TIME_300

	.byte $55, $00, $85, $64, $20, $01, $D5, $33, $0B, $45, $2F, $15, $45, $2E, $17, $05
	.byte $2E, $18, $05, $32, $0D, $05, $32, $0E, $05, $32, $20, $4F, $0A, $2E, $77, $02
	.byte $0A, $20, $71, $0E, $2D, $10, $20, $2A, $1A, $20, $2E, $21, $00, $0E, $2C, $0A
	.byte $14, $3B, $76, $05, $31, $3D, $92, $E3, $51, $C9, $1A, $00, $70, $3B, $FF
