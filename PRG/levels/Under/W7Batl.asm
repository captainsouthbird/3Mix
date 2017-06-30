	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(25) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BATTLE | LEVEL5_TIME_200

	.byte $40, $00, $0E, $80, $00, $08, $8F, $0C, $80, $00, $6F, $0A, $60, $6F, $0D, $50
	.byte $10, $09, $60, $10, $0F, $50, $14, $0F, $80, $14, $09, $70, $75, $0D, $80, $75
	.byte $0A, $70, $95, $0C, $B0, $00, $83, $03, $70, $00, $63, $04, $10, $63, $01, $20
	.byte $04, $06, $10, $04, $00, $20, $08, $00, $30, $08, $06, $40, $69, $04, $40, $69
	.byte $01, $30, $89, $03, $A0, $00, $11, $09, $E2, $05, $00, $D2, $71, $0F, $E2, $65
	.byte $06, $D2, $90, $0A, $54, $04, $84, $01, $44, $04, $A7, $0B, $21, $01, $34, $0F
	.byte $40, $35, $0F, $40, $36, $0F, $40, $FF
