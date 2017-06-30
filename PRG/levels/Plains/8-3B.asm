	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(24) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE | LEVEL5_TIME_300

	.byte $4B, $34, $EF, $3C, $40, $00, $B0, $7F, $59, $00, $C1, $14, $20, $01, $DF, $57
	.byte $00, $A1, $14, $18, $00, $98, $18, $0C, $98, $2F, $01, $D1, $56, $15, $C4, $01
	.byte $76, $17, $12, $15, $16, $0B, $73, $1A, $12, $70, $1F, $11, $72, $21, $11, $71
	.byte $24, $11, $6F, $26, $11, $6C, $28, $11, $6B, $2A, $11, $41, $2F, $BF, $01, $4B
	.byte $2C, $BF, $00, $78, $2D, $11, $4B, $33, $BF, $00, $78, $31, $11, $35, $08, $84
	.byte $34, $2E, $83, $35, $32, $0C, $41, $38, $BF, $01, $55, $34, $B5, $03, $59, $38
	.byte $B1, $0F, $41, $3A, $B9, $3C, $6B, $3D, $4C, $6B, $41, $4C, $36, $42, $22, $6B
	.byte $45, $4C, $56, $43, $05, $36, $3E, $22, $36, $3A, $22, $33, $3D, $60, $33, $41
	.byte $60, $2D, $3F, $0B, $2A, $35, $81, $77, $49, $11, $77, $4E, $11, $75, $53, $11
	.byte $79, $57, $11, $77, $5C, $11, $18, $46, $0B, $77, $64, $11, $59, $68, $B1, $17
	.byte $0D, $44, $09, $50, $77, $09, $36, $74, $0E, $34, $75, $0E, $34, $74, $80, $36
	.byte $73, $80, $7A, $54, $11, $17, $54, $0A, $FF
