//
//  ListViewModel.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var errorMessage: String
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    @Published var result = [Results]()
    @Published var hasError = false
    var someApi = NetWorking()
    
    func fetchData() {
        hasError = false
        someApi.getUserData { data in
            DispatchQueue.main.async {
                switch data {
                case .failure(let error):
                    self.hasError = true
                    self.errorMessage = error.description
                    print(error)
                case .success(let users):
                    self.result = users.results
                }
            }
        }
    }
}
