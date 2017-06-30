	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(27) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_UNLIMITED

	.byte $26, $03, $83, $25, $00, $1F, $2B, $0A, $D1, $10, $06, $12, $04, $0C, $04, $13
	.byte $04, $18, $00, $11, $19, $12, $0B, $11, $01, $11, $13, $26, $11, $1A, $36, $17
	.byte $14, $00, $17, $0D, $00, $0E, $0C, $43, $18, $11, $43, $0C, $11, $51, $02, $09
	.byte $05, $61, $02, $07, $0E, $72, $03, $12, $0E, $F2, $72, $00, $21, $01, $44, $01
	.byte $E2, $61, $07, $12, $71, $04, $32, $FF
