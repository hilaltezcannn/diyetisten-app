# Diyetisyen – Beslenme Takip Uygulaması

Yiyecek ve içeceklerin besin değerlerini (kalori, protein, karbonhidrat, yağ) gösteren, SwiftUI ile yazılmış basit bir iOS uygulaması.

## Özellikler

- Ana sayfa: karşılama, arama, kategoriler, öne çıkan ve popüler ürünler, günlük beslenme özeti
- Kategoriler ve kategoriye göre ürün listesi
- Ürün detay sayfası (100 g için besin değerleri)
- Ürün ismine göre arama
- Favorilere ekleme
- Üye olma ve giriş yapma (hesaplar cihazda saklanır, şifreler tuzlanmış SHA-256 özetiyle tutulur)
- Profil ve profil düzenleme (günlük kalori/protein hedefleri), çıkış yapma
- Profil ve favoriler her kullanıcı için ayrı olarak UserDefaults ile lokal saklanır

## Teknoloji

- Swift, SwiftUI, MVVM
- iOS 17+
- Backend yok; ürünler `Data/FoodData.swift` içinde lokal veri olarak tutulur

## Çalıştırma

`NutritionApp.xcodeproj` dosyasını Xcode ile açıp bir iPhone simülatörü seçin ve ▶︎ ile çalıştırın.

> Besin değerleri örnek amaçlıdır; gerçek kullanım için güvenilir bir besin veri kaynağıyla doğrulanmalıdır.
