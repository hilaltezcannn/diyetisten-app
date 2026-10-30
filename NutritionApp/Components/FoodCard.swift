import SwiftUI

struct FoodCard: View {
    let food: Food

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(food.category.tint.opacity(0.15))
                Text(food.emoji)
                    .font(.system(size: 54))
            }
            .frame(height: 96)

            Text(food.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(1)

            VStack(alignment: .leading, spacing: 4) {
                Text("🔥 \(food.calories.formatted1) kcal")
                Text("💪 \(food.protein.formatted1) g protein")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .padding(12)
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.06), radius: 8, y: 4)
    }
}

/// Liste görünümü için yatay ürün satırı.
struct FoodRow: View {
    let food: Food

    var body: some View {
        HStack(spacing: 14) {
            Text(food.emoji)
                .font(.system(size: 32))
                .frame(width: 56, height: 56)
                .background(food.category.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 4) {
                Text(food.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("P: \(food.protein.formatted1) g · K: \(food.carbohydrates.formatted1) g · Y: \(food.fat.formatted1) g")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text(food.calories.formatted1)
                    .font(.headline)
                    .foregroundStyle(Color.appGreen)
                Text("kcal")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(12)
        .background(.white, in: RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.05), radius: 6, y: 3)
    }
}

#Preview {
    FoodCard(food: FoodData.foods[0])
        .frame(width: 170)
        .padding()
}
