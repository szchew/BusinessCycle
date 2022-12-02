clear
//Country level data
use "C:\Users\chews\Downloads\Global Debt Monitor\2a country\2a country.dta"
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\2b country\2b country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\3a country\3a country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\4 country\4 country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\5a country\5a country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\5b country\5b country.dta"
drop _merge

merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\6a country\6a country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\6b country\6b country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\7a country\7a country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\7b country\7b country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\8a country\8a country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\8b country\8b country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\12 country\12 country.dta"
drop _merge
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\13 country\13 country.dta"
drop _merge
merge n:1 country using "C:\Users\chews\Downloads\Global Debt Monitor\MM EM.dta"
drop _merge
merge n:1 date market_type using "C:\Users\chews\Downloads\Global Debt Monitor\11 country\11 country.dta"
drop _merge



//Global Level data
clear
use "C:\Users\chews\Downloads\Global Debt Monitor\2a global\2a global.dta"
merge 1:1 date sector using "C:\Users\chews\Downloads\Global Debt Monitor\3a global\3a global.dta"
drop _merge
merge n:1 date using "C:\Users\chews\Downloads\Global Debt Monitor\4 global\4 global.dta"
drop _merge
drop avg_f_part_local_bond_mkt

//Bond and Loan Redemption Country Level data
clear
use "C:\Users\chews\Downloads\Global Debt Monitor\9 country\9 country.dta"
merge 1:1 date country using "C:\Users\chews\Downloads\Global Debt Monitor\10 country\10 country.dta"
drop _merge

//Bond and Loan Redemption Global Level data
clear
use "C:\Users\chews\Downloads\Global Debt Monitor\9 global\9 global.dta"
merge 1:1 date using "C:\Users\chews\Downloads\Global Debt Monitor\10 global\10 global.dta"
drop _merge


