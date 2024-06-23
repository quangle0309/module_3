
-- Hiển thị thông tin của tất cả nhân viên có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT * 
FROM employees 
WHERE full_name REGEXP '^[HTK]' AND LENGTH(full_name) <= 15;

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT *
FROM customers 
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 18 AND 50 
AND address in ('Đà Nẵng','Quảng Trị');

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có tên loại khách hàng là “Diamond”.
SELECT c.id, c.full_name, COUNT(*) AS booking_count
FROM customers c
JOIN customer_types ct ON c.id_customer_type = ct.id
JOIN contracts co ON c.id = co.id_customer
WHERE ct.name_customer = 'Diamond'
GROUP BY c.id, c.full_name
ORDER BY booking_count ASC;

-- Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien cho tất cả các Khách hàng đã từng đặt phòng.
SELECT c.id, c.full_name, ct.name_customer, 
co.id AS id_contract, s.name AS name_service, co.contract_date, 
co.contract_end_date, 
(s.price + IFNULL(SUM(ds.price * ds.unit), 0)) AS TongTien
FROM customers c
JOIN customer_types ct ON c.id_customer_type = ct.id
JOIN contracts co ON c.id = co.id_customer
JOIN services s ON co.id_service = s.id
LEFT JOIN detailed_contracts dc ON co.id = dc.id_contract
LEFT JOIN additional_services ds ON dc.id_additional_service = ds.id
GROUP BY c.id, co.id;

-- Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019.
SELECT s.id AS id_Service, s.name AS name_service, s.area, s.price, ts.name AS name_type_of_service
FROM services s
JOIN type_of_services ts ON s.id_type_of_service = ts.id
LEFT JOIN contracts c ON s.id = c.id_service AND c.contract_date BETWEEN '2019-01-01' AND '2019-03-31'
WHERE c.id IS NULL;

-- Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại 
-- dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
SELECT s.id, s.name, s.area, s.max_people, s.price, ts.name AS name_type_of_service
FROM services s
JOIN type_of_services ts ON s.id_type_of_service = ts.id
WHERE s.id IN (
    SELECT id_service 
    FROM contracts 
    WHERE YEAR(contract_date) = 2018
)
AND s.id NOT IN (
    SELECT id_service 
    FROM contracts 
    WHERE YEAR(contract_date) = 2019
);

-- Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
SELECT DISTINCT full_name AS name_customer 
FROM customers;

-- Thống kê doanh thu theo tháng trong năm 2019
SELECT MONTH(contract_end_date) AS Month, sum(total) as revenue
FROM contracts
WHERE YEAR(contract_end_date) = 2019
GROUP BY Month;

-- Hiển thị thông tin tương ứng với từng Hợp đồng đã sử dụng bao nhiêu Dịch vụ đi kèm
SELECT co.id AS id_contract, co.contract_date, co.contract_end_date, co.deposits, COUNT(dc.id_additional_service) AS So_Luong_Dich_Vu_Di_Kem
FROM contracts co
LEFT JOIN detailed_contracts dc ON co.id = dc.id_contract
GROUP BY co.id;

-- Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
SELECT c.id as id_customer, c.full_name, ads.name as name_service_additional, ads.price, ads.unit 
FROM additional_services ads
JOIN detailed_contracts dc ON ads.id = dc.id_additional_service
JOIN contracts co ON dc.id_contract = co.id
JOIN customers c ON co.id_customer = c.id
JOIN customer_types ct ON c.id_customer_type = ct.id
WHERE ct.name_customer = 'Diamond'
AND (c.address = 'Vinh' OR c.address = 'Quảng Ngãi');

-- Hiển thị thông tin các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
SELECT co.id AS id_contract, e.full_name AS name_employee, c.full_name AS name_customer, c.phone_number, s.name AS name_service, s.price, co.total
FROM contracts co
JOIN employees e ON co.id_employee = e.id
JOIN customers c ON co.id_customer = c.id
JOIN services s ON co.id_service = s.id
WHERE co.contract_date BETWEEN '2019-10-01' AND '2019-12-31'
AND co.id NOT IN (
    SELECT id 
    FROM contracts 
    WHERE contract_date BETWEEN '2019-01-01' AND '2019-06-30'
)
GROUP BY co.id;

-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
SELECT ads.id, ads.name, COUNT(dc.id_additional_service) AS usage_count
FROM additional_services ads
JOIN detailed_contracts dc ON ads.id = dc.id_additional_service
JOIN contracts co ON dc.id_contract = co.id
GROUP BY ads.id
HAVING usage_count = (
    SELECT MAX(usage_count)
    FROM (
        SELECT COUNT(dc2.id_additional_service) AS usage_count
        FROM additional_services ads2
        JOIN detailed_contracts dc2 ON ads2.id = dc2.id_additional_service
        JOIN contracts co2 ON dc2.id_contract = co2.id
        GROUP BY ads2.id
    ) AS usage_counts
);

-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
SELECT ads.id, ads.name AS name_additional_service, ads.price, ads.unit, COUNT(dc.id_additional_service) AS count_additional_service
FROM contracts co
JOIN detailed_contracts dc ON co.id = dc.id_contract
JOIN additional_services ads ON dc.id_additional_service = ads.id
GROUP BY dc.id_additional_service
HAVING count_additional_service = 1;

-- Hiển thị thông tin của tất cả nhân viên mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
SELECT e.id AS id_employee, e.full_name, l.level, d.name AS name_department, e.phone_number, e.address, count(co.id) as signed_contract
FROM employees e
JOIN levels l ON e.id_level = l.id
JOIN departments d ON e.id_department = d.id
LEFT JOIN contracts co ON e.id = co.id_employee AND co.contract_date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY e.id
HAVING signed_contract <= 3;

-- Xóa những nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
DELETE FROM employees
WHERE id NOT IN (
    SELECT DISTINCT id_employee 
    FROM contracts 
    WHERE contract_date BETWEEN '2017-01-01' AND '2019-12-31'
);

-- Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng tiền thanh toán trong năm 2019 là lớn hơn 10.000$.
UPDATE customers c
JOIN (
    SELECT co.id_customer, SUM(co.total) AS total_amount
    FROM contracts co
    WHERE YEAR(co.contract_date) = 2019
    GROUP BY co.id_customer
    HAVING total_amount > 10000
) AS total_customers ON c.id = total_customers.id_customer
SET c.id_customer_type = (SELECT id FROM customer_types WHERE name_customer = 'Diamond')
WHERE c.id_customer_type = (SELECT id FROM customer_types WHERE name_customer = 'Platinium');

-- Xóa những khách hàng có hợp đồng trước năm 2016.
DELETE FROM customers
WHERE id IN (
    SELECT DISTINCT id_customer 
    FROM contracts 
    WHERE contract_date < '2016-01-01'
);

-- Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
UPDATE additional_services ads
JOIN (
    SELECT id_additional_service, COUNT(*) AS usage_count
    FROM detailed_contracts dc
    JOIN contracts co ON dc.id_contract = co.id
    WHERE YEAR(co.contract_date) = 2019
    GROUP BY id_additional_service
    HAVING usage_count > 10
) AS frequently_used ON ads.id = frequently_used.id_additional_service
SET ads.price = ads.price * 2;

-- Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống.
SELECT e.full_name, e.email, e.phone_number, e.dob, e.address, "Nhân viên" as infor
FROM employees e
UNION
SELECT c.full_name, c.email, c.phone_number, c.dob, c.address, "Khách hàng" as infor
FROM customers c;

