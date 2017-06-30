W10_InitIndex:	.byte $00, (W10_ByRowType_S2 - W10_ByRowType), (W10_ByRowType_S3 - W10_ByRowType), (W10_ByRowType_S4 - W10_ByRowType)
W10_ByRowType:	.byte $2E, $21, $23, $6F, $6F, $AE, $AF, $A3
W10_ByRowType_S2:	.byte $2E, $2F, $23, $6F, $6F, $8F, $AE, $AF, $A3
W10_ByRowType_S3:
W10_ByRowType_S4:
W10_ByScrCol:	.byte $01, $03, $05, $06, $0A, $02, $08, $0A
W10_ByScrCol_S2:	.byte $11, $13, $15, $10, $1A, $12, $11, $13, $15
W10_ByScrCol_S3:
W10_ByScrCol_S4:
W10_ObjSets:	.word W2ZROI, WZW21AO, $0303, WZ1O, WZ2O, W4ZROI, WZW4BO, $0304
W10_ObjSets_S2:	.word W6ZROI, WZW6AO, $0305, WZ3O, WZFinalO, WZ4O, W8ZROI, WZW8AO, $0306
W10_ObjSets_S3:
W10_ObjSets_S4:
W10_LevelLayout:	.word WZRO2, WZW21AL, $014B, WZ1L, WZ2L, WZRO2, WZW4BL, $0100
W10_LevelLayout_S2:	.word WZRO2, WZW6AL, $0100, WZ3L, WZFinalL, WZ4L, WZRO2, WZW8AL, $0100
W10_LevelLayout_S3:
W10_LevelLayout_S4:
