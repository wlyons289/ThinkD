//
//  ThinkDTests.swift
//  ThinkDTests
//
//  Created by William Lyons on 2025-03-04.
//

import XCTest

@testable import ThinkD

final class ThinkDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor func testBrowseViewModelValid() async throws {
        
        let viewModel = BrowseViewModel()
        
        do {
            try await viewModel.fetchProcuts()
        } catch {
            XCTFail("Failed to fetch products: \(error)")
            return
        }
        XCTAssert(viewModel.products.count > 0)

    }
    
    @MainActor func testBrowseViewModelEmpty() async throws {
        let viewModel = BrowseViewModel()
        
        do {
            try await viewModel.fetchProcutsTestEmpty()
        } catch {
        }
        XCTAssert(viewModel.products.count == 0)

    }
    
    @MainActor func testBrowseViewModelMalformed() async throws {
        let viewModel = BrowseViewModel()
        
        do {
            try await viewModel.fetchProcutsTestMalformed()
        } catch {
            
            XCTAssert(error as? NetworkError == NetworkError.malformedJSON)
        }
        XCTAssert(viewModel.products.count == 0)

    }

}
