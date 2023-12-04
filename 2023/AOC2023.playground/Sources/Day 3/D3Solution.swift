import Foundation

//let partRegex = /(?<id>\d*)/
//let symbolRegex = /(?<symbol>[^\.\d])/
//
//let lines = Day3.input.split(separator: "\n")
//
//class Part: Hashable {
//    let id: Int
//    let range: NSRange
//    let line: Int
//
//    var adjacentSymbol: Symbol?
//
//    init(id: Int, range: NSRange, line: Int, adjacentSymbol: Symbol? = nil) {
//        self.id = id
//        self.range = range
//        self.line = line
//        self.adjacentSymbol = adjacentSymbol
//    }
//
//    static func == (lhs: Part, rhs: Part) -> Bool {
//        lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//}
//
//class Symbol {
//    let symbol: String
//    let range: NSRange
//    let line: Int
//
//    var adjacentParts: Set<Part> = Set([])
//
//    init(symbol: String, range: NSRange, line: Int) {
//        self.symbol = symbol
//        self.range = range
//        self.line = line
//    }
//
//    var gearRatio: Int {
//        adjacentParts.reduce(1, { $0 * $1.id })
//    }
//}
//
//var parts: [Part] = []
//var symbols: [Symbol] = []
//for (index, line) in lines.enumerated() {
//    for match in line.matches(of: partRegex) {
//        guard let id = Int(match.output.id) else {
//            continue
//        }
//        parts.append(Part(id: id, range: NSRange(match.range, in: line), line: index))
//    }
//    for match in line.matches(of: symbolRegex) {
//        symbols.append(Symbol(symbol: String(match.output.symbol), range: NSRange(match.range, in: line), line: index))
//    }
//}
//
//for part in parts {
//    for symbol in symbols.filter({ ((part.line - 1)...(part.line + 1)).contains($0.line) }) {
//        if ((part.range.lowerBound - 1)..<(part.range.upperBound + 1)).contains(symbol.range.lowerBound) {
//            part.adjacentSymbol = symbol
//            symbol.adjacentParts.insert(part)
//        }
//    }
//}
//
//print(symbols.filter { $0.adjacentParts.count == 2 }.reduce(0, { $0 + $1.gearRatio }))
