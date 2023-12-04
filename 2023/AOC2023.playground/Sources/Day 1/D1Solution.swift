//import Foundation
//import RegexBuilder
//
//extension Day1 {
//    static func solve() {
//        let regex = Regex {
//            Capture {
//                ChoiceOf {
//                    "one"
//                    "two"
//                    "three"
//                    "four"
//                    "five"
//                    "six"
//                    "seven"
//                    "eight"
//                    "nine"
//                    One(.digit)
//                }
//            }
//        }
//        let regexReverse = Regex {
//            Capture {
//                ChoiceOf {
//                    "eno"
//                    "owt"
//                    "eerht"
//                    "ruof"
//                    "evif"
//                    "xis"
//                    "neves"
//                    "thgie"
//                    "enin"
//                    One(.digit)
//                }
//            }
//        }
//        enum ProcessingError: Error {
//            case invalidDigits
//        }
//
//        enum Digits: String {
//            case one = "one"
//            case two = "two"
//            case three = "three"
//            case four = "four"
//            case five = "five"
//            case six = "six"
//            case seven = "seven"
//            case eight = "eight"
//            case nine = "nine"
//
//            case oneRev = "eno"
//            case twoRev = "owt"
//            case threeRev = "eerht"
//            case fourRev = "ruof"
//            case fiveRev = "evif"
//            case sixRev = "xis"
//            case sevenRev = "neves"
//            case eightRev = "thgie"
//            case nineRev = "enin"
//
//            var value: Int {
//                switch self {
//                case .one, .oneRev: 1
//                case .two, .twoRev: 2
//                case .three, .threeRev: 3
//                case .four, .fourRev: 4
//                case .five, .fiveRev: 5
//                case .six, .sixRev: 6
//                case .seven, .sevenRev: 7
//                case .eight, .eightRev: 8
//                case .nine, .nineRev: 9
//                }
//            }
//        }
//
//        let lines = Day1.input.split(separator: "\n")
//        var calibrationValue = 0
//        for line in lines {
//            let lineReversed = String(line.reversed())
//            guard let firstMatchRange = line.firstMatch(of: regex)?.range,
//                  let lastMatchRange = lineReversed.firstMatch(of: regexReverse)?.range else {
//                throw ProcessingError.invalidDigits
//            }
//            let firstMatchString = line[firstMatchRange]
//            let lastMatchString = lineReversed[lastMatchRange]
//
//            guard let digit1 = Digits(rawValue: String(firstMatchString))?.value ?? Int(firstMatchString),
//                  let digit2 = Digits(rawValue: String(lastMatchString))?.value ?? Int(lastMatchString),
//                  let value = Int("\(digit1)\(digit2)") else {
//                throw ProcessingError.invalidDigits
//            }
//            calibrationValue += value
//        }
//
//        print(calibrationValue)
//    }
//}
