//Rename the frame and Reshape Household Debt(% of GDP) data under Sheet 2a of Global Debt Database"
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty household_debt_pct_of_gdp 
label variable household_debt_pct_of_gdp "Household Debt(% of GDP)"
frame rename default Household_debt

//Create extra frame and reshape Financial Sector Data(% of GDP) under Sheet 2a of Global Debt Database
frame create government
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty government_pct_of_gdp
label variable government_pct_of_gdp "Government(% of GDP)"

//Create extra frame and reshape Government Data(% of GDP) under Sheet 2a of Global Debt Database
frame create financial
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty financial_sector_pct_of_gdp
label variable financial_sector_pct_of_gdp "Financial Sector(% of GDP)"

//Create extra frame and reshape Non-Financial Corporates Data(% of GDP) under Sheet 2a of Global Debt Database
frame create non_financial_corporates
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty n_fin_cor_pct_of_gdp
label variable n_fin_cor_pct_of_gdp "Non-Financial Corporates(% of GDP)"

//Merge all frames together
merge m:1 date country using financial
merge m:1 date country using government
merge m:1 date country using non_financial_corporates
