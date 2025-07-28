-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT *
FROM hop_dong HD
JOIN nhan_vien NV
ON HD.ma_nhan_vien = NV.ma_nhan_vien
JOIN khach_hang KH
ON HD.ma_khach_hang = KH.ma_khach_hang
JOIN dich_vu DV
ON HD.ma_dich_vu = DV.ma_dich_vu
JOIN hop_dong_chi_tiet HDCT
ON HD.ma_hop_dong = HDCT.ma_hop_dong
WHERE YEAR(HD.ngay_lam_hop_dong) = 2020 AND MONTH(HD.ngay_lam_hop_dong) IN (10, 11, 12) AND NOT EXISTS (SELECT 1
																											FROM hop_dong HD2
                                                                                                            WHERE HD.ma_hop_dong = HD2.ma_hop_dong AND (YEAR(HD.ngay_lam_hop_dong) = 2021 AND MONTH(HD.ngay_lam_hop_dong) IN (1, 2, 3, 4, 5, 6)))
GROUP BY HD.ma_hop_dong;