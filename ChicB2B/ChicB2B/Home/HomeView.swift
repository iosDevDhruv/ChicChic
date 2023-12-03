//
//  ContentView.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import SwiftUI
import ProductFeature
import ProductFeatureUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = .init()
    @StateObject var imageCacheVM: ImageCacheViewModel = .init()
    @State var currentProduct: Product = Product.DummyProduct()
    @State var showDetailScreen: Bool = false
    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
         ScrollView {
             ProductGridView(products: $vm.products, loading: $vm.loading, imageCache: imageCacheVM) { product in
                 currentProduct = product
                 showDetailScreen = true
             }
             .navigationDestination(isPresented: $showDetailScreen) {
                 ProductDetailView(product: currentProduct, imageCache: imageCacheVM)
             }
            }
         .toolbar {
             ToolbarItem(placement: .topBarLeading) {
                 Text("Explore")
                     .font(.title2)
                     .fontWeight(.semibold)
             }
             ToolbarItem(placement: .topBarTrailing) {
                 HStack {
                     Image(systemName: "line.3.horizontal.decrease.circle.fill")
                     Image(systemName: "cart.fill")
                 }
             }
         }
         .padding()
        }
        .tint(.primary)
        .task {
            await imageCacheVM.setup()
            await vm.setup()
            await vm.getProducts()
        }
    }
}

#Preview {
    HomeView()
}
