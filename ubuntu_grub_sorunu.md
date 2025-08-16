# Ubuntu'nun GRUB ve EFI Sorunu – Enes Köse'nin Teknik Gözlemi

Ubuntu, dual boot kurulumlarında EFI alanını agresif şekilde sahiplenebilir. Bu durum, Windows’un EFI dizinini etkileyebilir ve GRUB’un kontrolü Ubuntu’ya geçer. Bu belge, bu sorunun nedenlerini ve çözüm yollarını içerir.

---

## ⚠️ Sorunun Tanımı

- Ubuntu kurulum sırasında EFI alanını otomatik olarak algılar  
- `grub-install` komutu, Windows EFI dizinine yazabilir  
- Sonuç: GRUB menüsü Ubuntu tarafından kontrol edilir  
- Windows güncellemesi sonrası GRUB bozulabilir

---

## 🔍 Teknik Gözlem

| Durum | Etki |
|-------|------|
| Ubuntu EFI'yi sahiplenirse | Windows açılmayabilir  
| GRUB Windows’u algılamazsa | Tek sistem gibi davranır  
| EFI dizini karışırsa | Boot hataları oluşur

---

## ✅ Çözüm Stratejileri

1. **Kurulumda EFI alanına dokunma**  
   - Manuel bölümleme yap, EFI alanını “kullanma” olarak işaretle  
2. **GRUB’u ayrı EFI dizinine kur**  
   - `grub-install --efi-directory=/boot/efi` ile Linux’a özel EFI  
3. **`os-prober` aktif olmalı**  
   - `/etc/default/grub` içinde `GRUB_DISABLE_OS_PROBER=false`  
4. **GRUB menüsünü güncelle**  
   - `sudo update-grub` veya `grub-mkconfig -o /boot/grub/grub.cfg`  
5. **Windows EFI yedeği al**  
   - Olası bozulmalara karşı `diskpart` ile EFI dizinini yedekle

---

## 🧠 Enes’ten Notlar

- Ubuntu, kullanıcı dostu olsa da EFI konusunda “fazla özgüvenli” davranabilir  
- Extended bölüm stratejisi bu sorunu önlemek için idealdir  
- GRUB kontrolü Linux tarafında kalmalı ama Windows’a zarar vermemeli

---

> “EFI dizini kutsaldır. Ubuntu bile dokunmadan önce izin almalı.” – Enes Köse
