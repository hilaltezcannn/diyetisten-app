import SwiftUI

struct ProfileView: View {
    @Environment(ProfileViewModel.self) private var profileVM
    @Environment(FoodViewModel.self) private var foodVM
    @State private var isEditing = false

    var body: some View {
        let profile = profileVM.profile

        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        Text(String(profile.name.prefix(1)).uppercased())
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 96, height: 96)
                            .background(Color.appGreen, in: Circle())
                        Text(profile.name).font(.title.bold())
                    }
                    .padding(.top, 8)

                    HStack(spacing: 12) {
                        stat(title: "Yaş", value: "\(profile.age)")
                        stat(title: "Boy", value: "\(profile.height) cm")
                        stat(title: "Kilo", value: "\(profile.weight.formatted1) kg")
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Günlük Hedefler").font(.title3.bold())
                        NutritionValueView(icon: "🔥", title: "Kalori", value: "\(profile.dailyCalorieGoal.formatted()) kcal", tint: .orange)
                        NutritionValueView(icon: "💪", title: "Protein", value: "\(profile.dailyProteinGoal) g", tint: .appGreen)
                    }

                    NavigationLink {
                        FavoritesView()
                    } label: {
                        HStack {
                            Image(systemName: "heart.fill").foregroundStyle(.red)
                            Text("Favorilerim").font(.headline)
                            Spacer()
                            Text("\(foodVM.favoriteFoods.count)").foregroundStyle(.secondary)
                            Image(systemName: "chevron.right").foregroundStyle(.tertiary)
                        }
                        .padding(16)
                        .background(.white, in: RoundedRectangle(cornerRadius: 16))
                    }
                    .buttonStyle(.plain)

                    Button {
                        isEditing = true
                    } label: {
                        Label("Profili Düzenle", systemImage: "pencil")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.appGreen, in: RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding()
            }
            .background(Color.appBackground)
            .navigationTitle("Profil")
            .navigationDestination(for: Food.self) { FoodDetailView(food: $0) }
            .sheet(isPresented: $isEditing) {
                EditProfileView(profile: profile) { profileVM.profile = $0 }
            }
        }
    }

    private func stat(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(value).font(.headline)
            Text(title).font(.caption).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
    }
}
