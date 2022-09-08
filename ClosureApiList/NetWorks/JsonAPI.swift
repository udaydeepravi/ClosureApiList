//
//  JsonAPI.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation

class JsonAPI {
    func getUserData(completion: @escaping (UserModel) -> ()) {
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else {
            print("Invalid Url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            do {
                let users = try JSONDecoder().decode(UserModel.self, from: data!)
                completion(users)
            } catch {
                print(error)
            }
        }.resume()
    }
}
