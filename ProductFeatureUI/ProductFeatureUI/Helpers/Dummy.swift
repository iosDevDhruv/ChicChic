//
//  Dummy.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import Foundation
import ProductFeature

public class DummyImageCache: ImageCache {
public init() {}
   public func getImage(for url: String) -> Data? {
        return nil
    }

   public func setImage(_ data: Data, for url: String) {
        return
    }
}

extension Product {
    public static func DummyProduct() -> Product {
        let product = Product(id: Int.random(in: 0...1000), brand: "maybelline", name: "Maybelline Face Studio Master Hi-Light Light Booster Bronzer", price: "14.99", priceSign: "$", currency: "Dollar", imageLink: "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png", description: "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert balance of shade + shimmer illuminator for natural glow. Skin goes soft-lit with zero glitz. For Best Results: Brush over all shades in palette and gently sweep over cheekbones, brow bones, and temples, or anywhere light naturally touches the face.", rating: 5, category: "Beauty", productType: "bronzer", tagList: [], createdAt: "2016-10-01T18:36:15.012Z")
        return product
    }
}
