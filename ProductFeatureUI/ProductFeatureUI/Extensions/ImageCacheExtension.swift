//
//  File.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 01/12/23.
//

import ProductFeature
import SwiftUI
import UIKit

extension ImageCache {
    func getImageFromData(for url: String) -> Image? {
        guard let data = self.getImage(for: url),
              let uiimage = UIImage(data: data)
        else { return nil}
        let image = Image(uiImage: uiimage)
        return image
    }

    func saveImage(url: String, img: Image) {
        guard let data = img.asUIImage().jpegData(compressionQuality: 1) else {return}
        self.setImage(data, for: url)
    }
}
