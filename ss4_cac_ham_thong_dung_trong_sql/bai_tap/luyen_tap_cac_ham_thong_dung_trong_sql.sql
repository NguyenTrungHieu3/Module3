USE QuanLySinhVien2;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM Subject 
WHERE Credit >= ALL (SELECT MAX(Credit) FROM Subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.subId, S.subName
FROM Subject S
JOIN Mark M
ON S.SubId = M.SubId
WHERE M.mark >= ALL (SELECT MAX(Mark) FROM Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.StudentId, S.StudentName, AVG(M.mark)
FROM Student S
JOIN Mark M
ON S.StudentId = M.StudentId
GROUP BY S.StudentId
ORDER BY AVG(M.mark) DESC, S.StudentName ASC;