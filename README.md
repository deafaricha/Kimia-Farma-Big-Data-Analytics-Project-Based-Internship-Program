# Rakamin Academy x Kimia-Farma : Big Data Analytics (Project Based Virtual-Internship Program)
# Kimia Farma Business Performance Analytics (2020–2023)

## Deskripsi Proyek
Proyek ini bertujuan untuk mengolah, mentransformasi, dan memvisualisasikan data transaksi Kimia Farma periode 2020–2023. Hasil akhir berupa *executive dashboard* interaktif yang membantu manajemen mengevaluasi kinerja pendapatan bersih (*Nett Sales*), profitabilitas (*Nett Profit*), sebaran penjualan antarwilayah, hingga efisiensi operasional cabang secara presisi berbasis data.

[Dashboard Kimia Farma Business Performance Analytics 2020-2023](https://datastudio.google.com/s/lvYwDDCaO-w)

[Video Final Task Kimia Farma Big Data Analytics](https://www.youtube.com/watch?v=Iw4Dt4OFNxY)

## Teknologi & Tools
* **Pengolahan & Agregasi Data:** Google BigQuery (SQL)
* **Visualisasi & Interactive Dashboard:** Looker Studio
* **Sumber Data:** `kf_final_transaction`, `kf_product`, `kf_kantor_cabang`, `kf_inventory`

---

## Logika Bisnis & Transformasi SQL
Proses ETL (*Extract, Transform, Load*) dilakukan di BigQuery dengan menggabungkan tiga tabel utama menjadi satu tabel siap pakai bernama `analysisfinal` menggunakan fungsi `LEFT JOIN`. 

Kalkulasi logika bisnis yang diterapkan di pipeline data:
* **`persentase_gross_laba`:** Margin keuntungan ditentukan berjenjang menggunakan logika `CASE WHEN` berdasarkan tier harga dasar produk.
* **`nett_sales`:** Nilai penjualan bersih setelah memperhitungkan potongan diskon.
* **`nett_profit`:** Perkiraan keuntungan bersih perusahaan.

---

## Fitur & Visualisasi Utama Dashboard (Looker Studio)
* **Executive Scorecard:** Menampilkan ringkasan metrik utama bisnis seperti **Nett Sales**, **Nett Profit**, dan **Total Transaksi**.
* **Analisis Kinerja Provinsi:** Peta wilayah (*Geo-map*) dan *Bar Chart* untuk melihat *Top 10 Provinsi* dengan performa *Nett Sales* dan *Total Transaksi* tertinggi.
* **Deteksi Operasional:** Tabel khusus *Top 5 Cabang* untuk melacak cabang dengan rating cabang tinggi namun rating transaksi rendah guna mengidentifikasi masalah kualitas layanan.

