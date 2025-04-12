select 
    row_number() over() as id_insurance_provider,
    r.Insurance_Provider as name_insurance_provider
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
group by name_insurance_provider
order by id_insurance_provider