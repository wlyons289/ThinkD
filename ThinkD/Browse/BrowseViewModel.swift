//
//  BrowseViewModel.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import Foundation


@MainActor class BrowseViewModel: ObservableObject {
    
    @Published var products = [Product]()
    
    func fetchProcuts() async throws {        
        products = try await NetworkService.sharedInstance.requestProducts()
    }
}
