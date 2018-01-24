create table studentCourse
(student_id NUMBER(7) not null,
course_id NUMBER(6) not null,
grade char(1),
constraint studentCourse_pk primary key
  (student_id, course_id),
constraint studentCourse_fk_student
  foreign key (student_id)
  references student(student_id),
constraint studnetCourse_fk_course
  foreign key(course_id)
  references course(course_id));