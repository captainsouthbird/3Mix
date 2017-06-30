W1_InitIndex:	.byte $00, (W1_ByRowType_S2 - W1_ByRowType), (W1_ByRowType_S3 - W1_ByRowType), (W1_ByRowType_S4 - W1_ByRowType)
W1_ByRowType:	.byte $41, $41, $62, $65, $6F, $86, $81, $82
W1_ByRowType_S2:	.byte $61, $61, $62, $84
W1_ByRowType_S3:
W1_ByRowType_S4:
W1_ByScrCol:	.byte $04, $06, $06, $0C, $0E, $06, $08, $0E
W1_ByScrCol_S2:	.byte $10, $12, $18, $16
W1_ByScrCol_S3:
W1_ByScrCol_S4:
W1_ObjSets:	.word W101AO, W102AO, W1F1AO, W1G1AO, $0002, W103AO, W104AO, W1F2AO
W1_ObjSets_S2:	.word W105AO, W106AO, W1F3AO, W107AO
W1_ObjSets_S3:
W1_ObjSets_S4:
W1_LevelLayout:	.word W101AL, W102AL, W1F1AL, W1G1AL, $006F, W103AL, W104AL, W1F2AL
W1_LevelLayout_S2:	.word W105AL, W106AL, W1F3AL, W107AL
W1_LevelLayout_S3:
W1_LevelLayout_S4:
