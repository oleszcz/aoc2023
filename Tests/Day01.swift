import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """
  
  let testDataPart2 = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """
  
  func testFirstLine() {
    let challenge = Day01(data: "1abc2")
    XCTAssertEqual(String(describing: challenge.part1()), "12")
  }
  
  func testSecondLine() {
    let challenge = Day01(data: "pqr3stu8vwx")
    XCTAssertEqual(String(describing: challenge.part1()), "38")
  }
  
  func testTwoLines() {
    let data = """
    1abc2
    pqr3stu8vwx
    """
    let challenge = Day01(data: data)
    XCTAssertEqual(String(describing: challenge.part1()), "50")
  }
  
  func testMultipleDigits() {
    let challenge = Day01(data: "qoneight367gqbpbtbffivetlhrdjgnml2d")
    XCTAssertEqual(String(describing: challenge.part1()), "32")
  }
  
  func testSingleDigit() {
    let challenge = Day01(data: "da1ta")
    XCTAssertEqual(String(describing: challenge.part1()), "11")
  }
  
  func testNoDigits() {
    let challenge = Day01(data: "data")
    XCTAssertEqual(String(describing: challenge.part1()), "0")
  }
  
  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "142")
  }

  func testPart2() throws {
    let challenge = Day01(data: testDataPart2)
    XCTAssertEqual(String(describing: challenge.part2()), "281")
  }
  
  func testPart2SingleLine() {
    let challenge = Day01(data: "two1nine")
    XCTAssertEqual(String(describing: challenge.part2()), "29")
  }
}
