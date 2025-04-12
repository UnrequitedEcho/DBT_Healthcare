select
    d.name_doctor,
    count(distinct p.id_patient) as patient_count
from {{ref("stg_admissions_fct")}}
    join {{ref("stg_doctors_dim")}} d using(id_doctor)
    join {{ref("stg_patients_dim")}} p using(id_patient)
group by d.name_doctor
order by patient_count desc