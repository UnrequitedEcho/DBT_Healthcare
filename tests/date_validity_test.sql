-- Tests that all dates are valid and that they are after the first admission and before now

with dates_as_date_type as (
  select cast(concat(d.year, '-', d.month, '-', d.day) as date) as ds
  from {{ref("stg_dates_dim")}} d
)
select *
from dates_as_date_type
where ds <= '2019-05-08'
    and ds >= current_date()
