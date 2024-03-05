
import SwiftUI

struct ProfileView: View {
  @StateObject var VM = ProfileViewViewModel()
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @State var changePage = false
  var body: some View {
    NavigationStack {
      VStack {
        
        if VM.selectedImage == nil {
          ImagedButton(imageName: "selectImage") {
            changePage = true
          }.background(NavigationLink("", destination: SelectAvatarView(), isActive: $changePage))
        }else {
          VM.selectedImage!
            .resizable()
            .frame(width: sw * 0.8 ,height: sh * 0.3)
        }
        
        
        CircularButton(text: "Change Password", action: {}, backGroundColor: .orange)
        CircularButton(text: "Log Out", action: {}, backGroundColor: .red)
          
      }.navigationTitle("Profile")
        .onAppear{
          print("olustu")
          VM.loadUserImage()
        }
    }
  }
}

#Preview {
  ProfileView()
}
