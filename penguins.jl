using TidierData
using PalmerPenguins

penguins = DataFrame(PalmerPenguins.load())
ENV["LINES"] = 19



@chain penguins begin
  @filter(species == "Adelie" &&
            island in ("Biscoe", "Dream"))
end


@chain penguins begin
  @slice(10:20)
end

@chain penguins begin
    @arrange(island, desc(bill_length_mm))
  end


@chain penguins begin
    @select(bill_length_mm, sex)
  end

@chain penguins begin
    @rename(bill_length = bill_length_mm,
            bill_depth = bill_depth_mm)
  end


@chain penguins begin
    @mutate(ones = 1,
            bill_length = bill_length_mm / 10)
    @mutate(bill_length_squared = bill_length^2)
    @select(ones, bill_length_mm, bill_length, bill_length_squared)
  end

@chain penguins begin
  @select(island, bill_depth_mm, flipper_length_mm, body_mass_g, 
          species, bill_length_mm, sex)
end

@chain penguins begin
  @group_by(island) 
  @summarize(bill_depth_mean = mean(skipmissing(bill_depth_mm)))
  @arrange(island)
end

@chain penguins begin
  @group_by(island) 
  @summarize(count = n(),
             bill_depth_mean = mean(skipmissing(bill_depth_mm)),
             flipper_length_median = median(skipmissing(flipper_length_mm)),
             body_mass_sd = std(skipmissing(body_mass_g)),
             share_female = mean(skipmissing(sex == "female")))
  @arrange(island)
end