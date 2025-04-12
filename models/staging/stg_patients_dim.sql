select
    row_number() over() as id_patient,
    r.Name as name_patient,
    r.Age as age,
    r.Gender as gender,
    r.Blood_Type as blood_type,
    ip.id_insurance_provider as id_insurance_provider
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
    join {{ref("stg_insurance_providers_dim")}} ip on r.Insurance_Provider = ip.name_insurance_provider
group by name_patient, age, gender, blood_type, id_insurance_provider
order by id_patient