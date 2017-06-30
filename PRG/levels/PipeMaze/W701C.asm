	.word W701BL	; Alternate level layout
	.word W701BO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(8) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $3A, $00, $4F, $39, $00, $4F, $38, $00, $43, $38, $0C, $43, $37, $00, $41, $37
	.byte $0E, $41, $36, $00, $40, $36, $0F, $40, $35, $00, $40, $34, $00, $40, $33, $00
	.byte $40, $35, $0F, $40, $34, $0F, $40, $33, $0F, $40, $32, $00, $41, $32, $0E, $41
	.byte $31, $00, $43, $31, $0C, $43, $30, $00, $4F, $2F, $00, $4F, $38, $04, $A1, $30
	.byte $0A, $C1, $E0, $52, $F2, $57, $02, $08, $55, $02, $5B, $53, $02, $5B, $56, $09
	.byte $B2, $00, $56, $0C, $B1, $00, $36, $0A, $11, $17, $0A, $0F, $FF
