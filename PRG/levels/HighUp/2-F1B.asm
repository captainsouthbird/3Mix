	.word W2F1AL	; Alternate level layout
	.word W2F1AO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_400

	.byte $77, $00, $B3, $2B, $14, $09, $62, $34, $03, $A2, $10, $0C, $00, $0F, $07, $01
	.byte $56, $11, $C0, $00, $55, $13, $C1, $00, $54, $15, $C2, $00, $0F, $1B, $01, $0E
	.byte $1F, $00, $33, $18, $22, $33, $1B, $00, $54, $28, $C2, $00, $10, $23, $01, $4F
	.byte $2B, $A6, $12, $14, $34, $05, $E3, $28, $14, $76, $2B, $B4, $15, $FF
