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
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\Public, financial and non-financial corporates All Currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_pfnc_all_cur //edit                                                                                           
label variable total_brp_pfnc_all_cur "Total Bond Maturity Profile - Public, financial and non-financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\Public, financial and non-financial corporates All Currencies.dta" //edit

frame change public_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\Public, financial and non-financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_pfnc_usd //edit                                                                                           
label variable total_brp_pfnc_usd "Total Bond Maturity Profile - Public, financial and non-financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\Public, financial and non-financial corporates USD.dta" //edit

frame change non_fin_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\non-financial corporates all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_nfc_all //edit                                                                                           
label variable total_brp_nfc_all "Total Bond Maturity Profile - non-financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\non-financial corporates all currencies.dta" //edit

frame change non_fin_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\non-financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_nfc_usd //edit                                                                                           
label variable total_brp_nfc_usd "Total Bond Maturity Profile - non-financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\non-financial corporates USD.dta" //edit

frame change fin_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\financial corporates all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_fc_all //edit                                                                                           
label variable total_brp_fc_all "Total Bond Maturity Profile - financial corporates, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\financial corporates all currencies.dta" //edit

frame change fin_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\financial corporates USD.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_fc_usd //edit                                                                                           
label variable total_brp_fc_usd "Total Bond Maturity Profile - financial corporates, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\financial corporates USD.dta" //edit



frame change sov_all //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\sovereign all currencies.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_sov_all //edit                                                                                           
label variable total_brp_sov_all "Total Bond Maturity Profile - sovereign, All curr (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\sovereign all currencies.dta" //edit

frame change sov_usd //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\9 global\sovereign usd.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty total_brp_sov_usd //edit                                                                                           
label variable total_brp_sov_usd "Total Bond Maturity Profile - sovereign, USD (USD billion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\sovereign USD.dta" //edit

frame change public_all
cd "C:\Users\chews\Downloads\Global Debt Monitor\9 global"
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

drop country

save "C:\Users\chews\Downloads\Global Debt Monitor\9 global\9 global.dta" // edit

