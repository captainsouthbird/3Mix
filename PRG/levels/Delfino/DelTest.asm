	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_06 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $3A, $00, $4F, $0E, $02, $19, $00, $14, $05, $23, $04, $0E, $03, $23, $06, $11
	.byte $04, $D2, $17, $06, $E1, $18, $08, $00, $3A, $10, $4F, $16, $14, $11, $00, $16
	.byte $15, $21, $04, $17, $16, $E1, $18, $18, $00, $14, $16, $F1, $0B, $05, $F2, $4B
	.byte $04, $E2, $54, $15, $E1, $77, $1C, $11, $75, $20, $13, $76, $10, $21, $76, $23
	.byte $30, $03, $3A, $20, $4F, $77, $21, $30, $03, $75, $25, $30, $01, $75, $2C, $31
	.byte $01, $76, $30, $32, $01, $74, $28, $30, $01, $6D, $21, $31, $01, $6E, $21, $30
	.byte $01, $6F, $21, $31, $01, $70, $21, $30, $01, $6E, $27, $40, $02, $71, $24, $30
	.byte $01, $33, $1C, $F1, $57, $1A, $06, $57, $19, $06, $57, $18, $06, $57, $17, $06
	.byte $57, $16, $06, $57, $15, $06, $57, $14, $06, $37, $05, $41, $FF
