	.word W102AL	; Alternate level layout
	.word W102AO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0E, $06, $0F, $E9, $60, $00, $EF, $99, $01, $81, $0D, $99, $0F, $51
	.byte $00, $99, $00, $51, $00, $93, $0F, $52, $00, $00, $03, $EF, $66, $04, $EC, $93
	.byte $04, $51, $00, $95, $04, $B0, $03, $15, $03, $07, $20, $01, $D1, $21, $01, $DF
	.byte $70, $00, $E8, $10, $0F, $E8, $73, $05, $51, $15, $08, $0A, $73, $0D, $61, $95
	.byte $0C, $B0, $02, $93, $0F, $52, $00, $15, $0B, $07, $6C, $05, $50, $8D, $05, $B0
	.byte $00, $0D, $06, $0A, $8C, $04, $51, $00, $6C, $0D, $60, $8D, $0E, $B0, $00, $8C
	.byte $0F, $51, $00, $0D, $0D, $07, $34, $0B, $40, $34, $08, $40, $2C, $0C, $40, $2C
	.byte $07, $40, $39, $09, $61, $30, $09, $61, $85, $05, $B0, $09, $80, $04, $54, $0B
	.byte $85, $04, $50, $00, $85, $0F, $50, $00, $10, $03, $E4, $08, $0A, $0D, $37, $0D
	.byte $E2, $E0, $61, $47, $FF
