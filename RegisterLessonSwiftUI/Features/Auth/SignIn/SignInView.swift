
import SwiftUI

struct SignInView: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @Environment(\.dismiss) var dismiss
  @State var username: String = ""
  @State var password: String = ""
  var body: some View {
    NavigationStack {
      VStack(alignment: .center) {
        CustomText(text: "Sign In", color: Color.black, font: .title, fontWeight: .bold).padding(.bottom,100)
        
        VStack(alignment: .leading) {
          CustomText(text: "Username", color: Color.black, font: .subheadline, fontWeight: .medium)
          CustomTextField(text: $username, placeholder: "Username")
        }
        
        VStack(alignment: .leading) {
          CustomText(text: "Password", color: Color.black, font: .subheadline, fontWeight: .medium)
          CustomTextField(text: $password, placeholder: "Password")
        }
        
          
        CircularButton(text: "Sign In") {}.padding(.top,200) 
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
