	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $34, $01, $A2, $37, $00, $4F, $38, $00, $4F, $39, $00, $4F, $2F, $00, $4F, $39
	.byte $10, $4F, $2F, $10, $4F, $57, $10, $EA, $01, $37, $1B, $44, $38, $1B, $44, $39
	.byte $20, $4F, $57, $20, $EA, $01, $37, $2B, $44, $38, $2B, $44, $2F, $20, $4F, $14
	.byte $07, $05, $14, $1D, $05, $14, $2D, $05, $39, $30, $4F, $2F, $30, $4F, $33, $33
	.byte $48, $34, $33, $48, $35, $33, $48, $50, $39, $B2, $00, $38, $22, $86, $38, $12
	.byte $86, $30, $3C, $41, $31, $3C, $41, $32, $3C, $41, $33, $3C, $41, $10, $3B, $0F
	.byte $2F, $40, $4F, $39, $40, $4F, $33, $44, $4A, $34, $44, $4B, $35, $44, $4B, $34
	.byte $50, $4E, $2F, $50, $4F, $39, $50, $4F, $30, $5D, $42, $32, $5D, $41, $31, $5D
	.byte $42, $33, $5D, $41, $31, $51, $2A, $51, $59, $04, $31, $5C, $0B, $31, $50, $0A
	.byte $40, $5E, $BE, $01, $51, $69, $09, $55, $67, $B0, $00, $54, $67, $B0, $00, $78
	.byte $60, $50, $76, $62, $54, $56, $30, $EF, $02, $56, $40, $EF, $02, $56, $50, $EF
	.byte $02, $76, $60, $50, $77, $60, $50, $FF
