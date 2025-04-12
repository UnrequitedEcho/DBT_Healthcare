with all_dates as ( 
    select 
        extract(day from date(r.Date_of_Admission)) as day,
        extract(month from date(r.Date_of_Admission)) as month,
        extract(isoweek from date(r.Date_of_Admission)) as week_nb,
        extract(quarter from date(r.Date_of_Admission)) as quarter,
        extract(year from date(r.Date_of_Admission)) as year 
    from
        {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
    union distinct
    select 
        extract(day from date(r.Discharge_Date)) as day,
        extract(month from date(r.Discharge_Date)) as month,
        extract(isoweek from date(r.Discharge_Date)) as week_nb,
        extract(quarter from date(r.Discharge_Date)) as quarter,
        extract(year from date(r.Discharge_Date)) as year 
    from
        {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
)
select
    row_number() over() as id_date,
    day,
    month,
    week_nb,
    quarter,
    year
from all_dates
order by id_date