select ic.state, ic.date
, substring(to_char(ic.staffed_adult_icu_beds_occupied,'fm99999999'),1,1) as staf_b_occp, 
substring(to_char(im.inpatient_beds,'fm99999999'),1,1) as inp_beds
,substring(to_char(im.inpatient_beds_used,'fm99999999'),1,1) as inp_bused
--, round(ic.staffed_adult_icu_beds_occupied / im.inpatient_beds_used,3) as forhold
, substring(to_char(de.tot_pop,'fm99999999'),1,1) as pop
--, round(1000 * im.inpatient_beds_used / de.tot_pop,3)  as forhold2
, 1 as antall
from COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.CDC_INPATIENT_BEDS_ICU_ALL ic
inner join COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.CDC_REPORTED_PATIENT_IMPACT im
on ic.date = im.date and ic.state = im.state
inner join (select distinct state, sum(total_population) as tot_pop from COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.DEMOGRAPHICS group by state ) de
on ic.state = de.state
order by ic.date, ic.state

