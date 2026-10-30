import Foundation

struct Food: Identifiable, Hashable {
    let id: UUID
    let name: String
    let emoji: String
    let category: FoodCategory
    let calories: Double
    let protein: Double
    let carbohydrates: Double
    let fat: Double
    let portion: String
    let description: String
    var isFeatured: Bool = false
    var isPopular: Bool = false

    init(
        id: UUID = UUID(),
        name: String,
        emoji: String,
        category: FoodCategory,
        calories: Double,
        protein: Double,
        carbohydrates: Double,
        fat: Double,
        portion: String = "100 g",
        description: String,
        isFeatured: Bool = false,
        isPopular: Bool = false
    ) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.category = category
        self.calories = calories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
        self.portion = portion
        self.description = description
        self.isFeatured = isFeatured
        self.isPopular = isPopular
    }
}
