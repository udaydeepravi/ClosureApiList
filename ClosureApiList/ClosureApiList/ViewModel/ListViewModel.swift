//
//  ListViewModel.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var jsonResults = [Result]()
    var someApi = JsonAPI()
    func fetchData() {
        someApi.getUserData { data in
            DispatchQueue.main.async {
                self.jsonResults = data.results
            }
            print(data)
            return
        }
    }
}
