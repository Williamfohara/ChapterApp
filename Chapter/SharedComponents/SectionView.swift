import SwiftUI

// Reusable section for Career, Hobbies, and Goals
struct SectionView: View {
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)

            Text(description)
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.horizontal, 20)
    }
}

