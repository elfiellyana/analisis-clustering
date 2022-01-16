# analisis-clustering
Analisis Clustering Menggunakan PCA &amp; K-Means
Akan dilakukan analisis dengan menggunakan 2 metode yaitu : - Principal Component Analysis (PCA) dan - K-Means Clustering. Adapun data yang digunakan untuk analisis kali adalah data wholesale.csv.
1.	Data Explorasi
Sebelum melakukan analisis, diperlukan melakukan eksplorasi data dahulu. Dapat dilihat sekilas struktur dari dataset yang digunakan. Dapat menggunakan fungsi str() atau glimpse().
 ![image](https://user-images.githubusercontent.com/97815444/149651662-c66a020c-8d8e-46b3-95a0-7befeacbce16.png)
Outputnya :
Rows: 440
Columns: 8
$ Channel          <int> 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1~
$ Region           <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3~
$ Fresh            <int> 12669, 7057, 6353, 13265, 22615, 9413, 12126, 7579, 5963, 6006, 336~
$ Milk             <int> 9656, 9810, 8808, 1196, 5410, 8259, 3199, 4956, 3648, 11093, 5403, ~
$ Grocery          <int> 7561, 9568, 7684, 4221, 7198, 5126, 6975, 9426, 6192, 18881, 12974,~
$ Frozen           <int> 214, 1762, 2405, 6404, 3915, 666, 480, 1669, 425, 1159, 4400, 1420,~
$ Detergents_Paper <int> 2674, 3293, 3516, 507, 1777, 1795, 3140, 3321, 1716, 7425, 5977, 54~
$ Delicassen       <int> 1338, 1776, 7844, 1788, 5185, 1451, 545, 2566, 750, 2098, 1744, 497~
Kita juga dapat melihat sekilas tampilan data dengan menggunakan fungsi head() atau tail().
  
 ![image](https://user-images.githubusercontent.com/97815444/149651691-71aede61-fb85-404f-9389-94b15ccfbd38.png)
  
Outputnya :
> # lihat data
> head(wholesale)
  Channel Region Fresh Milk Grocery Frozen Detergents_Paper Delicassen
1       2      3 12669 9656    7561    214             2674       1338
2       2      3  7057 9810    9568   1762             3293       1776
3       2      3  6353 8808    7684   2405             3516       7844
4       1      3 13265 1196    4221   6404              507       1788
5       2      3 22615 5410    7198   3915             1777       5185
6       2      3  9413 8259    5126    666             1795       1451
Deskripsi dari data diatas :

Data set yang digunakan terdiri dari 440 baris, dan 8 kolom. Data tersebut berisi data dari toko grosir yang terdiri dari barang-barang consumer goods. Karena dirasa data yang kita gunakan cukup jelas, maka kita tidak perlu menjelaskannya lebih rinci lagi. Kita fokus pada tipe datanya apakah sudah sesuai atau belum.

Dari data diatas, kita ubah data tipe data pada kolom Channel dan Region menjadi factor() dan tipe data lainnya menjadi numeric.
  
 ![image](https://user-images.githubusercontent.com/97815444/149651711-70c0fddb-8a01-4961-a282-0b2f81cc1242.png)
  
Sebelum kita melakukaan ke tahap berikutnya, sebaiknya kita cek terlebih dahulu, apakah ada data yang missing value atau NA.
  
 ![image](https://user-images.githubusercontent.com/97815444/149651718-9673d976-7778-4d98-b72f-1378e955dccf.png)
  
Outputnya :
> # cek missing value
> colSums(is.na(wholesale))
         Channel           Region            Fresh             Milk          Grocery 
               0                0                0                0                0 
          Frozen Detergents_Paper       Delicassen 
               0                0                0
Didapat dari penjelasan diatas, bahwa di dataset kita tidak terdapat missing value atau NA, maka kita lanjut ke tahap berikutnya yaitu melakukan analisis.
2.	Principal Component Analysis (PCA)
PCA sangat berguna untuk menyimpan informasi sekaligus mereduksi dimensi data. Namun, kita perlu memastikan bahwa data sudah diskalakan (scaled) dengan benar untuk mendapatkan PCA yang berguna. Kita dapat menggunakan fungsi FactoMineR yang menyediakan fungsi untuk membuat PCA yaitu PCA() dan memvisualisasikan PCA yaitu plot.PCA(). Visualisasi PCA dengan FactoMineR dapat melibatkan variabel kategorik untuk membedakan informasi kategori dengan cara memberikan warna pada titik-titik amatan sehingga plot lebih informatif.
•	Membuat PCA
  
 ![image](https://user-images.githubusercontent.com/97815444/149651728-4517ca29-5f08-4e89-befc-1ee3b26a640e.png)
  
Outputnya :
  
 ![image](https://user-images.githubusercontent.com/97815444/149651764-fc5cd854-e72f-438a-9bac-cf24d9c1db95.png)
  
![image](https://user-images.githubusercontent.com/97815444/149651767-2016791e-faf2-462c-a28d-220df5af135e.png)
  
Visualisasi PCA menggunakan plot.PCA()
Individual Factor Map: plot sebaran data/scatter plot
  
 ![image](https://user-images.githubusercontent.com/97815444/149651778-3163ff32-7ccd-4edf-8310-844590bd8fc3.png)
  
Outputnya :
  
 ![image](https://user-images.githubusercontent.com/97815444/149651785-f846e619-19f1-4e72-9f3b-c25a73c74ba0.png)
  
Map: plot kontribusi setiap variabel pada setiap PC
  
 ![image](https://user-images.githubusercontent.com/97815444/149651790-4ab11f70-cf14-4758-8213-34cf0b9e642f.png)
  
Outputnya:
  
 ![image](https://user-images.githubusercontent.com/97815444/149651794-276e48fe-d7bb-4cef-a6e7-fb2e7de0cc00.png)
  
Inspect some output from PCA
  
 ![image](https://user-images.githubusercontent.com/97815444/149651802-ae9fa29a-ce5a-472b-bb40-ce1b434ffcaf.png)
  
Outputnya :
> # summary pca
> pca_wholesale$eig
       eigenvalue percentage of variance cumulative percentage of variance
comp 1 2.64497357              44.082893                          44.08289
comp 2 1.70258397              28.376400                          72.45929
comp 3 0.74006477              12.334413                          84.79371
comp 4 0.56373023               9.395504                          94.18921
comp 5 0.28567634               4.761272                          98.95048
comp 6 0.06297111               1.049519                         100.00000
Kita dapat melihat kontribusi setiap variabel pada setiap PC dapat dilihat menggunakan dimdesc(), dan hasilnya sbb :
  
 ![image](https://user-images.githubusercontent.com/97815444/149651805-f285f6b8-1f3e-42c8-a902-29926f657c86.png)
  
Outputnya :
> # dimdisc: dimension description
> # secara default hanya menampilkan kontribusi dari PC1-PC3
> dim <- dimdesc(pca_wholesale)
> # kontribusi setiap variabel terhadap PC1
> # quanti: variable numerik
> dim$Dim.1$quanti
                 correlation       p.value
Grocery            0.9420663 6.584197e-210
Detergents_Paper   0.8922741 2.332450e-153
Milk               0.8865463 1.021905e-148
Delicassen         0.4044408  9.572010e-19
Hasil PCA :
  
 ![image](https://user-images.githubusercontent.com/97815444/149651811-87a58d2c-fc68-4881-85b3-1148aa2faab1.png)
  
Outputnya :
> # hasil pca
> dim(pca_wholesale$ind$coord)
[1] 440   6
3.	K-Means Clustering
Step-by-step k-means clustering:
1.	Menentukan pusat cluster (centroid) sebanyak k secara random (hanya dilakukan di awal saja)
2.	Menghitung jarak setiap observasi ke setiap pusat cluster
3.	Assign setiap observasi ke cluster terdekat
4.	Menghitung ulang pusat cluster (mean setiap cluster)
5.	Kembali ke tahap 2, hingga observasi yang ter-assign ke setiap cluster sudah tidak berubah lagi
•	Read Data
Data yang digunakan masih menggunakan data yang telah dicleansing sebelumnya yaitu data wholesale. Berikut tampilan sebagian datanya.
  
 ![image](https://user-images.githubusercontent.com/97815444/149651828-7b395a9a-9690-4602-a4ec-2426999756d9.png)
  
Outputnya :
> # read data
> head(wholesale)
  Channel Region Fresh Milk Grocery Frozen Detergents_Paper Delicassen
1  Retail      3 12669 9656    7561    214             2674       1338
2  Retail      3  7057 9810    9568   1762             3293       1776
3  Retail      3  6353 8808    7684   2405             3516       7844
4  Horeca      3 13265 1196    4221   6404              507       1788
5  Retail      3 22615 5410    7198   3915             1777       5185
6  Retail      3  9413 8259    5126    666             1795       1451
•	Optimum K
Penentuan jumlah cluster (k) dapat dilakukan dengan cara: - Berdasarkan bussiness knowledge/kebutuhan analisis: User sudah mengetahui secara pasti jumlah cluster yang diharapkan. Contoh, membagi pelanggan menjadi 3 kelompok berdasarkan daya beli (low, medium, high). - Elbow method: melihat penurunan total WSS yang paling efektif (biasanya memilih k ketika penurunan total WSS k berikutnya sudah tidak signifikan).
•	semakin banyak k, wss semakin mendekati 0
•	semakin banyak k, rasion semakin mendekati 1
Langkah selanjutnya dalam membangun cluster dengan K-means adalah menemukan jumlah cluster optimal untuk memodelkan data kita. Gunakan fungsi kmeansTunning() yang disediakan di bawah ini untuk menemukan K yang optimal menggunakan metode Elbow. Gunakan maksimum maxK sebesar 6 untuk membatasi plot menjadi 6 cluster berbeda.
  
 ![image](https://user-images.githubusercontent.com/97815444/149651838-42ce258c-231e-45e3-9d12-3e48cc5a1ebf.png)
  
Lakukan scaling data
  
 ![image](https://user-images.githubusercontent.com/97815444/149651839-ccca2d77-4210-491c-91ec-e74274f1670a.png)
  
Outputnya :
  
![image](https://user-images.githubusercontent.com/97815444/149651844-4340e1b8-732a-4aa3-afdb-3c43d3e552c3.png) 
  
•	Building Cluster
  
 ![image](https://user-images.githubusercontent.com/97815444/149651848-81f5182e-d025-4e52-ba46-dd8573132f1a.png)
  
Outputnya :
  
 ![image](https://user-images.githubusercontent.com/97815444/149651851-7a7f420a-9476-4be7-b1b9-a282ac4d3e0b.png)
  
![image](https://user-images.githubusercontent.com/97815444/149651855-e0ec03de-8d63-4934-8a95-c688cd5f22fa.png)
  
Outputnya :
	head(wholesale_new)
  Fresh Milk Grocery Frozen Detergents_Paper Delicassen cluster
1 12669 9656    7561    214             2674       1338       6
2  7057 9810    9568   1762             3293       1776       6
3  6353 8808    7684   2405             3516       7844       6
4 13265 1196    4221   6404              507       1788       2
5 22615 5410    7198   3915             1777       5185       2
6  9413 8259    5126    666             1795       1451       6
  
 ![image](https://user-images.githubusercontent.com/97815444/149651859-25ce2381-d3f7-4d3e-bc1d-7964a0e7c40c.png)
  
Outputnya :
> head(profil)
 # A tibble: 6 x 7
  cluster  Fresh   Milk Grocery Frozen Detergents_Paper Delicassen
    <int>  <dbl>  <dbl>   <dbl>  <dbl>            <dbl>      <dbl>
1       1 20031. 38084   56126.  2565.           27645.      2548.
2       2 20996.  3826.   5098.  4157.            1120.      1680.
3       3 60572. 30120.  17315. 38049.            2153      20701.
4       4 46518   3439.   4785.  5250.             801.      2147.
5       5  5077. 12289.  18815.  1605             8254.      1831.
6       6  5996.  3369.   4207.  2418.            1283.      1001.
      
 ![image](https://user-images.githubusercontent.com/97815444/149651863-b0dccc36-e7b5-44c4-94d0-676ab89b2e58.png)
      
Outputnya :
      
 ![image](https://user-images.githubusercontent.com/97815444/149651872-fd3d3a3b-c845-45d3-807d-37cb69969bf7.png)
      
4.	Kesimpulan
1.	Pada analisa kali ini digunakan 2 metode dariunsupervised learning yaitu : PCA dan K-Means Clustering.
2.	Dengan menggunakan PCA kita mendapatkan sebanyak 6 PC untuk mendapatkan 100% dari informasi data.
3.	Dengan menggunakan K_means kita mendapatkan 6 pengelompokkan (clustrering), karena kita menggunakan metode Elbow.
