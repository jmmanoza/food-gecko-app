//
//  ProductTableViewCell.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    var productImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var expiration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ProductTableViewCell.identifier)
        addSubview(productImage)
        addSubview(productName)
        addSubview(price)
        addSubview(expiration)
        
        NSLayoutConstraint.activate([
            // Product image constraints
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 50),
            productImage.heightAnchor.constraint(equalToConstant: 50),
            
            // Product name constraints
            productName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // Price constraints
            price.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5),
            price.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            
            // Expiration constraints
            expiration.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            expiration.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            expiration.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(product: Product) {
        
        if (!product.productImage.isEmpty) {
            
            self.productImage.load(url: URL(string: product.productImage)!)
        }
        
        self.productName.text = product.productName
        self.price.text = "Price: ₱\(product.price)"
        self.expiration.text = "Consume before \(product.expirationDate)"
    }
}
