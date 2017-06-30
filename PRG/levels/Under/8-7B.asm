	.word W807L	; Alternate level layout
	.word W807O	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_14 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(25) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $40, $00, $0E, $8E, $04, $51, $07, $99, $04, $51, $07, $97, $0C, $53, $03, $99
	.byte $06, $81, $03, $78, $04, $50, $97, $00, $53, $03, $16, $02, $51, $78, $0A, $60
	.byte $16, $0D, $61, $92, $00, $54, $01, $92, $0E, $54, $01, $13, $0E, $E2, $73, $01
	.byte $E2, $8E, $00, $53, $03, $37, $07, $A1, $11, $02, $81, $8E, $0C, $53, $03, $11
	.byte $0C, $71, $70, $04, $80, $70, $0A, $70, $8E, $06, $B1, $03, $30, $07, $C1, $E0
	.byte $11, $73, $33, $03, $89, $34, $03, $89, $35, $03, $89, $11, $0A, $0D, $31, $05
	.byte $0A, $36, $05, $60, $36, $0A, $60, $FF
