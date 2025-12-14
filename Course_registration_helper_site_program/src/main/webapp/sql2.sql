CREATE TABLE Courses (
    CourseID        VARCHAR2(5)    NOT NULL PRIMARY KEY,  -- 과목 코드 (Primary Key)
    CourseName      VARCHAR2(40),                          -- 과목명
    Credits         NUMBER(6),                             -- 학점
    LecturerID      NUMBER(6),                             -- 교수 ID (Foreign Key)
    Weekday         NUMBER(2),                             -- 요일 (1: 월, 2: 화, ...)
    StartTime       VARCHAR2(4),                           -- 시작 시간 (HHMM 형식)
    EndTime         VARCHAR2(4),                           -- 종료 시간 (HHMM 형식)
    FOREIGN KEY (LecturerID) REFERENCES Lecturers(LecturerID)  -- 강의하는 교수 참조
);

drop table Courses;
drop table Lecturers;


CREATE TABLE Lecturers (
    LecturerID      NUMBER(6)    NOT NULL PRIMARY KEY,  -- 교수 ID (Primary Key)
    LecturerName    VARCHAR2(10),                       -- 교수명
    Major           VARCHAR2(25)                        -- 전공
);

CREATE TABLE Lecturers (
    LecturerID      NUMBER(6)    NOT NULL PRIMARY KEY,
    LecturerName    VARCHAR2(10),
    Major           VARCHAR2(25)
);

CREATE TABLE Courses (
    CourseID        VARCHAR2(5)    NOT NULL PRIMARY KEY,
    CourseName      VARCHAR2(40),
    Credits         NUMBER(6),
    LecturerID      NUMBER(6),
    Weekday         NUMBER(2),
    StartTime       VARCHAR2(4),
    EndTime         VARCHAR2(4),
    FOREIGN KEY (LecturerID) REFERENCES Lecturers(LecturerID)
);






INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (1, '김교수', '알고리즘');
INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (2, '이교수', '인공지능');
INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (3, '박교수', '소프트웨어 공학');
INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (4, '최교수', '알고리즘');
INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (5, '피교수', '임베디드시스템');
INSERT INTO Lecturers (LecturerID, LecturerName, Major)
VALUES (6, '깡교수', '스마트멀티미디어');


INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('10001', '화면구현', 2, 1, 1, '0900', '1100');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('10002', '프로그래밍언어활용', 2, 2, 2, '0900', '1200');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('10003', '데이터베이스구현', 3, 4, 3, '0900', '1200');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('10004', '응용SW기초기술활용', 3, 4, 4, '0900', '1200');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('20001', '애플리케이션테스트', 2, 5, 1, '1300', '1600');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('20002', 'UI테스트', 3, 5, 2, '1500', '1800');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('20003', '애플리케이션배포', 3, 5, 3, '1330', '1630');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('30001', '데이터입출력', 2, 3, 4, '1330', '1530');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('30002', '서버프로그램구현', 3, 3, 5, '0900', '1200');
INSERT INTO Courses (CourseID, CourseName, Credits, LecturerID, Weekday, StartTime, EndTime)
VALUES ('40001', '스마트문화앱구현', 3, 2, 5, '1300', '1600');




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