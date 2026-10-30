import SwiftUI

struct NutritionValueView: View {
    let icon: String
    let title: String
    let value: String
    let tint: Color

    var body: some View {
        HStack(spacing: 14) {
            Text(icon)
                .font(.title2)
                .frame(width: 48, height: 48)
                .background(tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
            Text(title)
                .font(.body)
            Spacer()
            Text(value)
                .font(.headline)
                .foregroundStyle(tint)
        }
        .padding(12)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
    }
}

/// Günlük özet için ilerleme çubuğu.
struct NutritionProgressView: View {
    let title: String
    let current: Int
    let goal: Int
    let unit: String
    let tint: Color

    private var progress: Double {
        guard goal > 0 else { return 0 }
        return min(Double(current) / Double(goal), 1)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title).font(.subheadline.weight(.medium))
                Spacer()
                Text("\(current.formatted()) / \(goal.formatted()) \(unit)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ProgressView(value: progress)
                .tint(tint)
        }
    }
}
