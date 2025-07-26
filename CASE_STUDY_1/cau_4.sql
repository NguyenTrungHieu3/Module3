-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT KH.ma_khach_hang, KH.ho_ten, COUNT(HD.ma_hop_dong) as so_lan_dat_phong
FROM khach_hang KH
JOIN loai_khach LK
ON KH.ma_loai_khach = LK.ma_loai_khach
JOIN hop_dong HD
ON KH.ma_khach_hang = HD.ma_khach_hang
WHERE LK.ten_loai_khach LIKE 'Diamond'
GROUP BY KH.ma_khach_hang 
ORDER BY COUNT(HD.ma_hop_dong) ASC;