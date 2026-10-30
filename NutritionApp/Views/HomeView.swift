import SwiftUI

struct HomeView: View {
    @Environment(FoodViewModel.self) private var foodVM
    @Environment(ProfileViewModel.self) private var profileVM

    var body: some View {
        @Bindable var foodVM = foodVM

        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    SearchBar(text: $foodVM.searchText)

                    if foodVM.searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                        categories
                        foodSection(title: "Öne Çıkanlar", foods: foodVM.featuredFoods)
                        dailySummary
                        foodSection(title: "Popüler Ürünler", foods: foodVM.popularFoods)
                    } else {
                        searchResults
                    }
                }
                .padding()
            }
            .background(Color.appBackground)
            .navigationDestination(for: Food.self) { FoodDetailView(food: $0) }
            .navigationDestination(for: FoodCategory.self) { CategoryFoodsView(category: $0) }
            .scrollDismissesKeyboard(.immediately)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Merhaba \(profileVM.profile.name) 👋")
                .font(.largeTitle.bold())
            Text("Bugün ne tüketmek istiyorsun?")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var categories: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Kategoriler").font(.title2.bold())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(FoodCategory.allCases) { category in
                        NavigationLink(value: category) {
                            CategoryChip(category: category)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    private func foodSection(title: String, foods: [Food]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).font(.title2.bold())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(foods) { food in
                        NavigationLink(value: food) {
                            FoodCard(food: food)
                                .frame(width: 170)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 2)
            }
        }
    }

    private var dailySummary: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Bugünkü Beslenme").font(.title2.bold())
            VStack(spacing: 14) {
                NutritionProgressView(title: "Kalori", current: profileVM.consumedCalories, goal: profileVM.profile.dailyCalorieGoal, unit: "kcal", tint: .orange)
                NutritionProgressView(title: "Protein", current: profileVM.consumedProtein, goal: profileVM.profile.dailyProteinGoal, unit: "g", tint: .appGreen)
                NutritionProgressView(title: "Karbonhidrat", current: profileVM.consumedCarbs, goal: profileVM.carbGoal, unit: "g", tint: .blue)
                NutritionProgressView(title: "Yağ", current: profileVM.consumedFat, goal: profileVM.fatGoal, unit: "g", tint: .yellow)
            }
            .padding(16)
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
        }
    }

    @ViewBuilder
    private var searchResults: some View {
        let results = foodVM.searchResults
        VStack(alignment: .leading, spacing: 12) {
            Text("Sonuçlar (\(results.count))").font(.title2.bold())
            if results.isEmpty {
                ContentUnavailableView.search(text: foodVM.searchText)
            } else {
                ForEach(results) { food in
                    NavigationLink(value: food) { FoodRow(food: food) }
                        .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(FoodViewModel(userEmail: "preview"))
        .environment(ProfileViewModel(user: AppUser(name: "Hilal", email: "preview", salt: "", passwordHash: "")))
}
