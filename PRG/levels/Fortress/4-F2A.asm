	.word W4F2BL	; Alternate level layout
	.word W4F2BO	; Alternate object layout
	.byte LEVEL1_SIZE_09 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_300

	.byte $6B, $00, $3F, $C8, $10, $00, $A4, $12, $19, $00, $E1, $0F, $7A, $10, $40, $01
	.byte $19, $12, $E1, $23, $10, $13, $A3, $05, $10, $19, $A5, $05, $10, $22, $A5, $05
	.byte $14, $28, $A1, $07, $10, $30, $A5, $0C, $7A, $36, $40, $0A, $19, $41, $E1, $0F
	.byte $7A, $51, $40, $0C, $32, $2A, $24, $32, $2C, $00, $10, $3E, $E4, $13, $36, $14
	.byte $84, $12, $3D, $A5, $02, $15, $40, $A2, $11, $10, $52, $A7, $0C, $19, $5E, $E1
	.byte $05, $13, $5C, $05, $10, $62, $A7, $0C, $7A, $64, $40, $16, $15, $6F, $A2, $08
	.byte $10, $78, $A7, $04, $15, $6A, $05, $15, $79, $05, $19, $7B, $E1, $14, $32, $71
	.byte $85, $10, $8D, $F2, $08, $17, $8A, $00, $E8, $6F, $30, $3A, $70, $90, $61, $00
	.byte $39, $C8, $08, $06, $CF, $09, $00, $E6, $8F, $08, $16, $CF, $47, $00, $22, $01
	.byte $05, $A2, $05, $03, $0E, $A2, $05, $01, $17, $A2, $05, $04, $20, $A1, $05, $30
	.byte $81, $D5, $27, $29, $91, $01, $2D, $F8, $07, $E2, $52, $18, $E7, $23, $20, $24
	.byte $01, $00, $21, $0E, $86, $21, $20, $86, $04, $29, $08, $FF
