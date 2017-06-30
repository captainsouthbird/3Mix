	.word W505BL	; Alternate level layout
	.word W505BO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $2F, $00, $4F, $36, $00, $4A, $37, $00, $48, $38, $00, $46, $39, $00, $46, $2F
	.byte $10, $4F, $37, $15, $A2, $38, $19, $A1, $38, $1D, $A1, $2F, $20, $4F, $38, $24
	.byte $A1, $36, $29, $A3, $32, $04, $23, $32, $06, $00, $E0, $02, $73, $E1, $02, $74
	.byte $38, $0B, $B1, $38, $0E, $B1, $38, $12, $B1, $37, $20, $B2, $34, $2C, $B5, $E2
	.byte $02, $75, $2F, $30, $4F, $30, $30, $4F, $31, $30, $4F, $39, $30, $4F, $38, $30
	.byte $4F, $37, $30, $4F, $32, $39, $46, $33, $39, $46, $34, $39, $46, $35, $39, $46
	.byte $36, $39, $46, $55, $37, $0B, $2F, $40, $4F, $2F, $50, $4F, $30, $41, $D5, $E3
	.byte $52, $14, $40, $5F, $BF, $00, $51, $77, $09, $13, $4F, $00, $78, $4E, $C3, $79
	.byte $4D, $C5, $77, $4F, $C1, $7A, $4D, $35, $36, $44, $23, $34, $44, $83, $33, $44
	.byte $83, $E6, $42, $76, $36, $45, $02, $13, $6C, $00, $77, $6C, $C1, $78, $6B, $C3
	.byte $79, $6A, $C5, $7A, $6A, $35, $18, $6D, $0F, $FF
