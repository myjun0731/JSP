create table course_tbl_01(
id varchar2(5) not null primary key,
name varchar2(40),
credit number(6),
lecturer_idx number(6),
week number(2),
start_hour varchar2(4),
end_hour varchar2(4),
foreign key(lecturer_idx) references lecturer_tbl_01(lecturer_idx)
);

create table lecturer_tbl_01(
lecturer_idx number(6) not null primary key,
name varchar2(10),
majar varchar2(25)
);

insert into course_tbl_01 values('10001', '화면구현', 2, 1, 1, '0900', '1100');
insert into course_tbl_01 values('10002', '프로그래밍언어활용', 2, 2, 2, '0900', '1200');
insert into course_tbl_01 values('10003', '데이터베이스구현', 3, 4, 3, '0900', '1200');
insert into course_tbl_01 values('10004', '응용SW기초기술활용', 3, 4, 4, '0900', '1200');
insert into course_tbl_01 values('20001', '애플리케이션테스트', 2, 5, 1, '1300', '1600');
insert into course_tbl_01 values('20002', 'UI테스트', 3, 5, 2, '1500', '1800');
insert into course_tbl_01 values('20003', '애플리케이션배포', 3, 5, 3, '1330', '1630');
insert into course_tbl_01 values('30001', '데이터입출력', 2, 3, 4, '1330', '1530');
insert into course_tbl_01 values('30002', '서버프로그램구현', 3, 3, 5, '0900', '1200');
insert into course_tbl_01 values('40001', '스마트문화앱구현', 3, 2, 5, '1300', '1600');

insert into lecturer_tbl_01 values(1, '김교수', '알고리즘');
insert into lecturer_tbl_01 values(2, '이교수', '인공지능');
insert into lecturer_tbl_01 values(3, '박교수', '소프트웨어 공학');
insert into lecturer_tbl_01 values(4, '최교수', '알고리즘');
insert into lecturer_tbl_01 values(5, '피교수', '임베디드시스템');
insert into lecturer_tbl_01 values(6, '깡교수', '스마트멀티미디어');

<--delete->
delete from course_tbl_01 where id = ?;

<--List-->
select id, name, credit, lecturer_idx, week, substr(start_hour, 1, 2), substr(start_hour, 3, 2), substr(end_hour, 1, 2), substr(end_hour, 3, 2) 
from course_tbl_01;

<--Regi-->
select lecturer_idx, name from lecturer_tbl_01 group by lecturer_idx, name;

<--RegiConfirm-->
insert into course_tbl_01 values(?, ?, ?, ?, ?, ?, ?);

<--Update-->
select lecturer_idx from lecturer_tbl_01;

<--updateConfirm-->
update course_tbl_01 set name = ?, credit = ?, lecturer_idx = ?, week = ?, start_hour = ?, end_hour = ? where id = ?;