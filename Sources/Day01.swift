import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  // Splits input data into its component parts and convert from string.
  var entities: [String] {
    data.split(separator: "\n").map { String($0) }
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    return entities.reduce(into: 0) { partialResult, line in
      let firstDigit = line.first { $0.isNumber }.flatMap { intFrom(character: $0) }
      let secondDigit = line.last { $0.isNumber }.flatMap { intFrom(character: $0) }
      let first = firstDigit ?? 0
      let second = secondDigit ?? 0
      partialResult += first * 10 + second
    }
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    return entities.reduce(into: 0) { partialResult, line in
      let first = firstNumberIn(line)
      let second = lastNumberIn(line)
      partialResult += first * 10 + second
    }
  }
}

private extension Day01 {
  enum SpelledOutNumber: String, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var intValue: Int {
      switch self {
      case .one:
        1
      case .two:
        2
      case .three:
        3
      case .four:
        4
      case .five:
        5
      case .six:
        6
      case .seven:
        7
      case .eight:
        8
      case .nine:
        9
      }
    }
  }
  
  func firstNumberIn(_ line: String) -> Int {
    var firstFind = 0
    var firstIndex = line.count + 1
    SpelledOutNumber.allCases.forEach {
      if let range = line.firstRange(of: $0.rawValue) {
        let index = range.lowerBound.utf16Offset(in: line)
        if index < firstIndex {
          firstFind = $0.intValue
          firstIndex = index
        }
      }
    }
    if let firstDigit = line.first(where: { $0.isNumber }) {
      let index = line.firstIndex(of: firstDigit)?.utf16Offset(in: line)
      if index! < firstIndex {
        firstFind = intFrom(character: firstDigit) ?? 0
      }
    }
    return firstFind
  }
  
  func lastNumberIn(_ line: String) -> Int {
    var firstFind = 0
    var firstIndex = line.count + 1
    let reversed = reversing(line)
    SpelledOutNumber.allCases.forEach {
      if let range = reversed.firstRange(of: reversing($0.rawValue)) {
        let index = range.lowerBound.utf16Offset(in: reversed)
        if index < firstIndex {
          firstFind = $0.intValue
          firstIndex = index
        }
      }
    }
    if let firstDigit = reversed.first(where: { $0.isNumber }) {
      let index = reversed.firstIndex(of: firstDigit)?.utf16Offset(in: reversed)
      if index! < firstIndex {
        firstFind = intFrom(character: firstDigit) ?? 0
      }
    }
    return firstFind
  }
  
  func intFrom(character: Character) -> Int? {
    return Int(String(character))
  }
  
  func reversing(_ string: String) -> String {
    String(string.reversed())
  }
}
