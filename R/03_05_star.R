star_forecast <- lapply(states, function(x) {

    star_model <- switch(x, 

            ES = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0), # 3.016973e-06
            PA = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0), # 0.00891104
            PR = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.09846496
            SP = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 0), # 0.1166086
            SC = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 0), # 6.509905e-05
            RS = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 2.98982e-05
            AM = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 0), # 0.2706182
            MG = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.05214163
            RJ = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 0), # 0.2798834
            GO = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.04862132
            AC = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 0), # 0.02815918
            MS = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 2), # 0.002312457
            MT = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0), # 0.015059
            DF = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 0), # 2.349909e-06
            BA = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 2), # 0.231291
            RO = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.07292827
            TO = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 0), # 0.4245053
            CE = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0), # 0.2764939
            PE = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 2), # 0.0298946
            SE = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0), # 0.02368958
            MA = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.2029058
            RN = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 2), # 0.01900131
            AL = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 2), # 2.718117e-09
            AP = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.07224372
            RR = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 2, thDelay = 1), # 0.08789952
            PI = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 3, thDelay = 1), # 0.25401
            PB = star(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts, m = 1, thDelay = 0) # 0.001290519

        )

    forecast <- predict(star_model, n.ahead = 20)
    
    index <- ts(seas_adj_dif_ln_rcl[[x]]$figure, 
                start = start(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts), 
                end = end(forecast), 
                frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(seas_adj_dif_ln_rcl[[x]]$original_ts, 
                   start = end(seas_adj_dif_ln_rcl[[x]]$original_ts), 
                   end = end(seas_adj_dif_ln_rcl[[x]]$original_ts), 
                   frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]
    
    level_forecast <- ts(level_forecast, 
                         start = start(seas_unadjusted_forecast), 
                         end = end(seas_unadjusted_forecast), 
                         frequency = 12)
    
    return(level_forecast)


    })

names(star_forecast) <- states
star_forecast <- data.frame(do.call("cbind", star_forecast))
star_forecast[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
star_forecast[, "MES"] <- c(5:12, 1:12)
star_forecast[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
star_forecast[, "MODELO"] <- "star"
star_forecast <- melt(star_forecast, id.vars = c("MODELO", "ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "PREVISTO")

star_accuracy <- lapply(states, 
                      function(x) { 
                          
                          stats <- accuracy(star_forecast[star_forecast$ESTADO == x, "PREVISTO"], 
                                            out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

star_accuracy <- data.frame(do.call("rbind", star_accuracy))
star_accuracy[, "MODELO"] <- "star"
star_accuracy[, "ESTADO"] <- row.names(star_accuracy)
row.names(star_accuracy) <- NULL
