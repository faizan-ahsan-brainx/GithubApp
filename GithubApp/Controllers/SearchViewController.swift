//
//  SearchViewController.swift
//  GithubApp
//
//  Created by BrainX on 08/06/2022.
//

import UIKit

class SearchViewController: UIViewController{
    
    // MARK: - Outlets
    @IBOutlet var searchView: SearchView!
      
    // MARK: - Instance Properties
    let searchViewModel = SearchViewModel()

    // MARK: - View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load 1 called")
        searchView.searchBar.delegate = self
        searchView.tableView.dataSource = self
        searchViewModel.delegate = self
        searchView.loader.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.searchViewModel.getDataFromAPIManager()
            self.searchView.loader.stopAnimating()
            self.searchView.loader.isHidden = true
        }
    }
    
    // MARK: Actions
    @IBAction func didOpenFilters(_ sender: Any) {
        let filterViewController = FilterViewController.instantiate(from: .main)
        filterViewController.filterViewModel.configureFilterData(searchViewModel.getFilterData())
        filterViewController.delegate = self
        filterViewController.modalPresentationStyle = .overCurrentContext
        filterViewController.modalTransitionStyle = .flipHorizontal
        present(filterViewController, animated: true)
    }
    
    // MARK: - Functions
    func configureNavigationBar(){
        let backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "close")
        navigationController?.navigationBar.backIndicatorImage?.withTintColor(.black)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "close")
    }
}

// MARK: - Extensions For SearchView Controller
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.searchedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueCell(for: indexPath)
        let personData = searchViewModel.searchedData[indexPath.row]
        cell.backgroungImage.image = UIImage(named: "R")
        cell.nameLabel.text = personData.name
        cell.descriptionLabel.text = personData.description
        cell.languageLabel.text = personData.languageUrl.rawValue
        guard let imageURL = personData.owner?.avatarUrl else {
            cell.personImage.image = UIImage(named: "Image1")
            return cell
        }
        cell.personImage.loadFrom(URLAddress: imageURL)
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.searchUser(prefix: searchText)
    }
}

extension SearchViewController: FilterDelegate {
    
    // MARK: Functions
    func getSelectedFilters(filters: [Filter]) {
        searchViewModel.getSelectedFilters(filters: filters)
        self.searchView.tableView.reloadData()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func getSearchedData(persons: [Person]) {
        self.searchView.tableView.reloadData()
    }
    
    func getDataOfPersons(persons: [Person]) {
        searchView.tableView.reloadData()
    }
}
