	.word W102BL	; Alternate level layout
	.word W102BO	; Alternate object layout
	.byte LEVEL1_SIZE_13 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(1) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_400

	.byte $58, $BC, $43, $58, $88, $43, $58, $6F, $43, $58, $57, $43, $58, $40, $43, $58
	.byte $27, $43, $58, $0F, $43, $19, $00, $C1, $5C, $16, $0B, $01, $35, $10, $12, $35
	.byte $11, $06, $58, $15, $B0, $04, $57, $16, $B0, $03, $56, $17, $B0, $02, $55, $18
	.byte $B0, $01, $54, $19, $B0, $00, $0F, $13, $E2, $0D, $1D, $E2, $0E, $20, $E3, $58
	.byte $23, $B0, $01, $57, $23, $B0, $01, $56, $23, $B0, $00, $55, $23, $B0, $00, $31
	.byte $1E, $12, $35, $1D, $0E, $16, $2B, $01, $35, $2F, $A3, $0E, $2D, $E2, $35, $38
	.byte $23, $31, $37, $24, $0F, $30, $E3, $35, $37, $00, $16, $3C, $01, $15, $46, $00
	.byte $35, $45, $10, $31, $46, $08, $31, $47, $12, $35, $4B, $A3, $0D, $4D, $E2, $0F
	.byte $4F, $E3, $35, $50, $23, $35, $56, $22, $31, $52, $14, $31, $54, $0C, $19, $61
	.byte $C1, $09, $31, $5D, $13, $0E, $5F, $E2, $0F, $62, $E3, $35, $68, $93, $19, $6E
	.byte $C1, $1E, $37, $74, $A1, $10, $72, $E2, $16, $76, $01, $35, $7C, $A3, $0D, $7F
	.byte $E2, $36, $80, $A2, $34, $84, $A4, $0E, $82, $E3, $30, $80, $12, $30, $7F, $06
	.byte $19, $90, $C1, $0A, $10, $91, $E3, $0E, $8F, $E2, $19, $9D, $C1, $32, $38, $9D
	.byte $40, $37, $9D, $40, $36, $9D, $40, $16, $9E, $01, $35, $A5, $0A, $0F, $A7, $E2
	.byte $31, $A8, $14, $35, $AE, $30, $31, $AF, $06, $0E, $AF, $E2, $10, $B1, $E3, $15
	.byte $A8, $00, $36, $B4, $A2, $35, $C0, $61, $31, $C3, $61, $2F, $C7, $86, $50, $C7
	.byte $48, $51, $C5, $B7, $01, $35, $C9, $44, $34, $CC, $40, $33, $CB, $40, $36, $CC
	.byte $40, $37, $CB, $40, $EC, $6F, $20, $E5, $D8, $70, $E6, $42, $10, $FF
