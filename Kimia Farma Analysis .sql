CREATE OR REPLACE TABLE rakaminkfanalytics-507607.kimia_farma.analysisfinal AS
SELECT 
    kf_final_transaction.transaction_id,
    kf_final_transaction.date,
    kf_final_transaction.branch_id,
    kf_kantor_cabang.branch_name,
    kf_kantor_cabang.kota,
    kf_kantor_cabang.provinsi,
    kf_kantor_cabang.rating AS rating_cabang,
    kf_final_transaction.customer_name,
    kf_final_transaction.product_id,
    kf_product.product_name,
    kf_final_transaction.price AS actual_price,
    kf_final_transaction.discount_percentage,
    
    -- persentase gross laba
    CASE 
        WHEN kf_final_transaction.price <= 50000 THEN 0.10
        WHEN kf_final_transaction.price > 50000 AND kf_final_transaction.price <= 100000 THEN 0.15
        WHEN kf_final_transaction.price > 100000 AND kf_final_transaction.price <= 300000 THEN 0.20
        WHEN kf_final_transaction.price > 300000 AND kf_final_transaction.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,
    
    -- harga setelah diskon
    (kf_final_transaction.price * (1 - kf_final_transaction.discount_percentage)) AS nett_sales,
    
    -- keuntungan nett profit
    ((kf_final_transaction.price * (1 - kf_final_transaction.discount_percentage)) * 
        CASE 
            WHEN kf_final_transaction.price <= 50000 THEN 0.10
            WHEN kf_final_transaction.price > 50000 AND kf_final_transaction.price <= 100000 THEN 0.15
            WHEN kf_final_transaction.price > 100000 AND kf_final_transaction.price <= 300000 THEN 0.20
            WHEN kf_final_transaction.price > 300000 AND kf_final_transaction.price <= 500000 THEN 0.25
            ELSE 0.30
        END
    ) AS nett_profit,
    
    kf_final_transaction.rating AS rating_transaksi

FROM kimia_farma.kf_final_transaction
LEFT JOIN kimia_farma.kf_product
    ON kf_final_transaction.product_id = kf_product.product_id
LEFT JOIN kimia_farma.kf_kantor_cabang
    ON kf_final_transaction.branch_id = kf_kantor_cabang.branch_id;
