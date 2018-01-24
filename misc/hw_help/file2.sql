create table course
(course_id NUMBER(6) not null,
course_number NUMBER(6) not null,
course_title varchar2(100),
constraint course_pk primary key(course_id));