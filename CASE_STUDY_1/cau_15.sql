-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT NV.ma_nhan_vien, NV.ho_ten, TD.ten_trinh_do, BP.ten_bo_phan, NV.so_dien_thoai, NV.dia_chi
FROM nhan_vien NV
JOIN trinh_do TD
ON NV.ma_trinh_do = TD.ma_trinh_do
JOIN bo_phan BP 
ON NV.ma_bo_phan = BP.ma_bo_phan
JOIN hop_dong HD
ON HD.ma_nhan_vien = NV.ma_nhan_vien
WHERE YEAR(HD.ngay_lam_hop_dong) IN (2020, 2021)
GROUP BY NV.ma_nhan_vien
HAVING COUNT(HD.ma_hop_dong) <= 3 
ORDER BY NV.ma_nhan_vien