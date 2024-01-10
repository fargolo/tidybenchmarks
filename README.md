# R::dplyr vs. Julia::TidierData.jl  

Sharing some benchmarks sketched out of curiosity for the Palmer penguins dataset.  
Just copy-pasted the original snippets available at https://blog.tidy-intelligence.com/posts/dplyr-vs-tidierdata/   

## Contributions  

This is a minimal test. Feel free to fork and improve.  

## Quick start  

Run `test.R` and `test.jl` to obtain results.  

Julia required packages are `BenchmarkTools.jl`, `TidierData.jl`, `PalmerPenguins.jl` (run `DataFrame(PalmerPenguins.load()` to download the data).  

R required packages are `dplyr` and `palmerpenguins`.  


## Results  

Specs: 11th Gen Intel® Core™ i7-11800H @ 2.30GHz × 16 / 16GB RAM.  

### R  

```
>summary(run_times) # 100 samples
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.01148 0.01184 0.01200 0.01459 0.01305 0.22571 

```

### Julia  

```
BenchmarkTools.Trial: 10 samples with 1 evaluation.
 Range (min … max):  512.539 ms … 571.741 ms  ┊ GC (min … max): 1.55% … 2.76%
 Time  (median):     516.707 ms               ┊ GC (median):    1.58%
 Time  (mean ± σ):   522.527 ms ±  17.773 ms  ┊ GC (mean ± σ):  2.00% ± 0.70%

```