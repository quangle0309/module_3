use student_manage;

select address, count(id) as "Số lượng học viên"
from students 
group by address;

select s.id as "Mã học viên", s.name as "Tên học viên", avg(mark)
from students s join marks m on s.id = m.id
group by s.id, s.name
having avg(mark > 10);

select s.id as "Mã học viên", s.name as "Tên học viên", avg(mark)
from students s join marks m on s.id = m.student_id
group by s.id, s.name
having avg(mark) >= all (select avg(mark) from marks group by marks.student_id);
