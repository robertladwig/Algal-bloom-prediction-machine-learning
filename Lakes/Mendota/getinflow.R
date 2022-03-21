
setwd('~/Documents/DSI/Algal-bloom-prediction-machine-learning/Lakes/Mendota/')

inf1 <- read_csv("ME_data/Mendota_yahara_30year2xP.csv")
inf2 <- read_csv("ME_data/Mendota_pheasant_branch_30year2xP.csv")

df <- data.frame('time' = inf1$time,
                 'FLOW' = (inf1$FLOW * inf1$FLOW+ inf2$FLOW * inf2$FLOW)/((inf1$FLOW + inf2$FLOW)),
                 'SALT' = (inf1$FLOW * inf1$SALT+ inf2$FLOW * inf2$SALT)/((inf1$FLOW + inf2$FLOW)),
                 "TEMP" = (inf1$FLOW * inf1$TEMP+ inf2$FLOW * inf2$TEMP)/((inf1$FLOW + inf2$FLOW)), 
                 "PHS_frp" =(inf1$FLOW * inf1$PHS_frp+ inf2$FLOW * inf2$PHS_frp)/((inf1$FLOW + inf2$FLOW)),
                 "PHS_frp_ads" =(inf1$FLOW * inf1$PHS_frp_ads+ inf2$FLOW * inf2$PHS_frp_ads)/((inf1$FLOW + inf2$FLOW)),
                 "OGM_dop"= (inf1$FLOW * inf1$OGM_dop+ inf2$FLOW * inf2$OGM_dop)/((inf1$FLOW + inf2$FLOW)),
                 "OGM_pop" =(inf1$FLOW * inf1$OGM_pop+ inf2$FLOW * inf2$OGM_pop)/((inf1$FLOW + inf2$FLOW)),
                 "OGM_don"  =(inf1$FLOW * inf1$OGM_don+ inf2$FLOW * inf2$OGM_don)/((inf1$FLOW + inf2$FLOW)),
                 "NIT_amm" =(inf1$FLOW * inf1$NIT_amm+ inf2$FLOW * inf2$NIT_amm)/((inf1$FLOW + inf2$FLOW)),
                 "NIT_nit"  =(inf1$FLOW * inf1$NIT_nit+ inf2$FLOW * inf2$NIT_nit)/((inf1$FLOW + inf2$FLOW)),
                 "OGM_docr" =(inf1$FLOW * inf1$OGM_docr+ inf2$FLOW * inf2$OGM_docr)/((inf1$FLOW + inf2$FLOW)),
                 "CAR_dic"  =(inf1$FLOW * inf1$CAR_dic+ inf2$FLOW * inf2$CAR_dic)/((inf1$FLOW + inf2$FLOW)),
                 "CAR_pH"   =(inf1$FLOW * inf1$CAR_pH+ inf2$FLOW * inf2$CAR_pH)/((inf1$FLOW + inf2$FLOW)),
                 "SIL_rsi"  =(inf1$FLOW * inf1$SIL_rsi+ inf2$FLOW * inf2$SIL_rsi)/((inf1$FLOW + inf2$FLOW)),
                 "ZOO_daphnia" =(inf1$FLOW * inf1$ZOO_daphnia+ inf2$FLOW * inf2$ZOO_daphnia)/((inf1$FLOW + inf2$FLOW)))

write_csv(df, 'Training data/ME_Daily_Inflow_df.csv')

daph <- read_csv('ME_data/ntl_daphnia_biomass.csv')
me <- daph %>% filter(lakeid == "ME")

write_csv(me, 'Training data/ME_biweekly_Daphnia.csv')
