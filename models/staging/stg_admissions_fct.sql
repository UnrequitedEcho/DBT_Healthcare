

select
    row_number() over() as id_admission,
    (
        select d.id_date
        from {{ref("stg_dates_dim")}} d 
        where date(concat(d.year, '-', d.month, '-', d.day)) = date(r.Date_of_Admission)
    ) as id_admission_date,
    (
        select d.id_date
        from {{ref("stg_dates_dim")}} d 
        where date(concat(d.year, '-', d.month, '-', d.day)) = date(r.Discharge_Date)
    ) as id_discharge_date,
    (
        select ro.id_room
        from {{ref("stg_rooms_dim")}} ro
            join {{ref("stg_hospitals_dim")}} h using(id_hospital)
        where ro.room_number = r.Room_Number 
            and h.name_hospital = r.Hospital
    ) as id_room,
    (
        select p.id_patient
        from {{ref("stg_patients_dim")}} p
        where p.name_patient = r.Name
            and p.age = r.Age
            and p.gender = r.Gender
            and p.blood_type = r.Blood_Type
    ) as id_patient,
    (
        select d.id_doctor
        from {{ref("stg_doctors_dim")}} d
        where d.name_doctor = r.Doctor
    ) as id_doctor,
    (
        select t.id_treatment
        from {{ref("stg_treatments_dim")}} t
        where t.medical_condition = r.Medical_Condition
            and t.test_result = r.Test_Results
            and t.medication = r.Medication
    ) as id_treatment,
    (
        select adt.id_admission_type
        from {{ref("stg_admission_types_dim")}} adt
        where adt.admission_type = r.Admission_Type
    ) as id_admission_type,
    round(r.Billing_Amount, 2) as billing_amount
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r