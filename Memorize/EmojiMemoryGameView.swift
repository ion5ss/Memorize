import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis: Array = ["🇰🇷", "🇬🇷", "🇸🇪", "🇨🇦", "🇮🇹"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title).fontWeight(.medium)
            ScrollView {
                cardBuilder
            }
        }
        .foregroundColor(.teal)
        .padding([.top, .leading, .trailing])
    }
    
    var cardBuilder: some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 110))]) {
            let contents = emojis.shuffled()
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(Content: contents[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
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
