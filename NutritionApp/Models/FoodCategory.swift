import SwiftUI

enum FoodCategory: String, CaseIterable, Identifiable, Codable {
    case meals = "Yemekler"
    case vegetables = "Sebzeler"
    case fruits = "Meyveler"
    case drinks = "İçecekler"
    case meat = "Et & Tavuk"
    case dairy = "Süt Ürünleri"
    case breakfast = "Kahvaltılık"
    case snacks = "Atıştırmalıklar"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .meals: "🍗"
        case .vegetables: "🥬"
        case .fruits: "🍎"
        case .drinks: "🥤"
        case .meat: "🥩"
        case .dairy: "🥛"
        case .breakfast: "🍞"
        case .snacks: "🍫"
        }
    }

    var tint: Color {
        switch self {
        case .meals: .orange
        case .vegetables: .green
        case .fruits: .red
        case .drinks: .blue
        case .meat: .brown
        case .dairy: .cyan
        case .breakfast: .yellow
        case .snacks: .purple
        }
    }
}
