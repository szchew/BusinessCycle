clear
frame reset
frame create public_all
frame create public_usd
frame create non_fin_all
frame create non_fin_usd
frame create fin_all
frame create fin_usd
frame create sov_all
frame rename default sov_usd

frame change public_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\Public, financial and non-financial corporates All Currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_pfnc_all_cur //edit                                                                                           
label variable brp_pfnc_all_cur "Loan Maturity Profile - Public, financial and non-financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\Public, financial and non-financial corporates All Currencies.dta" //edit

frame change public_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\Public, financial and non-financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_pfnc_usd //edit                                                                                           
label variable brp_pfnc_usd "Loan Maturity Profile - Public, financial and non-financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\Public, financial and non-financial corporates USD.dta" //edit

frame change non_fin_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\non-financial corporates all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_nfc_all //edit                                                                                           
label variable brp_nfc_all "Loan Maturity Profile - non-financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\non-financial corporates all currencies.dta" //edit

frame change non_fin_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\non-financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_nfc_usd //edit                                                                                           
label variable brp_nfc_usd "Loan Maturity Profile - non-financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\non-financial corporates USD.dta" //edit

frame change fin_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\financial corporates all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_fc_all //edit                                                                                           
label variable brp_fc_all "Loan Maturity Profile - financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\financial corporates all currencies.dta" //edit

frame change fin_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_fc_usd //edit                                                                                           
label variable brp_fc_usd "Loan Maturity Profile - financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\financial corporates USD.dta" //edit



frame change sov_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\sovereign all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_sov_all //edit                                                                                           
label variable brp_sov_all "Loan Maturity Profile - sovereign, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\sovereign all currencies.dta" //edit

frame change sov_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 country\sovereign usd.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty brp_sov_usd //edit                                                                                           
label variable brp_sov_usd "Loan Maturity Profile - sovereign, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\sovereign USD.dta" //edit

frame change public_all
cd "C:\Users\chews\Downloads\Global Debt Monitor\9 country"
merge 1:1 date country using "Public, financial and non-financial corporates USD.dta"
drop _merge
merge 1:1 date country using "non-financial corporates all currencies.dta"
drop _merge
merge 1:1 date country using "non-financial corporates USD.dta"
drop _merge
merge 1:1 date country using "financial corporates all currencies.dta"
drop _merge
merge 1:1 date country using "financial corporates USD.dta"
drop _merge
merge 1:1 date country using "sovereign all currencies.dta"
drop _merge
merge 1:1 date country using "sovereign USD.dta"
drop _merge

gen date2 = qofd(date)
drop date
gen date = date2
drop date2
order date
tsset date, quarterly

save "C:\Users\chews\Downloads\Global Debt Monitor\9 country\9 country.dta" // edit



