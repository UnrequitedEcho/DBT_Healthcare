-- Test if the room number is a positivie integer below 1000

select r.room_number
from {{ref("stg_rooms_dim")}} r
where r.room_number < 0 and r.room_number > 1000