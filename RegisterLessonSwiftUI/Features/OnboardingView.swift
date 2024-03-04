
import SwiftUI

struct OnboardingView: View {
  var body: some View {
    ZStack {
      Image(.background)
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
        
      VStack {
        Image(.iconpng)
          .resizable()
          .scaledToFit()
          .frame(height: 300)
            
        TitleText(text: "Register Your Lessons")
            
        TitleText(text: "Save your grades ")
            
        AngledButton(buttonText: "Sign In") {
          // nav
        }.padding()
        AngledButton(buttonText: "Sign up") {
          // nav
        }
      }
          
      Spacer()
    }
  }
}

#Preview {
  OnboardingView()
}
