
import SwiftUI

struct SelectAvatarView: View {
  @Environment(\.presentationMode) var presentationMode
  @StateObject var VM = ProfileViewViewModel()
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  var body: some View {
    NavigationStack {
      ScrollView {
        ForEach(VM.images.indices, id: \.self) { index in
          VM.images[index]
            .resizable().frame(width: sw * 0.9, height: sh * 0.3)
            .padding()
            .onTapGesture {
              print("pressed \(index)")
              VM.saveUserImage(index: index)
              presentationMode.wrappedValue.dismiss()
            }
        }
      }

    }.onAppear {
      VM.setImageList(urlList: AvatarPaths.avatarURLS)
    }.navigationBarBackButtonHidden(true)
      .toolbar{
        ToolbarItem(placement: .topBarLeading) {
          BackButton {
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
  }
}

#Preview {
  SelectAvatarView()
}
