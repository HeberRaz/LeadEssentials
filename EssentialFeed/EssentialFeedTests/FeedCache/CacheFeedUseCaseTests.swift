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
    // MARK: - Private properties
    private var uniqueItem: FeedItem {
        return FeedItem(id: UUID(), description: "any", location: "any", imageUrl: anyURL())
    }

    func test() {
        let (_, store) = makeSut()
        XCTAssertEqual(store.deletedCachedFeedCallCount, .zero)
    }

    func test_save_requestCacheDeletion() {
        let items = [uniqueItem, uniqueItem]
        let (sut, store) = makeSut()
        sut.save(items)
        XCTAssertEqual(store.deletedCachedFeedCallCount, 1)
    }

    // MARK: - Helpers
    private func makeSut(file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStore) {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }

    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
}
