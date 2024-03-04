
import SwiftUI

struct ProfileView: View {
  @StateObject var VM = ProfileViewViewModel()
  @State var showingSheet = false
  var body: some View {
    NavigationStack {
      VStack {
        CircularButton(text: "Change Password", action: {}, backGroundColor: .orange)
        CircularButton(text: "Log Out", action: {}, backGroundColor: .red)
          
      }.navigationTitle("Profile")
    }
  }
}

#Preview {
  ProfileView()
}
