//
//  BrowseView.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import SwiftUI

struct BrowseView: View {
    
    @StateObject private var viewModel = BrowseViewModel()
//    @State var loaded = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products, id: \.id) { product in
                    ZStack {
                        ProductView(product: product)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Browse")
            .task {
                await refreshData()
            }
            .refreshable {
                await refreshData()
            }
        }
    }
    
    func refreshData() async {
        Task {
            do {
                try await viewModel.fetchProcuts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    BrowseView()
}
