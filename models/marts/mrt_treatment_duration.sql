with treatment_duration as 
(
    select
        date_diff(date(concat(dd.year, '-', dd.month, '-', dd.day)),
            date(concat(ad.year, '-', ad.month, '-', ad.day)), day) as duration
    from {{ref("stg_admissions_fct")}} a
        join {{ref("stg_dates_dim")}} ad on ad.id_date = a.id_admission_date
        join {{ref("stg_dates_dim")}} dd on dd.id_date = a.id_discharge_date
)
select
    concat(floor(avg(td.duration)), ' days ', round((avg(td.duration)-floor(avg(td.duration)))*24, 0), ' hours') as average,
    APPROX_QUANTILES(td.duration, 4) as quartiles
from treatment_duration td