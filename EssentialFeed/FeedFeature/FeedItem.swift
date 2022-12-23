//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Heber Raziel Alvarez Ruedas on 05/12/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageUrl: URL
}
