	.word W407BL	; Alternate level layout
	.word W407BO	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_14 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(13) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_SPECIAL | LEVEL5_TIME_300

	.byte $00, $00, $03, $36, $04, $82, $18, $00, $D5, $14, $08, $D3, $18, $0D, $D3, $32
	.byte $09, $81, $36, $0E, $81, $16, $12, $D9, $14, $1D, $D9, $34, $14, $84, $33, $15
	.byte $82, $32, $16, $80, $30, $1F, $84, $31, $20, $82, $32, $21, $80, $78, $27, $10
	.byte $19, $13, $43, $0A, $39, $43, $80, $35, $43, $80, $36, $43, $80, $38, $43, $80
	.byte $37, $43, $80, $36, $33, $24, $36, $35, $70, $E0, $08, $B6, $E1, $08, $B6, $E2
	.byte $08, $B6, $E3, $08, $B6, $E4, $08, $B6, $FF
