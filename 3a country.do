clear
frame create non_financial_corporates
frame create government
frame create financial_sector
frame rename default household_debt
	
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a household debt.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty household_debt_pct_gdp                                                                                                  //edit
label variable household_debt_pct_gdp "Household Debt(% of GDP)"                                                                 //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a country\household debt.dta"                                                       //edit

frame change government
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a government.xlsx", sheet("Sheet1") firstrow                     // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty government_pct_gdp                                                                                                    // edit
label variable government_pct_gdp "Government(% of GDP)"                                                                         // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a country\government.dta"                                                           // edit

frame change financial_sector
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a financial corporates.xlsx", sheet("Sheet1") firstrow               // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty financial_corporates_pct_gdp                                                                                                 // edit
label variable financial_corporates_pct_gdp "Financial Corporates(% of GDP)"                                                             // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a country\financial corporates.dta"                                                     // edit

frame change non_financial_corporates
import excel "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a non-financial corporates.xlsx", sheet("Sheet1") firstrow       // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty n_fin_cor_pct_gdp                                                                                                        // edit
label variable n_fin_cor_pct_gdp "Non-Financial Corporates(% of GDP)"                                                            // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\3a country\non-financial corporates.dta"                                             // edit

frame change household_debt
cd "C:\Users\chews\Downloads\Global Debt Monitor\3a country"                                                                            // edit
merge m:1 date country using "financial corporates"
drop _merge
merge m:1 date country using government
drop _merge
merge m:1 date country using "non-financial corporates"
drop _merge

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a country.dta"                                                           // edit