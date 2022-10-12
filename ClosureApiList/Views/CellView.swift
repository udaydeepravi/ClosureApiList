//
//  CellView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 09/09/22.
//

import SwiftUI

struct CellView: View {
    
    var userdata: UserEntitys
    
    var body: some View {
        
        HStack (spacing: 10){
            if let data = userdata {
                ImageView(user: data)
                VStack (alignment: .leading, spacing: 3) {
                    
                    fullName
                    Text("DOB: \(DateUtils.formatDob(self.userdata.dateOfBirth ?? Date() ))").font(.subheadline)
                    Text("Gender: \(self.userdata.gender ?? "")").font(.subheadline)
                }
            }
        }
        .padding(.leading, 5)
    }
    
    private var fullName: some View {
        HStack {
            Text(userdata.first ?? "")
                .lineLimit(nil)
                .font(.headline)
                .padding(.bottom, 4)
            Text(userdata.last ?? "")
                .lineLimit(nil)
                .font(.headline)
                .padding(.bottom, 4)
        }
    }
}
