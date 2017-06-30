	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(1) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $1A, $00, $C0, $1F, $10, $08, $E2, $12, $04, $E2, $38, $02, $A1, $19, $04, $96
	.byte $12, $06, $02, $51, $15, $09, $52, $0F, $B7, $01, $53, $0E, $B6, $00, $54, $0D
	.byte $B5, $00, $55, $0C, $B4, $00, $56, $0B, $B3, $00, $57, $0A, $B2, $00, $58, $09
	.byte $B1, $00, $59, $08, $B0, $00, $FF
