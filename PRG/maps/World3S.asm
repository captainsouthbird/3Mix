W3_InitIndex:	.byte $00, (W3_ByRowType_S2 - W3_ByRowType), (W3_ByRowType_S3 - W3_ByRowType), (W3_ByRowType_S4 - W3_ByRowType)
W3_ByRowType:	.byte $4E, $6F, $61, $62, $81, $81, $A1, $A1
W3_ByRowType_S2:	.byte $65, $6A
W3_ByRowType_S3:
W3_ByRowType_S4:
W3_ByScrCol:	.byte $08, $04, $0C, $0E, $06, $08, $04, $0C
W3_ByScrCol_S2:	.byte $12, $16
W3_ByScrCol_S3:
W3_ByScrCol_S4:
W3_ObjSets:	.word W303AO, $0002, W305O, W3F1AO, W302O, W304O, W301O, W3F2BO
W3_ObjSets_S2:	.word W3G1AO, W3AirshipO
W3_ObjSets_S3:
W3_ObjSets_S4:
W3_LevelLayout:	.word W303AL, $0000, W305L, W3F1AL, W302L, W304L, W301L, W3F2BL
W3_LevelLayout_S2:	.word W3G1AL, W3AirshipL
W3_LevelLayout_S3:
W3_LevelLayout_S4:
