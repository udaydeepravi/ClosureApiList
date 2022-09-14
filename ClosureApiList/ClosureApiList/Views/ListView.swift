//
//  ContentView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.result.isEmpty {
                    VStack(spacing: 8) {
                        ProgressView()
                        Text("Fetching Users")
                    }
                } else {
                    List {
                        ForEach(viewModel.result) { data in
                            NavigationLink(destination: DetailView(user: data)) {
                                CellView(userdata: data)
                            }
                        }
                    }
                    .navigationTitle("Random Users")
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text(String("Try again later due to \(viewModel.errorMessage!)")))
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
