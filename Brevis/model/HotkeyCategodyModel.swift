import Foundation


struct HotkeyCatgeoryModel: Identifiable {
    let id = UUID()
    let name: String
    let hotkeyModel: [HotKeyModel]
}
