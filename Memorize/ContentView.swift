import SwiftUI

struct ContentView: View {
    let emojis = [1 : ["🇰🇷", "🇬🇷", "🇸🇪", "🇨🇦", "🇮🇹"],
                  2 : ["👻", "🐼", "🐇", "🐹", "🐈"],
                  3 : ["🏎️", "🚓", "🚕", "🚙", "🚑"]]
    @State var theme: Int = 1
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title).fontWeight(.medium)
            ScrollView {
                cardBuilder
            }
            Spacer()
            buttons
        }
        .foregroundColor(.teal)
        .padding([.top, .leading, .trailing])
    }
    
    var cardBuilder: some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 110))]) {
            var contents = emojis[theme]?.shuffled()
            ForEach(0..<emojis[theme]!.count, id: \.self) { index in
                CardView(Content: contents![index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            flagButton
            Spacer()
            animalButton
            Spacer()
            carButton
            Spacer()
        }
        .font(.title2)
        .padding(.horizontal)
    }

    func makeButton(Themes: Int, Symbol: String,
        text: String) -> some View {
        VStack {
            Button(action: {
                theme = Themes
            }, label: {
                Image (systemName: Symbol)
            })
            Text(text).font(.headline)
        }
    }
    
    var flagButton: some View {
        makeButton(Themes: 1, Symbol: "flag.fill", text: "Flags")
    }
    
    var animalButton: some View {
        makeButton(Themes: 2, Symbol: "teddybear.fill", text: "Animals")
    }
    
    var carButton: some View {
        makeButton(Themes: 3, Symbol: "car.fill", text: "Cars")
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
