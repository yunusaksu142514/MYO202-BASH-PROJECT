#!/bin/bash

# Yunus AKSU
# 2420171037
# Sertifika 1: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=yjahz2XG8J
# Sertifika 2: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=MAZUEjPmxP
# Sertifika 3: https://credsverse.com/credentials/f052fae5-a8f1-4c68-adde-90bc9d4873ed



echo "Rapor Başlangıç: $(date '+%Y-%m-%d %H:%M:%S')" > report.log

echo "=== WINDOWS DONANIM BILGILERI ===" >> report.log
echo "" >> report.log


echo "=== CPU ===" >> report.log
wmic cpu get Name, Manufacturer >> report.log

echo "=== RAM BILGISI ===" >> report.log
wmic memorychip get Capacity,Manufacturer,PartNumber,SerialNumber >> report.log

echo "=== ANAKART BILGISI ===" >> report.log
wmic baseboard get Manufacturer,Product,SerialNumber >> report.log

echo "=== ANAKART UUID BILGISI ===" >> report.log
wmic csproduct get UUID >> report.log

echo "=== Disk Bilgisi ===" >> report.log
wmic diskdrive get model,mediatype,size,serialnumber >> report.log

echo "=== MAC Adresi ===" >> report.log
getmac >> report.log


read -s -p "Parola gir: " PAROLA
echo


gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 report.log


rm report.log

echo ""
echo "=== ISLEM TAMAMLANDI ==="
echo "Orijinal rapor: report.log"
echo "Sifrelenmis rapor: report.log.gpg"


