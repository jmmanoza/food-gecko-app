//
//  ViewController.swift
//  food-gecko
//
//  Created by jm on 10/3/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel: ProductViewModel = ProductViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var avatarImage: UIImageView = {
        let imageview = UIImageView()
        return imageview
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.systemGroupedBackground
        
        setAvatarImage()
        setProfileNameLabel(profileName: "Avatar Ang")
        setUpSearchBar()
        
//        view.addSubview(tableView)
//        tableView.frame = view.bounds
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
//
//        Task {
//            await viewModel.getAllProduct()
//            self.tableView.reloadData()
//        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configCell(product: viewModel.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension HomeViewController {
    private func setAvatarImage() {
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.layer.cornerRadius = 30
        avatarImage.clipsToBounds = true
        avatarImage.image = UIImage(named: "avatar")
        view.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            avatarImage.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setProfileNameLabel(profileName: String) {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        profileNameLabel.text = profileName
        
        welcomeLabel.font = UIFont.systemFont(ofSize: 16)
        welcomeLabel.textColor = .gray
    
        profileNameLabel.textColor = .black
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(welcomeLabel)
        view.addSubview(profileNameLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileNameLabel.topAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: 25)
        ])
    }
    
    private func setUpSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.topAnchor.constraint(equalTo: profileNameLabel.topAnchor, constant: 50),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
