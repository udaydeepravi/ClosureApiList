//
//  ListViewModel.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation
import CoreData
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var errorMessage: String
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    @Published var result = [Results]()
    @Published var core = UserEntitys()
    @Published var hasError = false
    var someApi = NetWorking()
    
    func CoreDate(context: NSManagedObjectContext, results: [Results]) {
        
        results.forEach { user in
            let entity = UserEntitys(context: context)
            entity.gender = user.gender
            entity.picture = user.picture.large
            entity.dateOfBirth = user.dateOfBirth
            entity.email = user.email
            entity.first = user.name.first
            entity.last = user.name.last
            entity.phone = user.phone
        }
        SaveDate(context: context)
    }
    
    func fetchData(context: NSManagedObjectContext) {
        hasError = false
        someApi.getUserData { data in
            DispatchQueue.main.async { [self] in
                switch data {
                case .failure(let error):
                    self.hasError = true
                    self.errorMessage = error.description
                    print(error)
                case .success(let users):
//                    self.result = users.results
//                    print(result)
                    self.CoreDate(context: context, results: users.results)
                }
            }
        }
    }
}


extension ListViewModel {
    
    func SaveDate(context: NSManagedObjectContext) {
        do {
            // Save the data in Database
            try context.save()
            print("Data Saved in CoreStack")
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
