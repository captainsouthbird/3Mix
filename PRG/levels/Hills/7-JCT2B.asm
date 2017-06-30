	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GOODEGG | LEVEL5_TIME_300

	.byte $40, $00, $0E, $80, $00, $08, $99, $00, $81, $03, $19, $04, $04, $7A, $04, $E0
	.byte $59, $05, $81, $0A, $50, $0A, $B0, $05, $50, $0B, $69, $02, $19, $0F, $A1, $19
	.byte $0F, $01, $FF
