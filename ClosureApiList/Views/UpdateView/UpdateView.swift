//
//  UpdateView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 29/09/22.
//

import SwiftUI

struct UpdateView: View {
    
    var user: UserEntitys
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ImageLoop
                Text("First Name")
                    .foregroundColor(.gray)
                firstname
                Text("Last Name")
                    .foregroundColor(.gray)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RequirementStyle())
                Text("Email Address")
                    .foregroundColor(.gray)
                TextField("Email Address", text: $email)
                    .textFieldStyle(RequirementStyle())
                Text("Phone Number")
                    .foregroundColor(.gray)
                TextField("Phone Number", text: $phoneNumber)
                    .textFieldStyle(RequirementStyle())
                saveButton
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    })
                }
            }
        }
        .navigationBarHidden(true)
    }
    private var ImageLoop: some View {
        AsyncImage(url: URL(string: user.picture ?? "" )) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100).overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 380, height: 200, alignment: .center)
        }
    private var saveButton: some View {
        Button(action: saveData, label: {
            Text("Save".uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .padding(.vertical, 20)
        })
    }
    
    func saveData() {
            presentationMode.wrappedValue.dismiss()
    }
}

private extension UpdateView {
    
    var firstname: some View {
        TextField("First Name", text: $firstName)
            .textFieldStyle(RequirementStyle())
    }
}

struct RequirementStyle: TextFieldStyle {
  @ViewBuilder
  func _body(configuration: TextField<_Label>) -> some View {
    let mirror = Mirror(reflecting: configuration)
    let text: String = mirror.descendant("_text", "_value") as! String
    configuration
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 16)
          .strokeBorder(text.count > 3 ? Color.green : Color.red)
      )
  }
}

