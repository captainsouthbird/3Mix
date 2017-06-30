	.word GhostExitL	; Alternate level layout
	.word GhostExitO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(24) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $49, $65, $EF, $38, $59, $00, $C1, $64, $52, $00, $C1, $64, $54, $00, $E4, $64
	.byte $74, $04, $43, $4D, $00, $F4, $0A, $74, $13, $43, $74, $21, $43, $50, $0B, $A1
	.byte $3D, $11, $0B, $93, $11, $12, $9A, $11, $20, $9A, $11, $2E, $9A, $11, $3C, $9A
	.byte $36, $0B, $23, $56, $0D, $04, $36, $1B, $23, $59, $65, $B1, $06, $57, $6C, $B3
	.byte $06, $55, $73, $B5, $06, $40, $64, $BF, $06, $40, $6B, $BD, $06, $40, $72, $BB
	.byte $06, $40, $79, $B9, $06, $40, $80, $B8, $1E, $52, $7A, $B8, $06, $50, $81, $BA
	.byte $06, $47, $60, $BA, $04, $40, $60, $B6, $03, $41, $9E, $BF, $01, $51, $9E, $B9
	.byte $01, $59, $88, $B1, $15, $58, $27, $C1, $0A, $50, $88, $B5, $01, $50, $8D, $B5
	.byte $00, $50, $91, $B5, $00, $50, $95, $B5, $00, $2F, $81, $41, $29, $82, $41, $2A
	.byte $82, $41, $29, $85, $41, $2A, $85, $41, $2B, $85, $41, $51, $99, $B4, $00, $50
	.byte $9A, $B0, $03, $57, $88, $11, $2F, $84, $A2, $E8, $41, $48, $49, $8A, $B4, $13
	.byte $0F, $9D, $09, $E9, $78, $10, $17, $9C, $04, $51, $00, $C1, $09, $44, $5D, $B0
	.byte $02, $30, $5E, $E1, $E5, $41, $48, $30, $4C, $91, $2F, $14, $A2, $E4, $41, $41
	.byte $07, $5E, $0A, $4E, $24, $C4, $01, $4E, $33, $C4, $01, $4E, $41, $C4, $01, $4E
	.byte $57, $C4, $01, $2B, $58, $0E, $28, $59, $0E, $25, $5A, $0E, $2B, $5A, $80, $29
	.byte $5C, $80, $FF
