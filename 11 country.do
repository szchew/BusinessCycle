clear

import excel "C:\Users\chews\Downloads\Global Debt Monitor\11 country\Global Bond Markets USD Trillion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(market_type) string
rename cty global_bonds_market   //edit                                                                                           
label variable global_bonds_market "Global Bond Markets(USD Trillion)"          //edit

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\11 country\11 country.dta"   


