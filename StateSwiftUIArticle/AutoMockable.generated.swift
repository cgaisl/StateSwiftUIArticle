// Generated using Sourcery 2.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

class PhoneDialerScreenActionsMock: PhoneDialerScreenActions {
    // MARK: - inputPhoneNumber

    var inputPhoneNumberPhoneNumberCallsCount = 0
    var inputPhoneNumberPhoneNumberCalled: Bool {
        return inputPhoneNumberPhoneNumberCallsCount > 0
    }

    var inputPhoneNumberPhoneNumberReceivedPhoneNumber: String?
    var inputPhoneNumberPhoneNumberReceivedInvocations: [String] = []
    var inputPhoneNumberPhoneNumberClosure: ((String) -> Void)?

    func inputPhoneNumber(phoneNumber: String) {
        inputPhoneNumberPhoneNumberCallsCount += 1
        inputPhoneNumberPhoneNumberReceivedPhoneNumber = phoneNumber
        inputPhoneNumberPhoneNumberReceivedInvocations.append(phoneNumber)
        inputPhoneNumberPhoneNumberClosure?(phoneNumber)
    }

    // MARK: - onDialButtonPress

    var onDialButtonPressCallsCount = 0
    var onDialButtonPressCalled: Bool {
        return onDialButtonPressCallsCount > 0
    }

    var onDialButtonPressClosure: (() -> Void)?

    func onDialButtonPress() {
        onDialButtonPressCallsCount += 1
        onDialButtonPressClosure?()
    }
}
