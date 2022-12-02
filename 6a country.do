clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Local currency denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdtg_local_curr    //edit                                                                                           
label variable fsdtg_local_curr "Financial Sector Debt-to-GDP - Local curr debt(% of GDP)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Local currency denominated debt, % of GDP.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6a country\USD denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdtg_usd_curr   // edit
label variable fsdtg_usd_curr "Financial Sector Debt-to-GDP - USD debt(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\USD denominated debt, % of GDP.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6a country\EURO denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdtg_euro_curr  // edit
label variable fsdtg_euro_curr "Financial Sector Debt-to-GDP - Euro debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\EURO denominated debt, % of GDP.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Other, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdtg_other_curr // edit
label variable fsdtg_other_curr "Financial Sector Debt-to-GDP - Other curr debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Other denominated debt, % of GDP.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Total debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdtg_total_debt_per_gdp // edit
label variable fsdtg_total_debt_per_gdp "Total Debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\Total debt, % of GDP.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\6a country" // edit
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

save "C:\Users\chews\Downloads\Global Debt Monitor\6a country\6a country.dta" // edit