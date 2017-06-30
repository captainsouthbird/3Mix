	.word W3APBL	; Alternate level layout
	.word W3APBO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(21) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $4F, $01, $88, $6C, $40, $00, $8F, $65, $00, $03, $20, $64, $01, $03, $20, $64
	.byte $02, $03, $20, $64, $20, $01, $D5, $00, $00, $4F, $0B, $01, $20, $64, $47, $18
	.byte $B3, $05, $43, $2E, $B2, $05, $49, $2E, $B1, $05, $43, $48, $B4, $05, $46, $52
	.byte $B4, $03, $03, $66, $6F, $00, $68, $6F, $00, $6A, $6F, $00, $6C, $6F, $10, $00
	.byte $4A, $18, $01, $20, $6C, $19, $01, $20, $6C, $1A, $01, $20, $6C, $36, $01, $91
	.byte $E0, $42, $10, $10, $6E, $6A, $10, $70, $6A, $10, $72, $6A, $10, $74, $6A, $4C
	.byte $48, $B4, $01, $53, $4C, $B4, $01, $55, $3B, $B2, $05, $50, $38, $B2, $05, $4C
	.byte $34, $B1, $05, $4C, $2E, $B9, $02, $52, $26, $B5, $02, $52, $20, $B1, $05, $51
	.byte $1D, $B3, $02, $54, $17, $B0, $05, $77, $25, $05, $63, $47, $04, $27, $3A, $22
	.byte $27, $42, $22, $47, $3F, $04, $33, $54, $22, $55, $21, $04, $28, $64, $92, $30
	.byte $6C, $D5, $00, $6E, $6F, $00, $70, $6F, $00, $72, $6F, $00, $74, $6F, $E6, $52
	.byte $C6, $FF
