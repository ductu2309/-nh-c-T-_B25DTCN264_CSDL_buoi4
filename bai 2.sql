use LiveStreamingDB;


select * from studio
where studio_status = 'Available' and hourly_price > 20;
select creator_name , creator_phone from creator where creator_platform like 'tiktok';
select studio_id, studio_name, hourly_price from studio order by hourly_price desc;
select * from payment where payment_method = 'Credit Card' limit 3;
select creator_id, creator_name from creator limit 2 offset 2;
