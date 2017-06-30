	.word W302L	; Alternate level layout
	.word W302O	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(3) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0E, $74, $2A, $04, $74, $1A, $04, $20, $04, $D5, $B9, $00, $41, $80
	.byte $73, $02, $09, $73, $0F, $09, $73, $22, $0D, $17, $19, $07, $16, $19, $01, $17
	.byte $32, $0A, $16, $32, $04, $95, $24, $D2, $73, $3A, $0A, $73, $42, $0B, $30, $40
	.byte $23, $30, $42, $70, $73, $4A, $0C, $70, $4F, $0C, $20, $58, $DF, $6F, $5A, $08
	.byte $20, $62, $DF, $33, $5B, $85, $34, $5B, $85, $74, $6D, $64, $94, $6F, $84, $11
	.byte $8A, $6F, $B7, $11, $6C, $64, $75, $8A, $64, $51, $0A, $32, $7D, $E4, $E7, $51
	.byte $5A, $18, $62, $0A, $17, $62, $04, $17, $57, $01, $18, $57, $07, $97, $58, $80
	.byte $09, $98, $58, $B0, $09, $0C, $57, $0E, $FF
