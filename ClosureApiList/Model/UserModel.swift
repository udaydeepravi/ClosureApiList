//
//  UserModel.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation
struct UserModel: Codable {
    let results: [Result]
}

struct Result: Codable, Identifiable {
    var id: String {
        return name!.first
    }
    let gender: String
    let name: Name?
    let email: String
    let login: Login?
    let phone, cell: String
    let picture: Picture?
}

struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

struct Name: Codable {
    let title, first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
