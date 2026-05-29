#!/bin/bash

# Yunus AKSU
# 2420171037
# Sertifika 1: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=yjahz2XG8J
# Sertifika 2: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=MAZUEjPmxP
# Sertifika 3: https://credsverse.com/credentials/f052fae5-a8f1-4c68-adde-90bc9d4873ed


# report.log oluştur
echo "Rapor Başlangıç: $(date '+%Y-%m-%d %H:%M:%S')" > report.log

# Donanım bilgileri
echo "=== CPU ===" >> report.log
wmic cpu get name >> report.log

echo "=== RAM ===" >> report.log
wmic memorychip get capacity >> report.log

echo "=== Anakart ===" >> report.log
wmic baseboard get product,manufacturer >> report.log

echo "=== Disk Bilgisi ===" >> report.log
wmic diskdrive get model,mediatype,size,serialnumber >> report.log

echo "=== MAC ===" >> report.log
getmac >> report.log

# Parola alma
read -s -p "Parola gir: " PAROLA
echo

# AES256 ile şifreleme
gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 report.log

# Orijinal dosyayı sil
rm report.log

echo "Şifreleme tamamlandı."

