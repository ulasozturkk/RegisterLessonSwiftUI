
import SwiftUI

struct SignUpView: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @Environment(\.dismiss) var dismiss
  @State private var showingAlert = false
  @StateObject var VM = SignUpViewViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        CustomText(text: "Sign Up", color: Color.black, font: .title, fontWeight: .bold).padding(.bottom,100)
        
        VStack(alignment: .leading) {
          
          if VM.errorMesage != "" {
            CustomText(text: VM.errorMesage, color: Color.red, font: .title, fontWeight: .bold)
          }
            CustomText(text: "Username", color: Color.black, font: .subheadline, fontWeight: .medium)
            CustomTextField(text: $VM.username, placeholder: "Username")
            CustomText(text: "Password", color: Color.black, font: .subheadline, fontWeight: .medium)
            CustomSecurefield(text: $VM.password, placeholder: "Password")
            CustomText(text: "Confirm Password", color: Color.black, font: .subheadline, fontWeight: .medium)
            CustomSecurefield(text: $VM.confirmPassword, placeholder: "Confirm Password")
        }
        CircularButton(text: "Sign Up") {
          let success = VM.signUp()
          if success == true {
            showingAlert = true
            
          }
          

        }.padding(.top,100)
          .alert("Success", isPresented: $showingAlert) {
            Button("OK",role:.cancel){dismiss()}
          } message: {
            Text("your account created successfully")
          }

      }.toolbar{
        ToolbarItem(placement: .topBarLeading) {
          BackButton {
            dismiss()
          }
        }
      }.navigationBarBackButtonHidden(true)
    }
  }
}

#Preview {
  SignUpView()
}
