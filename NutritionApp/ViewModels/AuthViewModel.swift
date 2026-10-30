import CryptoKit
import Foundation
import Observation

enum AuthError: LocalizedError {
    case emptyName
    case invalidEmail
    case weakPassword
    case passwordMismatch
    case emailTaken
    case wrongCredentials

    var errorDescription: String? {
        switch self {
        case .emptyName: "Lütfen adınızı girin."
        case .invalidEmail: "Lütfen geçerli bir e-posta adresi girin."
        case .weakPassword: "Şifre en az 6 karakter olmalıdır."
        case .passwordMismatch: "Şifreler eşleşmiyor."
        case .emailTaken: "Bu e-posta adresiyle zaten bir hesap var."
        case .wrongCredentials: "E-posta veya şifre hatalı."
        }
    }
}

/// İlk versiyonda backend olmadığı için üyelik bilgileri cihazda (UserDefaults) tutulur.
@Observable
final class AuthViewModel {
    private static let usersKey = "registeredUsers"
    private static let currentUserKey = "loggedInEmail"

    private var users: [AppUser]
    private(set) var currentUser: AppUser?

    init() {
        if let data = UserDefaults.standard.data(forKey: Self.usersKey),
           let saved = try? JSONDecoder().decode([AppUser].self, from: data) {
            users = saved
        } else {
            users = []
        }
        let email = UserDefaults.standard.string(forKey: Self.currentUserKey)
        currentUser = users.first { $0.email == email }
    }

    func signUp(name: String, email: String, password: String, confirmPassword: String) throws {
        let name = name.trimmingCharacters(in: .whitespaces)
        let email = Self.normalized(email)

        guard !name.isEmpty else { throw AuthError.emptyName }
        guard Self.isValidEmail(email) else { throw AuthError.invalidEmail }
        guard password.count >= 6 else { throw AuthError.weakPassword }
        guard password == confirmPassword else { throw AuthError.passwordMismatch }
        guard !users.contains(where: { $0.email == email }) else { throw AuthError.emailTaken }

        let salt = UUID().uuidString
        let user = AppUser(name: name, email: email, salt: salt, passwordHash: Self.hash(password, salt: salt))
        users.append(user)
        saveUsers()
        setCurrentUser(user)
    }

    func login(email: String, password: String) throws {
        let email = Self.normalized(email)
        guard let user = users.first(where: { $0.email == email }),
              user.passwordHash == Self.hash(password, salt: user.salt) else {
            throw AuthError.wrongCredentials
        }
        setCurrentUser(user)
    }

    func logout() {
        setCurrentUser(nil)
    }

    private func setCurrentUser(_ user: AppUser?) {
        currentUser = user
        UserDefaults.standard.set(user?.email, forKey: Self.currentUserKey)
    }

    private func saveUsers() {
        guard let data = try? JSONEncoder().encode(users) else { return }
        UserDefaults.standard.set(data, forKey: Self.usersKey)
    }

    private static func normalized(_ email: String) -> String {
        email.trimmingCharacters(in: .whitespaces).lowercased()
    }

    private static func isValidEmail(_ email: String) -> Bool {
        email.wholeMatch(of: #/[^@\s]+@[^@\s]+\.[^@\s]+/#) != nil
    }

    private static func hash(_ password: String, salt: String) -> String {
        let digest = SHA256.hash(data: Data((salt + password).utf8))
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}
