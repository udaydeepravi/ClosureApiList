//
//  PictureView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 12/10/22.
//

import SwiftUI

struct PictureView: View {
    
    var user: UserEntitys
    
    var body: some View {
        AsyncImage(url: URL(string: user.picture ?? "" )) { image in
            image.resizable()
        } placeholder: {
            ZStack {
                ProgressView()
                Image(systemName: "person.crop.square")
                    .resizable()
                    .frame(width: 350, height: 300)
            }
        }
        .scaledToFill()
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
