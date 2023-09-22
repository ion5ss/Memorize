import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp: false)
            CardView()
            CardView()
        }
        .foregroundColor(.teal)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp = true
    var body: some View {
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color.white.opacity(0))
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder()
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
