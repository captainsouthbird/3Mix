	.word W5PB3L	; Alternate level layout
	.word W5PB3O	; Alternate object layout
	.byte LEVEL1_SIZE_04 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(9) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $02, $24, $00, $54, $19, $B0, $08, $55, $21, $B4, $00, $4D, $2A, $B4, $00, $52
	.byte $27, $B0, $08, $53, $2E, $B4, $00, $4B, $1E, $B0, $08, $49, $22, $B6, $00, $75
	.byte $27, $C6, $76, $27, $C6, $77, $27, $C6, $57, $28, $0A, $35, $2A, $82, $36, $2A
	.byte $82, $37, $2A, $82, $4F, $1F, $B0, $08, $6C, $23, $C3, $0C, $23, $0F, $6D, $23
	.byte $C3, $6E, $23, $C3, $2D, $23, $82, $2E, $23, $82, $75, $1D, $C3, $76, $1D, $C3
	.byte $77, $1D, $C3, $78, $1D, $C3, $79, $1D, $C3, $36, $1D, $82, $37, $1D, $82, $38
	.byte $1D, $82, $37, $20, $00, $41, $24, $0C, $57, $28, $0C, $E2, $71, $70, $FF
