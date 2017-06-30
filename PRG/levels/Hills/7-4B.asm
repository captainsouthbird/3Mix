	.word W704L	; Alternate level layout
	.word W704O	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(25) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE | LEVEL5_TIME_300

	.byte $40, $00, $0E, $A0, $02, $22, $0F, $A0, $14, $23, $04, $A0, $1B, $23, $04, $26
	.byte $1C, $83, $A0, $24, $23, $04, $A0, $2D, $22, $04, $26, $25, $83, $25, $2E, $83
	.byte $A0, $35, $22, $04, $A0, $3A, $26, $00, $A8, $3B, $20, $08, $AE, $35, $20, $12
	.byte $A4, $47, $28, $00, $A4, $40, $20, $05, $A0, $3C, $20, $0F, $2A, $3C, $89, $29
	.byte $45, $80, $28, $45, $80, $27, $45, $80, $26, $3F, $86, $25, $3F, $80, $24, $3F
	.byte $80, $23, $3F, $80, $22, $3F, $88, $A0, $4F, $22, $00, $A4, $4D, $20, $04, $03
	.byte $4E, $61, $03, $51, $51, $83, $4F, $51, $01, $A0, $59, $21, $00, $A2, $57, $20
	.byte $04, $62, $57, $60, $62, $5B, $50, $27, $4E, $83, $26, $59, $01, $AB, $5D, $20
	.byte $0F, $AA, $72, $23, $00, $A9, $70, $20, $04, $6A, $74, $80, $6A, $70, $70, $29
	.byte $60, $83, $29, $68, $83, $26, $71, $23, $26, $73, $00, $28, $7A, $81, $25, $7A
	.byte $81, $22, $7A, $81, $A0, $78, $24, $00, $2B, $7A, $81, $E7, $78, $C3, $0B, $46
	.byte $0D, $FF
