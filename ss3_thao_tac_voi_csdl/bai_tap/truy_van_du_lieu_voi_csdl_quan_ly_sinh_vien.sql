USE QuanLySinhVien2;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student as s
where lower(s.StudentName) like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * 
from class as c
where month(c.startdate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * 
from subject as s
where s.Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student
set classId = 2
where lower(studentname) like '%hung';
SET SQL_SAFE_UPDATES = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName, sub.SubName, m.Mark
from student as s
join mark as m
on s.StudentId = m.StudentId
join subject as sub
on m.SubId = sub.SubId
order by m.mark desc, s.StudentName asc



