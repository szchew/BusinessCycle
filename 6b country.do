clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Local currency denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdcb_local_curr    //edit                                                                                           
label variable fsdcb_local_curr "Financial Sector Debt Currency Breakdown - Local curr(USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Local currency denominated debt, USD value in billion.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6b country\USD denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdcb_usd_curr   // edit
label variable fsdcb_usd_curr "Financial Sector Debt Currency Breakdown - USD(USD billion)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\USD denominated debt, USD value in billion.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6b country\EURO denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdcb_euro_curr  // edit
label variable fsdcb_euro_curr "Financial Sector Debt Currency Breakdown - Euro(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\EURO denominated debt, USD value in billion.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Other, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdcb_other_curr // edit
label variable fsdcb_other_curr "Financial Sector Debt Currency Breakdown - Other curr(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Other denominated debt, USD value in billion.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Total Fin corporate debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty fsdcb_total_debt_per_gdp // edit
label variable fsdcb_total_debt_per_gdp "Total Fin corporate debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\Total Fin corporate debt, USD value in billion.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\6b country" // edit
merge m:1 date country using "USD denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "EURO denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Other denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Total Fin corporate debt, USD value in billion"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\6b country\6b country.dta" // edit