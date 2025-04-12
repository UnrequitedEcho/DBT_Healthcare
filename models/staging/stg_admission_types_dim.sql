select
    row_number() over() as id_admission_type,
    initcap(r.Admission_Type) as admission_type
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
group by admission_type
order by id_admission_type