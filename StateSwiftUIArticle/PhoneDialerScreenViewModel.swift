import AsyncAlgorithms
import Combine
import Foundation
import SwiftUI

// sourcery: AutoMockable
protocol PhoneDialerScreenActions {
    func inputPhoneNumber(phoneNumber: String)
    func onDialButtonPress()
}

// sourcery: @AutoCopy
struct PhoneDialerScreenState {
    let username: String
    let phoneNumber: String
}

enum PhoneDialerScreenSideEffects {
    case dial(phoneNumber: String)
}

class PhoneDialerScreenViewModel: ObservableObject, PhoneDialerScreenActions {
    @Published private(set) var state: PhoneDialerScreenState = .init(username: "", phoneNumber: "")
    let sideEffects = AsyncChannel<PhoneDialerScreenSideEffects>()
    
    private var tasks: [Task<Any, Error>] = []
    

    func loadUsername() {
        // pretend we are loading the username from an external database
        state = state.copy { $0.username = "Christian" }
    }

    func inputPhoneNumber(phoneNumber: String) {
        state = state.copy { $0.phoneNumber = phoneNumber }
    }

    func onDialButtonPress() {
        tasks.append(
            Task {
                await sideEffects.send(.dial(phoneNumber: state.phoneNumber))
            }
        )
    }
    
    // Gets called when the view disappears
    func cleanUp() {
        tasks.forEach { $0.cancel() }
    }
}
