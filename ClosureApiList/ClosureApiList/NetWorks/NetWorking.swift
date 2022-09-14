//
//  JsonAPI.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation

class NetWorking {
    func getUserData(completion: @escaping(Result<UserModel, NetWorkErrors>) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else {
            let error = NetWorkErrors.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
                do {
                    let response = try urlResponse(error: error, response: response)
                    print(response)
                } catch {
                    print(error.localizedDescription)
                }
            guard response != nil else {
                return
            }
            guard let safeData = data else {
                return
            }
            do {
                let decodedData = try decodingData(data: safeData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetWorkErrors.badURL))
            }
        }
        task.resume()
    }
}

func urlResponse(error: Error?, response: URLResponse?) throws -> Bool {
    guard let error = error as? URLError else {
        throw NetWorkErrors.unknown
    }
    if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
        throw NetWorkErrors.badResponse(statusCode: response.statusCode)
    }
    return true
}

func decodingData(data: Data) throws -> UserModel {
    let decoder = JSONDecoder()
    let fetch = try decoder.decode(UserModel.self, from: data)
    return fetch
}
