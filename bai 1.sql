create database LiveStreamingDB;
use LiveStreamingDB;

create table Creator (
    creator_id varchar(5) primary key,
    creator_name varchar(100) not null,
    creator_email varchar(100) not null unique,
    creator_phone varchar(15) not null unique,
    creator_platform varchar(50) not null
);

create table Studio (
    studio_id varchar(5) primary key,
    studio_name varchar(100) not null,
    studio_location varchar(100) not null,
    hourly_price decimal(10,2) not null,
    studio_status varchar(20) not null
);
 
CREATE TABLE LiveSession (
    session_id int auto_increment primary key,
    creator_id varchar(5) not null,
    studio_id varchar(5) not null,
    session_date date not null,
    duration_hours int not null,
    foreign key (creator_id) references Creator(creator_id),
    foreign key  (studio_id) references Studio(studio_id)
);

CREATE TABLE Payment (
    payment_id int auto_increment primary key,
    session_id int not NULL,
    payment_method varchar(50) not null,
    payment_amount decimal(10,2) not null,
    payment_date date not null,
    foreign key (session_id) references LiveSession(session_id)
);

insert into Creator (creator_id, creator_name, creator_email, creator_phone, creator_platform) values
('CR01', 'Nguyen Van A', 'a@live.com', '0901111111', 'Tiktok'),
('CR02', 'Tran Thi B', 'b@live.com', '0902222222', 'Youtube'),
('CR03', 'Le Minh C', 'c@live.com', '0903333333', 'Facebook'),
('CR04', 'Pham Thi D', 'd@live.com', '0904444444', 'Tiktok'),
('CR05', 'Vu Hoang E', 'e@live.com', '0905555555', 'Shopee live');


insert into Studio (studio_id, studio_name, studio_location, hourly_price, studio_status) values
('ST01', 'Studio A', 'Ha Noi', 20.00, 'Available'),
('ST02', 'Studio B', 'HCM', 25.00, 'Available'),
('ST03', 'Studio C', 'Danang', 30.00, 'Booked'),
('ST04', 'Studio D', 'Ha Noi', 22.00, 'Available'),
('ST05', 'Studio E', 'Can Tho', 18.00, 'Maintenance');

insert into LiveSession (session_id, creator_id, studio_id, session_date, duration_hours) values
(1, 'CR01', 'ST01', '2025-05-01', 3),
(2, 'CR02', 'ST02', '2025-05-02', 4),
(3, 'CR03', 'ST03', '2025-05-03', 2),
(4, 'CR01', 'ST04', '2025-05-04', 5),
(5, 'CR05', 'ST02', '2025-05-05', 1);

insert into Payment (payment_id, session_id, payment_method, payment_amount, payment_date) values
(1, 1, 'Cash', 60.00, '2025-05-01'),
(2, 2, 'Credit Card', 100.00, '2025-05-02'),
(3, 3, 'Bank Transfer', 60.00, '2025-05-03'),
(4, 4, 'Credit Card', 110.00, '2025-05-04'),
(5, 5, 'Cash', 25.00, '2025-05-05');

update Creator
set creator_platform = 'YouTube'
where creator_id = 'CR03';

select * from Creator where creator_id = 'CR03';
update Studio
set studio_status = 'Available' , hourly_price = hourly_price * 0.9
where studio_id = 'ST05';

select * from Studio where studio_id = 'ST05';
delete from Payment
where payment_method = 'Cash' 
and payment_date < '2025-05-03';

select * from Payment 



