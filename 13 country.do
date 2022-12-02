clear
frames reset
import excel "C:\Users\chews\Downloads\Global Debt Monitor\13 country\Debt of State-Owned Enterprises (SOEs).xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty debt_soe  //edit                                                                                           
label variable debt_soe "Debt of State-Owned Enterprises (SOEs) in percentage"          //edit

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\13 country\13 country.dta"   
