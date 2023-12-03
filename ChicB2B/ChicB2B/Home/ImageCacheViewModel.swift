//
//  ImageCacheViewModel.swift
//  ChicB2B
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import Foundation
import ProductFeature

class ImageCacheViewModel: ObservableObject {
    private var imageCache: ImageCache?

    init() {
    }

   func setup() async {
            let store = await RealmClient()
            imageCache = await ImageCacheClient(store: store)
            await MainActor.run {
                objectWillChange.send()
            }
    }
}

extension ImageCacheViewModel: ImageCache {
    func getImage(for url: String) -> Data? {
       return imageCache?.getImage(for: url)
    }

    func setImage(_ data: Data, for url: String) {
        imageCache?.setImage(data, for: url)
    }

}
