
import SwiftUI

struct OnboardingView: View {
  @State var isGoingSignIn = false
  @State var isGoingSignUp = false
  var body: some View {
    NavigationStack {
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
              
          CustomText(text: "Register Your Lessons",color: Color.white,font: .title,fontWeight: .bold)
              
          CustomText(text: "Save your grades ",color:Color.white,font: .title,fontWeight: .bold)
              
          NavigationLink(destination:SignInView()) {
            AngledNavigationText(buttonText: "Sign In")
          }
          NavigationLink(destination:SignUpView()) {
            AngledNavigationText(buttonText: "Sign Up")
          }
        }
            
        Spacer()
      }
    }
  }
}

#Preview {
  OnboardingView()
}
