//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Heber Raziel Alvarez Ruedas on 05/12/22.
//

import Foundation

public protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}

public enum LoadFeedResult  {
    case success([FeedItem])
    case failure(Error)
}
