import SwiftUI

struct ContentView: View {
    let Emojis: [String] = ["👻", "🐼", "🐇", "🐈"]
    @State var CardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjusters
        }
        .foregroundColor(.teal)
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 110))]) {
            ForEach(0..<CardCount, id: \.self) { index in
                CardView(Content: Emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardAdjusters: some View {
        HStack {
            minus
            Spacer()
            plus
        }
        .font(.largeTitle)
    }
    
    func CardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            CardCount += offset
        }, label: {
            Image (systemName: symbol)
        })
        .disabled(CardCount + offset < 1 || CardCount + offset > Emojis.count)
    }
    
    var minus: some View {
        CardCountAdjusters(by: -1, symbol: "minus.square")
    }
    
    var plus: some View {
        CardCountAdjusters(by: 1, symbol: "plus.square")
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let Content: String
    var body: some View {
        ZStack {
            let Card = RoundedRectangle(cornerRadius: 12)
            Group {
                Card.foregroundColor(Color.white.opacity(0))
                Card.strokeBorder()
                Text(Content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            Card.fill().opacity(isFaceUp ? 0:1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
