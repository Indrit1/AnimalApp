//
//  AnimalItemView.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import SwiftUI

struct AnimalItemView: View {
    var animal: Animal
    var body: some View {
        
        VStack{
            HStack {
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                
                VStack(alignment: .leading, spacing: 1){
                    HStack{
                        VStack(alignment: .leading, spacing: 6){
                            Text(animal.name)
                                .font(RalewayFont.title2)
                                .foregroundColor(.black)
                            Text(animal.headline)
                                .foregroundColor(.black)
                                .opacity(0.9)
                                .font(RalewayFont.footnote2)
                                .lineLimit(1)
                        }
                    }
                    
                    Text(animal.description)
                        .lineLimit(4)
                        .font(RalewayFont.footnoteSmall)
                        .opacity(0.6)
                        .padding([.bottom,.top], 4)
                        .lineLimit(3)
                    
                }.padding(.trailing, 4)
            }
        }.cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.15), lineWidth: 1)
            )
    }
}
struct AnimalItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalItemView(animal: Animal(id: "Lion", name: "Lion", headline: "Animals", description: "", link: "", image: "", gallery: [""], fact: [""]))
    }
}
