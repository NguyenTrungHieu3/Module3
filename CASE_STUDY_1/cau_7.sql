-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.so_nguoi_toi_da, DV.chi_phi_thue, LDV.ten_loai_dich_vu
FROM dich_vu DV
JOIN loai_dich_vu LDV
ON DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
WHERE EXISTS (SELECT 1
			FROM hop_dong HD
			WHERE DV.ma_dich_vu = HD.ma_dich_vu AND YEAR(HD.ngay_lam_hop_dong) = 2020) 
	AND NOT EXISTS (SELECT 1
						FROM hop_dong HD
						WHERE DV.ma_dich_vu = HD.ma_dich_vu AND YEAR(HD.ngay_lam_hop_dong) = 2021);
