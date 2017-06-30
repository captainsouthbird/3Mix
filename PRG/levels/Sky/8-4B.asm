	.word W804L	; Alternate level layout
	.word W804O	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(13) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $13, $2D, $02, $15, $00, $CB, $34, $02, $A6, $79, $04, $22, $64, $15, $0C, $F4
	.byte $17, $12, $F2, $13, $12, $F2, $0F, $12, $F2, $2C, $13, $0A, $32, $0D, $22, $32
	.byte $0E, $00, $09, $0B, $CB, $27, $0C, $29, $0A, $19, $C4, $4B, $1A, $6F, $02, $0A
	.byte $27, $C4, $4B, $28, $6F, $02, $0E, $20, $C4, $4F, $21, $6B, $02, $0E, $20, $F4
	.byte $0A, $19, $F4, $0A, $27, $F4, $27, $1A, $22, $2B, $21, $22, $27, $28, $22, $0A
	.byte $2D, $C4, $54, $2D, $66, $01, $47, $29, $05, $4B, $2E, $69, $02, $15, $2F, $D4
	.byte $56, $30, $64, $02, $15, $2F, $F4, $0A, $2D, $F4, $54, $31, $90, $02, $54, $34
	.byte $66, $00, $17, $33, $0A, $39, $3B, $91, $E3, $02, $6A, $FF
