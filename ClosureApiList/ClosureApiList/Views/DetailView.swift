//
//  DetailView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI

struct DetailView: View {
    var user: Result
    init(user: Result) {
        self.user = user
    }
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 5) {
                    ImageLoop
                    Text("Phone No: \(user.phone)")
                        .font(.system(size: 20))
                    Text("Email: \(user.email)")
                        .font(.system(size: 20))
                }
            }.navigationBarTitle(Text(user.name!.first + user.name!.last), displayMode: .large)
        }
    }
    
    private var ImageLoop: some View {
        AsyncImage(url: URL(string: "\(user.picture!.large)")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 350, height: 300)
    }
    private var FullName: some View {
        HStack(spacing: 5) {
            Text("\(user.name!.first)")
            Text("\(user.name!.last)")
        }
    }
}
