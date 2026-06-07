use LiveStreamingDB;

select 
	l.session_id, 
    c.creator_name, 
    s.studio_name, 
    l.duration_hours, 
    p.payment_amount
 from Creator c
 join LiveSession l on c.creator_id = l.creator_id
 join Studio s on s.studio_id  = l.studio_id
 join Payment p on p.session_id = l.session_id;
 
select s.*, COUNT(ls.session_id)
from Studio s
left join LiveSession ls on s.studio_id = ls.studio_id
group by s.studio_id, s.studio_name;

select payment_method, sum(payment_amount)
from Payment
group by payment_method;

select c.creator_name, count(l.session_id)
from Creator c
join LiveSession l ON c.creator_id = l.creator_id
group by  c.creator_id, c.creator_name
having count(l.session_id) >= 2; 

select * from Studio
where hourly_price > (select avg(hourly_price) from Studio);
select distinct c.creator_name, c.creator_email
from Creator c
join LiveSession l on c.creator_id = l.creator_id
join Studio s on l.studio_id = s.studio_id
where s.studio_name = 'Studio B';

select 
    l.session_id, 
    c.creator_name, 
    s.studio_name, 
    p.payment_method, 
    p.payment_amount
from LiveSession l
join Creator c on l.creator_id = c.creator_id
join Studio s on l.studio_id = s.studio_id
join Payment p on l.session_id = p.session_id;