import SwiftUI

/// Ana sayfadaki yatay kategori butonu.
struct CategoryChip: View {
    let category: FoodCategory

    var body: some View {
        VStack(spacing: 6) {
            Text(category.emoji)
                .font(.system(size: 28))
                .frame(width: 60, height: 60)
                .background(category.tint.opacity(0.15), in: Circle())
            Text(category.rawValue)
                .font(.caption)
                .foregroundStyle(.primary)
                .lineLimit(1)
        }
        .frame(width: 78)
    }
}

/// Kategoriler ekranındaki ızgara kartı.
struct CategoryCard: View {
    let category: FoodCategory
    let count: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(category.emoji)
                .font(.system(size: 40))
            Spacer(minLength: 0)
            Text(category.rawValue)
                .font(.headline)
                .foregroundStyle(.primary)
            Text("\(count) ürün")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
        .padding(16)
        .background(category.tint.opacity(0.14), in: RoundedRectangle(cornerRadius: 20))
    }
}
