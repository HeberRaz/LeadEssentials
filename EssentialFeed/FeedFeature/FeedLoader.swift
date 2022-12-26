//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Heber Raziel Alvarez Ruedas on 05/12/22.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error >  {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable {}

protocol FeedLoader {
    associatedtype Error: Swift.Error 
    func loadItems(completion: @escaping(LoadFeedResult<Error>) -> Void)
}
