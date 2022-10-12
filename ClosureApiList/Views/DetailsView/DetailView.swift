//
//  DetailView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var user: UserEntitys
    
    var body: some View {
        NavigationView {
            self.content()
                .listStyle(GroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            UpdateView(user: user)
                        } label: {
                            Text("Edit")
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
        }
        .padding()
        .navigationBarHidden(true)
    }
    
    private var headerFullName : some View {
        HStack {
            Text(user.first ?? " ")
                .font(.largeTitle)
                .padding(.vertical, 15)
            Text(user.last ?? " ")
                .font(.largeTitle)
                .padding(.vertical, 15)
        }
    }
    
    func content() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                headerFullName
                PictureView(user: user)
                UserInfoItemView(label: "First name", value: user.first)
                Divider()
                UserInfoItemView(label: "Last name", value: user.last)
                Divider()
                UserInfoItemView(label: "Date of birth", value: DateUtils.formatDob(user.dateOfBirth ?? Date()))
                Divider()
                UserInfoItemView(label: "Phone", value: user.phone)
                UserInfoItemView(label: "Email", value: user.email)
            }
            .padding(.horizontal, 10)
        }
    }
}

