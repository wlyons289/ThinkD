//
//  ProductView.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    
    var product: Product
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                if let imageURL = product.smallImageURL() {
                    KFImage.url(imageURL)
                        .placeholder { progress in
                            Image(systemName: "photo")
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Name: \(product.product_name)")
                    .foregroundColor(.primary)
                    .font(.headline)
                Text("Brand: \(product.brand_name)")
                    .foregroundColor(.secondary)
                Text("Category: \(product.product_category)")
                    .foregroundColor(.secondary)
                Text("Hazard Rating: \(product.hazard_rating)")
                    .foregroundColor(.secondary)
                Text("Hazard Catrgory: \(product.hazard_rating_category)")
                    .foregroundColor(.secondary)
                Text(product.description ?? "NA")
                    .foregroundColor(.secondary)
            }
            .padding(5)
        }
    }
}

#Preview {
    let product = Product(uuid: "xxx", product_name: "name", brand_name: "brand", product_category: "cat", hazard_rating: 34, hazard_rating_category: "CLEAN")
    
    ProductView(product: product)
}
