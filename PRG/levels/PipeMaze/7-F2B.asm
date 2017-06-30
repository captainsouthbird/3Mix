	.word W7F2AL	; Alternate level layout
	.word W7F2AO	; Alternate object layout
	.byte LEVEL1_SIZE_03 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_08 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $2B, $20, $4F, $27, $21, $A3, $02, $2B, $13, $01, $2B, $01, $01, $24, $26, $0A
	.byte $13, $16, $01, $23, $02, $09, $13, $00, $09, $15, $39, $00, $1E, $19, $09, $1E
	.byte $03, $20, $02, $C2, $0E, $0E, $01, $22, $02, $CF, $0E, $01, $2C, $00, $10, $15
	.byte $0E, $00, $00, $05, $10, $02, $05, $12, $39, $02, $1B, $13, $05, $1B, $03, $01
	.byte $1B, $01, $01, $17, $23, $03, $15, $0E, $28, $05, $42, $29, $07, $40, $2A, $06
	.byte $41, $2B, $06, $40, $2D, $06, $40, $28, $0A, $40, $29, $0A, $40, $2A, $0A, $40
	.byte $2B, $0A, $40, $2D, $0A, $40, $E1, $41, $29, $FF
