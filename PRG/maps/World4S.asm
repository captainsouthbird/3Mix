W4_InitIndex:	.byte $00, (W4_ByRowType_S2 - W4_ByRowType), (W4_ByRowType_S3 - W4_ByRowType), (W4_ByRowType_S4 - W4_ByRowType)
W4_ByRowType:	.byte $41, $41, $66, $62, $63, $83, $83, $82
W4_ByRowType_S2:	.byte $43, $4E, $65, $82, $8A
W4_ByRowType_S3:
W4_ByRowType_S4:
W4_ByScrCol:	.byte $04, $06, $06, $0C, $0E, $04, $0C, $0E
W4_ByScrCol_S2:	.byte $10, $18, $12, $14, $18
W4_ByScrCol_S3:
W4_ByScrCol_S4:
W4_ObjSets:	.word W401BO, W402O, W404AO, W4F1AO, W407AO, $0002, W406AO, W4F2AO
W4_ObjSets_S2:	.word $0002, W4ZROI, W4G1AO, W4F3AO, W4AirshipO
W4_ObjSets_S3:
W4_ObjSets_S4:
W4_LevelLayout:	.word W401BL, W402L, W404AL, W4F1AL, W407AL, $0000, W406AL, W4F2AL
W4_LevelLayout_S2:	.word $0000, W2ZRO, W4G1AL, W4F3AL, W4AirshipL
W4_LevelLayout_S3:
W4_LevelLayout_S4:
