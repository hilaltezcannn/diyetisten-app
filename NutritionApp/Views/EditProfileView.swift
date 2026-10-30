import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var draft: UserProfile
    let onSave: (UserProfile) -> Void

    init(profile: UserProfile, onSave: @escaping (UserProfile) -> Void) {
        _draft = State(initialValue: profile)
        self.onSave = onSave
    }

    private var isValid: Bool {
        !draft.name.trimmingCharacters(in: .whitespaces).isEmpty
            && (1...120).contains(draft.age)
            && (50...250).contains(draft.height)
            && (20...300).contains(draft.weight)
            && draft.dailyCalorieGoal > 0
            && draft.dailyProteinGoal > 0
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Kişisel Bilgiler") {
                    TextField("Ad", text: $draft.name)
                    numberRow("Yaş", value: $draft.age, unit: "")
                    numberRow("Boy", value: $draft.height, unit: "cm")
                    HStack {
                        Text("Kilo")
                        Spacer()
                        TextField("Kilo", value: $draft.weight, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                        Text("kg").foregroundStyle(.secondary)
                    }
                }
                Section("Günlük Hedefler") {
                    numberRow("Kalori hedefi", value: $draft.dailyCalorieGoal, unit: "kcal")
                    numberRow("Protein hedefi", value: $draft.dailyProteinGoal, unit: "g")
                }
                if !isValid {
                    Section {
                        Text("Lütfen tüm alanları geçerli değerlerle doldurun.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Profili Düzenle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Vazgeç") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        draft.name = draft.name.trimmingCharacters(in: .whitespaces)
                        onSave(draft)
                        dismiss()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }

    private func numberRow(_ title: String, value: Binding<Int>, unit: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            TextField(title, value: value, format: .number)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .frame(width: 80)
            if !unit.isEmpty {
                Text(unit).foregroundStyle(.secondary)
            }
        }
    }
}
