clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Local currency denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdtg_local_curr_per_gdp    //edit                                                                                           
label variable gdtg_local_curr_per_gdp "Government Debt-to-GDP - Local curr(% of GDP)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Local currency denominated debt, % of GDP.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7a country\USD denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdtg_usd_curr_per_gdp   // edit
label variable gdtg_usd_curr_per_gdp "Government Debt-to-GDP - USD(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\USD denominated debt, % of GDP.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7a country\EURO denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdtg_euro_curr_per_gdp  // edit
label variable gdtg_euro_curr_per_gdp "Government Debt-to-GDP - Euro(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\EURO denominated debt, % of GDP.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Other, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdtg_other_curr_per_gdp // edit
label variable gdtg_other_curr_per_gdp "Government Debt-to-GDP - Other curr(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Other denominated debt, % of GDP.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Total debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdtg_total_debt_per_gdp // edit
label variable gdtg_total_debt_per_gdp "Total debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\Total debt, % of GDP.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\7a country" // edit
merge m:1 date country using "USD denominated debt, % of GDP"
drop _merge
merge m:1 date country using "EURO denominated debt, % of GDP"
drop _merge
merge m:1 date country using "Other denominated debt, % of GDP"
drop _merge
merge m:1 date country using "Total debt, % of GDP"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\7a country\7a country.dta" // edit