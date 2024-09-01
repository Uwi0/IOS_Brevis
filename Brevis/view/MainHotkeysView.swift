import SwiftUI

struct MainHotkeysView: View {
    
    @State private var searchQuery: String = ""
    var viewModel: HotkeyCategoryViewModel = HotkeyCategoryViewModel()
    
    let listStyle = Theme.listStyle
    
    var body: some View {
        NavigationStack {
            Form {
                List(viewModel.hotkeyCategories) { hotkeyCategory in
                    HotkeySectionView(
                        hotKeyCategoryName: hotkeyCategory.name,
                        hotkeyModels: hotkeyCategory.hotkeyModels,
                        searchQuery: searchQuery
                    )
                }
                .listStyle(listStyle)
            }
            .navigationTitle("XCode Hotkeys")
            .searchable(text: $searchQuery, prompt: "Search...")
            
            KeySymbolView()
        }
        .frame(minWidth: Theme.frameWithd, minHeight: Theme.frameHeight)
    }
}

#Preview {
    MainHotkeysView()
}
