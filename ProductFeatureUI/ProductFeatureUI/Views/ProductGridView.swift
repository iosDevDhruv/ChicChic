//
//  ProductGridView.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import SwiftUI
import ProductFeature

public struct ProductGridView: View {
    @Binding private var products: [Product]
    @State private var filteredProducts: [Product] = []
    @Binding var loading: Bool
    @State private var searchText: String = ""
    private let imageCache: ImageCache
    public var productTaped: ((Product) -> Void)?
    private let columns = [GridItem(.adaptive(minimum: (screenWidth / 2) - 32))]

    public init(products: Binding<[Product]>, loading: Binding<Bool>, imageCache: ImageCache, productTap: ((Product) -> Void)? = nil) {
        self._products = products
        self._loading = loading
        self.productTaped = productTap
        self.imageCache = imageCache
    }

    public var body: some View {
        LazyVGrid(columns: columns) {
            if loading {
                ForEach(0..<10) { _ in
                    ProductView(product: Product.DummyProduct(), imageCache: imageCache)
                        .frame(height: 332)
                }
                .redacted(reason: .placeholder)
            } else {
                ForEach(filteredProducts, id: \.id) { product in
                        ProductView(product: product, imageCache: imageCache)
                        .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .frame(height: 332)
                            .onTapGesture {
                                productTaped?(product)
                            }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search Product")
        .onChange(of: searchText) {_ in
            withAnimation {
                search()
            }
        }
        .onChange(of: products) { _ in
            filteredProducts = products
        }
    }

    private func search() {
        guard !searchText.isEmpty else {
            filteredProducts = products
            return
        }
       filteredProducts = products.filter { $0.name.contains(searchText) || $0.brand.contains(searchText) }
    }
}

#Preview {
    ProductGridView(products: .constant([Product.DummyProduct(), Product.DummyProduct()]), loading: .constant(false), imageCache: DummyImageCache())
}
