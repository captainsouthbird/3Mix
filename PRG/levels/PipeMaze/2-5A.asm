	.word W205BL	; Alternate level layout
	.word W205BO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(6) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $08, $28, $93, $05, $6D, $93, $07, $2F, $94, $02, $02, $97, $02, $05, $97, $29
	.byte $02, $4A, $27, $03, $91, $40, $06, $0A, $22, $13, $43, $03, $15, $9D, $02, $1C
	.byte $9E, $02, $25, $99, $2B, $24, $4C, $28, $2C, $42, $4A, $30, $B0, $0E, $08, $3F
	.byte $98, $4A, $40, $B0, $03, $07, $44, $98, $6A, $46, $53, $06, $26, $47, $24, $09
	.byte $4E, $98, $4B, $4F, $B0, $09, $08, $59, $98, $24, $59, $00, $29, $5C, $47, $28
	.byte $61, $4E, $64, $66, $53, $04, $39, $00, $4F, $36, $09, $44, $33, $0B, $49, $52
	.byte $00, $B6, $01, $31, $13, $EF, $27, $2A, $A3, $E1, $21, $A2, $44, $6D, $0B, $49
	.byte $26, $0C, $44, $6D, $0C, $27, $0B, $A1, $E2, $21, $B0, $E0, $21, $50, $01, $15
	.byte $0B, $22, $0E, $82, $FF
