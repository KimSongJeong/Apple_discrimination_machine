create table agri_data(
	cl_seq int not null auto_increment,
	cl_date datetime not null default now(),
	m_seq int,
	fruit_kind varchar(20),
	deep_seq int not null,
	primary key(cl_seq)
);


select * from agri_data;
						선별기 순번, 과일 품종, 학습모델 결과
insert into agri_data(m_seq, fruit_kind, deep_seq) values(2, 'fugi', 3);


select deep_seq, count(*) as cnt from agri_data group by deep_seq having cnt > 1;


select cl_date, deep_seq, count(*) as cnt from agri_data group by cl_date, deep_seq;


select * from questions;
select * from answers;
select * from classifications;

select fruit_kind,cl_result, count(*) as cnt from classifications where mb_id = 'test' and cl_date between '2021-11-01' and '2021-11-02'  group by fruit_kind, cl_result;
select m_id,fruit_kind,cl_result, count(*) as cnt from classifications where mb_id = 'test' and cl_date between '2021-11-01' and '2021-11-02'  group by m_id,fruit_kind,cl_result;

select fruit_kind,cl_result, count(*) as cnt from classifications where mb_id = 'test' and DATE(cl_date)= '2021-11-01' group by fruit_kind, cl_result;


select m_id, cl_date from (select m_id, cl_date, row_number() over(partition by m_id order by cl_date desc) as recent from classifications where mb_id = 'test') s where recent = 1