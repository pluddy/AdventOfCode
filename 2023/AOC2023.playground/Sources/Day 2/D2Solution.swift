//import Foundation
//
//let gameRegex = /Game (?<game>\d*):\s/
//let setRegex = /(\d+ blue|\d+ red|\d+ green)(?:,\s*(\d+ blue|\d+ red|\d+ green))?(?:,\s*(\d+ blue|\d+ red|\d+ green))?/
//let countRegex = /(?<red>\d*) red|(?<green>\d*) green|(?<blue>\d*) blue/
//
//enum ParseError: Error {
//    case badInput
//}
//
//struct Game {
//    let id: Int
//    let sets: [Set]
//
//    init?(line: String) {
//        guard let gameMatch = try? gameRegex.firstMatch(in: line),
//            let id = Int(gameMatch.output.game) else {
//            return nil
//        }
//        self.id = id
//        var shortenedLine = line
//        shortenedLine.removeSubrange(gameMatch.range)
//        let setsStrings = shortenedLine.split(separator: "; ").map(String.init)
//        self.sets = setsStrings.compactMap(Set.init)
//    }
//
//    var maxRed: Int {
//        sets.map(\.red).max() ?? 0
//    }
//
//    var maxGreen: Int {
//        sets.map(\.green).max() ?? 0
//    }
//
//    var maxBlue: Int {
//        sets.map(\.blue).max() ?? 0
//    }
//
//    var power: Int {
//        maxRed * maxGreen * maxBlue
//    }
//}
//
//struct Set {
//    let red: Int
//    let green: Int
//    let blue: Int
//
//    init?(string: String) {
//        guard let setMatch = try? setRegex.firstMatch(in: string) else {
//            return nil
//        }
//        let matchStrings = [setMatch.output.1, setMatch.output.2, setMatch.output.3]
//                .compactMap { $0 }
//                .map(String.init)
//
//        let matches = matchStrings.compactMap { try? countRegex.firstMatch(in: $0) }
//
//        var red, green, blue: Int?
//        for match in matches {
//            if let redString = match.output.red, let redInt = Int(redString) {
//                red = redInt
//            }
//            if let greenString = match.output.green, let greenInt = Int(greenString) {
//                green = greenInt
//            }
//            if let blueString = match.output.blue, let blueInt = Int(blueString) {
//                blue = blueInt
//            }
//        }
//        self.red = red ?? 0
//        self.green = green ?? 0
//        self.blue = blue ?? 0
//    }
//
//    var power: Int {
//        red * green * blue
//    }
//}
//
//let lines = Day2.input.split(separator: "\n").map(String.init)
//
//let games = lines.compactMap(Game.init)
//
//let possibleGames = games.filter { $0.maxRed <= 12 && $0.maxGreen <= 13 && $0.maxBlue <= 14 }
//let sumIDs = possibleGames.reduce(0, { $0 + $1.id })
//
//print(sumIDs)
//
//let sumPower = games.reduce(0, { $0 + $1.power })
