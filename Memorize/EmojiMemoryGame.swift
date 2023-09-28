import SwiftUI

@Observable class EmojiMemoryGame {
    private var model = createMemoryGame()
    
    private static let emojis = ["🇰🇷", "🇬🇷", "🇸🇪", "🇨🇦", "🇮🇹"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
