//
//  ProductRepository.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

protocol ProductRepository {
    func fetchProduct() async throws -> [Product]
}

class ProductRepositoryImp: ProductRepository {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchProduct() async throws -> [Product] {
        do {
            let products = try await apiService.fetchProducts()
            // save local db here
            return products
        } catch {
            // load data from db
            return []
        }
    }
}
