import SwiftUI

struct HotkeySectionView: View {
    let hotKeyCategoryName: String
    let hotkeyModels: [HotKeyModel]
    let searchQuery: String
    
    let sectionHeaderFont: Font = Theme.sectionHeaderFont
    let fontWeight: Font.Weight = Theme.fontWeight
    let subtitleColor: Color = Theme.subtitleColor
    
    var filterHotkeysModels: [HotKeyModel] {
        if searchQuery.count <= 1 {
            return hotkeyModels
        } else {
            let query = searchQuery.lowercased()
            return hotkeyModels.filter {
                $0.text.lowercased().contains(query)
            }
        }
    }
    
    var body: some View {
        if !filterHotkeysModels.isEmpty {
            Section {
                ForEach(filterHotkeysModels) { hotKeyModel in
                    HotkeyRow(hotkeyModel: hotKeyModel, searchQuery: searchQuery)
                }
            } header: {
                Text(hotKeyCategoryName)
                    .font(sectionHeaderFont)
                    .fontWeight(fontWeight)
                    .foregroundStyle(subtitleColor)
            }
        }
    }
}

#Preview {
    Form {
        HotkeySectionView(
            hotKeyCategoryName: "Navigation",
            hotkeyModels: [
                .init(modifiers: [.command],character: "b",text: "Build"),
                .init(modifiers: [.command],character: "r",text: "Run"),
                .init(modifiers: [.command],character: ".",text: "Stop"),
                .init(modifiers: [.command, .shift],character: "k",text: "Clean build folder"),
            ],
            searchQuery: ""
        )
    }
}
