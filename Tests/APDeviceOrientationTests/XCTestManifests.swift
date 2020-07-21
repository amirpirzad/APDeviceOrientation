import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(APDeviceOrientationTests.allTests),
    ]
}
#endif
