import SwiftUI

struct PhoneDialerScreenBaseline: View {
    @State var username = "Christian"
    @State var phoneNumber = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hello, \(username)!")

            Spacer()

            TextField(
                "Phone number",
                text: $phoneNumber
            )
            .keyboardType(.phonePad)

            Button("Press here to dial") {
                print("This is a test")
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    PhoneDialerScreenBaseline()
}
