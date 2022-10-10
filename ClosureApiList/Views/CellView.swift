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
                    HStack {
                        Text(data.first ?? "")
                            .lineLimit(nil)
                            .font(.headline)
                            .padding(.bottom, 4)
                    }
//                    if self.userdata.dob != nil {
                        Text("DOB: \(DateUtils.formatDob(self.userdata.dateOfBirth! ))").font(.subheadline)
//                    }
//                    if self.userdata.genderEmoji != nil {
                        Text("Gender: \(self.userdata.gender ?? "")").font(.subheadline)
//                    }
                    
                }
            }
        }
        .padding(.leading, 5)
    }
}


