//
//  ImageView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import Foundation
import SwiftUI

struct ImageView: View {
    var user: Result
    init(user: Result) {
        self.user = user
    }
    var body: some View {
        AsyncImage(url: URL(string: "\(user.picture!.thumbnail)")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width:40, height:40)
        .cornerRadius(25)
    }
}
