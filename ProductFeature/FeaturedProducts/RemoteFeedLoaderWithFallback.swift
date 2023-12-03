//
//  File.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import Foundation

public protocol RemoteFeedLoaderWithFallbackProtocol: ProductLoader {
    var remoteFeedLoader: RemoteProductLoader {get}
    var localFeedLoader: LocalProductLoader {get}
    init(remoteFeedLoader: RemoteProductLoader, localFeedLoader: LocalProductLoader)
}

extension RemoteFeedLoaderWithFallbackProtocol {
   public func loadProducts() async throws -> [Product] {
        do {
            let products = try await remoteFeedLoader.loadProducts()
            await localFeedLoader.save(products: products)
            return products
        } catch {
            let products = await localFeedLoader.loadProducts()
            return products
        }
    }
}
