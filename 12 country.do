clear
frames reset
frame create household
frame create household_4_qtr_avg
frame create non_financial_corp_4_qtr_avg
frame rename default non_financial_corp

import excel "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap Non-financial corporates.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty credit_to_gdp_nf_corp_pct   //edit                                                                                           
label variable credit_to_gdp_nf_corp_pct "Credit-To-Gap % Points(Non-financial corporates)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap Non-financial corporates.dta"   
                                                    //edit
frame change household   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap household.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty credit_to_gdp_hsehold_pct   // edit
label variable credit_to_gdp_hsehold_pct "Credit-To-Gap % Points(Household)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-To-Gap % Points(Household).dta"   // edit

frame change non_financial_corp_4_qtr_avg
import excel "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap Non-financial corporates 4-quart avg.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty ctg_nfc_4_qtr_avg   //edit                                                                                           
label variable ctg_nfc_4_qtr_avg "Credit-To-Gap % Points(Non-financial corporates) 4 Qtr Avg"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap Non-financial corporates 4-quart avg.dta"  

frame change household_4_qtr_avg   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-to-gdp gap household 4-quart avg.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty ctg_hsehold_4_qtr_avg   // edit
label variable ctg_hsehold_4_qtr_avg "Credit-To-Gap % Points(Household) 4 Qtr Avg"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\12 country\credit-To-Gap % Points(Household) 4-quart avg.dta"   // edit





frame change non_financial_corp //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\12 country" // edit
merge m:1 date country using "credit-To-Gap % Points(Household)"
drop _merge
merge m:1 country using "credit-to-gdp gap Non-financial corporates 4-quart avg"
drop _merge
merge m:1 country using "credit-To-Gap % Points(Household) 4-quart avg"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\12 country\12 country.dta" // edit


