# Diyetisyen – Beslenme Takip Uygulaması

Yiyecek ve içeceklerin besin değerlerini (kalori, protein, karbonhidrat, yağ) gösteren, SwiftUI ile yazılmış basit bir iOS uygulaması.

## Özellikler

- Ana sayfa: karşılama, arama, kategoriler, öne çıkan ve popüler ürünler, günlük beslenme özeti
- Kategoriler ve kategoriye göre ürün listesi
- Ürün detay sayfası (100 g için besin değerleri)
- Ürün ismine göre arama
- Favorilere ekleme
- Profil ve profil düzenleme (günlük kalori/protein hedefleri)
- Profil ve favoriler UserDefaults ile lokal olarak saklanır

## Teknoloji

- Swift, SwiftUI, MVVM
- iOS 17+
- Backend yok; ürünler `Data/FoodData.swift` içinde lokal veri olarak tutulur

## Çalıştırma

`NutritionApp.xcodeproj` dosyasını Xcode ile açıp bir iPhone simülatörü seçin ve ▶︎ ile çalıştırın.

> Besin değerleri örnek amaçlıdır; gerçek kullanım için güvenilir bir besin veri kaynağıyla doğrulanmalıdır.
