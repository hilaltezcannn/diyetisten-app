import SwiftUI

struct LoginView: View {
    @Environment(AuthViewModel.self) private var authVM
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isShowingSignUp = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    AuthHeader(title: "Hoş Geldin", subtitle: "Beslenmeni takip etmek için giriş yap.")

                    VStack(spacing: 14) {
                        AuthTextField(icon: "envelope.fill", placeholder: "E-posta", text: $email,
                                      keyboard: .emailAddress, contentType: .emailAddress)
                        AuthTextField(icon: "lock.fill", placeholder: "Şifre", text: $password,
                                      isSecure: true, contentType: .password)
                    }

                    if let errorMessage {
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }

                    Button("Giriş Yap", action: login)
                        .buttonStyle(PrimaryButtonStyle())

                    HStack(spacing: 4) {
                        Text("Hesabın yok mu?")
                            .foregroundStyle(.secondary)
                        Button("Üye Ol") { isShowingSignUp = true }
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                }
                .padding()
            }
            .background(Color.appBackground)
            .scrollDismissesKeyboard(.interactively)
            .navigationDestination(isPresented: $isShowingSignUp) { SignUpView() }
        }
    }

    private func login() {
        do {
            try authVM.login(email: email, password: password)
        } catch {
            withAnimation { errorMessage = error.localizedDescription }
        }
    }
}

#Preview {
    LoginView()
        .environment(AuthViewModel())
}
