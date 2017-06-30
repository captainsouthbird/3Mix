	.word W401AL	; Alternate level layout
	.word W401AO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_14 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(14) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $00, $00, $03, $19, $00, $C1, $32, $37, $03, $A1, $15, $14, $37, $17, $0F, $47
	.byte $31, $15, $85, $27, $14, $85, $24, $0A, $85, $23, $22, $85, $0A, $3D, $B5, $06
	.byte $42, $BA, $23, $44, $86, $03, $47, $09, $15, $26, $47, $17, $33, $C3, $0A, $19
	.byte $3E, $C1, $14, $12, $43, $28, $35, $38, $A1, $19, $55, $C1, $14, $16, $58, $25
	.byte $37, $60, $91, $32, $63, $D3, $31, $63, $41, $E6, $61, $0B, $18, $6A, $C2, $02
	.byte $16, $6D, $C4, $02, $12, $70, $C8, $02, $50, $79, $09, $19, $73, $D1, $0D, $33
	.byte $0A, $48, $54, $12, $B4, $00, $15, $11, $08, $54, $0B, $B1, $00, $33, $3A, $80
	.byte $31, $3B, $80, $2F, $3C, $80, $35, $20, $01, $34, $09, $60, $78, $0A, $57, $70
	.byte $0B, $71, $06, $77, $1E, $71, $06, $6F, $44, $71, $06, $73, $59, $71, $03, $75
	.byte $6A, $71, $02, $72, $6D, $71, $02, $6F, $70, $71, $02, $35, $73, $0E, $FF
