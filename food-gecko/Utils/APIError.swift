//
//  APIError.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case errorData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid Url found."
        case .invalidResponse:
            return "Invalid Response found."
        case .errorData:
            return "Invalid Data json."
        }
    }
}
