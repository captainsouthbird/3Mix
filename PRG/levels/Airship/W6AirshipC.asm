	.word W6AirshipDL	; Alternate level layout
	.word W6AirshipDO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $00, $00, $4F, $00, $0F, $4F, $01, $10, $4F, $01, $1F, $4F, $02, $20, $4F, $02
	.byte $2F, $4F, $03, $30, $4F, $03, $3F, $4F, $09, $40, $1F, $0A, $40, $1F, $0B, $40
	.byte $1F, $27, $43, $A1, $04, $40, $44, $04, $4F, $44, $63, $41, $41, $07, $6D, $37
	.byte $41, $07, $65, $31, $41, $02, $67, $31, $41, $04, $69, $31, $41, $06, $00, $48
	.byte $C2, $0B, $37, $D1, $63, $37, $41, $07, $05, $3A, $C7, $26, $48, $86, $27, $48
	.byte $86, $69, $3A, $54, $20, $42, $22, $26, $3C, $22, $0E, $21, $BD, $6A, $2A, $54
	.byte $66, $2C, $52, $63, $21, $41, $06, $2D, $1B, $21, $2D, $1D, $00, $09, $11, $BD
	.byte $69, $18, $42, $06, $09, $14, $C8, $05, $24, $C8, $65, $11, $57, $61, $13, $53
	.byte $6C, $04, $51, $68, $01, $41, $06, $26, $04, $91, $2D, $16, $82, $2E, $16, $82
	.byte $00, $01, $1D, $E0, $71, $20, $61, $29, $41, $05, $0C, $1A, $C3, $03, $29, $CA
	.byte $62, $21, $05, $FF
