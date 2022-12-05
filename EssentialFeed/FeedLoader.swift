//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Heber Raziel Alvarez Ruedas on 05/12/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func loadItems(completion: @escaping(LoadFeedResult) -> Void)
}
