#!/bin/bash
# Enes Köse – GRUB Fix Script

echo "🔧 GRUB yapılandırması başlatılıyor..."

# os-prober aktif mi?
grep "GRUB_DISABLE_OS_PROBER=false" /etc/default/grub || echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub

# GRUB menüsünü güncelle
sudo update-grub || sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "✅ GRUB menüsü başarıyla güncellendi."
