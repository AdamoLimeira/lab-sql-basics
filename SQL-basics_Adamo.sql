use bank;

select * from client;
select client_id from client where district_id = 1 limit 5;

select max(client_id) from client where district_id = 72;

select * from loan;
select amount from loan order by amount asc limit 3;

select distinct status from loan order by status asc;

select loan_id from loan order by payments desc limit 1;

select account_id, amount from loan order by account_id asc limit 5;

select account_id from loan where duration = 60 order by amount asc limit 5;

select distinct k_symbol from bank.order;

select order_id from bank.order where account_id = 34;

select distinct account_id from bank.order where order_id between 29540 and 29560;

select * from bank.order;
select amount from bank.order where account_to = 30067122;

select * from trans;
select trans_id, date, type, amount from trans where account_id = 793 order by date desc limit 10;

select * from client;
select count(*), district_id from client group by district_id having district_id < 10 order by district_id asc;
select count(*), district_id from client where district_id < 10 group by district_id order by district_id asc;

select * from card;
select count(*), type from card group by type order by count(*) desc;

select * from loan;
select account_id, sum(amount) from loan group by account_id order by sum(amount) desc;

select count(loan_id), date from loan where date < 930907 group by date order by date desc;

select date, duration, count(loan_id) from loan where date regexp "^9712" group by date, duration order by date asc, duration asc;

select account_id, type, sum(amount) as total_amount from trans where account_id = 396 group by type order by type asc; 

select account_id, floor(sum(amount)) as total_amount, 
 case
   when type = 'VYDAJ' then 'Outgoing'
   when type = 'PRIJEM' then 'Incoming'
   end as 'transaction_type'
from trans where account_id = 396 group by type order by type asc; 

select * from trans;    
SELECT account_id, 
    floor(sum(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END)) AS Incoming,
    floor(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) AS Outgoing,
    floor(sum(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END))-floor(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) as difference
FROM trans where account_id = 396;


SELECT account_id, 
    floor(sum(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END))-floor(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END)) as difference
FROM trans group by account_id order by difference desc limit 10; 