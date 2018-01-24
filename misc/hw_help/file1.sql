connect ap/ap;
begin
  execute immediate 'drop table studentCourse';
  execute immediate 'drop table course';
  execute immediate 'drop table student';
  exception
    when others then
      dbms_output.put_line('');
  end;
  /
create table student
(student_id NUMBER(7) NOT NULL,
student_name VARCHAR(2) NOT NULL,
constraint student_pk primary  key (student_id));