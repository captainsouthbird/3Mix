	.word W2F2BL	; Alternate level layout
	.word W2F2BO	; Alternate object layout
	.byte LEVEL1_SIZE_09 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $79, $00, $D1, $20, $71, $00, $37, $6E, $6F, $00, $D9, $01, $6F, $02, $D1, $7D
	.byte $76, $02, $6F, $71, $12, $D1, $01, $71, $16, $D2, $00, $76, $12, $6D, $71, $19
	.byte $D1, $01, $71, $1C, $D1, $01, $73, $1C, $D0, $00, $76, $20, $D2, $00, $79, $21
	.byte $31, $01, $79, $23, $D1, $5C, $74, $22, $5F, $18, $23, $CF, $18, $33, $CF, $76
	.byte $33, $5F, $71, $3D, $D1, $01, $76, $43, $D2, $00, $76, $44, $53, $18, $44, $C5
	.byte $77, $4A, $D1, $00, $73, $4A, $6F, $76, $53, $5F, $18, $58, $C5, $18, $5F, $CA
	.byte $76, $63, $56, $78, $6A, $D0, $00, $74, $6B, $D4, $03, $71, $6F, $D7, $10, $37
	.byte $4D, $91, $E4, $12, $70, $32, $6D, $E1, $E6, $64, $B6, $6F, $80, $39, $0F, $61
	.byte $77, $DD, $08, $15, $80, $F3, $00, $15, $8C, $F3, $00, $6F, $90, $D9, $10, $18
	.byte $57, $0A, $33, $02, $08, $FF
