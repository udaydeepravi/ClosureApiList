//
//  UserInfoItemView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 29/09/22.
//

import SwiftUI

struct UserInfoItemView: View {
    private let label: String
    private let value: String?
    
    init(label: String, value: String?) {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label).font(.headline).fontWeight(.bold)
            Spacer()
            Text(value ?? "").font(.subheadline)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
    }
}
