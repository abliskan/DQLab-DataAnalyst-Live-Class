-- Sesi 2
-- Objective: Buatlah Query untuk melihat 10 transaksi dari tabel 'transaction'
select *  
from transaction
limit 10;

-- Sesi 3
-- Objective: 
-- + Buatlah Query untuk mengetahui list produk id diurutkan berdasarkan total pembelian per produk terbesar. 
-- + Tampilkan dalam urutan Product_ID, total_pembelian_per_produk.
SELECT Product_ID, SUM(Quantity) AS total_pembelian_per_produk
FROM Transaction
GROUP BY Product_ID
ORDER BY SUM(Quantity) DESC

-- Sesi 4
-- Objective: 
-- + Buatlah query untuk mengetahui "produk" yang memiliki "profit" tertinggi. 
-- + Tampilkan output dalam urutan sebagai berikut: Product_Name, Category, dan Sub_Category.
SELECT Product_Name, Category, Sub_Category
FROM Ref_Product
WHERE product_id = (
    SELECT product_id FROM transaction
    GROUP BY product_id 
    ORDER BY MAX(profit) DESC
    LIMIT 1
);

-- Sesi 5
-- Objective: Buatlah query untuk menampilkan Customer_ID, Customer_Name, dan total_pembelian tiap customer.
-- +----------------------+
-- | Tables_in_superstore |
-- +----------------------+
-- | ref_customer         |
-- | ref_order            |
-- | ref_product          |
-- | ref_region           |
-- | transaction          |
-- +----------------------+
SELECT t.Customer_ID, 
       c.Customer_Name,        
	   ROUND(SUM(t.sales)) AS total_pembelian
FROM transaction AS t
JOIN ref_customer AS c
ON t.Customer_ID = c.Customer_ID
GROUP BY t.Customer_ID, c.Customer_Name;