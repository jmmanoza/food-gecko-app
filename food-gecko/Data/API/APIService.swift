//
//  APIService.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

final class APIService {
    let baseURL = "http://localhost:3000"
    static let shared = APIService()
    
    func fetchProducts() async throws -> [Product] {
        let endpoint = baseURL + "/api/v1/products/"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let product = try JSONDecoder().decode(ProductResponse.self, from: data)
            return product.results
        } catch {
            throw APIError.errorData
        }
    }
}
