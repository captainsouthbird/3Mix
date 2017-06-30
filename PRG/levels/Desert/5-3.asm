	.word W503BL	; Alternate level layout
	.word W503BO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_11 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC2 | LEVEL5_TIME_300

	.byte $4F, $00, $B0, $96, $06, $71, $0C, $49, $00, $B2, $0A, $0B, $1E, $20, $07, $15
	.byte $20, $0A, $2D, $20, $0B, $3E, $20, $08, $51, $20, $48, $70, $A2, $0F, $06, $61
	.byte $20, $29, $7D, $91, $07, $0F, $0C, $0B, $24, $0C, $06, $36, $0C, $0A, $47, $0C
	.byte $04, $5A, $0C, $47, $32, $B0, $08, $46, $30, $B3, $00, $49, $31, $B0, $09, $28
	.byte $3B, $10, $46, $3C, $B5, $00, $4B, $32, $B0, $09, $48, $56, $B3, $08, $48, $57
	.byte $E6, $02, $0A, $5A, $0E, $09, $3B, $0D, $67, $6F, $A0, $4C, $6F, $A2, $10, $0B
	.byte $7A, $08, $67, $7B, $C4, $27, $7A, $40, $26, $27, $81, $24, $33, $86, $26, $46
	.byte $85, $27, $74, $0B, $26, $73, $40, $26, $08, $70, $28, $40, $0A, $25, $53, $0A
	.byte $E7, $12, $80, $0B, $0E, $20, $0A, $27, $20, $09, $46, $20, $08, $68, $20, $FF
