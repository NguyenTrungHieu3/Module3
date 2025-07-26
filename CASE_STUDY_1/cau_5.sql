-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, HD.ma_hop_dong, DV.ten_dich_vu, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, SUM(DV.chi_phi_thue + HDCT.so_luong * DVDK.gia) as tong_tien
FROM khach_hang KH
JOIN loai_khach LK
ON KH.ma_loai_khach = LK.ma_loai_khach
LEFT JOIN hop_dong HD
ON KH.ma_khach_hang = HD.ma_khach_hang
LEFT JOIN dich_vu DV
ON HD.ma_dich_vu = DV.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet HDCT
ON HDCT.ma_hop_dong = HD.ma_hop_dong
LEFT JOIN dich_vu_di_kem DVDK
ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
GROUP BY 
    KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, 
    HD.ma_hop_dong, DV.ten_dich_vu, 
    HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, DV.chi_phi_thue