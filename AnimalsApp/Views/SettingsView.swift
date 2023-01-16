//
//  SettingsView.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import SwiftUI
struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("")) {
                        NavigationLink(destination: TermsConditionView()){
                            Button(action: {}) {
                                Text("Terms and Conditions")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    Section(header: Text("About")) {
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("Animals App")
                        }
                        
                        HStack {
                            Text("Software Version")
                            Spacer()
                            Text("0.0.2")
                        }
                    }
                }
                
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
