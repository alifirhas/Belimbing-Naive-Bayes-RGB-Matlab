# Klasifikasi Belimbing Menggunakan Naïve Bayes Berdasarkan Fitur Warna RGB

<!-- ![Project Image](project-image-url) -->


<!-- --- -->

## Table of Contents

  - [Table of Contents](#table-of-contents)
  - [Description](#description)
      - [Technologies](#technologies)
  - [How To Use](#how-to-use)
      - [Installation](#installation)
      - [Run](#run)
      - [Training](#training)
      - [Testing](#testing)
  - [References](#references)
  - [License](#license)
  - [Author Info](#author-info)

---

## Description

Project ini dilakukan untuk menyelesaikan tugas akhir Politeknik Negeri Jember TIF 19 2021. Project ini ditujukan untuk membantu petani dalam proses pasca panen dlaam proses memilah belimbing berdasarkan kematangan dari buah belimbing. Kematangan buah belimbing dibagi menjadi 3 yaitu Matang, Sedang, dan Mentah. Proses pengenalan kematangan buah dilakukan dengan metode Gaussian Naive Bayes dengan mengekstraksi fitur warna RGB dari buah.

#### Technologies

- Matlab 2021a

### YouTube Presentation

[![Lihat disini](https://img.youtube.com/vi/G926VcSj0RA/0.jpg)](https://www.youtube.com/watch?v=G926VcSj0RA)

[Back To The Top](#read-me-template)

---

## How To Use

#### Installation

- Clone Project
- Buka project dalam Matlab
- Select semua folder yang ada
- Klik kanan
- Add path -> add path with subfolders, agar matlab bisa menggunakan function dan file data yang berada di subfolder

#### Run
- Buka HomeApp.m untuk memulai aplikasi

#### Training
- Buka HomeTesting.m atau akses menggunakan menu dalam aplikasi
- Pilih folder yang berisi data training buah belimbing dengan format nama file citra ```Belimbing n -> LabelKematangan```. Ex: ``` Belimbing 1 - Sedang```
- Tentuka fold, nilai default adalah 3, nilai fold adalah nilai modulus jumlah data training
- Klik Proses dan tunggu

#### Testing
- Buka HomeTesting.m atau akses menggunakan menu dalam aplikasi
- Pilih gambar buah belimbing yang ingin dideteksi tingkat kematangannya
- Klik Proses

- - -
## References

- [Jurnal Referensi](https://journal.ugm.ac.id/ijccs/article/view/17838/12149)
- Referensi Pemrograman
	- https://www.kaggle.com/burhanykiyakoglu/k-nn-logistic-regression-k-fold-cv-from-scratch#-k-Fold-Cross-Validation-from-Scratch
	- https://machinelearningmastery.com/naive-bayes-classifier-scratch-python/

- Gaussian Naive Bayes
	- https://www.youtube.com/watch?v=H3EjCKtlVog&t=63s&ab_channel=StatQuestwithJoshStarmer
	- https://www.youtube.com/watch?v=rzFX5NWojp0&ab_channel=StatQuestwithJoshStarmer
	- https://www.youtube.com/watch?v=SzZ6GpcfoQY&ab_channel=StatQuestwithJoshStarmer

- k-fold cross validation
	- https://www.youtube.com/watch?v=fSytzGwwBVw


[Back To The Top](#read-me-template)

---

## License

[LICENSE](LICENSE)

[Back To The Top](#read-me-template)

---

## Author Info

- Priska Arlinda Sabilah | E41190668 - [GitHub](https://github.com/priska19)
- Alif Irhasshoufi Nasihul Umam | E41190530 - [GitHub](https://github.com/alifirhas)
- Nanda Raditya Akbar - | E41190200 - [GitHub](https://github.com/NandaRaditiyaA)
- Resa Wahyu Saputra - | E41190739 - [GitHub]()

[Back To The Top](#read-me-template)

