-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT HD.ma_hop_dong, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, HD.tien_dat_coc, COALESCE(SUM(HDCT.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong HD
LEFT JOIN hop_dong_chi_tiet HDCT
ON HD.ma_hop_dong = HDCT.ma_hop_dong
GROUP BY HD.ma_hop_dong
