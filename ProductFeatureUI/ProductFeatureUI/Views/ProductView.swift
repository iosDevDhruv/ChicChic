//
//  ProductView.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 01/12/23.
//

import SwiftUI
import ProductFeature

public struct ProductView: View {
    private let product: Product
    private let imageCache: ImageCache
    public init(product: Product, imageCache: ImageCache) {
        self.product = product
        self.imageCache = imageCache
    }
   public var body: some View {
        VStack {
            AsyncImageWithCache(urlString: product.imageLink, imageCache: imageCache)
                .frame(height: 176)
                .frame(maxWidth: .infinity)
                .cornerRadius(5)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    Text(product.brand.capitalized)
                            .font(.subheadline)
                    Text("\(product.priceSign)\(product.price)")
                        .font(.headline)
                    }
                .padding(.top, 12)
                Spacer()
            }
        }
        .padding(.all, 8)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primary.opacity(0.5), lineWidth: 0.5)
        }
    }
}

#Preview {
    ProductView(product: Product.DummyProduct(), imageCache: DummyImageCache())
        .frame(width: 165, height: 332)
}
