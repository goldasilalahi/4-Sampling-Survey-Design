# Memuat paket yang diperlukan
library(readxl)
library(dplyr)
library(openxlsx)  

# Membaca data dari file Excel
data <- read_excel("Library/Containers/com.apple.AppleMediaServicesUI.SpyglassPurchases/Data/file:/Users/Golda/College/sem 4/Sampling dan Survei/Kuesioner Pembayaran Digital dan Perilaku Konsumtif Mahasiswa Departemen Matematika FMIPA UI (Responses).xlsx")

# Menghitung jumlah laki-laki dan perempuan
total_laki <- data %>% filter(Jenis_Kelamin == "Laki-laki") %>% nrow()
total_perempuan <- data %>% filter(Jenis_Kelamin == "Perempuan") %>% nrow()

# Membuat dataframe populasi
populasi <- data.frame(Strata = rep(c("Laki-Laki", "Perempuan"),
            times = c(total_laki, total_perempuan)))
total_populasi <- nrow(populasi)
nrow(populasi)

N <- seq(1, 293)
miu <- mean(N)
Sd <- sd(N)

# Dengan margin error 5% D=bounds of error/4
D <- 8.25
N_pop <- length(N)
n <- round((N_pop * Sd^2)/((N_pop-1) * D^2 + Sd^2))

ukuran_strata <- table(populasi$Strata)
ukuran_strata
ukuran_sampel_per_strata <- round((ukuran_strata / total_populasi) * n)
ukuran_sampel_per_strata

# SRS
set.seed(123)
srs_laki <- data %>% filter(Jenis_Kelamin == "Laki-laki") %>% sample_n(ukuran_sampel_per_strata["Laki-Laki"])
srs_perempuan <- data %>% filter(Jenis_Kelamin == "Perempuan") %>% sample_n(ukuran_sampel_per_strata["Perempuan"])

nrow(srs_laki)
nrow(srs_perempuan)

# Menyimpan data hasil SRS ke dalam file baru
hasil_sampling <- bind_rows(srs_laki, srs_perempuan)
write.xlsx(hasil_sampling, "hasil_sampling.xlsx")

write.xlsx(srs_laki, "hasil srs laki2.xlsx")
write.xlsx(srs_perempuan, "hasil srs perempuan.xlsx")
