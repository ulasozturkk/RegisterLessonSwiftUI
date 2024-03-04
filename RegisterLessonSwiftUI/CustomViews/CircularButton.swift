

import SwiftUI

struct CircularButton: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  let text : String
  var action : ()-> Void
    var body: some View {
      Button(action: action, label: {
        ZStack{
          RoundedRectangle(cornerRadius: sw / 2)
            .frame(width: sw * 0.8,height: sh * 0.1)
            .foregroundStyle(.orange)
          
          Text(text)
            .foregroundStyle(.white)
            .font(.title)
            .fontWeight(.bold)
        }
      })
    }
}

#Preview {
  CircularButton(text:"asd") {
    
  }
}
