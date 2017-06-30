W6_InitIndex:	.byte $00, (W6_ByRowType_S2 - W6_ByRowType), (W6_ByRowType_S3 - W6_ByRowType), (W6_ByRowType_S4 - W6_ByRowType)
W6_ByRowType:	.byte $27, $47, $47, $63, $63, $83, $87, $A3
W6_ByRowType_S2:	.byte $26, $25, $4E, $43, $6A, $83
W6_ByRowType_S3:
W6_ByRowType_S4:
W6_ByScrCol:	.byte $08, $04, $0C, $06, $08, $04, $0C, $04
W6_ByScrCol_S2:	.byte $10, $14, $14, $16, $1A, $10
W6_ByScrCol_S3:
W6_ByScrCol_S4:
W6_ObjSets:	.word W603O, W602O, W605O, $0002, W6F1AO, W601AO, W604O, W6F1BossO
W6_ObjSets_S2:	.word W606AO, W6G1AO, W6ZROI, W6F2AO, W6AirshipO, $0002
W6_ObjSets_S3:
W6_ObjSets_S4:
W6_LevelLayout:	.word W603L, W602L, W605L, $0000, W6F1AL, W601AL, W604L, W6F1BossL
W6_LevelLayout_S2:	.word W606AL, W6G1AL, W2ZRO, W6F2AL, W6AirshipL, $0000
W6_LevelLayout_S3:
W6_LevelLayout_S4:
