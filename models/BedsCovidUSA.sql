select ic.state, ic.date, ic.staffed_adult_icu_beds_occupied, 
im.inpatient_beds,im.inpatient_beds_used, round(ic.staffed_adult_icu_beds_occupied / im.inpatient_beds_used,3) as forhold
, de.tot_pop, round(1000 * im.inpatient_beds_used / de.tot_pop,3)  as forhold2
from COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.CDC_INPATIENT_BEDS_ICU_ALL ic
inner join COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.CDC_REPORTED_PATIENT_IMPACT im
on ic.date = im.date and ic.state = im.state
inner join (select distinct state, sum(total_population) as tot_pop from COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.DEMOGRAPHICS group by state ) de
on ic.state = de.state
order by ic.date, ic.state

