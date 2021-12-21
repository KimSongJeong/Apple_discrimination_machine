select * from members

alter table members members modify mb_types number(1) default 1

insert into members values('admin','admin','관리자','광주 남구 cgi','010-123-1234',now(),'0')

<<<<<<< HEAD

create table cls_test(
	cl_seq int not null auto_increment,
	cl_date datetime not null default now(),
	m_seq int(12) not null,
	fruit_kind varchar(20) not null,
	deep_seq int(12) not null,
	deep_result varchar(100) not null,
	primary key(cl_seq)
);


alter table deeplearnings modify deep_seq

insert into deeplearnings values(1,'apple','apple solution')

alter table cls_test add column mb_id varchar(30) not null

create table ai_data(
	img_seq int not null auto_increment,
	img_path varchar(500) not null,
	file_name varchar(100) not null,
	mb_id varchar(20) not null,
	m_id int,
	primary key(img_seq),
	foreign key (mb_id) references members(mb_id),
	foreign key (m_id) references machines(m_id)
)
=======
select * from machines

select * from questions
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-2/2st_stardewVilage.git


select * from machines where mb_id = 'test'

select * from machines
select * from questions

<<<<<<< HEAD
select * from classifications where mb_id = 'test' order by cl_date desc limit 20


select cl_result, count(*) as cnt from classifications where mb_id = 'test' and cl_date between '2021-11-03' and '2021-11-05'  group by cl_result order by cl_result

select m_id,fruit_kind, cl_date from (select m_id,fruit_kind, cl_date, row_number() over(partition by m_id order by cl_date desc) as recent_date from classifications where mb_id ='test') s where recent_date = 1

select m_id, fruit_kind, DATE(cl_date) as cl_date from (select m_id, fruit_kind, cl_date, row_number() over(partition by m_id order by cl_date desc) as recent_date from classifications where mb_id = 'test') s where recent_date = 1 



select cl_result, count(*) as cnt from classifications where mb_id = 'test' and cl_date between '2021-11-04' and '2021-11-05'  group by cl_result order by cl_result





insert into chart(times,result,kind,cnt,rat) (
	with C as
(
   select ('2021-11-06 01') as times , cl_result as result ,fruit_kind as kind, count(*) as cnt ,count(*)/sum(count(*)) over() * 100 as rat from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 02'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 02' and '2021-11-06 03' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 03'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 03' and '2021-11-06 04' group by fruit_kind, cl_result
    union all
   select ('2021-11-06 04'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 04' and '2021-11-06 05' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 05'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 05' and '2021-11-06 06' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 06'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 06' and '2021-11-06 07' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 07'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 07' and '2021-11-06 08' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 09'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 09' and '2021-11-06 10' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 10'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 10' and '2021-11-06 11' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 11'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 11' and '2021-11-06 12' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 12'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 12' and '2021-11-06 13' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 13'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 13' and '2021-11-06 14' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 14'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 14' and '2021-11-06 15' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 15'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 15' and '2021-11-06 16' group by fruit_kind, cl_result 
	union all
   select ('2021-11-06 16'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 16' and '2021-11-06 17' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 17'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 17' and '2021-11-06 18' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 18'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 18' and '2021-11-06 19' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 19'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 19' and '2021-11-06 20' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 20'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 20' and '2021-11-06 21' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 21'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 21' and '2021-11-06 22' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 22'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 22' and '2021-11-06 23' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 23'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 23' and '2021-11-07 00' group by fruit_kind, cl_result 
   
) 
select * from C where result = 'acceptance'
)

select * from chart
select * from chart order by kind





insert into chart(times,result,kind,cnt,rat) values ( '2021-11-06 01', acceptance yang-gwang 1465 41.7141
)






insert into chart(times,result,kind,cnt,rat) (
	select  cl_result, fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 16' and '2021-11-06 17' group by fruit_kind, cl_result 
)

delete from machines where m_id = 4


select * from machines


select * from chart











with C as
(
   select ('2021-11-06 01') as times , cl_result as result ,fruit_kind as kind, count(*) as cnt ,count(*)/sum(count(*)) over() * 100 as rat from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 02'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 02' and '2021-11-06 03' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 03'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 03' and '2021-11-06 04' group by fruit_kind, cl_result
    union all
   select ('2021-11-06 04'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 04' and '2021-11-06 05' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 05'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 05' and '2021-11-06 06' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 06'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 06' and '2021-11-06 07' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 07'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 07' and '2021-11-06 08' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 09'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 09' and '2021-11-06 10' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 10'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 10' and '2021-11-06 11' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 11'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 11' and '2021-11-06 12' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 12'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 12' and '2021-11-06 13' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 13'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 13' and '2021-11-06 14' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 14'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 14' and '2021-11-06 15' group by fruit_kind, cl_result 
    union all
   select ('2021-11-06 15'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 15' and '2021-11-06 16' group by fruit_kind, cl_result 
	union all
   select ('2021-11-06 16'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 16' and '2021-11-06 17' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 17'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 17' and '2021-11-06 18' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 18'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 18' and '2021-11-06 19' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 19'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 19' and '2021-11-06 20' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 20'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 20' and '2021-11-06 21' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 21'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 21' and '2021-11-06 22' group by fruit_kind, cl_result
   union all
   select ('2021-11-06 22'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 22' and '2021-11-06 23' group by fruit_kind, cl_result 
   union all
   select ('2021-11-06 23'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 24' and '2021-11-06 25' group by fruit_kind, cl_result 
   
) 
select * from C where result = 'acceptance'













create table chart(idx int autoincrement)





insert into chart values(
	select Hour('2021-11-06 13'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 13' and '2021-11-06 14' group by fruit_kind, cl_result as
)


select()
select Hour('2021-11-06 13'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-06 13' and '2021-11-06 14' group by fruit_kind, cl_result







update classifications set cl_date = '2021-11-09 08:01:00' where cl_date between '2021-11-08' and '2021-11-09'




=======
UPDATE classifications SET cl_date = concat('2021-11-06 13', time(cl_date)) 

UPDATE classifications SET cl_date = '2021-11-06 08:01:00' where cl_seq between 6001 and 6200;
UPDATE classifications SET cl_date = '2021-11-06 09:01:00' where cl_seq between 6201 and 6350;
UPDATE classifications SET cl_date = '2021-11-06 10:01:00' where cl_seq between 6351 and 6600;
UPDATE classifications SET cl_date = '2021-11-06 11:01:00' where cl_seq between 6601 and 6888;
UPDATE classifications SET cl_date = '2021-11-06 12:01:00' where cl_seq between 6889 and 7000;
UPDATE classifications SET cl_date = '2021-11-06 13:01:00' where cl_seq between 7001 and 7100;
UPDATE classifications SET cl_date = '2021-11-06 14:01:00' where cl_seq between 7101 and 7333;
UPDATE classifications SET cl_date = '2021-11-06 15:01:00' where cl_seq between 7334 and 7500;
UPDATE classifications SET cl_date = '2021-11-06 16:01:00' where cl_seq between 7501 and 7777;
UPDATE classifications SET cl_date = '2021-11-06 17:01:00' where cl_seq between 7778 and 7915;
UPDATE classifications SET cl_date = '2021-11-06 18:01:00' where cl_seq between 6201 and 7915;


select cl_seq, cl_date,cl_result from classifications where cl_date like '2021-11-06%'

delete from classifications

ALTER TABLE classifications AUTO_INCREMENT=1;


select m_id , cl_date , recent
from (
	select c.*,
			(CASE @m_ids when c.m_id then @ @rownum :=rownum + 1 ElSE @rownum := 1 END) recent,
			(@m_ids :=c.m_id) m_ids
	from emp c, (select @m_ids :='',@rownum := 0 from dual) b
	order by a.cl_date, desc
) c;


select m_id, cl_date from classifications order by cl_date desc where m_id = 1


select m_id, cl_date, @rankt := @rank +1 as ranking
from classicifations, (select @rank := 0) 
order by cl_date desc

select *
from(
select *
from classifications
where (m_id,cl_date) in (
	select m_id, max(cl_date) as cl_date
	from classifications group by m_id
	)
	order by cl_date desc
) t
group by t.m_id


/** 선별기별 최신 분류 날짜 가져오기 **/

select m_id, cl_date
from
	(select m_id, cl_date,
	row_number() over(partition by m_id order by cl_date desc) as recent
	from classifications
	where mb_id = 'test') s
where recent = 1


select Hour('2021-11-05 01'), cl_result,fruit_kind, count(*) from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result 



with test_chart as
(
	select cl_result,fruit_kind, count(*) from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result
	union all
	select cl_result,fruit_kind, count(*) from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result
)



select * from
(
	select 1 as '월', '월' as '요일'  union
	select 2 ,'화'
	
) as b

select * from
(
	select 1,2,3 union
	select 2,3,4 
) as b


select * from
(
	select Hour('2021-11-05 01') as times , cl_result as result ,fruit_kind as kind, count(*) as cnt from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result 
	union
	select Hour('2021-11-05 02'), cl_result,fruit_kind, count(*) from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result

) as b order by b.kind , b.times, b.result

with C as
(
	select Hour('2021-11-05 01') as times , cl_result as result ,fruit_kind as kind, count(*) as cnt from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result
	union all
	select Hour('2021-11-05 02'), cl_result,fruit_kind, count(*) from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result
) c
select kind, ratio_to_report() over (partition by )
from c

with C as
(
	select Hour('2021-11-05 01') as times , cl_result as result ,fruit_kind as kind, count(*) as cnt ,count(*)/sum(count(*)) over() * 100 as rat from classifications where cl_date between '2021-11-05 01' and '2021-11-05 02' group by fruit_kind, cl_result
	union all
	select Hour('2021-11-05 02'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result 
) 
select * 
from C
where result = 'acceptance'



select Hour('2021-11-05 02'), cl_result,fruit_kind, count(*), count(*)/sum(count(*)) over() * 100 rat_1 from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result 



	
select Hour('2021-11-05 02'), cl_result,fruit_kind, count(*),
	concat(round())
from classifications where cl_date between '2021-11-05 02' and '2021-11-05 03' group by fruit_kind, cl_result
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-2/2st_stardewVilage.git



select * from answers

select * from members where mb_id = ''

delete from members where mb_id = ''


SET foreign_key_checks = 0;