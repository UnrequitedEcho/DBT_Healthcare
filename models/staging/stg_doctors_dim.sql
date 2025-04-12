select
    row_number() over() as id_doctor,
    initcap(r.Doctor) as name_doctor
from {{source("Raw_Anonymized","Healthcare_Raw_Anonymized")}} r
group by name_doctor
order by id_doctor