import Algorithms
import Foundation

struct Day04: AdventDay {
  struct Stratchcard {
    let winningNumbers: Set<Int>
    let yourNumbers: Set<Int>
    
    var value: Decimal {
      let commonNumbersCount = winningNumbers.intersection(yourNumbers).count
      return commonNumbersCount == 0 ? 0 : pow(2, commonNumbersCount - 1)
    }
  }
  
  init(data: String) {
    self.data = data
    entities = data
      .split(separator: "\n")
      .map { String($0) }
  }
  
  
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  var entities: [String]
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    entities
      .map(ScratchcardParser.from(_:))
      .reduce(into: 0) { partialResult, stratchcard in
        partialResult += stratchcard.value
      }
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    "day 4 part 2"
  }
}

extension Day04 {
  enum ScratchcardParser {
    static func from(_ str: String) -> Day04.Stratchcard {
      let initialSplit = str.split(separator: "|")
      let leftSide = initialSplit.first!.split(separator: ":")
      let winningNumbers = leftSide.last!.split(separator: " ")
        .map { Int(String($0)) ?? -1 }
      let yourNumbers = initialSplit.last!.split(separator: " ")
        .map { Int(String($0)) ?? -1 }
      return .init(winningNumbers: .init(winningNumbers), yourNumbers: .init(yourNumbers))
    }
  }
}
