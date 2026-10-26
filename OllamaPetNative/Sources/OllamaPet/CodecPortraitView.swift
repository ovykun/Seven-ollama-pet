import AppKit
import SwiftUI

/// Loads a bundled still portrait for the Codec panel. Portraits remain static;
/// the chat transcript and speech controls provide the live interaction.
struct CodecPortraitView: View {
    let name: String

    var body: some View {
        Group {
            if let image = loadImage(named: name) {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFill()
                    .accessibilityLabel("Seven portrait: \(name)")
            } else {
                ZStack {
                    LinearGradient(colors: [Color(red: 0.25, green: 0.20, blue: 0.38), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                    VStack(spacing: 5) {
                        Image(systemName: "person.crop.square")
                            .font(.system(size: 22))
                        Text("SEVEN")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(.white.opacity(0.72))
                }
            }
        }
    }

    private func loadImage(named name: String) -> NSImage? {
        guard let url = Bundle.module.url(forResource: name, withExtension: "webp", subdirectory: "Codec") else {
            return nil
        }
        return NSImage(contentsOf: url)
    }
}
