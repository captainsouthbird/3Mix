	.word W6F1BL	; Alternate level layout
	.word W6F1BO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_040
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(19) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_300

	.byte $40, $00, $0E, $A0, $00, $21, $A5, $A8, $00, $28, $0D, $45, $0B, $0B, $A6, $00
	.byte $21, $01, $A8, $1A, $28, $0F, $AF, $12, $41, $04, $43, $14, $E9, $AC, $0E, $24
	.byte $02, $AC, $17, $24, $02, $43, $10, $E6, $43, $18, $E4, $8B, $0F, $D1, $8B, $18
	.byte $D1, $44, $1C, $0A, $B1, $00, $21, $63, $AF, $2B, $41, $32, $43, $2D, $E8, $43
	.byte $30, $EA, $43, $33, $E9, $AE, $39, $22, $03, $23, $3F, $D4, $23, $46, $D4, $AE
	.byte $42, $22, $01, $AE, $4A, $22, $01, $43, $36, $E8, $43, $39, $EA, $A2, $3A, $25
	.byte $01, $0E, $30, $0C, $2B, $3A, $22, $2B, $3B, $00, $2E, $4F, $A2, $2E, $53, $A2
	.byte $2E, $57, $A2, $2E, $5B, $A2, $A2, $4C, $25, $59, $49, $4E, $E4, $49, $52, $E4
	.byte $49, $56, $E4, $49, $5A, $E4, $49, $5E, $E4, $AE, $5E, $22, $01, $74, $9D, $65
	.byte $A9, $9E, $2F, $07, $B3, $62, $26, $01, $11, $64, $58, $B9, $64, $20, $51, $99
	.byte $93, $81, $01, $99, $6C, $81, $00, $33, $9D, $E1, $2B, $42, $82, $2B, $4A, $82
	.byte $25, $05, $84, $26, $05, $84, $51, $6F, $0C, $55, $85, $0A, $37, $79, $F9, $35
	.byte $7B, $F7, $31, $7F, $F3, $2F, $81, $F1, $33, $7D, $E5, $2B, $83, $AD, $E7, $63
	.byte $30, $49, $85, $EC, $49, $8B, $ED, $49, $93, $E9, $49, $99, $EA, $49, $8E, $EA
	.byte $56, $90, $0B, $E9, $63, $71, $AA, $B5, $2F, $05, $A8, $9E, $21, $1C, $2B, $A8
	.byte $D1, $2B, $B2, $CA, $34, $A8, $86, $36, $A8, $86, $35, $A8, $86, $15, $B0, $0E
	.byte $EB, $61, $C3, $FF
