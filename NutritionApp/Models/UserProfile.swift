import Foundation

struct UserProfile: Codable, Equatable {
    var name: String
    var age: Int
    var height: Int
    var weight: Double
    var dailyCalorieGoal: Int
    var dailyProteinGoal: Int

    static let sample = UserProfile(
        name: "Hilal",
        age: 25,
        height: 180,
        weight: 80,
        dailyCalorieGoal: 2200,
        dailyProteinGoal: 150
    )
}
