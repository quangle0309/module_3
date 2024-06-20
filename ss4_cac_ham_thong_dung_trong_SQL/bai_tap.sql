use student_manage;

-- hiển thị môn học có credit lớn nhất
select id, name, credit, status
from subjects
where credit = (select max(credit) from subjects);

-- hiển thị thông tin môn học có điểm thi lớn nhất
select sub.id, sub.name, sub.credit, sub.status, marks.mark 
from subjects sub join marks on sub.id = marks.sub_id
where marks.mark = (select max(mark) from marks);

-- hiển thị thông tin sinh viên và điểm trung bình của mỗi sinh viên
select students.id, students.name, students.phone, status, avg(marks.mark) as diem_tb
from students 
join marks 
on students.id = marks.student_id
group by students.id, students.name, students.address, students.phone, students.status
order by diem_tb desc;
