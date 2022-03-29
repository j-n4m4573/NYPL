//
//  BooksViewController.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import UIKit

class BooksViewController: UIViewController, FetchCompletionDelegate {
    
    private var searchController: UISearchController = UISearchController()
    private let screenSize: CGRect = UIScreen.main.bounds
    private let viewModel: BooksViewModel
 
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    init(viewModel: BooksViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
        setupNavigationBar()
        addTableView()
        

    }
    
    internal func didFetchData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupView() {
        viewModel.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.searchTextField.backgroundColor = .white
        navigationItem.searchController = searchController
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = UIColor(red: 0.12, green: 0.31, blue: 0.62, alpha: 1.00)
        navigationController?.navigationBar.tintColor = UIColor(red: 0.12, green: 0.31, blue: 0.62, alpha: 1.00)
        navigationItem.title = "Search Books"
        
        guard let font = UIFont(name: "Avenir", size: 18) else {return}
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
   
    private func addTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        cell.bookImageView.image = UIImage(systemName: "book.circle.fill")
        cell.titleLabel.text = viewModel.books[indexPath.row].title
        cell.authorLabel.text = viewModel.books[indexPath.row].authorName?[0] ?? ""
        cell.publishDateLabel.text = String(viewModel.books[indexPath.row].firstPublishYear ?? 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenSize.height / 14
    }
}

extension BooksViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        if text.count > 3 { viewModel.fetchBooks(for: text) }
    }

}
