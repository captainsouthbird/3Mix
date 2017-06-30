	.word W204BL	; Alternate level layout
	.word W204BO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_PCOMET_STARTALT | LEVEL5_TIME_300

	.byte $00, $1E, $06, $40, $00, $DC, $02, $40, $03, $D2, $1A, $49, $03, $D3, $0C, $48
	.byte $10, $D4, $0F, $40, $20, $DF, $0F, $00, $1E, $08, $40, $1F, $D2, $00, $43, $15
	.byte $B4, $00, $E1, $78, $50, $50, $20, $DA, $0F, $56, $30, $D4, $0F, $13, $44, $10
	.byte $07, $56, $45, $D4, $0C, $14, $4A, $10, $02, $15, $4B, $10, $02, $30, $45, $21
	.byte $33, $4F, $21, $59, $53, $D1, $0F, $52, $57, $D2, $0F, $55, $59, $B3, $00, $59
	.byte $63, $D1, $08, $52, $67, $B0, $01, $57, $67, $D1, $01, $52, $69, $D2, $02, $51
	.byte $6C, $D9, $11, $4C, $77, $D4, $06, $2F, $75, $F1, $51, $55, $31, $16, $60, $0A
	.byte $33, $54, $42, $36, $5C, $00, $36, $5D, $21, $54, $39, $31, $46, $33, $FD, $54
	.byte $33, $B1, $01, $07, $35, $10, $0F, $24, $3F, $23, $03, $3E, $00, $02, $3A, $01
	.byte $05, $47, $10, $08, $07, $51, $10, $08, $24, $53, $24, $09, $5C, $F1, $06, $5F
	.byte $F3, $02, $64, $F2, $05, $65, $F2, $07, $6A, $F2, $05, $6F, $F3, $07, $75, $10
	.byte $03, $48, $77, $C3, $00, $09, $7C, $10, $02, $4A, $7D, $C1, $00, $0B, $80, $10
	.byte $19, $4C, $86, $CA, $00, $42, $85, $09, $09, $79, $0B, $63, $7C, $42, $31, $31
	.byte $0F, $FF
