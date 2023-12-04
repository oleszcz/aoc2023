import Algorithms

struct Day02: AdventDay {
  struct Game {
    enum Color: String {
      case red, green, blue
    }
    
    struct Cubes: Equatable {
      let count: Int
      let color: Color
    }
    
    let id: Int
    let draws: [[Cubes]]
    
    var isPossible: Bool {
      var red = 0
      var green = 0
      var blue = 0
      
      return true
    }
  }
  
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  // Splits input data into its component parts and convert from string.
  var entities: [String] {
    data.split(separator: "\n").map { String($0) }
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    return GameParser.game(from: entities.first!)
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    return "day 2 part 2"
    }
}

extension Day02 {
  enum GameParser {
    static func game(from str: String) -> Game {
      let initialSplit = str.split(separator: ":")
      let draws = initialSplit.last!
        .split(separator: ";")
        .map(String.init)
        .map(draws(from:))
      return .init(id: idFrom(gameNumber: .init(initialSplit.first!)), draws: draws)
    }
    
    static func idFrom(gameNumber: String) -> Int {
      Int(String(gameNumber.dropFirst(5))) ?? -1
    }
    
    static func draws(from str: String) -> [Game.Cubes] {
      str
        .split(separator: ",")
        .map { $0.trimmingCharacters(in: .whitespaces) }
        .compactMap { cubes(from: $0) }
    }
    
    static func cubes(from str: String) -> Game.Cubes? {
      let split = str.split(separator: " ")
      guard let color = Game.Color(rawValue: .init(split.last!)),
            let count = Int(String(split.first!)) else {
        return nil
      }
      return .init(count: count, color: color)
    }
  }
}


