# =======================================================
# implementação STAR manual para todos estados

# =======================================================
# ES
star_ES <- star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 1, thDelay = 0) # 3.016973e-06
star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 2, thDelay = 0) # 6.798838e-05
star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.001235433
star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.00543078
star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.006980296
star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.001776731

accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["ES" ]], star_ES), out_sample_rcl[["ES"]]) 
# =======================================================

# =======================================================
# PA
star_PA <- star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.00891104
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.00729907
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.01500219
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.552603
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.7051937
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.4817578

accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["PA" ]], star_PA), out_sample_rcl[["PA"]]) 
# =======================================================

# =======================================================
# PR
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.8415572
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.7439387
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.3235614
star_PR <- star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.09846496
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.342717
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.1861111

accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["PR" ]], star_PR), out_sample_rcl[["PR"]]) 
# =======================================================

# =======================================================
# SP
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.4418059
star_SP <- star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.1166086
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.1217046
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.3814695
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.1443616
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.331405

accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["SP" ]], star_SP), out_sample_rcl[["SP"]]) 
# =======================================================

# =======================================================
# SC
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 1, thDelay = 0) # 8.36854e-05
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.004311316
star_SC <- star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 3, thDelay = 0) # 6.509905e-05
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.0002420077
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.0007665383
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.005047109


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["SC" ]], star_SC), out_sample_rcl[["SC"]]) 
# =======================================================

# =======================================================
# RS
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.003599682
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.03374031
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.1688452
star_RS <- star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 2, thDelay = 1) # 2.98982e-05
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.07962218
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.4919605


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["RS" ]], star_RS), out_sample_rcl[["RS"]]) 
# =======================================================

# =======================================================
# AM
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.2830181
star_AM <- star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.2706182
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.569724
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.4249202
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.7900899
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.9768422


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["AM" ]], star_AM), out_sample_rcl[["AM"]]) 
# =======================================================

# =======================================================
# MG
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.4673414
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.3357096
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.3447759
star_MG <- star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.05214163
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.3792273
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.2413588


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["MG" ]], star_MG), out_sample_rcl[["MG"]]) 
# =======================================================

# =======================================================
# RJ
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.5223777
star_RJ <- star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.2798834
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.4683901
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.5301071
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.5022575
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.7643634


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["RJ" ]], star_RJ), out_sample_rcl[["RJ"]]) 
# =======================================================

# =======================================================
# GO
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.5698762
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.595534
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.8180027
star_GO <-star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.04862132
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.2296138
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.451476


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["GO" ]], star_GO), out_sample_rcl[["GO"]]) 
# =======================================================

# =======================================================
# AC
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.3160079
star_AC <- star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.02815918
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.0544208
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.1284736
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.01800888 - erro
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.181763


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["AC" ]], star_AC), out_sample_rcl[["AC"]]) 
# =======================================================

# =======================================================
# MS
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.7706064
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.8268509
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.4831219
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.02293971
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.0652629
star_MS <- star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.002312457


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["MS" ]], star_MS), out_sample_rcl[["MS"]]) 
# =======================================================

# =======================================================
# MT
star_MT <- star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.015059
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.2372174
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.3785857
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.494127
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.9335255
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.5739755


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["MT" ]], star_MT), out_sample_rcl[["MT"]]) 
# =======================================================


# =======================================================
# DF
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.3498943
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.00146011
star_DF <- star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 3, thDelay = 0) # 2.349909e-06
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.09772762
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.01725688
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.02832034


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["DF" ]], star_DF), out_sample_rcl[["DF"]]) 
# =======================================================


# =======================================================
# BA - outlier em abr/2013 devido a concentracao de transferecias a municipios nesse mes
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.2536828
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.2343106
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.3668612
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.8828778
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.3670299
star_BA <- star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.231291


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["BA" ]], star_BA), out_sample_rcl[["BA"]]) 
# =======================================================


# =======================================================
# RO
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.009719068
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.1196687
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.6049128
star_RO <- star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.07292827
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.5665151
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.2168866


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["RO" ]], star_RO), out_sample_rcl[["RO"]]) 
# =======================================================

# =======================================================
# TO
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.6785387
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.5814937
star_TO <- star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.4245053
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.4979961
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.7352554
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.9034525


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["TO" ]], star_TO), out_sample_rcl[["TO"]]) 
# =======================================================

# =======================================================
# CE
star_CE <- star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.2764939
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.5633205
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.6958805
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.3174391
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.6830069
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.883374


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["CE" ]], star_CE), out_sample_rcl[["CE"]]) 
# =======================================================

# =======================================================
# PE
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.07112481
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.1661115
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.1756389 erro
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.4939349
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.5870119
star_PE <- star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.0298946


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["PE" ]], star_PE), out_sample_rcl[["PE"]]) 
# =======================================================

# =======================================================
# SE
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.6785387
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.5814937
star_SE <- star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.4245053
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.4979961
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.7352554
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.9034525


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["SE" ]], star_SE), out_sample_rcl[["SE"]]) 
# =======================================================

# =======================================================
# MA
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.3961114
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.3039157
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.5201715
star_MA <- star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.2029058
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.4011141
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.2296948


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["MA" ]], star_MA), out_sample_rcl[["MA"]]) 
# =======================================================

# =======================================================
# RN
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.761008
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.8825861
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.2936456
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.5195087
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.5891148
star_RN <- star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.01900131


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["RN" ]], star_RN), out_sample_rcl[["RN"]]) 
# =======================================================

# =======================================================
# AL
star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 1, thDelay = 0) # 1.56952e-06
star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 2, thDelay = 0) # 3.171983e-05
star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.01996122
star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 2, thDelay = 1) # 1.507197e-06
star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 3, thDelay = 1) # 2.692721e-05
star_AL <- star(seas_adj_dif_ln_rcl[["AL" ]]$seas_adj_ts, m = 3, thDelay = 2) # 2.718117e-09


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["AL" ]], star_AL), out_sample_rcl[["AL"]]) 
# =======================================================


# =======================================================
# AP
star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.5396975
star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.9722525
star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.9093331
star_AP <- star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.07224372
star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.3086373
star(seas_adj_dif_ln_rcl[["AP" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.1810721


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["AP" ]], star_AP), out_sample_rcl[["AP"]]) 
# =======================================================


# =======================================================
# RR - estorno de receita patrimonial em julho/2013 e leve incremento em agosto/2013
star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.2373153 erro
star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.3230909
star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.4952744
star_RR <- star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.08789952
star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.2417556
star(seas_adj_dif_ln_rcl[["RR" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.5553238


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["RR" ]], star_RR), out_sample_rcl[["RR"]]) 
# =======================================================

# =======================================================
# PI
star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.1139425
star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.6045927
star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.5205826
star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.7027872
star_PI <- star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.25401
star(seas_adj_dif_ln_rcl[["PI" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.9784113


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["PI" ]], star_PI), out_sample_rcl[["PI"]]) 
# =======================================================

# =======================================================
# PB
star_PB <- star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 1, thDelay = 0) # 0.001290519
star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 2, thDelay = 0) # 0.09228932
star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 3, thDelay = 0) # 0.3386051
star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 2, thDelay = 1) # 0.1195073
star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 3, thDelay = 1) # 0.1352686
star(seas_adj_dif_ln_rcl[["PB" ]]$seas_adj_ts, m = 3, thDelay = 2) # 0.06560986


accuracy(forecast_star_state(seas_adj_dif_ln_rcl[["PB" ]], star_PB), out_sample_rcl[["PB"]]) 
# =======================================================
