import SwiftUI

struct HotkeyRow: View {
    
    let hotkeyModel: HotKeyModel
    let searchQuery: String
    
    let font: Font = Theme.font
    let fontSecondary: Font = Theme.fontSecondary
    let fontWeight: Font.Weight = Theme.fontWeight
    let hotKeyWidth = Theme.hotkeyWidth
    
    var charFound: Bool {
        let hotKeyChar = hotkeyModel.character.lowercased()
        return searchQuery.count == 1 && hotKeyChar == searchQuery.lowercased()
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIpad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    var body: some View {
        let layout = Theme.layout(isIpad: isIpad)
        
        layout { //TODO: Adapt for Mac and iPad
            HStack {
                if charFound {
                    Text("🔵").font(font)
                }
                Text(hotkeyModel.description)
                    .font(font)
                    .fontWeight(.semibold)
            }
            .frame(width: hotKeyWidth, alignment: .leading)
            
            Text(hotkeyModel.text.capitalized)
                .foregroundStyle(.secondary)
                .font(fontSecondary)
        }
        .foregroundStyle(charFound ? .blue : .black)
    }
}

#Preview {
    VStack {
        HotkeyRow(
            hotkeyModel: .init(modifiers: [.command],character: "b",text: "Build"),
            searchQuery: "b"
        )
        HotkeyRow(
            hotkeyModel: .init(modifiers: [.command],character: "b",text: "Build"),
            searchQuery: "r"
        )
    }
}
