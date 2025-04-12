select
    row_number() over() as id_hospital,
    initcap(trim(r.Hospital, ',')) as name_hospital
from 
    {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
group by name_hospital
order by id_hospital