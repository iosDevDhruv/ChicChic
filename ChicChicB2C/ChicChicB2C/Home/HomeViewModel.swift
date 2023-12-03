//
//  ViewModel.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import Foundation
import ProductFeature

class HomeViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var loading: Bool = true
    private var remoteFeedLoaderWithFallback: RemoteFeedLoaderWithFallbackProtocol?

    init() {

    }

    func setup() async {
        guard remoteFeedLoaderWithFallback == nil else {return}
        let client = URLSessionClient()
        let remote = RemoteProductLoader(client: client)
        let store = await RealmClient()
        let local = LocalProductLoader(productStore: store)
        remoteFeedLoaderWithFallback = RemoteFeedLoaderWithFallback(remoteFeedLoader: remote, localFeedLoader: local)
    }

    @MainActor func getProducts() async {
        loading = true
        defer {
            loading = false
        }
        do {
            products = try await remoteFeedLoaderWithFallback?.loadProducts() ?? []
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
}
