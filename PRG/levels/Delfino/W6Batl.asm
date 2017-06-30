	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(7) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BATTLE | LEVEL5_TIME_300

	.byte $7A, $00, $80, $0F, $57, $03, $06, $57, $04, $06, $57, $05, $06, $57, $0B, $06
	.byte $57, $0C, $06, $57, $0A, $06, $54, $07, $06, $54, $08, $06, $54, $09, $06, $54
	.byte $06, $06, $51, $02, $06, $51, $03, $06, $51, $04, $06, $51, $0B, $06, $51, $0C
	.byte $06, $51, $0D, $06, $4F, $00, $21, $2F, $0E, $F1, $71, $0F, $E7, $71, $00, $D7
	.byte $51, $0A, $06, $51, $05, $06, $2E, $00, $4F, $FF
