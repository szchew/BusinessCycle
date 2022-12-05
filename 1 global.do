clear
//Create extra frames that can be used to merge data later on
frame create global_debt_pct_gdp
frame rename default global_debt_usd_trillion

//Import the Global sectoral debt data(USD trillion) and reshape it 
import excel "C:\Users\chews\Downloads\Global Debt Monitor\1 global\Global sectoral debt, USD trillion.xlsx", sheet("Sheet1") firstrow                 // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gsd_usd_trillion   //edit                                                                                           
label variable gsd_usd_trillion "Global sectoral debt(USD trillion)"          //edit
save "C:\Users\chews\Downloads\Global Debt Monitor\1 global\Global sectoral debt, USD trillion.dta"   
                                                    //edit
//Repeat as above with Global sectoral debt data(% of GDP)
frame change global_debt_pct_gdp   //edit
import excel "C:\Users\chews\Downloads\Global Debt Monitor\1 global\Global sectoral debt, % of GDP.xlsx", sheet("Sheet1") firstrow // edit
ren * cty*
rename ctyA date
reshape long cty, i(date) j(country) string
rename cty gsd_pct_gdp   // edit
label variable gsd_pct_gdp "Global sectoral debt(% of GDP)"  // edit
save "C:\Users\chews\Downloads\Global Debt Monitor\1 global\Global sectoral debt, % of GDP.dta"   // edit

//Merge the 2 frames
frame change global_debt_usd_trillion //edit
cd "C:\Users\chews\Downloads\Global Debt Monitor\1 global" // edit
merge m:1 date country using "Global sectoral debt, % of GDP"
drop _merge

//Save the data
save "C:\Users\chews\Downloads\Global Debt Monitor\1 global\1 global.dta" // edit
