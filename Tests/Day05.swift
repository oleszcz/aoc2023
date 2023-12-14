import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day05Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    seeds: 79 14 55 13

    seed-to-soil map:
    50 98 2
    52 50 48

    soil-to-fertilizer map:
    0 15 37
    37 52 2
    39 0 15

    fertilizer-to-water map:
    49 53 8
    0 11 42
    42 0 7
    57 7 4

    water-to-light map:
    88 18 7
    18 25 70

    light-to-temperature map:
    45 77 23
    81 45 19
    68 64 13

    temperature-to-humidity map:
    0 69 1
    1 0 69

    humidity-to-location map:
    60 56 37
    56 93 4
    """
  
  func testPart1() throws {
    let challenge = Day05(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "13")
  }

  func testPart2() throws {
    let challenge = Day05(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "30")
  }
    
    func testPart2_penultimateWinningLine() throws {
        let aTestData = """
          Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
          Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
          Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
          Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
          Card 5: 87 83 26 28 32 | 88 30 70 32 93 22 82 36
          Card 6: 31 18 13 56 74 | 70 77 10 23 35 67 36 11
          """
        let challenge = Day05(data: aTestData)
        XCTAssertEqual(String(describing: challenge.part2()), "44")
    }
}
