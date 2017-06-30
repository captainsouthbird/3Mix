	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_D8 | LEVEL2_INVERTMUSIC
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_PIPE_L
	.byte LEVEL5_BGM_SKY | LEVEL5_TIME_UNLIMITED

	.byte $40, $00, $0E, $55, $01, $4D, $B9, $00, $41, $0F, $40, $00, $BF, $00, $50, $00
	.byte $B8, $00, $40, $0F, $BF, $00, $50, $0F, $B8, $00, $40, $03, $B1, $0B, $20, $01
	.byte $C1, $34, $0D, $E1, $05, $01, $56, $0D, $0E, $65, $8C, $01, $B0, $05, $0C, $07
	.byte $0A, $93, $0A, $B0, $04, $13, $09, $07, $FF
