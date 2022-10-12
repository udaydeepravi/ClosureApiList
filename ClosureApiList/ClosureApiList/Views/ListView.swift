//
//  ContentView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI
import CoreData

struct ListView: View {
    
    @State var hasAppeared: Bool = false
    @State var apiAppeared: Bool = false
    @StateObject var viewModel: ListViewModel = ListViewModel(errorMessage: "")
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: UserEntitys.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "dateOfBirth", ascending: true)])
    private var items: FetchedResults<UserEntitys>
    
    var body: some View {
        NavigationView {
            Group {
                List {
                    listView
                }
                .navigationTitle("Random Users")
            }
            .onAppear {
                if !hasAppeared {
                    viewModel.fetchData(context: context)
                    hasAppeared = true
                }
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text(String("Try again later due to \(viewModel.errorMessage)")))
            }
        }
    }
    
    private var listView: some View {
        ForEach(items, id: \.self) { data in
            NavigationLink(destination: DetailView(user: data)) {
                CellView(userdata: data)
            }
        }
        .onDelete(perform: deleteItems)
    }
    
    private func deleteItems(offsets: IndexSet) {
        offsets.map { items[$0] }.forEach(context.delete)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

