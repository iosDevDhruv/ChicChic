//
//  ProductDetailView.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import SwiftUI
import ProductFeature
import ProductFeatureUI

struct ProductDetailView: View {
    private let product: Product
    private let imageCache: ImageCache
    @State private var value: Int = 1
    @Environment(\.dismiss) var dismiss

    init(product: Product, imageCache: ImageCache) {
        self.product = product
        self.imageCache = imageCache
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
                AsyncImageWithCache(urlString: product.imageLink, imageCache: imageCache)
                    .frame(height: screenHeight * 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .padding(.bottom, 24)
            VStack(alignment: .leading, spacing: 16) {
                Text(product.name)
                    .font(.headline)
                HStack {
                    Text(product.brand.capitalized)
                        .fontWeight(.bold)
                    Spacer()
                    StartReviewView(rating: Int(product.rating))
                }
                Text(product.description)
                    .font(.caption)
            }
            HStack {
                Text("\(product.priceSign)\(String(format: "%.2f", ((Double(product.price) ?? 0) * Double(value))))")
                    .font(.title2)
                    .fontWeight(.bold)
                Stepper(value: $value, in: 1...10) {
                    HStack {
                        Spacer()
                        Text("\(value)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                    }
            }
            .padding(.vertical)
            Button(action: {
                dismiss()
            }, label: {
                Text("Add to cart")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .colorInvert()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Color.primary
                    }
                    .cornerRadius(8)

            })
            .frame(width: screenWidth - 32, height: 48)
            .padding(.top, 24)
        }
        .navigationTitle(product.brand.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    ProductDetailView(product: Product.DummyProduct(), imageCache: DummyImageCache())
}
