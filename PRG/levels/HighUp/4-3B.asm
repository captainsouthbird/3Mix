	.word $B62E	; Alternate level layout
	.word $CE82	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(4) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $34, $02, $A6, $17, $07, $66, $17, $12, $6A, $14, $14, $66, $11, $14, $66, $0E
	.byte $14, $66, $13, $22, $6D, $0F, $33, $66, $2C, $34, $84, $0C, $3D, $67, $0F, $53
	.byte $67, $12, $5E, $64, $13, $67, $65, $11, $74, $68, $15, $71, $64, $0D, $80, $68
	.byte $0B, $90, $81, $0D, $8E, $B1, $0C, $92, $A9, $16, $9B, $91, $0E, $8D, $91, $0B
	.byte $A2, $81, $0D, $A0, $B1, $0C, $A4, $A1, $0E, $9F, $98, $18, $B0, $6F, $4F, $B8
	.byte $09, $0E, $A6, $D1, $12, $A8, $A1, $13, $AA, $87, $13, $B2, $B1, $0E, $B5, $E1
	.byte $32, $73, $01, $2F, $24, $89, $28, $41, $0A, $12, $4E, $0B, $31, $4D, $82, $31
	.byte $47, $82, $FF
