# Write your MySQL query statement below
Select *
From Stadium
Where id in (Select id From Stadium Where people >= 100)
and id-1 in (Select id From Stadium Where people >= 100)
and id-2 in (Select id From Stadium Where people >= 100)
or
id in (Select id From Stadium Where people >= 100)
and id+1 in (Select id From Stadium Where people >= 100)
and id+2 in (Select id From Stadium Where people >= 100)
or
id in (Select id From Stadium Where people >= 100)
and id+1 in (Select id From Stadium Where people >= 100)
and id-1 in (Select id From Stadium Where people >= 100)
order by visit_date