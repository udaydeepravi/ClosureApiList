//
//  ContentView.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel:ListViewModel = ListViewModel()
    var body: some View {
        NavigationView {
            NameListLoop
            .navigationTitle("Random Users")
        }
    }
    private var NameListLoop: some View {
        List {
            ForEach(viewModel.jsonResults) { data in
                HStack {
                    ImageView(user: data)
                    Text("\(data.name!.first)")
                        .font(.system(size: 20))
                    Text("\(data.name!.last)")
                        .font(.system(size: 20))
                    NavigationLink(destination: DetailView(user: data)) {
                        
                    }
                }
            }
        }.onAppear {
            Task {
                 viewModel.fetchData()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            
    }
}
