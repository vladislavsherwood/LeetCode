Select request_at as Day, round(sum(case when status = "completed" then 0 else am end)/sum(am),2) as "Cancellation Rate"
  From
    (Select request_at, status, count(status) as am
    From Trips t
    Where client_id not in (Select users_id From Users Where banned = "Yes") AND
    driver_id not in (Select users_id From Users Where banned = "Yes")
    Group by request_at, status) as a
  Group by Day
Having day <= "2013-10-03" and day >= "2013-10-01"
