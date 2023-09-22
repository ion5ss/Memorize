import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.teal)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let Card = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                Card.foregroundColor(Color.white.opacity(0))
                Card.strokeBorder()
                Text("👻").font(.largeTitle)
            } else {
                Card
            }
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
