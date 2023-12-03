//
//  SwiftUIView.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 01/12/23.
//

import SwiftUI
import ProductFeature

public struct AsyncImageWithCache: View {
    private let urlString: String
    private let imageCache: ImageCache
    public init(urlString: String, imageCache: ImageCache) {
        self.urlString = urlString
        self.imageCache = imageCache
    }
    public var body: some View {
        if let img = imageCache.getImageFromData(for: urlString) {
            img
                .resizable()
                .scaledToFill()
        } else {
            AsyncImage(url: URL(string: urlString)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .onAppear {
                            imageCache.saveImage(url: urlString, img: image)
                        }
                default:
                    Image("productPlaceholder")
                        .resizable()
                        .scaledToFill()
                }
            }
        }
    }
}

#Preview {
    AsyncImageWithCache(urlString: "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png", imageCache: DummyImageCache())
}
