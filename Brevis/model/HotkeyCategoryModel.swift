import Foundation


struct HotkeyCategoryModel: Identifiable {
    let id = UUID()
    let name: String
    let hotkeyModels: [HotKeyModel]
}
