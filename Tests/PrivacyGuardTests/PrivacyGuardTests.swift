import XCTest
@testable import PrivacyGuard

final class PrivacyGuardTests: XCTestCase {
    func testPrivacyGuardManagerExists() throws {
        // Verify the main manager is accessible
        let manager = PrivacyGuardManager.shared
        XCTAssertNotNil(manager)
    }
    
    func testExample() throws {
        // Simple passing test
        XCTAssertTrue(true, "Basic test should pass")
    }
}