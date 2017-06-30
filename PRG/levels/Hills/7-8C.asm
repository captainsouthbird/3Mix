	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FFGALAXYF | LEVEL5_TIME_300

	.byte $40, $00, $0E, $80, $00, $08, $B8, $00, $21, $01, $75, $02, $0E, $5A, $10, $B0
	.byte $0F, $34, $01, $A3, $51, $18, $09, $B7, $09, $22, $07, $72, $0A, $0D, $FF
