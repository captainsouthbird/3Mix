	.word W3F1BL	; Alternate level layout
	.word W3F1BO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_0F0
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MANSION | LEVEL5_TIME_400

	.byte $61, $00, $26, $42, $69, $00, $27, $42, $79, $00, $D1, $80, $52, $02, $A6, $7E
	.byte $71, $00, $D0, $80, $68, $00, $D0, $80, $72, $00, $D6, $01, $50, $0D, $B0, $00
	.byte $0A, $08, $7E, $4E, $16, $B2, $00, $4F, $1E, $B1, $00, $0D, $05, $04, $0D, $1D
	.byte $04, $02, $08, $7E, $57, $02, $81, $7E, $14, $03, $0A, $61, $43, $DF, $01, $2E
	.byte $06, $25, $2E, $09, $70, $09, $29, $DF, $46, $41, $F8, $20, $01, $C1, $25, $1A
	.byte $25, $25, $1E, $00, $E0, $61, $10, $06, $11, $0C, $E1, $61, $38, $37, $7D, $A1
	.byte $77, $29, $D1, $32, $12, $2C, $DF, $12, $3C, $DF, $12, $4C, $DC, $E3, $68, $70
	.byte $15, $36, $07, $26, $01, $40, $27, $01, $40, $09, $03, $10, $FF
