	.word W203BL	; Alternate level layout
	.word W203BO	; Alternate object layout
	.byte LEVEL1_SIZE_15 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $40, $00, $DF, $03, $50, $00, $DA, $03, $56, $04, $D4, $08, $55, $0D, $4F, $4B
	.byte $1D, $DF, $03, $08, $1C, $08, $07, $1C, $40, $04, $27, $01, $0E, $2E, $01, $07
	.byte $35, $01, $0E, $40, $01, $06, $47, $01, $05, $3D, $01, $0D, $4B, $00, $07, $41
	.byte $00, $0D, $3A, $00, $0E, $35, $00, $06, $2E, $00, $0D, $26, $00, $0E, $5A, $00
	.byte $0E, $52, $01, $04, $59, $01, $05, $4C, $01, $07, $60, $01, $2C, $7C, $44, $2D
	.byte $7D, $44, $2E, $7E, $44, $2F, $7F, $45, $0D, $67, $01, $13, $74, $01, $08, $78
	.byte $01, $07, $6F, $01, $0A, $8B, $01, $09, $85, $01, $11, $79, $00, $06, $81, $00
	.byte $6B, $21, $5F, $6B, $31, $5F, $6B, $41, $5F, $6B, $51, $5F, $6F, $5F, $5F, $6C
	.byte $6C, $5F, $59, $7E, $61, $00, $59, $7F, $71, $70, $16, $7E, $09, $2D, $87, $80
	.byte $2E, $87, $80, $2F, $87, $80, $30, $87, $80, $31, $87, $80, $33, $85, $80, $32
	.byte $86, $80, $34, $84, $80, $77, $87, $B3, $0E, $77, $9A, $B3, $05, $33, $94, $44
	.byte $33, $9A, $83, $30, $9F, $42, $77, $A2, $B3, $05, $0D, $A8, $0A, $30, $A7, $43
	.byte $2D, $9F, $82, $56, $AB, $B3, $02, $32, $AB, $22, $55, $B0, $B4, $02, $31, $B0
	.byte $22, $51, $B6, $B8, $02, $2D, $B7, $00, $33, $BA, $41, $34, $BB, $41, $32, $BA
	.byte $40, $36, $BD, $41, $77, $C2, $B3, $05, $33, $C2, $83, $76, $CB, $B4, $08, $30
	.byte $CC, $82, $78, $D8, $B2, $05, $78, $E1, $B2, $06, $34, $E2, $82, $77, $EA, $B3
	.byte $06, $34, $EC, $92, $EE, $61, $30, $FF