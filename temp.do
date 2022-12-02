clear
frame create local
frame create usd
frame create financial_sector
frame rename default household_debt



foreach var in "5a country\Local currency denominated debt, % of GDP" "5a country\Local USD denominated debt, % of GDP" "5a country\Local EURO denominated debt, % of GDP" "5a country\Local Other denominated debt, % of GDP" "5a country\Local Total debt, % of GDP" {
	local str="C:\Users\chews\Downloads\Global Debt Monitor\" + `var' + ".xlsx"
	import excel "`str'", sheet("Sheet1") firstrow                 // edit
	ren * cty*
	reshape long cty, i(date) j(country) string
	rename cty local_curr  
	label variable local_curr "Non-Financial Corporate Debt-to-GDP - Local currency denominated debt(% of GDP)"                 //edit
	save "C:\Users\chews\Downloads\Global Debt Monitor\`section' country\`section' local.dta"                                                       //edit
}








	
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\Local currency denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty local_curr                                                                                                //edit
label variable local_curr "Non-Financial Corporate Debt-to-GDP - Local currency denominated debt(% of GDP)"                                                                 //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\5a_local.dta"                                                       //edit

frame change 
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\USD denominated debt, % of GDP.xlsx", sheet("Sheet1") firstrow                     // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty government_usd_billion                                                                                                       // edit
label variable  "Government(USD billion)"                                                                         // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\5a_usd.dta"                                                           // edit

frame change financial_sector
import excel "C:\Users\chews\Downloads\Global Debt Monitor\5a country\5a financial corporates.xlsx", sheet("Sheet1") firstrow               // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty financial_corporates_usd_billion                                                                                                 // edit
label variable financial_corporates_usd_billion "Financial Corporates(USD billion)"                                                             // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\.dta"                                                     // edit

frame change non_financial_corporates
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3b country\3b non-financial corporates.xlsx", sheet("Sheet1") firstrow       // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty n_fin_cor_usd_billion                                                                                                        // edit
label variable n_fin_cor_usd_billion "Non-Financial Corporates(USD billion)"                                                            // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\5a country\non-financial corporates.dta"                                             // edit

frame change household_debt
cd "C:\Users\chews\Downloads\Global Debt Monitor\3b country"                                                                            // edit
merge m:1 date country using "financial corporates"
drop _merge
merge m:1 date country using government
drop _merge
merge m:1 date country using "non-financial corporates"
drop _merge

save "C:\Users\chews\Downloads\Global Debt Monitor\3b country\3b country.dta"                                                           // edit