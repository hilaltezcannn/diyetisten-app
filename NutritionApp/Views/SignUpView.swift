import SwiftUI

struct SignUpView: View {
    @Environment(AuthViewModel.self) private var authVM
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String?

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                AuthHeader(title: "Üye Ol", subtitle: "Birkaç bilgiyle hesabını oluştur.")

                VStack(spacing: 14) {
                    AuthTextField(icon: "person.fill", placeholder: "Ad", text: $name, contentType: .givenName)
                    AuthTextField(icon: "envelope.fill", placeholder: "E-posta", text: $email,
                                  keyboard: .emailAddress, contentType: .emailAddress)
                    AuthTextField(icon: "lock.fill", placeholder: "Şifre (en az 6 karakter)", text: $password,
                                  isSecure: true, contentType: .newPassword)
                    AuthTextField(icon: "lock.rotation", placeholder: "Şifre (tekrar)", text: $confirmPassword,
                                  isSecure: true, contentType: .newPassword)
                }

                if let errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }

                Button("Hesap Oluştur", action: signUp)
                    .buttonStyle(PrimaryButtonStyle())
            }
            .padding()
        }
        .background(Color.appBackground)
        .scrollDismissesKeyboard(.interactively)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func signUp() {
        do {
            try authVM.signUp(name: name, email: email, password: password, confirmPassword: confirmPassword)
        } catch {
            withAnimation { errorMessage = error.localizedDescription }
        }
    }
}

#Preview {
    NavigationStack { SignUpView() }
        .environment(AuthViewModel())
}
