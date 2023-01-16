//
//  HomeView.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: AnimalsViewModel = AnimalsViewModel(service: ApiServiceImplementation())
    @State private var searchAnimalName: String = ""
    var body: some View {
        NavigationView {
            List(viewModel.filteredItems) { item in
                NavigationLink(destination: AnimalItemDetailsView(animal: item)) {
                    AnimalItemView(animal: item)
                }
            }
            .navigationBarTitle("Animals")
        }
        .searchable(text: $searchAnimalName, prompt: Text("Search by Name"))
        .onChange(of: searchAnimalName) { value in
            let search = value.trimmingCharacters(in: .whitespaces)
            viewModel.filterValues(search: search)
        }
        .onAppear() {
            viewModel.getAllAnimals()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
