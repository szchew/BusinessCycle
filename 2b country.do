clear
//Create extra frames for reshaping data and storing the different country level data
frames reset
frame create non_financial_corporates
frame create government
frame create financial_sector

//Import the Household Debt(USD billion) country level data and reshape it
import excel "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b household debt.xlsx", sheet("Sheet1") firstrow
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty household_debt_usd_billion 
label variable household_debt_usd_billion "Household Debt(USD billion)"
frame rename default household_debt
save "C:\Users\chews\Downloads\Global Debt Monitor\2b country\household_debt.dta"

//Change frame and import the Government(USD billion) country level data and reshape it
frame change government
import excel "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b government.xlsx", sheet("Sheet1") firstrow
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty government_usd_billion
label variable government_usd_billion "Government(USD billion)"
save "C:\Users\chews\Downloads\Global Debt Monitor\2b country\government.dta"

//Change frame and import the Financial Sector(USD billion) country level data and reshape it
frame change financial_sector
import excel "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b financial sector.xlsx", sheet("Sheet1") firstrow
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty financial_sector_usd_billion
label variable financial_sector_usd_billion "Financial Sector(USD billion)"
save "C:\Users\chews\Downloads\Global Debt Monitor\2b country\financial_sector.dta"

//Change frame and import the Non-Financial Corporates(USD billion) country level data and reshape it
frame change non_financial_corporates
import excel "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b non-financial corporates.xlsx", sheet("Sheet1") firstrow
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty n_fin_cor_usd_billion
label variable n_fin_cor_usd_billion "Non-Financial Corporates(USD billion)"
save "C:\Users\chews\Downloads\Global Debt Monitor\2b country\non_financial_corporates.dta"

//Change back to household_debt frame and use it as the main frame to merge the other frames together
frame change household_debt
cd "C:\Users\chews\Downloads\Global Debt Monitor\2b country"
merge m:1 date country using financial_sector
drop _merge
merge m:1 date country using government
drop _merge
merge m:1 date country using non_financial_corporates
drop _merge

//Generate quarterly date using tsset for easy merging with other data files later on
gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

//Save the results
save "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b country.dta"
