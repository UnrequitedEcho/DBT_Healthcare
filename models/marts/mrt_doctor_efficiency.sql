select
    d.name_doctor,
    count(distinct p.id_patient) as patients_count,
    count(a.id_admission) as admissions_count
from {{ref("stg_admissions_fct")}} a
    join {{ref("stg_doctors_dim")}} d using(id_doctor)
    join {{ref("stg_patients_dim")}} p using(id_patient)
group by d.name_doctor
order by patients_count desc, admissions_count desc