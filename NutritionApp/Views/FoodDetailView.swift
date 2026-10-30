import SwiftUI

struct FoodDetailView: View {
    @Environment(FoodViewModel.self) private var foodVM
    let food: Food

    var body: some View {
        let isFavorite = foodVM.isFavorite(food)

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(food.category.tint.opacity(0.15))
                    Text(food.emoji)
                        .font(.system(size: 110))
                }
                .frame(height: 220)

                VStack(alignment: .leading, spacing: 6) {
                    Text(food.category.rawValue.uppercased())
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(food.category.tint)
                    Text(food.name)
                        .font(.largeTitle.bold())
                    Text("\(food.portion) için")
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 10) {
                    NutritionValueView(icon: "🔥", title: "Kalori", value: "\(food.calories.formatted1) kcal", tint: .orange)
                    NutritionValueView(icon: "💪", title: "Protein", value: "\(food.protein.formatted1) g", tint: .appGreen)
                    NutritionValueView(icon: "🍞", title: "Karbonhidrat", value: "\(food.carbohydrates.formatted1) g", tint: .blue)
                    NutritionValueView(icon: "🥑", title: "Yağ", value: "\(food.fat.formatted1) g", tint: .yellow)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Hakkında").font(.headline)
                    Text(food.description)
                        .foregroundStyle(.secondary)
                }

                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        foodVM.toggleFavorite(food)
                    }
                } label: {
                    Label(isFavorite ? "Favorilerden Çıkar" : "Favorilere Ekle",
                          systemImage: isFavorite ? "heart.fill" : "heart")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(isFavorite ? Color.appGreen : .white)
                        .background(isFavorite ? Color.appGreen.opacity(0.15) : Color.appGreen,
                                    in: RoundedRectangle(cornerRadius: 16))
                }
                .sensoryFeedback(.success, trigger: isFavorite)
            }
            .padding()
        }
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    foodVM.toggleFavorite(food)
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FoodDetailView(food: FoodData.foods.first { $0.name == "Izgara Tavuk" }!)
    }
    .environment(FoodViewModel())
}
