	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_00 | LEVEL3_VERTICAL | LEVEL3_VSCROLL_LOCKED
	.byte LEVEL4_BGBANK_INDEX(4) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BATTLE | LEVEL5_TIME_300

	.byte $29, $00, $43, $29, $0C, $43, $2B, $03, $49, $25, $0C, $43, $27, $0C, $43, $28
	.byte $0C, $43, $26, $00, $43, $27, $00, $43, $28, $00, $43, $25, $00, $43, $64, $00
	.byte $A0, $03, $64, $0C, $A0, $03, $6A, $04, $A0, $07, $20, $00, $D1, $20, $0E, $D1
	.byte $26, $0C, $43, $20, $02, $4B, $FF
