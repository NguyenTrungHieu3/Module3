-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem, COUNT(DVDK.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM hop_dong HD
JOIN dich_vu DV
ON HD.ma_dich_vu = DV.ma_dich_vu
JOIN loai_dich_vu LDV
ON DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
JOIN hop_dong_chi_tiet HDCT
ON HD.ma_hop_dong = HDCT.ma_hop_dong
JOIN dich_vu_di_kem DVDK 
ON HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
GROUP BY DVDK.ma_dich_vu_di_kem
HAVING COUNT(DVDK.ma_dich_vu_di_kem) = 1