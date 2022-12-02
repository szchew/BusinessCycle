clear
frame create local_curr_debt
frame create fx_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8b country\Local currency denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdcb_local_curr_usd_billion    //edit                                                                                           
label variable hdcb_local_curr_usd_billion "Household Debt Currency Breakdown - Local(USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8b country\Local currency denominated debt, USD value in billion.dta" //edit

frame change fx_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8b country\FX denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdcb_fx_curr_usd_billion   // edit
label variable hdcb_fx_curr_usd_billion "Household Debt Currency Breakdown - FX(USD billion)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8b country\FX denominated debt, USD value in billion.dta"   // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\8b country\Total debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty hdcb_total_debt_usd_billion // edit
label variable hdcb_total_debt_usd_billion "Total debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\8b country\Total debt, USD value in billion.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\8b country" // edit
merge m:1 date country using "FX denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Total debt, USD value in billion"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\8b country\8b country.dta" // edit