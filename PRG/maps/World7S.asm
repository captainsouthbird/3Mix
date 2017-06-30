W7_InitIndex:	.byte $00, (W7_ByRowType_S2 - W7_ByRowType), (W7_ByRowType_S3 - W7_ByRowType), (W7_ByRowType_S4 - W7_ByRowType)
W7_ByRowType:	.byte $33, $5E, $5B, $5E, $53, $53, $73, $73, $72
W7_ByRowType_S2:	.byte $53, $53, $58, $73, $7A, $98, $98
W7_ByRowType_S3:	.byte $73, $9A
W7_ByRowType_S4:
W7_ByScrCol:	.byte $04, $02, $04, $0A, $0C, $0E, $04, $0A, $0E
W7_ByScrCol_S2:	.byte $10, $18, $1A, $10, $1C, $1A, $1E
W7_ByScrCol_S3:	.byte $20, $20
W7_ByScrCol_S4:
W7_ObjSets:	.word W7JCT1AO, W701O, W702O, W703O, W7JCT1BO, W7JCT2AO, $0002, W704O, W7F1AO
W7_ObjSets_S2:	.word W706O, W7JCT2BO, W7F2AO, W705O, W708PO, W707O, W7F3O
W7_ObjSets_S3:	.word $0002, W7AirshipO
W7_ObjSets_S4:
W7_LevelLayout:	.word W7JCT1AL, W701L, W702L, W703L, W7JCT1BL, W7JCT2AL, $0000, W704L, W7F1AL
W7_LevelLayout_S2:	.word W706L, W7JCT2BL, W7F2AL, W705L, W708PL, W707L, W7F3L
W7_LevelLayout_S3:	.word $0000, W7AirshipL
W7_LevelLayout_S4:
