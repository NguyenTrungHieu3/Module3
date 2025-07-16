use c0225l1;
-- Câu 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.id, s.name, c.name
from student as s
join class as c
on s.class_id = c.id;

-- Câu 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select s.id, s.name, c.name
from student as s
left join class as c
on s.class_id = c.id;

-- Câu 3. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select * 
from student as s
where lower(s.name) LIKE '%Hai' OR s.name LIKE '%Huynh';

-- Câu 4. Lấy ra học viên có điểm lớn hơn 5 .
select * 
from student 
where point > 5;

-- Câu 5. Lấy ra học viên có họ là “nguyen”
select * 
from student as s
where lower(s.name) LIKE 'Nguyen%';

-- Câu 6. Thông kế số lượng học sinh theo từng loại điểm.
select s.point, count(s.id)
from student as s 
group by s.point 
order by s.point desc;

-- Câu 7 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select s.point, count(s.id)
from student as s 
where s.point > 5
group by s.point 
order by s.point desc;

-- Câu 8. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select s.point, count(s.id)
from student as s 
where s.point > 5
group by s.point 
having count(s.id) >= 2
order by s.point desc;

-- Câu 9. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet. 
select *
from student as s
where class_id = 1
order by s.name asc