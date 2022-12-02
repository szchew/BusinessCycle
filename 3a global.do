clear
frames reset
frame create em31_sec_agg_pct_gdp
frame rename default em31_sec_agg_usd_trillion

import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a global\EM-31 Sectoral Aggregates, USD trillion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(sector) string
rename cty em31_usd_trillion   //edit                                                                                           
label variable em31_usd_trillion "EM-31 Sectoral Aggregates(USD trillion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a global\EM-31 Sectoral Aggregates, USD trillion.dta"   
                                                    //edit
frame change em31_sec_agg_pct_gdp   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a global\EM-31 Sectoral Aggregates, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(sector) string
rename cty em31_pct_gdp   // edit
label variable em31_pct_gdp "Global sectoral debt(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a global\EM-31 Sectoral Aggregates, % of GDP.dta"   // edit

frame change  em31_sec_agg_usd_trillion //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\3a global" // edit
merge m:1 date sector using "EM-31 Sectoral Aggregates, % of GDP"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\3a global\3a global.dta" // edit