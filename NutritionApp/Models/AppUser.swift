import Foundation

/// Cihazda kayıtlı kullanıcı. Şifre düz metin olarak değil, tuzlanmış SHA-256 özeti olarak saklanır.
struct AppUser: Codable, Equatable, Identifiable {
    let name: String
    let email: String
    let salt: String
    let passwordHash: String

    var id: String { email }
}
