import SwiftUI

struct ContentView: View {
    let emojis = [1 : ["🇰🇷", "🇬🇷", "🇸🇪", "🇨🇦", "🇮🇹"],
                  2 : ["👻", "🐼", "🐇", "🐹", "🐈"],
                  3 : ["🏎️", "🚓", "🚕", "🚙", "🚑"]]
    @State var theme: Int = 1
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                CardBuilder(theme: theme)
            }
            Spacer()
            buttons
        }
        .foregroundColor(.teal)
        .padding()
    }
    
    func CardBuilder(theme: Int) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 110))]) {
            ForEach(0..<emojis[theme]!.count, id: \.self) { index in
                CardView(Content: emojis[theme]![index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var buttons: some View {
        HStack {
            
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
