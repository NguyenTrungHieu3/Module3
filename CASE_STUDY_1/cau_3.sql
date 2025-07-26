-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT *
FROM khach_hang 
WHERE (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%') AND (YEAR(NOW()) - YEAR(ngay_sinh)) BETWEEN 18 and 50;