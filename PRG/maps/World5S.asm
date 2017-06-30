W5_InitIndex:	.byte $00, (W5_ByRowType_S2 - W5_ByRowType), (W5_ByRowType_S3 - W5_ByRowType), (W5_ByRowType_S4 - W5_ByRowType)
W5_ByRowType:	.byte $23, $23, $49, $69, $69, $63, $85
W5_ByRowType_S2:	.byte $29, $49, $49, $8A, $A3
W5_ByRowType_S3:
W5_ByRowType_S4:
W5_ByScrCol:	.byte $04, $08, $0C, $04, $08, $0E, $0E
W5_ByScrCol_S2:	.byte $12, $10, $14, $1A, $10
W5_ByScrCol_S3:
W5_ByScrCol_S4:
W5_ObjSets:	.word $0002, W502O, W503O, W501O, W5P1O, $0002, W5G1AO
W5_ObjSets_S2:	.word W505O, W504O, W5P2O, W5AirshipO, W506O
W5_ObjSets_S3:
W5_ObjSets_S4:
W5_LevelLayout:	.word $0000, W502L, W503L, W501L, W5P1L, $0000, W5G1AL
W5_LevelLayout_S2:	.word W505L, W504L, W5P2L, W5AirshipL, W506L
W5_LevelLayout_S3:
W5_LevelLayout_S4:
