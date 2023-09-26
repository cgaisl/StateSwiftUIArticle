@testable import StateSwiftUIArticle
import XCTest

final class PhoneDialerScreenViewModelTest: XCTestCase {
    func phoneDialerViewModelTest() throws {
        let viewModel = PhoneDialerScreenViewModel()

        // Trigger action
        viewModel.loadUsername()

        // Assert state
        XCTAssertEqual(viewModel.state.username, "Christian")

        // Trigger action
        viewModel.inputPhoneNumber(phoneNumber: "555-0123")

        // Assert state
        XCTAssertEqual(viewModel.state.phoneNumber, "555-0123")



        // capture side effects
        let sideEffectExpectation = expectation(description: "side effect should be triggered")
        Task {
            for await sideEffect in viewModel.sideEffects {
                if case let .dial(phoneNumber) = sideEffect {
                    XCTAssertEqual(phoneNumber, "555-0123")
                    sideEffectExpectation.fulfill()
                }
            }
        }
        
        // Trigger action
        viewModel.onDialButtonPress()
        
        // Wait for side effect assertion
        waitForExpectations(timeout: 1, handler: nil)
    }
}
