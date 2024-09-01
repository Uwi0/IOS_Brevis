import SwiftUI

struct HotKeyModel: Identifiable {
    let id = UUID()
    let modifier: [Modifier] //TODO: Create Modifier data type
    let character: String
    let text: String
    
    var description: String {
        "Decription - todo incomplete - \(modifier) \(character.capitalized)" 
    }
}
