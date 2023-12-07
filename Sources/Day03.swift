import Algorithms
import Foundation

struct Day03: AdventDay {
  init(data: String) {
    self.data = data
    entities = data
      .split(separator: "\n")
      .map { String($0) }
      .map { Array($0) }
    symbols = entities
      .flatMap { $0 }
      .filter { $0 != "." && !$0.isWholeNumber }
  }
  
  
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  var entities: [[Character]]

  let symbols: [Character]
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var result = 0
    for i in entities.indices {
      var cluster: Cluster?
      for j in entities[i].indices {
        let currentCharacter = entities[i][j]
        if currentCharacter.isWholeNumber {
          if cluster == nil {
            cluster = .init(i: i, j: j, value: currentCharacter)
          } else {
            cluster?.append(j: j, value: currentCharacter)
          }
        } else if let aCluster = cluster {
          if !filteredNeighbors(for: aCluster).isEmpty {
            result += aCluster.intValue
          }
          cluster = nil
        }
      }
      if let aCluster = cluster {
        if !filteredNeighbors(for: aCluster).isEmpty {
          result += aCluster.intValue
        }
        cluster = nil
      }
    }
    return result
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var result = 0
    for i in entities.indices {
      var cluster: Cluster?
      for j in entities[i].indices {
        let currentCharacter = entities[i][j]
        if currentCharacter == "*" {
          
        }
      }
    }
    return result
  }
  
  func neighbors(for cluster: Cluster) -> [Character] {
    var neighbors = [Character]()
    if cluster.i > 0 {
      let i = cluster.i - 1
      neighbors.append(contentsOf: entities[i][extended(jRange: cluster.jRange)])
    }
    if cluster.jRange.lowerBound > 0 {
      let j = cluster.jRange.lowerBound - 1
      neighbors.append(entities[cluster.i][j])
    }
    if cluster.jRange.upperBound < 0 {
      let j = cluster.jRange.lowerBound + 1
      neighbors.append(entities[cluster.i][j])
    }
    let j = cluster.jRange.upperBound + 1
    if j < entities.first!.count {
      neighbors.append(entities[cluster.i][j])
    }
    let i = cluster.i + 1
    if i < entities.count {
      neighbors.append(contentsOf: entities[i][extended(jRange: cluster.jRange)])
    }
    return neighbors
  }
  
  func filteredNeighbors(for cluster: Cluster) -> [Character] {
    neighbors(for: cluster).filter { symbols.contains($0) }
  }
  
  func extended(jRange: ClosedRange<Int>) -> ClosedRange<Int> {
    let extentedRange = (jRange.lowerBound - 1)...(jRange.upperBound + 1)
    return extentedRange.clamped(to: ClosedRange(entities.first!.indices))
  }
}

extension Day03 {
  struct Cluster {
    let i: Int
    private(set) var jRange: ClosedRange<Int>
    
    private var value: String
        
    var intValue: Int {
      Int(value) ?? -1
    }
    
    init(i: Int, j: Int, value: Character) {
      self.i = i
      self.jRange = j...j
      self.value = String(value)
    }
    
    mutating func append(j: Int, value: Character) {
      jRange = jRange.lowerBound...j
      self.value.append(.init(value))
    }
    
    func validate(using neighbors: [Character]) -> Bool {
      let filteredNeighbors = neighbors.filter { $0 != "." && ($0.isPunctuation || $0.isSymbol || $0.isMathSymbol) }
      return !filteredNeighbors.isEmpty
    }
  }
  
  struct GearCluster {
    
  }
}
