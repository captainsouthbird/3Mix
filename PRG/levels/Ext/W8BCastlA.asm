	.word W8BCastlBL	; Alternate level layout
	.word W8BCastlBO	; Alternate object layout
	.byte LEVEL1_SIZE_14 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_AIRSHIP | LEVEL5_TIME_400

	.byte $0B, $00, $70, $46, $09, $00, $71, $05, $47, $10, $33, $49, $17, $31, $48, $1E
	.byte $32, $28, $2C, $22, $28, $09, $22, $48, $13, $05, $0B, $4C, $70, $53, $0A, $4E
	.byte $70, $51, $09, $50, $70, $4F, $27, $53, $A1, $26, $57, $A2, $05, $69, $70, $01
	.byte $05, $79, $70, $01, $07, $77, $70, $01, $03, $7B, $70, $01, $09, $C0, $4F, $0A
	.byte $A0, $51, $3F, $09, $A0, $4D, $00, $DA, $38, $00, $D1, $38, $00, $C8, $38, $00
	.byte $BF, $38, $00, $B6, $38, $00, $AD, $38, $08, $A5, $00, $08, $AE, $00, $08, $B7
	.byte $00, $08, $C0, $00, $08, $C9, $00, $08, $D2, $00, $46, $A1, $05, $46, $C6, $05
	.byte $00, $DC, $64, $03, $07, $DD, $01, $07, $DE, $01, $05, $DD, $01, $05, $DE, $01
	.byte $05, $DF, $63, $00, $ED, $68, $20, $08, $79, $08, $FF
