// Generated using Sourcery 2.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//  PhoneDialerScreenStateCopy.generated.swift
//

extension PhoneDialerScreenState {
    // A default style constructor for the .copy fn to use
    init(
        username: String,
        phoneNumber: String,
        // This is to prevent overriding the default init if it exists already
        forCopyInit _: Void? = nil
    ) {
        self.username = username
        self.phoneNumber = phoneNumber
    }

    // struct copy, lets you overwrite specific variables retaining the value of the rest
    // using a closure to set the new values for the copy of the struct
    func copy(build: (inout Builder) -> Void) -> PhoneDialerScreenState {
        var builder = Builder(original: self)
        build(&builder)
        return builder.toPhoneDialerScreenState()
    }

    struct Builder {
        var username: String
        var phoneNumber: String

        fileprivate init(original: PhoneDialerScreenState) {
            username = original.username
            phoneNumber = original.phoneNumber
        }

        fileprivate func toPhoneDialerScreenState() -> PhoneDialerScreenState {
            return PhoneDialerScreenState(
                username: username,
                phoneNumber: phoneNumber
            )
        }
    }
}
