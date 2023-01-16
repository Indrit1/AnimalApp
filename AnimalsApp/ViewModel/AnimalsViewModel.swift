//
//  AnimalsViewModel.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Combine
import Foundation

protocol FetchData {
    func getAllAnimals()
}

class AnimalsViewModel: ObservableObject, FetchData {
    
    private let service: APIService
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: ResultState = .loading
    @Published var filteredItems = [Animal]()
    var animals = [Animal]() {
        didSet {
            filterValues(search: "")
        }
    }
    
    init(service: APIService) {
        self.service = service
    }
    
    func filterValues(search: String){
        if search.isEmpty {
            filteredItems = animals.sorted(by: {$0.name < $1.name })
        } else {
            let animalsList = animals.filter({ item in
                return item.name.localizedCaseInsensitiveContains(search)
            })
            filteredItems = animalsList.sorted(by: {$0.name < $1.name })
        }
    }
    
    func getAllAnimals() {
        self.state = .loading
        let cancellable = service
            .getAllAnimals(from: .getAnimalsEN)
            .sink {[weak self] res in
                
                guard let self =  self else { return }
                switch res {
                case .finished:
                    self.state = .success(content: self.animals)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: {[weak self] result in
                
                guard let self =  self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    print(result.count)
                    self.animals = result
                }
            }
        self.cancellables.insert(cancellable)
    }
}
