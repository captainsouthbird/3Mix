	.word W4F1DL	; Alternate level layout
	.word W4F1DO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_400

	.byte $65, $12, $3F, $0B, $64, $02, $3F, $0B, $00, $00, $FF, $03, $04, $00, $F1, $46
	.byte $04, $0B, $F4, $06, $07, $08, $07, $09, $05, $F5, $01, $0B, $0E, $F1, $3F, $04
	.byte $02, $A9, $01, $03, $12, $A7, $01, $0E, $08, $A9, $01, $09, $12, $A1, $07, $0E
	.byte $12, $A2, $05, $66, $22, $3F, $0B, $0E, $1B, $A6, $01, $07, $15, $F2, $01, $06
	.byte $15, $C2, $05, $26, $F3, $01, $04, $26, $C3, $08, $24, $A2, $06, $01, $39, $F4
	.byte $01, $00, $39, $C4, $67, $32, $3F, $0B, $0E, $22, $A2, $04, $05, $32, $A2, $0A
	.byte $08, $32, $A7, $00, $08, $3A, $A7, $02, $01, $42, $A2, $0A, $0D, $34, $F5, $01
	.byte $0C, $34, $C5, $04, $47, $A2, $03, $68, $42, $32, $0B, $07, $42, $F3, $07, $07
	.byte $4C, $F1, $07, $0B, $46, $F5, $03, $47, $40, $26, $28, $4B, $00, $28, $4A, $20
	.byte $28, $49, $20, $E0, $68, $10, $26, $06, $00, $04, $22, $0A, $FF
