-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien
WHERE (ho_ten LIKE '% H%' OR ho_ten LIKE '% Y%' OR ho_ten LIKE '% K%') AND CHAR_LENGTH(ho_ten) <= 15;