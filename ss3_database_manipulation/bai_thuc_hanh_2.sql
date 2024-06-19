select * from students;

select * from students where status = true;

select * from subjects where credit < 10;

select s.id, s.name, c.name from students s join classes c on s.class_id = c.id where c.name = "A1";

select s.id, s.name, sub.name, m.mark
from students s join marks m on s.id = m.id join subjects sub on m.id = sub.id where sub.name = "CF";