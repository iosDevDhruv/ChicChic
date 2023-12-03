//
//  File.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import Foundation
import ProductFeature

class RemoteFeedLoaderWithFallback: RemoteFeedLoaderWithFallbackProtocol {
    let remoteFeedLoader: RemoteProductLoader
    let localFeedLoader: LocalProductLoader
    required init(remoteFeedLoader: RemoteProductLoader, localFeedLoader: LocalProductLoader) {
        self.remoteFeedLoader = remoteFeedLoader
        self.localFeedLoader = localFeedLoader
    }
}
