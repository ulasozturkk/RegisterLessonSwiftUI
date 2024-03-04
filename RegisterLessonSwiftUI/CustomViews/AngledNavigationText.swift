
import SwiftUI

struct AngledNavigationText: View {
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  let buttonText : String
  
    var body: some View {
      
        ZStack{
          RoundedRectangle(cornerRadius: 12)
            .frame(width: sW * 0.9, height: sH * 0.08)
            .foregroundStyle(.white)
            .buttonStyle(.bordered)
          
          Text(buttonText)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.black)
        }
      
    }
}

#Preview {
  AngledNavigationText(buttonText:"asd") 
}
