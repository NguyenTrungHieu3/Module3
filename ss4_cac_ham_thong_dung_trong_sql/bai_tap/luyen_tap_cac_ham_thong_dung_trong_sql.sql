USE QuanLySinhVien2;
SELECT *
FROM Subject 
WHERE Credit >= ALL (SELECT MAX(Credit) FROM Subject);

SELECT S.subId, S.subName
FROM Subject S
JOIN Mark M
ON S.SubId = M.SubId
WHERE M.mark >= ALL (SELECT MAX(Mark) FROM Mark);

SELECT S.StudentId, S.StudentName, AVG(M.mark)
FROM Student S
JOIN Mark M
ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AVG(M.mark) DESC, S.StudentName ASC;