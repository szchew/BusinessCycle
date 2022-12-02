clear
frames reset

import excel "C:\Users\chews\Downloads\Global Debt Monitor\4 global\Foreign Participation in Local Currency Government Bond Markets (% of total local currency denominated government bonds).xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(avg_f_part_local_bond_mkt) string
rename cty f_part_local_curr_bond  //edit                                                                                           
label variable f_part_local_curr_bond " Avg Foreign Part. in Local Curr Govt Bond(% of total local curr govt bonds)"          //edit

gen date2 = quarterly(substr(date, 2, .), "QY")
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\4 global\4 global.dta"   
                                     
