select
    row_number() over() as id_treatment,
    initcap(r.Medical_Condition) as medical_condition,
    initcap(r.Test_Results) as test_result,
    initcap(r.Medication) as medication
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
group by medical_condition, test_result, medication
order by id_treatment