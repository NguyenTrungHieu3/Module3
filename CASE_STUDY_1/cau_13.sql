-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem, SUM(HDCT.so_luong) as so_luong_dich_vu_di_kem
FROM hop_dong_chi_tiet HDCT
JOIN dich_vu_di_kem DVDK
ON HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
GROUP BY DVDK.ma_dich_vu_di_kem
HAVING SUM(HDCT.so_luong) = (SELECT SUM(so_luong)
							FROM hop_dong_chi_tiet
                            GROUP BY ma_dich_vu_di_kem
                            ORDER BY SUM(so_luong) DESC
                            LIMIT 1);