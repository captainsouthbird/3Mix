	.word W4F1BL	; Alternate level layout
	.word W4F1BO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_0F0
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_400

	.byte $69, $36, $34, $39, $75, $31, $32, $3E, $11, $00, $E1, $20, $0C, $00, $E1, $25
	.byte $0E, $24, $F1, $04, $13, $1F, $F1, $04, $16, $21, $E1, $0F, $11, $26, $E1, $05
	.byte $0E, $2F, $F1, $07, $09, $2A, $F1, $07, $09, $2C, $E1, $09, $0B, $34, $F1, $04
	.byte $13, $31, $E1, $0C, $0E, $36, $E1, $05, $0D, $3C, $E1, $03, $0E, $40, $E1, $05
	.byte $0D, $46, $E1, $21, $14, $3E, $E1, $08, $13, $47, $E1, $20, $0D, $68, $F1, $03
	.byte $73, $00, $37, $1E, $78, $1F, $32, $50, $60, $00, $3B, $29, $60, $2A, $38, $45
	.byte $6E, $6A, $36, $05, $6C, $26, $34, $03, $35, $2E, $40, $31, $2C, $40, $32, $23
	.byte $04, $11, $66, $06, $E6, $68, $10, $54, $6A, $B0, $03, $4E, $6D, $B0, $00, $10
	.byte $29, $08, $13, $68, $F1, $01, $31, $68, $11, $32, $68, $11, $2D, $26, $60, $2D
	.byte $2C, $01, $FF
