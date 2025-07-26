-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu
FROM dich_vu DV
JOIN loai_dich_vu LDV
ON DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
WHERE DV.ma_dich_vu NOT IN (SELECT HD.ma_dich_vu
							FROM hop_dong HD
							WHERE YEAR(HD.ngay_lam_hop_dong) = 2021 AND MONTH(HD.ngay_lam_hop_dong) IN (1,2,3));