clear
frame reset
frame create local_curr_debt
frame create fx_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8a country\Local currency denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdtg_local_curr_per_gdp    //edit                                                                                           
label variable hdtg_local_curr_per_gdp "Household Debt-to-GDP - Local curr(% of GDP)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8a country\Local currency denominated debt, % of GDP.dta"                                                       //edit
frame change fx_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8a country\FX denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdtg_fx_curr_per_gdp   // edit
label variable hdtg_fx_curr_per_gdp "Household Debt-to-GDP - FX(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8a country\FX denominated debt, % of GDP.dta"   // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8a country\Total debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdtg_total_debt_per_gdp // edit
label variable hdtg_total_debt_per_gdp "Total debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8a country\Total debt, % of GDP.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\8a country" // edit
merge m:1 date country using "FX denominated debt, % of GDP"
drop _merge
merge m:1 date country using "Total debt, % of GDP"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\8a country\8a country.dta" // edit