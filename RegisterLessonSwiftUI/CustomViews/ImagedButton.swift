

import SwiftUI

struct ImagedButton: View {
  let imageName: String
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  var action:()->Void
  var body: some View {
    Button(action: action, label: {
      Image(imageName)
        .resizable()
        .frame(width: sw * 0.8,height: sh * 0.3)
        .scaledToFit()
        
    })
  }
}

