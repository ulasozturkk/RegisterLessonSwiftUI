

import SwiftUI

struct TitleText: View {
  let text: String
  var body: some View {
    Text(text)
      .font(.title)
      .fontWeight(.bold)
      .foregroundStyle(.white)
  }
}
