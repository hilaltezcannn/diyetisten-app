import SwiftUI

@main
struct NutritionApp: App {
    @State private var foodViewModel = FoodViewModel()
    @State private var profileViewModel = ProfileViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(foodViewModel)
                .environment(profileViewModel)
                .tint(.appGreen)
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Ana Sayfa", systemImage: "house.fill") }
            CategoriesView()
                .tabItem { Label("Kategoriler", systemImage: "square.grid.2x2.fill") }
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person.fill") }
        }
    }
}

extension Color {
    static let appGreen = Color(red: 0.20, green: 0.66, blue: 0.40)
    static let appBackground = Color(red: 0.96, green: 0.98, blue: 0.96)
}

extension Double {
    /// 3.6 → "3.6", 31 → "31"
    var formatted1: String {
        formatted(.number.precision(.fractionLength(0...1)))
    }
}
