	.word W603BAL	; Alternate level layout
	.word W603BAO	; Alternate object layout
	.byte LEVEL1_SIZE_11 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_13 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(20) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC2 | LEVEL5_TIME_300

	.byte $74, $76, $30, $00, $59, $00, $4F, $59, $10, $4F, $59, $20, $4F, $20, $02, $D5
	.byte $59, $30, $4F, $78, $09, $31, $01, $77, $09, $31, $01, $78, $0F, $41, $01, $76
	.byte $06, $32, $05, $75, $09, $32, $04, $74, $09, $32, $04, $77, $0F, $32, $00, $77
	.byte $12, $31, $01, $78, $12, $31, $01, $77, $18, $30, $00, $76, $18, $30, $03, $75
	.byte $18, $30, $03, $74, $18, $30, $03, $77, $1B, $31, $01, $78, $1B, $31, $01, $77
	.byte $21, $30, $00, $77, $24, $32, $00, $73, $18, $32, $04, $72, $18, $32, $03, $74
	.byte $27, $42, $00, $78, $27, $42, $00, $79, $21, $41, $00, $79, $18, $41, $00, $75
	.byte $24, $40, $01, $73, $0F, $31, $00, $72, $0F, $31, $00, $71, $0D, $31, $01, $73
	.byte $12, $41, $00, $76, $2A, $30, $05, $77, $2D, $31, $00, $77, $36, $31, $00, $75
	.byte $2A, $32, $05, $77, $3C, $40, $00, $59, $40, $4F, $59, $50, $4F, $74, $2A, $32
	.byte $05, $75, $3C, $42, $01, $76, $3F, $30, $05, $77, $42, $31, $00, $75, $3F, $32
	.byte $00, $77, $4B, $31, $00, $70, $0D, $31, $01, $71, $13, $41, $01, $75, $4E, $32
	.byte $00, $76, $51, $42, $00, $77, $51, $40, $00, $78, $59, $31, $00, $59, $60, $4F
	.byte $59, $70, $4F, $76, $56, $32, $06, $77, $59, $31, $00, $78, $65, $31, $00, $77
	.byte $5C, $32, $02, $77, $65, $31, $00, $77, $68, $32, $01, $75, $59, $32, $00, $75
	.byte $61, $32, $00, $74, $59, $32, $00, $74, $61, $32, $00, $73, $5A, $32, $00, $72
	.byte $5B, $32, $04, $73, $61, $32, $00, $75, $68, $32, $00, $74, $68, $32, $00, $73
	.byte $68, $32, $00, $74, $5D, $42, $00, $75, $5C, $42, $00, $74, $64, $42, $01, $74
	.byte $6B, $42, $02, $59, $80, $4F, $59, $90, $45, $78, $76, $30, $02, $77, $7C, $30
	.byte $00, $75, $79, $30, $00, $76, $7C, $31, $00, $75, $7C, $31, $00, $74, $79, $30
	.byte $00, $73, $76, $30, $01, $72, $79, $30, $00, $71, $79, $30, $00, $74, $7C, $32
	.byte $00, $73, $7C, $31, $00, $72, $7C, $31, $00, $71, $7C, $31, $00, $70, $7C, $30
	.byte $00, $71, $73, $30, $00, $70, $73, $30, $01, $6F, $73, $30, $03, $6E, $73, $30
	.byte $01, $6E, $79, $31, $00, $6E, $7C, $30, $01, $6D, $76, $31, $01, $6C, $76, $32
	.byte $00, $6B, $76, $32, $00, $6C, $79, $31, $00, $6B, $79, $31, $00, $6A, $76, $31
	.byte $01, $69, $79, $31, $00, $6A, $7C, $30, $00, $6B, $7C, $30, $01, $6C, $7C, $30
	.byte $01, $6D, $7C, $30, $01, $74, $7F, $30, $00, $6F, $85, $32, $02, $70, $82, $32
	.byte $04, $71, $7F, $32, $03, $71, $8B, $31, $01, $72, $7F, $32, $01, $72, $85, $30
	.byte $00, $72, $88, $32, $01, $72, $8E, $31, $00, $73, $7F, $32, $05, $74, $82, $32
	.byte $02, $74, $8B, $30, $00, $74, $8E, $32, $00, $75, $7F, $32, $05, $76, $7F, $32
	.byte $01, $76, $85, $30, $00, $76, $88, $32, $01, $76, $8E, $31, $01, $77, $7F, $31
	.byte $05, $78, $8E, $30, $01, $71, $91, $42, $00, $72, $91, $41, $01, $74, $91, $42
	.byte $01, $77, $94, $41, $00, $79, $94, $40, $00, $6C, $82, $40, $03, $70, $7F, $40
	.byte $00, $72, $76, $40, $00, $79, $7F, $40, $00, $32, $6D, $63, $33, $92, $0E, $51
	.byte $A7, $09, $77, $99, $30, $02, $78, $96, $32, $03, $76, $9C, $31, $01, $75, $9F
	.byte $32, $00, $76, $A2, $42, $00, $77, $A2, $41, $00, $78, $A2, $40, $00, $79, $96
	.byte $31, $08, $78, $6E, $42, $00, $79, $68, $41, $00, $2F, $19, $89, $30, $19, $89
	.byte $32, $2C, $8D, $31, $2C, $8D, $33, $05, $21, $33, $07, $00, $32, $43, $8A, $33
	.byte $42, $81, $33, $4D, $81, $37, $6E, $0A, $79, $5C, $41, $00, $2C, $73, $82, $28
	.byte $76, $82, $26, $79, $82, $28, $7C, $82, $29, $7F, $82, $2D, $85, $88, $35, $96
	.byte $82, $34, $99, $82, $33, $9C, $82, $4F, $62, $07, $30, $63, $80, $30, $61, $80
	.byte $31, $64, $80, $31, $60, $80, $E6, $78, $30, $78, $2D, $31, $00, $78, $36, $31
	.byte $00, $78, $30, $41, $01, $78, $39, $41, $01, $78, $42, $31, $00, $78, $4B, $31
	.byte $00, $78, $45, $41, $01, $78, $4E, $41, $01, $33, $75, $0E, $33, $74, $0E, $33
	.byte $73, $0E, $FF
