	.word W304BL	; Alternate level layout
	.word W304BO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(24) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE | LEVEL5_PCOMET_STARTALT | LEVEL5_TIME_300

	.byte $51, $85, $E7, $0F, $59, $00, $C1, $50, $52, $00, $E6, $1E, $57, $1F, $A1, $26
	.byte $18, $1F, $9F, $18, $32, $9F, $36, $18, $24, $36, $1B, $00, $17, $12, $04, $E1
	.byte $28, $30, $41, $45, $BF, $05, $40, $00, $B0, $C8, $51, $45, $B7, $05, $3A, $51
	.byte $05, $3A, $52, $05, $59, $53, $C1, $0A, $3A, $5E, $05, $3A, $5F, $05, $59, $60
	.byte $C1, $0A, $0C, $12, $E3, $10, $22, $E3, $0F, $04, $E3, $12, $2C, $E3, $0D, $36
	.byte $E3, $12, $3F, $E3, $13, $50, $E3, $0C, $5B, $E3, $11, $58, $E3, $13, $64, $E2
	.byte $15, $5D, $E2, $0F, $52, $E2, $14, $37, $E2, $15, $24, $E2, $37, $4B, $91, $E4
	.byte $52, $E2, $56, $69, $06, $36, $5C, $0D, $59, $85, $C1, $3A, $41, $8A, $BF, $0E
	.byte $51, $8A, $B7, $05, $37, $88, $91, $E8, $13, $73, $33, $44, $0C, $06, $37, $BC
	.byte $03, $38, $08, $37, $90, $A1, $45, $9F, $BF, $08, $52, $99, $B0, $00, $54, $99
	.byte $B0, $00, $52, $9E, $B0, $00, $50, $9E, $B0, $00, $51, $96, $B3, $02, $65, $9B
	.byte $2B, $56, $9B, $B0, $01, $4C, $99, $B0, $01, $4C, $9D, $B0, $01, $45, $9D, $B0
	.byte $01, $45, $99, $B0, $01, $44, $9F, $B0, $00, $44, $A1, $B0, $00, $41, $A5, $B0
	.byte $00, $41, $A7, $B0, $00, $45, $A8, $B2, $05, $41, $AE, $B6, $05, $43, $AA, $B1
	.byte $00, $04, $AD, $0A, $EA, $61, $09, $50, $B9, $09, $EB, $42, $4B, $32, $AB, $42
	.byte $30, $AA, $40, $31, $AA, $40, $63, $AB, $2C, $31, $AE, $41, $FF
