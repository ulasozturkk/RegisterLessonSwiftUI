
import SwiftUI

struct SignInView: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @Environment(\.dismiss) var dismiss
  @StateObject var VM = SignInViewViewModel()
  @State var changePage : Bool = false
  var body: some View {
    NavigationStack {
      VStack(alignment: .center) {
        CustomText(text: "Sign In", color: Color.black, font: .title, fontWeight: .bold).padding(.bottom,100)
        
        VStack(alignment: .leading) {
          if VM.errorMessage != "" {
            CustomText(text: VM.errorMessage, color: Color.red, font: .title, fontWeight: .bold)
          }
          
          CustomText(text: "Username", color: Color.black, font: .subheadline, fontWeight: .medium)
          CustomTextField(text: $VM.username, placeholder: "Username")
          CustomText(text: "Password", color: Color.black, font: .subheadline, fontWeight: .medium)
          CustomSecurefield(text: $VM.password, placeholder: "Password")
        }

        CircularButton(text: "Sign In") {
          let signInResult = VM.signIn()
          if signInResult == true {
            self.changePage = true
          }
        }.padding(.top,200)
          .navigationDestination(isPresented: $changePage, destination: {
            ContentView()
          })
          
          .toolbar{
          ToolbarItem(placement: .topBarLeading) {
            BackButton {
              dismiss()
            }
          }

        }.navigationBarBackButtonHidden(true)
        
      }
    }
  }
}

 
#Preview {
  SignInView()
}
