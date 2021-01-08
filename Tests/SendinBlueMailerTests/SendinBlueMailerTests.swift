import XCTest
@testable import SendinBlueMailer

final class SendinBlueMailerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SendinBlueMailer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
