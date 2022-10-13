//
//  UpdateView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 29/09/22.
//

import SwiftUI

struct UpdateView: View {
    
    var user: UserEntitys
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                ProfileImage(user: user)
                textFields
                saveButton
            }
            .padding()
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
    
    private var textFields: some View {
        
        VStack(alignment: .leading) {
            Text("First Name")
                .foregroundColor(.gray)
            TextField("First Name", text: $firstName)
                .textFieldStyle(RequirementStyle())
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
        }
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
        let userInfo = user
        userInfo.first = firstName
        userInfo.last = lastName
        userInfo.email = email
        userInfo.phone = phoneNumber
        do {
            try self.context.save()
        } catch {
            print("whoops \(error.localizedDescription)")
        }
        presentationMode.wrappedValue.dismiss()
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
                    .strokeBorder(text.count > 3 ? Color.green : Color.red))
    }
}

