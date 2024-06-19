use student_manage;

select students.id, students.name, students.address, students.phone 
from students 
where students.name like "h%";

select classes.id, classes.name as "Tên Lớp", classes.start_date, classes.status
from classes 
where month(classes.start_date) = 12; 

select subjects.id, subjects.name, subjects.credit, subjects.status
from subjects 
where subjects.credit between 3 and 5;

update students 
set class_id = 2
where id  = 1;

select students.name, subjects.name as "sub_name", marks.mark
from marks
join students on marks.student_id = students.id
join subjects on marks.sub_id = subjects.id
order by 
marks.mark desc,
students.name asc;