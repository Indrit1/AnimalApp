//
//  HeadingView.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import SwiftUI

struct CustomHeadingView: View {
  var image: String
  var text: String

  var body: some View {
    HStack {
      Image(systemName: image)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(text)
        .font(.title3)
        .fontWeight(.bold)
    }
    .padding(.vertical)
  }
}
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeadingView(image: "", text: "title")
    }
}
