//
//  ProductViewModel.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var errorMesage: String = ""
    @Published var isLoading: Bool = false
    
    private let useCase: ProductUseCase
    
    init(useCase: ProductUseCase = ProductUseCaseImp(repository: ProductRepositoryImp(apiService: APIService()))) {
        self.useCase = useCase
    }
    
    @MainActor
    func getAllProduct() async {
        isLoading = true
        
        do {
            let newProducts = try await useCase.execute()
            products.append(contentsOf: newProducts)
            print("get all products: \(products)")
        } catch let error {
            self.errorMesage = error.localizedDescription
        }
        
        isLoading = false
    }
}
