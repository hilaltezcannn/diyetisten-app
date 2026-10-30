import SwiftUI

struct FavoritesView: View {
    @Environment(FoodViewModel.self) private var foodVM

    var body: some View {
        Group {
            if foodVM.favoriteFoods.isEmpty {
                ContentUnavailableView(
                    "Henüz favorin yok",
                    systemImage: "heart",
                    description: Text("Ürün detayında ♡ Favorilere Ekle butonuna dokunarak ekleyebilirsin.")
                )
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(foodVM.favoriteFoods) { food in
                            NavigationLink(value: food) { FoodRow(food: food) }
                                .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .navigationTitle("Favorilerim")
    }
}
