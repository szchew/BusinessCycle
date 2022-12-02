clear
frame create local_curr_debt
frame create usd_curr_debt
frame create euro_curr_debt
frame create other_curr_debt
frame rename default total_debt

frame change local_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Local currency denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdcb_local_curr_usd_billion    //edit                                                                                           
label variable nfcdcb_local_curr_usd_billion "Non-Financial Corporate Debt Currency Breakdown - Local curr debt(USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Local currency denominated debt, USD value in billion.dta"                                                       //edit

frame change usd_curr_debt   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5b country\USD denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdcb_usd_curr_usd_billion   // edit
label variable nfcdcb_usd_curr_usd_billion "Non-Financial Corporate Debt Currency Breakdown - USD debt(USDbillion)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\USD denominated debt, USD value in billion.dta"   // edit

frame change euro_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5b country\EURO denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdcb_euro_curr_usd_billion  // edit
label variable nfcdcb_euro_curr_usd_billion "Non-Financial Corporate Debt Currency Breakdown - Euro debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\EURO denominated debt, USD value in billion.dta" // edit

frame change other_curr_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Other denominated debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdcb_other_curr_usd_billion // edit
label variable nfcdcb_other_curr_usd_billion "Non-Financial Corporate Debt Currency Breakdown - Other curr debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Other denominated debt, USD value in billion.dta" // edit

frame change total_debt //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Total NFC debt, USD value in billion.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty nfcdcb_t_nfc_usd_billion // edit
label variable nfcdcb_t_nfc_usd_billion "Total NFC debt(USD billion)" // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\Total NFC debt, USD value in billion.dta" // edit

frame change local_curr_debt //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\5b country" // edit
merge m:1 date country using "USD denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "EURO denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Other denominated debt, USD value in billion"
drop _merge
merge m:1 date country using "Total NFC debt, USD value in billion"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\5b country\5b country.dta" // edit