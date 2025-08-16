# Extended Bölüm ile Güvenli Dual Boot – Enes Köse’nin Stratejisi

Bu belge, Windows’un EFI alanına dokunmadan Linux kurulumu için extended bölüm stratejisini içerir. Ubuntu’nun EFI sahiplenme sorununa karşı geliştirilmiş, güvenli ve kontrollü bir yaklaşımı temsil eder.

---

## 🎯 Amaç
- Windows’un EFI alanını korumak  
- GRUB karmaşasını önlemek  
- Linux’u izole bir alanda çalıştırmak  
- Dual boot sürecini sadeleştirmek

---

## 🧱 Bölümleme Planı

| Bölüm | Tür | Açıklama |
|-------|-----|----------|
| EFI | FAT32 (UEFI) | Windows tarafından oluşturulmuş, dokunulmaz  
| Recovery | NTFS | Windows sistem kurtarma alanı  
| C: | NTFS | Windows ana bölümü  
| Extended | Mantıksal | Linux için ayrılmış güvenli alan  
| ├── `/` | ext4 | Root dosya sistemi  
| ├── `swap` | swap | Bellek destek alanı  
| └── `home` | ext4 | Kullanıcı dosyaları

---

## ⚙️ Kurulum Adımları

1. Windows’tan boş alan ayır (`Disk Yönetimi`)  
2. Live USB ile GParted çalıştır  
3. Extended bölüm oluştur, içine mantıksal bölümler ekle  
4. Linux kurulumunda EFI alanına dokunma  
5. GRUB’u Linux EFI’ye kur (`grub-install`)  
6. `os-prober` ile Windows’u algılat  
7. `grub-mkconfig` ile GRUB menüsünü güncelle

---

## 🧠 Notlar

- Ubuntu gibi bazı dağıtımlar EFI alanını sahiplenebilir. Bu yüzden kurulum sırasında dikkatli olunmalı.  
- Extended bölüm, Linux’un Windows’tan izole çalışmasını sağlar.  
- GRUB’un kontrolü Linux tarafında kalırsa sistem daha stabil olur.

---

> “Dual boot, sabırla yapılan teknik bir sanattır.” – Enes Köse
