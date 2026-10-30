import Foundation
import Observation

@Observable
final class FoodViewModel {
    private let favoritesKey: String

    let foods: [Food]
    var searchText = ""
    private(set) var favoriteNames: Set<String>

    init(userEmail: String, foods: [Food] = FoodData.foods) {
        self.foods = foods
        favoritesKey = "favoriteFoodNames.\(userEmail)"
        let saved = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        self.favoriteNames = Set(saved)
    }

    var featuredFoods: [Food] { foods.filter(\.isFeatured) }
    var popularFoods: [Food] { foods.filter(\.isPopular) }
    var favoriteFoods: [Food] { foods.filter { favoriteNames.contains($0.name) } }

    // İlk versiyonda arama sadece ürün ismine göre yapılır.
    var searchResults: [Food] {
        let query = searchText.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else { return [] }
        return foods.filter { $0.name.localizedStandardContains(query) }
    }

    func foods(in category: FoodCategory) -> [Food] {
        foods.filter { $0.category == category }
    }

    func isFavorite(_ food: Food) -> Bool {
        favoriteNames.contains(food.name)
    }

    func toggleFavorite(_ food: Food) {
        if favoriteNames.contains(food.name) {
            favoriteNames.remove(food.name)
        } else {
            favoriteNames.insert(food.name)
        }
        UserDefaults.standard.set(Array(favoriteNames), forKey: favoritesKey)
    }
}
