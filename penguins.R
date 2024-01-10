library(dplyr)
library(palmerpenguins)

penguins <- palmerpenguins::penguins

# 2
penguins |> 
  filter(species == "Adelie" & 
           island %in% c("Biscoe", "Dream"))

# 3 

penguins |> 
  slice(10:20)

# 4 

penguins |> 
  arrange(island, desc(bill_length_mm))

# 5 

penguins |> 
  select(bill_length_mm, sex)

# 6

penguins |> 
  rename(bill_length = bill_length_mm,
         bill_depth = bill_depth_mm)


# 7 

penguins |> 
  mutate(ones = 1,
         bill_length = bill_length_mm / 10,
         bill_length_squared = bill_length^2) |> 
  select(ones, bill_length_mm, bill_length, bill_length_squared)

# 8

penguins |> 
  relocate(c(species, bill_length_mm), .before = sex)


# 9

penguins |> 
  group_by(island) |> 
  summarize(bill_depth_mean = mean(bill_depth_mm, na.rm = TRUE))


# 10 

penguins |> 
  group_by(island) |> 
  summarize(count = n(),
            bill_depth_mean = mean(bill_depth_mm, na.rm = TRUE),
            flipper_length_median = median(flipper_length_mm, na.rm = TRUE),
            body_mass_sd = sd(body_mass_g, na.rm = TRUE),
            share_female = mean(sex == "female", na.rm = TRUE))