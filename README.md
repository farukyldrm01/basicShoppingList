# Alışveriş Listesi

iOS platformu için geliştirilmiş bir alışveriş listesi uygulaması. Ürün ekleme, görüntüleme ve silme özelliklerine sahiptir.

## 📱 Proje Hakkında

Bu proje, iOS geliştirme için UIKit ve Core Data kullanılarak oluşturulmuş bir alışveriş listesi uygulamasıdır. Kullanıcılar ürün ekleyebilir, ürün detaylarını görüntüleyebilir ve ürünleri silebilir.

## ✨ Özellikler

- ✅ Ürün ekleme (isim, fiyat, beden, görsel)
- 📋 Ürün listesini görüntüleme
- 🔍 Ürün detaylarını görüntüleme
- 🗑️ Ürün silme (swipe to delete)
- 📸 Fotoğraf galerisinden görsel seçme
- 💾 Core Data ile yerel veri saklama

## 🛠️ Teknolojiler

- **Platform**: iOS
- **Dil**: Swift
- **Framework**: UIKit
- **Veri Saklama**: Core Data
- **UI**: Storyboard
- **Minimum iOS Sürümü**: iOS 13.0+ (SceneDelegate kullanımı nedeniyle)

## 📂 Proje Yapısı

```
AlisverisListesi/
├── ViewController.swift          # Ana liste görünümü
├── DetailsViewController.swift   # Ürün detay/ekleme görünümü
├── AppDelegate.swift             # Core Data yapılandırması
├── SceneDelegate.swift           # Scene lifecycle yönetimi
├── Main.storyboard               # UI tasarımı
└── AlisverisListesi.xcdatamodeld # Core Data model tanımları
```

## 🗄️ Veri Modeli

Core Data'da **Alisveris** entity'si aşağıdaki özelliklere sahiptir:

- `isim` (String): Ürün adı
- `fiyat` (Integer 32): Ürün fiyatı
- `beden` (String): Ürün bedeni
- `gorsel` (Binary): Ürün görseli (JPEG formatında, %25 sıkıştırma)
- `id` (UUID): Benzersiz ürün kimliği

## 🚀 Kurulum

1. Projeyi Xcode ile açın:
   ```bash
   open AlisverisListesi.xcodeproj
   ```

2. Gerekli izinleri kontrol edin:
   - `Info.plist` dosyasında fotoğraf galerisi erişim izni tanımlıdır (`NSAppleMusicUsageDescription` - not: bu key yanlış, `NSPhotoLibraryUsageDescription` olmalı)

3. Projeyi derleyin ve çalıştırın (⌘R)

## 📖 Kullanım

### Ürün Ekleme
1. Ana ekrandaki **+** butonuna tıklayın
2. Ürün görseli seçmek için görsel alanına tıklayın
3. Ürün bilgilerini girin (isim, fiyat, beden)
4. **Kaydet** butonuna tıklayın

### Ürün Görüntüleme
- Ana listede bir ürüne tıklayarak detaylarını görüntüleyebilirsiniz

### Ürün Silme
- Ana listede bir ürünü sola kaydırarak silme seçeneğini görüntüleyin
- **Sil** butonuna tıklayın
- 
---

## 📝 English Summary

### Shopping List iOS App

A shopping list application for iOS platform built with UIKit and Core Data. Features include adding products with images, viewing product details, and deleting items.

**Key Features:**
- Add products (name, price, size, image)
- View product list
- View product details
- Delete products (swipe to delete)
- Select images from photo library
- Local data storage with Core Data

**Tech Stack:**
- Swift
- UIKit
- Core Data
- Storyboard

---

