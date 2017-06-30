	.word W504CL	; Alternate level layout
	.word W504CO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $45, $61, $8F, $0D, $45, $51, $8F, $0D, $40, $00, $BF, $01, $40, $0E, $BF, $01
	.byte $41, $10, $BF, $01, $41, $1E, $BF, $01, $46, $06, $BF, $03, $4D, $41, $8D, $0D
	.byte $47, $16, $B5, $03, $69, $03, $51, $69, $0B, $51, $42, $27, $B3, $02, $65, $2A
	.byte $53, $42, $2E, $BF, $01, $42, $20, $BF, $01, $0A, $1C, $0E, $45, $31, $ED, $14
	.byte $43, $30, $BF, $01, $43, $3E, $BF, $01, $44, $40, $BF, $01, $44, $4E, $BF, $01
	.byte $4C, $32, $BF, $00, $45, $3B, $B7, $02, $45, $50, $BF, $00, $45, $5F, $BF, $00
	.byte $46, $60, $BF, $00, $46, $6F, $BF, $00, $46, $70, $B4, $0F, $27, $34, $83, $20
	.byte $46, $83, $28, $45, $83, $24, $77, $91, $22, $72, $00, $22, $73, $22, $22, $7A
	.byte $23, $61, $73, $31, $61, $7B, $31, $E7, $51, $10, $FF
