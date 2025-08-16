# Windows EFI Alanını Koruma – Enes Köse'nin Dual Boot Güvenlik Rehberi

Windows’un EFI bölümü, sistemin önyükleme yapabilmesi için kritik bir alandır. Linux kurulumlarında bu alanın bozulması, Windows’un açılmamasına veya GRUB hatalarına yol açabilir. Bu belge, EFI alanını korumanın yollarını içerir.

---

## ⚠️ Riskler

| Durum | Etki |
|-------|------|
| Ubuntu EFI'ye yazarsa | Windows açılmaz  
| GRUB Windows EFI’ye kurulur | Güncelleme sonrası GRUB bozulabilir  
| EFI dizini karışırsa | Boot hataları, sistem çökmesi

---

## ✅ Koruma Stratejileri

1. **EFI alanını tanı ama kullanma**  
   - Linux kurulumunda EFI bölümünü “kullanma” olarak işaretle  
2. **GRUB’u ayrı EFI dizinine kur**  
   - `--efi-directory=/boot/efi` ile Linux’a özel EFI  
3. **Secure Boot devre dışı bırakılmalı**  
   - BIOS’tan kapat, sürücü uyumsuzlukları önlenir  
4. **Windows EFI yedeği alınmalı**  
   - `diskpart` ile EFI dizini yedeklenebilir  
5. **GRUB yapılandırması dikkatli yapılmalı**  
   - `os-prober` ile Windows algılatılmalı  
   - `grub-mkconfig` ile menü güncellenmeli

---

## 🧠 Enes’ten Notlar

- EFI dizini, sistemin kalbidir. Bozulursa tüm sistem etkilenir  
- Extended bölüm stratejisi EFI’ye dokunmadan Linux kurmak için idealdir  
- Windows’un EFI alanı, sadece Windows’a ait kalmalıdır

---

> “Dual boot’un en hassas noktası EFI’dir. Ona saygı göster, sistem seni ödüllendirir.” – Enes Köse
> 
