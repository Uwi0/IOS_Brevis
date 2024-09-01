import SwiftUI

struct HotKeyModel: Identifiable {
    let id = UUID()
    let modifiers: [Modifier]
    let character: String
    let text: String
    
    //TODO: Update description
    var description: String {
        "Decription - todo incomplete - \(modifiers) \(character.capitalized)" 
    }
}
