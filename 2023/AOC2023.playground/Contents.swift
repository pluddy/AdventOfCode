import Foundation
import RegexBuilder

let lineRegex = /Card +(?<id>\d+): (?<winning>[\d ]*) \| (?<chosen>[\d ]*)$/
let numberRegex = /(?<number>\d*)/

struct Card {
    let id: Int
    let winningNumbers: Set<Int>
    let chosenNumbers: Set<Int>

    var matches: Int {
        chosenNumbers.intersection(winningNumbers).count
    }

    var points: Int {
        switch matches {
        case 0:
            return 0
        case 1:
            return 1
        default:
            return Int(pow(2.0, Double(matches - 1)))
        }
    }
}

let lines = Day4.input.split(separator: "\n")

var cards: [Card] = []
for line in lines {
    guard let match = line.firstMatch(of: lineRegex),
        let id = Int(match.output.id) else {
        continue
    }
    let winning = match.output.winning
        .matches(of: numberRegex)
        .map(\.output.number)
        .compactMap { Int($0) }
    let chosen = match.output.chosen
        .matches(of: numberRegex)
        .map(\.output.number)
        .compactMap { Int($0) }
    let card = Card(id: id, winningNumbers: Set(winning), chosenNumbers: Set(chosen))
    cards.append(card)
}

var repeats = Array(repeating: 0, count: cards.count)

for (index, card) in cards.enumerated() where index + 1 < cards.endIndex {
    for _ in 0...repeats[index] {
        for repeatIndex in (index + 1)..<min((index + 1 + card.matches), cards.endIndex) {
            repeats[repeatIndex] += 1
        }
    }
}

print(repeats.reduce(0, { $0 + $1 }) + cards.count)
