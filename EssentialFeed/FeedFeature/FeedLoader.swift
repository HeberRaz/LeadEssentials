//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Heber Raziel Alvarez Ruedas on 05/12/22.
//

import Foundation

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping(LoadFeedResult<Error>) -> Void)
}

public enum LoadFeedResult<Error: Swift.Error >  {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable {}
