	.word W3AirshipBL	; Alternate level layout
	.word W3AirshipBO	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_000
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_80
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(21) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_400

	.byte $4F, $00, $8B, $64, $41, $00, $8E, $64, $1A, $10, $31, $64, $79, $0F, $71, $64
	.byte $78, $0E, $71, $64, $5A, $10, $0B, $77, $0D, $71, $64, $57, $0C, $0A, $76, $0B
	.byte $71, $64, $56, $0A, $0A, $75, $08, $71, $64, $55, $08, $0A, $74, $07, $71, $64
	.byte $54, $06, $0A, $73, $04, $71, $14, $53, $03, $0A, $72, $01, $71, $08, $52, $00
	.byte $0A, $12, $09, $11, $13, $17, $11, $6F, $20, $A3, $6B, $1A, $A1, $66, $23, $A0
	.byte $06, $24, $11, $0C, $17, $66, $0C, $19, $66, $0C, $1B, $66, $07, $1C, $64, $07
	.byte $1E, $64, $07, $20, $64, $07, $22, $64, $07, $24, $6A, $08, $28, $69, $08, $2A
	.byte $63, $08, $2C, $63, $0C, $26, $65, $44, $33, $B4, $0F, $49, $3F, $BA, $03, $53
	.byte $34, $B0, $08, $30, $3D, $93, $72, $35, $A0, $12, $36, $11, $E3, $12, $10, $6F
	.byte $1E, $03, $FF
