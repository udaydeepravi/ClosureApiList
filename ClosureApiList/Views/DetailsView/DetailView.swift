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
        //        .navigationBarTitle(Text(user.fullName), displayMode: .large)
    }
    
    func content() -> some View {
        //        return
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                Text(user.first ?? " ")
                    .font(.largeTitle)
                    .padding(.vertical, 15)
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
                
                UserInfoItemView(label: "First name", value: user.first)
                Divider()
                UserInfoItemView(label: "Last name", value: user.last)
                    .lineLimit(nil)
                Divider()
                
                if user.dateOfBirth != nil {
                    UserInfoItemView(label: "Date of birth", value: DateUtils.formatDob(user.dateOfBirth!))
                    Divider()
                }
                UserInfoItemView(label: "Phone", value: user.phone)
                UserInfoItemView(label: "Email", value: user.email)
            }
            .padding(.horizontal, 10)
        }
    }
}
