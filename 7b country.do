clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Local currency denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdcb_local_curr_usd_billon    //edit                                                                                           
label variable gdcb_local_curr_usd_billon "Government Debt Currency Breakdown - Local curr(USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Local currency denominated debt, USD value in billion.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7b country\USD denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdcb_usd_curr_usd_billon   // edit
label variable gdcb_usd_curr_usd_billon "Government Debt Currency Breakdown - USD(USD billion)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\USD denominated debt, USD value in billion.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7b country\EURO denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdcb_euro_curr_usd_billon  // edit
label variable gdcb_euro_curr_usd_billon "Government Debt Currency Breakdown - Euro(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\EURO denominated debt, USD value in billion.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Other, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdcb_other_curr_usd_billon // edit
label variable gdcb_other_curr_usd_billon "Government Debt Currency Breakdown - Other curr(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Other denominated debt, USD value in billion.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Total Gov debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gdcb_total_debt_usd_billon // edit
label variable gdcb_total_debt_usd_billon "Total Gov debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\Total Gov debt, USD value in billion.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\7b country" // edit
merge m:1 date country using "USD denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "EURO denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Other denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Total Gov debt, USD value in billion"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\7b country\7b country.dta" // edit