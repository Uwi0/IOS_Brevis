import SwiftUI

struct HotkeySectionView: View {
    let hotKeyCategoryName: String
    let hotkeyModels: [HotKeyModel]
    let searchQuery: String
    
    //TODO: Use a Theme
    let sectionHeaderFont: Font = .body
    let fontWeight: Font.Weight = .semibold
    let sectionHeaderColor: Color = .red
    
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
                    .foregroundStyle(sectionHeaderColor)
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
