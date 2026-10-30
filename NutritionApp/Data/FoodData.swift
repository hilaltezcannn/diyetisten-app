import Foundation

// Besin değerleri örnek amaçlıdır; gerçek bir uygulamada güvenilir bir kaynakla doğrulanmalıdır.
enum FoodData {
    static let foods: [Food] = [
        // Yemekler
        Food(name: "Tavuklu Pilav", emoji: "🍛", category: .meals, calories: 190, protein: 10, carbohydrates: 25, fat: 5.5, description: "Pirinç ve tavuk etiyle hazırlanan, doyurucu bir ana yemektir.", isPopular: true),
        Food(name: "Mercimek Çorbası", emoji: "🥣", category: .meals, calories: 56, protein: 3.5, carbohydrates: 8.5, fat: 1.2, description: "Lif ve bitkisel protein açısından zengin, hafif bir çorbadır.", isFeatured: true),
        Food(name: "Makarna", emoji: "🍝", category: .meals, calories: 158, protein: 5.8, carbohydrates: 31, fat: 0.9, description: "Haşlanmış makarna; enerji veren karbonhidrat kaynağıdır."),
        Food(name: "Kuru Fasulye", emoji: "🫘", category: .meals, calories: 120, protein: 7, carbohydrates: 18, fat: 2.5, description: "Bitkisel protein ve lif açısından zengin geleneksel bir yemektir.", isPopular: true),
        Food(name: "Omlet", emoji: "🍳", category: .meals, calories: 154, protein: 11, carbohydrates: 0.7, fat: 12, description: "Yumurtayla hazırlanan, protein içeriği yüksek pratik bir yemektir."),
        Food(name: "Tavuk Salata", emoji: "🥗", category: .meals, calories: 110, protein: 14, carbohydrates: 4, fat: 4.5, description: "Izgara tavuk ve yeşilliklerle hazırlanan hafif bir salatadır.", isFeatured: true),

        // Sebzeler
        Food(name: "Domates", emoji: "🍅", category: .vegetables, calories: 18, protein: 0.9, carbohydrates: 3.9, fat: 0.2, description: "Düşük kalorili, C vitamini ve likopen içeren bir sebzedir."),
        Food(name: "Salatalık", emoji: "🥒", category: .vegetables, calories: 15, protein: 0.7, carbohydrates: 3.6, fat: 0.1, description: "Su oranı çok yüksek, ferahlatıcı ve düşük kalorili bir sebzedir."),
        Food(name: "Brokoli", emoji: "🥦", category: .vegetables, calories: 34, protein: 2.8, carbohydrates: 7, fat: 0.4, description: "Lif, C ve K vitamini açısından zengin bir sebzedir.", isFeatured: true),
        Food(name: "Havuç", emoji: "🥕", category: .vegetables, calories: 41, protein: 0.9, carbohydrates: 10, fat: 0.2, description: "Beta-karoten açısından zengin, tatlı bir kök sebzedir."),
        Food(name: "Ispanak", emoji: "🥬", category: .vegetables, calories: 23, protein: 2.9, carbohydrates: 3.6, fat: 0.4, description: "Demir, folat ve K vitamini içeren yeşil yapraklı bir sebzedir."),
        Food(name: "Patates", emoji: "🥔", category: .vegetables, calories: 77, protein: 2, carbohydrates: 17, fat: 0.1, description: "Nişasta açısından zengin, enerji veren bir sebzedir."),

        // Meyveler
        Food(name: "Elma", emoji: "🍎", category: .fruits, calories: 52, protein: 0.3, carbohydrates: 14, fat: 0.2, description: "Lif içeriği yüksek, pratik bir ara öğün meyvesidir.", isPopular: true),
        Food(name: "Muz", emoji: "🍌", category: .fruits, calories: 89, protein: 1.1, carbohydrates: 23, fat: 0.3, description: "Potasyum açısından zengin, hızlı enerji veren bir meyvedir.", isFeatured: true, isPopular: true),
        Food(name: "Portakal", emoji: "🍊", category: .fruits, calories: 47, protein: 0.9, carbohydrates: 12, fat: 0.1, description: "C vitamini açısından zengin, sulu bir narenciyedir."),
        Food(name: "Çilek", emoji: "🍓", category: .fruits, calories: 32, protein: 0.7, carbohydrates: 7.7, fat: 0.3, description: "Düşük kalorili, antioksidan içeren bir meyvedir."),
        Food(name: "Karpuz", emoji: "🍉", category: .fruits, calories: 30, protein: 0.6, carbohydrates: 7.6, fat: 0.2, description: "Su oranı yüksek, serinletici bir yaz meyvesidir."),

        // İçecekler
        Food(name: "Su", emoji: "💧", category: .drinks, calories: 0, protein: 0, carbohydrates: 0, fat: 0, portion: "100 ml", description: "Vücudun temel ihtiyacı; kalori içermez."),
        Food(name: "Ayran", emoji: "🥛", category: .drinks, calories: 37, protein: 1.7, carbohydrates: 2.5, fat: 2, portion: "100 ml", description: "Yoğurt ve sudan yapılan, ferahlatıcı geleneksel bir içecektir.", isPopular: true),
        Food(name: "Kahve", emoji: "☕️", category: .drinks, calories: 2, protein: 0.1, carbohydrates: 0, fat: 0, portion: "100 ml", description: "Şekersiz sade kahve; neredeyse hiç kalori içermez."),
        Food(name: "Çay", emoji: "🍵", category: .drinks, calories: 1, protein: 0, carbohydrates: 0.3, fat: 0, portion: "100 ml", description: "Şekersiz demlenmiş çay; antioksidan içerir."),
        Food(name: "Portakal Suyu", emoji: "🧃", category: .drinks, calories: 45, protein: 0.7, carbohydrates: 10, fat: 0.2, portion: "100 ml", description: "C vitamini içeren, doğal şeker oranı yüksek bir içecektir."),

        // Et & Tavuk
        Food(name: "Izgara Tavuk", emoji: "🍗", category: .meat, calories: 165, protein: 31, carbohydrates: 0, fat: 3.6, description: "Yüksek protein içeriğine sahip, düşük karbonhidratlı bir besindir.", isFeatured: true, isPopular: true),
        Food(name: "Kırmızı Et", emoji: "🥩", category: .meat, calories: 250, protein: 26, carbohydrates: 0, fat: 15, description: "Protein, demir ve B12 vitamini açısından zengindir."),
        Food(name: "Köfte", emoji: "🍖", category: .meat, calories: 230, protein: 17, carbohydrates: 6, fat: 15, description: "Kıyma ile hazırlanan, protein içeren popüler bir yemektir."),
        Food(name: "Somon", emoji: "🐟", category: .meat, calories: 208, protein: 20, carbohydrates: 0, fat: 13, description: "Omega-3 yağ asitleri açısından zengin bir balıktır."),

        // Süt Ürünleri
        Food(name: "Süt", emoji: "🥛", category: .dairy, calories: 61, protein: 3.2, carbohydrates: 4.8, fat: 3.3, portion: "100 ml", description: "Kalsiyum ve protein açısından zengin bir içecektir."),
        Food(name: "Yoğurt", emoji: "🍶", category: .dairy, calories: 61, protein: 3.5, carbohydrates: 4.7, fat: 3.3, description: "Probiyotik içeren, sindirim dostu bir süt ürünüdür."),
        Food(name: "Beyaz Peynir", emoji: "🧀", category: .dairy, calories: 264, protein: 14, carbohydrates: 4, fat: 21, description: "Kahvaltıların vazgeçilmezi; kalsiyum ve protein içerir."),
        Food(name: "Kefir", emoji: "🥛", category: .dairy, calories: 52, protein: 3.4, carbohydrates: 4.5, fat: 2, portion: "100 ml", description: "Fermente, probiyotik açısından zengin bir süt içeceğidir."),

        // Kahvaltılık
        Food(name: "Yumurta", emoji: "🥚", category: .breakfast, calories: 155, protein: 13, carbohydrates: 1.1, fat: 11, description: "Kaliteli protein kaynağı, besleyici bir kahvaltılıktır.", isPopular: true),
        Food(name: "Tam Buğday Ekmeği", emoji: "🍞", category: .breakfast, calories: 247, protein: 13, carbohydrates: 41, fat: 3.4, description: "Beyaz ekmeğe göre daha fazla lif içerir."),
        Food(name: "Yulaf", emoji: "🥣", category: .breakfast, calories: 389, protein: 17, carbohydrates: 66, fat: 7, description: "Lif açısından zengin, uzun süre tok tutan bir tahıldır.", isFeatured: true),
        Food(name: "Zeytin", emoji: "🫒", category: .breakfast, calories: 115, protein: 0.8, carbohydrates: 6, fat: 11, description: "Sağlıklı tekli doymamış yağlar içerir."),
        Food(name: "Bal", emoji: "🍯", category: .breakfast, calories: 304, protein: 0.3, carbohydrates: 82, fat: 0, description: "Doğal şeker kaynağıdır; ölçülü tüketilmelidir."),

        // Atıştırmalıklar
        Food(name: "Badem", emoji: "🌰", category: .snacks, calories: 579, protein: 21, carbohydrates: 22, fat: 50, description: "E vitamini ve sağlıklı yağlar açısından zengin bir kuruyemiştir."),
        Food(name: "Bitter Çikolata", emoji: "🍫", category: .snacks, calories: 546, protein: 4.9, carbohydrates: 61, fat: 31, description: "Kakao oranı yüksek; antioksidan içerir, ölçülü tüketilmelidir."),
        Food(name: "Ceviz", emoji: "🥜", category: .snacks, calories: 654, protein: 15, carbohydrates: 14, fat: 65, description: "Omega-3 açısından zengin bir kuruyemiştir."),
        Food(name: "Patlamış Mısır", emoji: "🍿", category: .snacks, calories: 387, protein: 13, carbohydrates: 78, fat: 4.5, description: "Yağsız hazırlandığında lifli ve hafif bir atıştırmalıktır."),
    ]
}
