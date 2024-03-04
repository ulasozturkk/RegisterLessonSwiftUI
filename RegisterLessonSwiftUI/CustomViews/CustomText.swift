

import SwiftUI

struct CustomText: View {
  let text: String
  let color : any ShapeStyle
  let font : Font?
  let fontWeight : Font.Weight
  var body: some View {
    Text(text)
      .font(font ?? .title)
      .fontWeight(fontWeight)
      .foregroundStyle(color)
  }
}
