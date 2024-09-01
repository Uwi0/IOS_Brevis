import SwiftUI

struct HotKeyModel: Identifiable {
    let id = UUID()
    let modifiers: [Modifier]
    let character: String
    let text: String
    
    //TODO: Update description
    var description: String {
        var result = ""
        for modifier in modifiers {
            result += modifier.rawValue
        }
        
        result += " \(character.capitalized)"
        
        return result
    }
}
