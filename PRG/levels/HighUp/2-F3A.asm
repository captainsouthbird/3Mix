	.word W2F3BL	; Alternate level layout
	.word W2F3BO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $76, $26, $B4, $1A, $46, $27, $AF, $11, $14, $35, $05, $13, $3E, $61, $57, $24
	.byte $63, $01, $76, $16, $B4, $0E, $14, $21, $61, $14, $1B, $61, $13, $1C, $10, $05
	.byte $30, $1D, $23, $30, $1F, $00, $57, $0B, $63, $0A, $16, $00, $6A, $12, $00, $68
	.byte $2F, $01, $86, $E3, $E8, $70, $0F, $17, $03, $0F, $19, $02, $10, $17, $10, $02
	.byte $0E, $18, $09, $19, $0C, $10, $02, $19, $12, $10, $02, $17, $0F, $10, $02, $36
	.byte $12, $0F, $FF
