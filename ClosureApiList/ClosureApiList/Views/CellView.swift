//
//  CellView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 09/09/22.
//

import SwiftUI

struct CellView: View {
    
    var userdata: Results
        
    var body: some View {
        HStack {
            if let data = userdata {
                ImageView(user: data)
                Text("\(data.name.first)")
                    .font(.system(size: 20))
                Text("\(data.name.last)")
                    .font(.system(size: 20))
            }
        }
    }
}


