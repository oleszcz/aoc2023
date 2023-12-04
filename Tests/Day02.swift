import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day02Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """
  
  
  
  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "142")
  }

  func testPart2() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "281")
  }
  
  func testParsingGameId() {
    XCTAssertEqual(Day02.GameParser.idFrom(gameNumber: "Game 92"), 92)
  }
  
  func testParsingCube() {
    XCTAssertEqual(Day02.GameParser.cubes(from: "3 red"), Day02.Game.Cubes(count: 3, color: .red))
  }
}