import SwiftUI

@main
struct NutritionApp: App {
    @State private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(authViewModel)
                .tint(.appGreen)
        }
    }
}

/// Giriş yapılmamışsa giriş ekranını, yapılmışsa uygulamanın kendisini gösterir.
struct RootView: View {
    @Environment(AuthViewModel.self) private var authVM

    var body: some View {
        Group {
            if let user = authVM.currentUser {
                MainTabView(user: user)
                    .id(user.email)
                    .transition(.opacity)
            } else {
                LoginView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: authVM.currentUser)
    }
}

struct MainTabView: View {
    @State private var foodViewModel: FoodViewModel
    @State private var profileViewModel: ProfileViewModel

    init(user: AppUser) {
        _foodViewModel = State(initialValue: FoodViewModel(userEmail: user.email))
        _profileViewModel = State(initialValue: ProfileViewModel(user: user))
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Ana Sayfa", systemImage: "house.fill") }
            CategoriesView()
                .tabItem { Label("Kategoriler", systemImage: "square.grid.2x2.fill") }
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person.fill") }
        }
        .environment(foodViewModel)
        .environment(profileViewModel)
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
