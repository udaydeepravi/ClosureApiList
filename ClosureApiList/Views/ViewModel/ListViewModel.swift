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
    
    @Published var errorMessage: String = ""
    @Published var core = UserEntitys()
    @Published var hasError = false
    @Published var savedData: Bool = false
    var someApi: NetWorking
    
    init(someApi: NetWorking) {
        self.someApi = someApi
    }
    
    func userFetch(context: NSManagedObjectContext, results: [Results]) {
        //Manages a collection of model objects
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
        //Fetching Data from API
        hasError = false
        someApi.getUserData { data in
            DispatchQueue.main.async { [self] in
                switch data {
                case .failure(let error):
                    self.hasError = true
                    self.errorMessage = error.description
                    print(error)
                case .success(let users):
                    self.userFetch(context: context, results: users.results)
                }
            }
        }
    }
}


extension ListViewModel {
    
    func SaveDate(context: NSManagedObjectContext) {
        // Save the data in Database
        do {
            try context.save()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
