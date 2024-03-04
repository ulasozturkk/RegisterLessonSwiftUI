

import SwiftUI

struct TabBarView: View {
    var body: some View {
      TabView {
        LessonListView()
          .tabItem { Label("Lesson List", systemImage: "list.bullet.clipboard") }
        
        GradeEntryView()
          .tabItem { Label("Grade Entry",systemImage: "pencil.tip.crop.circle.badge.plus") }
        
        SettingsView()
          .tabItem { Label("Settings",systemImage: "gearshape") }
        
        ProfileView()
          .tabItem { Label("Profile",systemImage: "person.crop.circle") }
      }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}
