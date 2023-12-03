//
//  RatingView.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import SwiftUI

public struct StartReviewView: View {
    private let width: CGFloat
    private let height: CGFloat
    @State private var rating: Int
    public init(width: CGFloat = 24, height: CGFloat = 24, rating: Int) {
        self.width = width
        self.height = height
        self.rating = rating
    }

   public var body: some View {
        HStack {
            ForEach(1..<6) {val in
                if val <= rating {
                  StartShape()
                        .fill(Color.yellow)
                        .frame(width: width, height: height)
                } else {
                    StartShape()
                        .fill(.gray.opacity(0.3))
                        .frame(width: width, height: height)
                }
            }
        }
    }
}

#Preview {
    StartReviewView(rating: 5)
}
