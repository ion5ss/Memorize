import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
