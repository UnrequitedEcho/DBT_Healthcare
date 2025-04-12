-- Test if all billings are positive
select a.billing_amount
from {{ref("stg_admissions_fct")}} a
where a.billing_amount < 0