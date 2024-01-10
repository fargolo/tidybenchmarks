
run_times <- numeric()
for(i in 1:100){
    start_time <- Sys.time()
    source("penguins.R")
    end_time <- Sys.time()
    run_times[i] <- end_time - start_time
}

summary(run_times)

