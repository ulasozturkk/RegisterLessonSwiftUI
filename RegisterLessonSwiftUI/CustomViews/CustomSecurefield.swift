

import SwiftUI

struct CustomSecurefield: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @Binding var text : String
  let placeholder: String
    var body: some View {
      SecureField(placeholder, text: $text)
        .frame(width: sw * 0.9, height: sh * 0.05)
        .textFieldStyle(.roundedBorder)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
    }
}
