# GRUB Kurtarma Rehberi – Enes Köse

Bu belge, GRUB menüsünü yeniden oluşturmak ve çoklu işletim sistemlerini algılamak için gereken adımları içerir. Özellikle dualboot sistemlerde OS-Prober desteği kritik öneme sahiptir.

---

## 🔧 Kullanılan Script

**scripts/recreate_grub.sh**  
Bu script, GRUB yapılandırmasını yeniden oluşturur ve OS-Prober desteğini aktif hale getirir.

### Komutlar:
```bash
sudo bash scripts/recreate_grub.sh
