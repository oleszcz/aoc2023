import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day03Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """
  
  func testPart1() throws {
    let challenge = Day03(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "4361")
  }

  func testPart2() throws {
    let challenge = Day03(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "2286")
  }
  
  func testParsingGameId() {
    XCTAssertTrue(true)
  }
  
  func testParsingCube() {
//    XCTAssertEqual(Day03.GameParser.cubes(from: "3 red"), Day03.Game.Cubes(count: 3, color: .red))
  }
}
