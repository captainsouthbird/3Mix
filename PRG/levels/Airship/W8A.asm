	.word W8Airship_BossL	; Alternate level layout
	.word W8Airship_BossO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(21) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_PURPLE | LEVEL5_TIME_300

	.byte $79, $00, $3F, $79, $10, $3F, $79, $20, $3F, $79, $30, $3F, $79, $40, $3F, $79
	.byte $50, $3F, $79, $60, $3F, $79, $70, $3F, $79, $80, $3F, $79, $90, $3F, $79, $A0
	.byte $3F, $54, $0F, $0C, $54, $2D, $0D, $54, $1F, $0C, $78, $45, $BE, $17, $44, $21
	.byte $10, $57, $43, $0A, $15, $43, $41, $15, $54, $41, $16, $4A, $14, $15, $4B, $12
	.byte $54, $68, $0C, $54, $7A, $0D, $17, $83, $16, $78, $7B, $BD, $12, $89, $44, $52
	.byte $82, $84, $06, $12, $81, $44, $78, $92, $B3, $78, $9A, $B3, $78, $A2, $B3, $17
	.byte $91, $20, $15, $14, $A5, $42, $15, $A6, $41, $14, $92, $42, $15, $91, $41, $10
	.byte $92, $42, $10, $91, $41, $10, $A5, $42, $10, $A6, $41, $0F, $91, $20, $15, $79
	.byte $B0, $3F, $FF
