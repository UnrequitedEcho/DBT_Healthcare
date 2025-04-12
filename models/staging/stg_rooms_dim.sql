select
    row_number() over() as id_room,
    h.id_hospital as id_hospital,
    r.Room_Number as room_number
from {{source("Raw_Anonymized", "Healthcare_Raw_Anonymized")}} r
    join {{ref("stg_hospitals_dim")}} h on h.name_hospital = r.Hospital
group by id_hospital, room_number
order by id_room
 