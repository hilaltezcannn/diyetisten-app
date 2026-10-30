import Foundation
import Observation

@Observable
final class ProfileViewModel {
    private let profileKey: String

    var profile: UserProfile {
        didSet { save() }
    }

    // Günlük özet ilk versiyonda örnek değerlerle basit tutulur.
    let consumedCalories = 1450
    let consumedProtein = 105
    let consumedCarbs = 160
    let carbGoal = 250
    let consumedFat = 45
    let fatGoal = 70

    init(user: AppUser) {
        profileKey = "userProfile.\(user.email)"
        if let data = UserDefaults.standard.data(forKey: profileKey),
           let saved = try? JSONDecoder().decode(UserProfile.self, from: data) {
            profile = saved
        } else {
            var profile = UserProfile.sample
            profile.name = user.name
            self.profile = profile
        }
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(profile) else { return }
        UserDefaults.standard.set(data, forKey: profileKey)
    }
}
