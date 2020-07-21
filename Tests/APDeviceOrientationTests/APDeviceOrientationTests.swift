import XCTest
@testable import APDeviceOrientation

final class APDeviceOrientationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(APDeviceOrientation().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
