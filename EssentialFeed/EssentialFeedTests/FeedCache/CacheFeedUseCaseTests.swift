//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Heber Alvarez on 05/05/23.
//

import XCTest

class FeedStore {
    var deletedCachedFeedCallCount = 0
}

class LocalFeedLoader {
    private let store: FeedStore

    init(store: FeedStore) {
        self.store = store
    }
}

final class CacheFeedUseCaseTests: XCTestCase {
    func test() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deletedCachedFeedCallCount, .zero)
    }
}
