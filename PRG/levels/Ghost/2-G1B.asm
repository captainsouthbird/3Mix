	.word W2G1AL	; Alternate level layout
	.word W2G1AO	; Alternate object layout
	.byte LEVEL1_SIZE_07 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(5) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $27, $1C, $88, $16, $02, $50, $80, $02, $00, $61, $30, $04, $00, $6F, $02, $14
	.byte $00, $66, $02, $0C, $06, $70, $3A, $0D, $06, $73, $01, $11, $0C, $70, $05, $0D
	.byte $10, $73, $01, $11, $11, $70, $0A, $31, $1B, $0E, $11, $1C, $70, $05, $0D, $20
	.byte $73, $01, $11, $21, $70, $0A, $31, $2B, $0E, $11, $2C, $70, $05, $0D, $30, $73
	.byte $01, $11, $31, $70, $09, $31, $3A, $0E, $11, $3B, $70, $05, $0D, $3F, $73, $01
	.byte $2F, $11, $A1, $2F, $21, $A1, $2F, $31, $A1, $0F, $0E, $90, $0F, $1E, $A0, $0F
	.byte $2E, $B0, $E0, $41, $11, $E2, $41, $13, $E1, $41, $12, $0F, $3E, $04, $E3, $78
	.byte $20, $14, $4D, $04, $0F, $4B, $74, $01, $14, $5C, $04, $0F, $57, $70, $04, $10
	.byte $5A, $70, $01, $11, $57, $70, $04, $12, $57, $70, $01, $13, $57, $70, $04, $14
	.byte $6C, $04, $13, $67, $70, $03, $0F, $67, $70, $03, $11, $67, $70, $03, $0F, $6A
	.byte $74, $01, $E4, $78, $27, $E5, $78, $88, $E6, $48, $8A, $12, $0B, $71, $01, $32
	.byte $42, $00, $07, $20, $09, $25, $1C, $88, $26, $1C, $88, $2E, $41, $0E, $FF
