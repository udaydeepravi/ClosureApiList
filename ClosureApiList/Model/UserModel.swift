//
//  UserModel.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation
struct UserModel: Codable {
    let results: [Results]
}

struct Results: Codable, Identifiable {
    
    var id: String {
        return name.first
    }
    
    let gender: String
    let name: Name
    let email: String
    let dob, registered: DateTime?
    let phone, cell: String
    let picture: Picture
}

struct Name: Codable {
    let title, first, last: String
}

struct DateTime: Codable {
    let date: String?
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}

extension Results {
    
    var dateOfBirth: Date? {
        get {
            return DateUtils.parse(self.dob?.date)
        }
    }
    
    var registeredTime: Date? {
        get {
            return DateUtils.parse(self.registered?.date)
        }
    }
    
    var fullName: String {
        get {
            return "\(self.name.first) \(self.name.last)".trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    var genderEmoji: String? {
        if gender == "Male" || gender == "male" {
            return "♂️"
        } else if gender == "Female" || gender == "female" {
            return "♀️"
        } else {
            return nil
        }
    }
    
    var avatarUrl: URL? {
        URL(string: picture.large)
    }
}
