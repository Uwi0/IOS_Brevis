import SwiftUI

struct MainHotkeysView: View {
    
    @State private var searchQuery: String = ""
    var viewModel: HotkeyCategoryViewModel = HotkeyCategoryViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                List(viewModel.hotkeyCategories) { hotkeyCategory in
                    Text("Hello")
                }
            }
            .navigationTitle("XCode Hotkeys")
            .searchable(text: $searchQuery, prompt: "Search...")
        }
    }
}

#Preview {
    MainHotkeysView()
}
