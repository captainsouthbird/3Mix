W2_InitIndex:	.byte $00, (W2_ByRowType_S2 - W2_ByRowType), (W2_ByRowType_S3 - W2_ByRowType), (W2_ByRowType_S4 - W2_ByRowType)
W2_ByRowType:	.byte $64, $64, $8F, $84, $84
W2_ByRowType_S2:	.byte $4E, $65, $84, $82, $8A, $A8
W2_ByRowType_S3:
W2_ByRowType_S4:
W2_ByScrCol:	.byte $04, $08, $04, $08, $0C
W2_ByScrCol_S2:	.byte $12, $12, $10, $18, $1C, $14
W2_ByScrCol_S3:
W2_ByScrCol_S4:
W2_ObjSets:	.word W201AO, W202AO, $0002, W203AO, W2F3AO
W2_ObjSets_S2:	.word W2ZROI, W2G1AO, W204AO, W2F1AO, W2AirshipO, W205AO
W2_ObjSets_S3:
W2_ObjSets_S4:
W2_LevelLayout:	.word W201AL, W202AL, $0000, W203AL, W2F3AL
W2_LevelLayout_S2:	.word W2ZRO, W2G1AL, W204AL, W2F1AL, W2AirshipL, W205AL
W2_LevelLayout_S3:
W2_LevelLayout_S4:
