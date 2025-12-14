CREATE TABLE admin_tbl (
    admin_id VARCHAR2(10) PRIMARY KEY,
    admin_name VARCHAR2(20),
    admin_password VARCHAR2(20),
    admin_role VARCHAR2(10)
);

CREATE TABLE teacher_tbl (
    teacher_number VARCHAR2(8) PRIMARY KEY,
    teacher_name VARCHAR2(20)
);


CREATE TABLE student_tbl (
    user_id VARCHAR2(10) PRIMARY KEY,
    user_name VARCHAR2(20),
    user_password VARCHAR2(20),
    user_role VARCHAR2(10),
    student_number VARCHAR2(8),
    teacher_number VARCHAR2(8)
);


create table member_tbl_01 (
id varchar2(5) not null primary key,
name varchar2(20),
gender varchar2(3)
);

create table score_tbl_01 (
id varchar2(5) not null primary key,
korean number(3),
english number(3),
math number(3),
history number(3)
);


INSERT INTO teacher_tbl (teacher_number, teacher_name) VALUES ('12345678', '홍길동');
INSERT INTO teacher_tbl (teacher_number, teacher_name) VALUES ('87654321', '김영희');


INSERT INTO student_tbl (user_id, user_name, user_password, user_role, student_number, teacher_number) 
VALUES ('10301', '권기현', 'student123', 'student', '10301234', NULL);


INSERT INTO student_tbl (user_id, user_name, user_password, user_role, student_number, teacher_number) 
VALUES ('admin001', '홍길동', 'teacher123', 'teacher', NULL, '12345678');






insert into member_tbl_01 values('10301', '권기현', '남');
insert into member_tbl_01 values('10302', '구지우', '여');
insert into member_tbl_01 values('10303', '권태준', '남');
insert into member_tbl_01 values('10304', '금기연', '여');
insert into member_tbl_01 values('10305', '김영진', '남');
insert into member_tbl_01 values('10401', '김주현', '남');
insert into member_tbl_01 values('10402', '김태민', '여');
insert into member_tbl_01 values('10403', '임수민', '여');
insert into member_tbl_01 values('10404', '남상도', '남');
insert into member_tbl_01 values('10405', '조은호', '여');

insert into score_tbl_01 values('10301', 70, 80, 75, 95);
insert into score_tbl_01 values('10302', 80, 73, 80, 85);
insert into score_tbl_01 values('10303', 45, 75, 45, 75);
insert into score_tbl_01 values('10304', 65, 73, 65, 65);
insert into score_tbl_01 values('10305', 90, 100, 68, 95);
insert into score_tbl_01 values('10401', 95, 75, 84, 60);
insert into score_tbl_01 values('10402', 65, 70, 50, 94);
insert into score_tbl_01 values('10403', 80, 60, 100, 80);
insert into score_tbl_01 values('10404', 64, 50, 40, 65);
insert into score_tbl_01 values('10405', 55, 70, 80, 75);





INSERT INTO admin_tbl (admin_id, admin_name, admin_password, admin_role) VALUES ('admin001', '홍길동', 'teacher123', 'teacher');
INSERT INTO admin_tbl (admin_id, admin_name, admin_password, admin_role) VALUES ('admin002', '김영희', 'admin123', 'admin');
