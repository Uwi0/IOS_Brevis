import SwiftUI

struct KeySymbolView: View {
    var body: some View {
        let modifierSize = Modifier.allCases.count
        var midleIndex: Int {
            modifierSize / 2 + 1
        }
        
        HStack(alignment: .top) {
            KeySymbolColumnView(lowerIndex: 0, upperIndex: midleIndex)
            KeySymbolColumnView(lowerIndex: midleIndex, upperIndex: modifierSize)
        }
    }
}

struct KeySymbolColumnView: View {
    
    let lowerIndex: Int
    let upperIndex: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(lowerIndex ..< upperIndex, id: \.self) { i in
                KeyValueRow(modifier: Modifier.allCases[i])
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct KeyValueRow: View {
    
    let modifier: Modifier
    
    //TODO: Use Theme
    let modifierFont: Font = .body
    
    var body: some View {
        Text("\(modifier.rawValue) = \(modifier.description)")
            .font(modifierFont)
    }
}


#Preview {
    KeySymbolView()
}
