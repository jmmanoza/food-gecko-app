//
//  Product.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

struct ProductResponse: Codable {
    let message: String
    let results: [Product]
    let statusCode: Int
    let version: String
}

// MARK: - Result
struct Product: Codable {
    let id, productName: String
    let productImage: String
    let price: Int
    let expirationDate, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName, productImage, price, expirationDate, createdAt, updatedAt
        case v = "__v"
    }
}
