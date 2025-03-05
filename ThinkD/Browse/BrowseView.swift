//
//  BrowseView.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import SwiftUI

struct BrowseView: View {
    
    @StateObject private var viewModel = BrowseViewModel()
    @State private var showingAlert = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products, id: \.id) { product in
                    ProductView(product: product)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
            .task {
                await refreshData()
            }
            .refreshable {
                await refreshData()
            }
            .overlay {
                if viewModel.products.isEmpty {
                    ContentUnavailableView {
                        Label("No Results", systemImage: "doc.richtext.fill")
                    } description: {
                        Text("No Products Available.")
                    }                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Network Error"), message: Text("An error occured while retreiving data. Please try again later."), dismissButton: .default(Text("OK")))
        }
    }
    
    func refreshData() async {
        Task {
            do {
                try await viewModel.fetchProcuts()
            } catch {
                print(error.localizedDescription)                
                showingAlert = true
            }
        }
    }
}

#Preview {
    BrowseView()
}
