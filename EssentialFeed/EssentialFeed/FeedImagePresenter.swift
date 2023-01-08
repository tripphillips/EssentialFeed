//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/5/22.
//

import Foundation

public final class FeedImagePresenter  {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
