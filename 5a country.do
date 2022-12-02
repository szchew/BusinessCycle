clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Local currency denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdtg_local_curr_pct_gdp    //edit                                                                                           
label variable nfcdtg_local_curr_pct_gdp "Non-Financial Corporate Debt-to-GDP - Local curr debt(% of GDP)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Local currency denominated debt, % of GDP.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\USD denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdtg_usd_curr_pct_gdp   // edit
label variable nfcdtg_usd_curr_pct_gdp "Non-Financial Corporate Debt-to-GDP - USD debt(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\USD denominated debt, % of GDP.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\EURO denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdtg_euro_curr_pct_gdp  // edit
label variable nfcdtg_euro_curr_pct_gdp "Non-Financial Corporate Debt-to-GDP - Euro debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\EURO denominated debt, % of GDP.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Other denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdtg_other_curr_pct_gdp // edit
label variable nfcdtg_other_curr_pct_gdp "Non-Financial Corporate Debt-to-GDP - Other curr debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Other denominated debt, % of GDP.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Total debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdtg_total_debt_per_gdp // edit
label variable nfcdtg_total_debt_per_gdp "Total Debt(% of GDP)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Total debt, % of GDP.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\5a country" // edit
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

save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\5a country.dta" // edit