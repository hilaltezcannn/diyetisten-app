import SwiftUI

struct CategoriesView: View {
    @Environment(FoodViewModel.self) private var foodVM

    private let columns = [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(FoodCategory.allCases) { category in
                        NavigationLink(value: category) {
                            CategoryCard(category: category, count: foodVM.foods(in: category).count)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .background(Color.appBackground)
            .navigationTitle("Kategoriler")
            .navigationDestination(for: FoodCategory.self) { CategoryFoodsView(category: $0) }
            .navigationDestination(for: Food.self) { FoodDetailView(food: $0) }
        }
    }
}

struct CategoryFoodsView: View {
    @Environment(FoodViewModel.self) private var foodVM
    let category: FoodCategory

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(foodVM.foods(in: category)) { food in
                    NavigationLink(value: food) { FoodRow(food: food) }
                        .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .background(Color.appBackground)
        .navigationTitle("\(category.emoji) \(category.rawValue)")
    }
}
