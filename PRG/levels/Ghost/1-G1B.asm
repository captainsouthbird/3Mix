	.word W1G1AL	; Alternate level layout
	.word W1G1AO	; Alternate object layout
	.byte LEVEL1_SIZE_06 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(5) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $16, $00, $50, $29, $17, $0B, $22, $36, $29, $4F, $37, $29, $4F, $38, $29, $4F
	.byte $39, $29, $4F, $3A, $29, $4F, $36, $39, $4F, $37, $39, $4F, $38, $39, $4F, $39
	.byte $39, $4F, $3A, $39, $4F, $04, $29, $6F, $20, $00, $00, $63, $5F, $34, $29, $1F
	.byte $35, $29, $1F, $34, $39, $1E, $35, $39, $1E, $04, $49, $6F, $20, $14, $49, $66
	.byte $20, $14, $29, $04, $14, $31, $04, $14, $39, $04, $14, $41, $04, $E2, $5F, $A5
	.byte $E3, $5F, $20, $E4, $4F, $F6, $14, $48, $08, $FF
