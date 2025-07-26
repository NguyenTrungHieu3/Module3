-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(HD.ngay_lam_hop_dong) AS thang, COUNT(HD.ma_hop_dong) AS so_luong_khach_hang
FROM hop_dong HD
WHERE YEAR(HD.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(HD.ngay_lam_hop_dong)
ORDER BY MONTH(HD.ngay_lam_hop_dong) ASC;