//
//  ProductUseCase.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

protocol ProductUseCase {
    func execute() async throws -> [Product]
}

class ProductUseCaseImp: ProductUseCase {
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Product] {
        return try await repository.fetchProduct()
    }
}
