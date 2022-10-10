//
//  ImageView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation
import SwiftUI

struct ImageView: View {
    
    var user: UserEntitys
    
    var body: some View {
        AsyncImage(url: URL(string: user.picture ?? "")) { image in
                image.resizable()
            } placeholder: {
                ZStack {
                    Image("users")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 96, height: 96)
                        .cornerRadius(20)
                        .foregroundColor(Color("CustomGray"))
                    ProgressView()
                }
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1))
            }
            .frame(width: 96, height: 96)
            .cornerRadius(20)
            .shadow(radius: 5)
    }
}
