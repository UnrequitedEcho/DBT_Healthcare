select
    t.medical_condition as medical_condition,
    round(avg(date_diff(date(concat(dd.year, '-', dd.month, '-', dd.day)),
        date(concat(ad.year, '-', ad.month, '-', ad.day)), day)), 0) as average_treatment_time_in_days
from {{ref("stg_admissions_fct")}} a
    join {{ref("stg_dates_dim")}} ad on ad.id_date = a.id_admission_date
    join {{ref("stg_dates_dim")}} dd on dd.id_date = a.id_discharge_date
    join {{ref("stg_treatments_dim")}} t using(id_treatment)
group by medical_condition
order by average_treatment_time_in_days desc
