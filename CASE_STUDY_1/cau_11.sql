-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
USE quan_ly_khu_nghi_duong_furama;
SELECT DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem
FROM dich_vu_di_kem DVDK
JOIN hop_dong_chi_tiet HDCT
ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
JOIN hop_dong HD
ON HDCT.ma_hop_dong = HD.ma_hop_dong
JOIN khach_hang KH
ON HD.ma_khach_hang = KH.ma_khach_hang
JOIN loai_khach LK
ON KH.ma_loai_khach = LK.ma_loai_khach
WHERE LK.ten_loai_khach LIKE 'Diamond' AND (KH.dia_chi LIKE '%Vinh%' OR KH.dia_chi LIKE '%Quảng Ngãi%');