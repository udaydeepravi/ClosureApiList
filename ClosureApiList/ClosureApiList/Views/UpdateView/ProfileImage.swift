//
//  ProfileImage.swift
//  ClosureApiList
//
//  Created by Udaydeep on 12/10/22.
//

import SwiftUI

struct ProfileImage: View {
    
    var user: UserEntitys
    
    var body: some View {
        
        AsyncImage(url: URL(string: user.picture ?? "" )) { image in
            image.resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(100).overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.white, lineWidth: 3))
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 380, height: 200, alignment: .center)
    }
}

