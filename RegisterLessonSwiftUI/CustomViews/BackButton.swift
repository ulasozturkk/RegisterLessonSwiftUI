//
//  BackButton.swift
//  RegisterLessonSwiftUI
//
//  Created by macbook pro on 4.03.2024.
//

import SwiftUI

struct BackButton: View {
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  var action : ()->()
    var body: some View {
      Button(action: {action()}, label: {
        ZStack {
          Circle()
            .frame(width: sW * 0.1)
            .foregroundColor(.orange)
          Image(systemName: "arrow.left")
            .foregroundColor(.white)
        }
      })
    }
}

#Preview {
  BackButton {
    
  }
}
