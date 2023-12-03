//
//  jj.swift
//  ProductFeatureTests
//
//  Created by Dhruv Jaiswal on 03/12/23.
//

import XCTest
import ProductFeature

final class RemoteFeedLoaderWithFallbackProtocolTests: XCTestCase {

    private var localRemoteLoader: LocalProductLoader!
    private var remoteProductLoader: RemoteProductLoader!

    override func setUp() async throws {
        let httpClient = URLSessionClient()
        let productStore = await RealmClient()
        remoteProductLoader = RemoteProductLoader(client: httpClient)
        localRemoteLoader = LocalProductLoader(productStore: productStore)
    }

    func test_RemoteFeedLoaderWithFallback() async {
        do {
            let sut = RemoteFeedLoaderWithFallback(remoteFeedLoader: remoteProductLoader, localFeedLoader: localRemoteLoader)
            let products = try await sut.loadProducts()
            XCTAssertEqual(products.count, 54)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}

private class RemoteFeedLoaderWithFallback: RemoteFeedLoaderWithFallbackProtocol {
    let remoteFeedLoader: ProductFeature.RemoteProductLoader
    let localFeedLoader: ProductFeature.LocalProductLoader

    required init(remoteFeedLoader: ProductFeature.RemoteProductLoader, localFeedLoader: ProductFeature.LocalProductLoader) {
        self.remoteFeedLoader = remoteFeedLoader
        self.localFeedLoader = localFeedLoader
    }
}
