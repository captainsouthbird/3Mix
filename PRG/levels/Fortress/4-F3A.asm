	.word W4F3BL	; Alternate level layout
	.word W4F3BO	; Alternate object layout
	.byte LEVEL1_SIZE_15 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_400

	.byte $6F, $00, $3B, $EF, $19, $00, $E1, $64, $0F, $00, $E0, $64, $7A, $0A, $40, $02
	.byte $7A, $0F, $40, $02, $7A, $16, $40, $02, $7A, $1B, $40, $02, $7A, $22, $40, $08
	.byte $36, $07, $01, $19, $33, $CF, $19, $43, $CE, $10, $2F, $A5, $25, $16, $34, $A1
	.byte $1B, $13, $35, $05, $13, $42, $05, $13, $4D, $05, $7A, $33, $40, $1E, $01, $64
	.byte $F0, $0D, $16, $65, $E1, $0A, $13, $72, $F1, $02, $14, $75, $F2, $04, $18, $87
	.byte $E1, $02, $15, $8C, $E1, $02, $34, $8D, $40, $17, $92, $E1, $0A, $15, $94, $E1
	.byte $01, $15, $99, $E1, $01, $15, $9F, $E1, $01, $18, $A2, $E1, $3E, $38, $7A, $4A
	.byte $01, $AE, $F0, $0D, $0F, $AE, $E0, $32, $10, $B9, $E2, $01, $10, $BD, $E2, $01
	.byte $10, $C1, $E2, $01, $10, $C5, $E2, $01, $10, $C9, $E2, $01, $10, $CD, $E2, $01
	.byte $10, $D1, $E2, $01, $0F, $E1, $F8, $0A, $10, $D5, $E2, $01, $10, $D9, $E2, $01
	.byte $ED, $E3, $30, $11, $DE, $08, $79, $0A, $30, $02, $79, $0F, $30, $02, $79, $16
	.byte $30, $02, $79, $1B, $30, $02, $58, $22, $48, $36, $DD, $91, $FF
