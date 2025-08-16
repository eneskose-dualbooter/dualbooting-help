#!/bin/bash
# recreate_grub.sh – GRUB Fix Script by Enes Köse
# Amaç: GRUB menüsünü yeniden oluşturmak ve OS-Prober desteğini aktif hale getirmek
# Gereksinimler: sudo yetkisi, update-grub veya grub-mkconfig komutu

echo "🔧 GRUB yapılandırması başlatılıyor..."

# OS-Prober kontrolü: Çoklu işletim sistemlerini algılamayı sağlar
if grep -q "GRUB_DISABLE_OS_PROBER=false" /etc/default/grub; then
    echo "✅ OS-Prober zaten aktif."
else
    echo "🔄 OS-Prober etkinleştiriliyor..."
    echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub > /dev/null
fi

# GRUB menüsünü güncelle
if command -v update-grub &> /dev/null; then
    sudo update-grub
elif command -v grub-mkconfig &> /dev/null; then
    sudo grub-mkconfig -o /boot/grub/grub.cfg
else
    echo "❌ GRUB güncelleme komutu bulunamadı!"
    exit 1
fi

echo "✅ GRUB menüsü başarıyla güncellendi."
