	.word W205BL	; Alternate level layout
	.word W205BO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(23) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $20, $32, $50, $25, $17, $50, $6C, $08, $95, $67, $02, $91, $44, $03, $C2, $00
	.byte $67, $05, $94, $6C, $01, $95, $05, $04, $08, $04, $04, $40, $05, $0A, $08, $04
	.byte $0A, $40, $02, $05, $64, $05, $07, $05, $67, $0B, $91, $44, $0B, $C2, $00, $0A
	.byte $07, $08, $09, $07, $40, $66, $11, $92, $42, $12, $C3, $00, $66, $1B, $92, $42
	.byte $1C, $C3, $00, $6E, $10, $9F, $03, $16, $08, $03, $18, $08, $02, $18, $40, $02
	.byte $16, $40, $03, $14, $08, $02, $14, $40, $03, $1A, $08, $02, $1A, $40, $69, $20
	.byte $91, $69, $23, $9C, $46, $25, $B2, $00, $46, $2A, $B2, $00, $45, $26, $B0, $03
	.byte $07, $22, $08, $06, $22, $40, $63, $30, $9F, $22, $35, $40, $22, $3A, $40, $22
	.byte $3C, $40, $66, $30, $9F, $6B, $30, $9F, $69, $3B, $93, $28, $32, $A2, $E0, $78
	.byte $A5, $07, $28, $0B, $2D, $28, $0E, $2E, $29, $80, $20, $3A, $80, $21, $3B, $80
	.byte $20, $36, $80, $2E, $27, $80, $21, $35, $80, $65, $27, $91, $62, $27, $91, $FF
