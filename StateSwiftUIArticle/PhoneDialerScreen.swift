import SwiftUI

struct PhoneDialerScreen: View {
    @StateObject var viewModel = PhoneDialerScreenViewModel()

    var body: some View {
        PhoneDialerScreenContent(
            state: viewModel.state,
            actions: viewModel
        )
        .task {
            viewModel.loadUsername()

            for await sideEffect in viewModel.sideEffects {
                switch sideEffect {
                case let .dial(phoneNumber):
                    if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
        .onDisappear {
            viewModel.cleanUp()
        }
    }
}

struct PhoneDialerScreenContent: View {
    let state: PhoneDialerScreenState
    let actions: PhoneDialerScreenActions

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hello, \(state.username)!")

            Spacer()

            TextField(
                "Phone number",
                text: Binding(
                    get: {
                        state.phoneNumber
                    },
                    set: {
                        actions.inputPhoneNumber(phoneNumber: $0)
                    }
                )
            )
            .keyboardType(.phonePad)

            Button("Press here to dial") {
                actions.onDialButtonPress()
            }

            Spacer()
        }
        .padding()
    }
}


 #Preview {
    PhoneDialerScreenContent(
        state: .init(
            username: "username",
            phoneNumber: "555-0123"
        ),
        actions: PhoneDialerScreenActionsMock()
    )
 }
