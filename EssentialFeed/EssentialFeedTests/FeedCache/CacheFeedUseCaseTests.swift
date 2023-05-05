//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Heber Alvarez on 05/05/23.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    private let store: FeedStore

    init(store: FeedStore) {
        self.store = store
    }

    func save(_ items: [FeedItem]) {
        store.deleteCachedFeed()
    }
}

class FeedStore {
    var deletedCachedFeedCallCount = 0
    func deleteCachedFeed() {
        deletedCachedFeedCallCount += 1
    }
}

final class CacheFeedUseCaseTests: XCTestCase {
    func test() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deletedCachedFeedCallCount, .zero)
    }

    func test_save_requestCacheDeletion() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [uniqueItem, uniqueItem]
        sut.save(items)
        XCTAssertEqual(store.deletedCachedFeedCallCount, 1)
    }

    // MARK: - Helpers

    private var uniqueItem: FeedItem {
        return FeedItem(id: UUID(), description: "any", location: "any", imageUrl: anyURL())
    }

    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
}
