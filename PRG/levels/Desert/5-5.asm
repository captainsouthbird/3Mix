	.word W505BL	; Alternate level layout
	.word W505BO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_180
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $16, $02, $04, $5A, $06, $D0, $2D, $79, $0B, $51, $79, $12, $51, $75, $17, $51
	.byte $71, $1D, $51, $73, $22, $51, $71, $28, $51, $75, $2E, $51, $38, $36, $B1, $E3
	.byte $02, $72, $79, $3B, $21, $79, $43, $21, $36, $3F, $70, $36, $40, $20, $16, $48
	.byte $04, $16, $4E, $04, $56, $53, $B3, $01, $16, $55, $92, $75, $57, $51, $75, $5F
	.byte $51, $16, $6D, $80, $0B, $6B, $80, $0E, $6B, $62, $0F, $6A, $62, $10, $6B, $62
	.byte $11, $6A, $62, $12, $6B, $62, $13, $6A, $62, $14, $6B, $62, $15, $6A, $62, $6F
	.byte $6A, $B6, $14, $6B, $0B, $31, $63, $84, $31, $5A, $83, $38, $4B, $82, $E6, $58
	.byte $10, $16, $18, $0D, $FF
