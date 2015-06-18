# =======================================================
# implementação STAR manual todos estados

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


star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts) # erro
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["AL"]]$seas_adj_ts)
