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
    var data: [Person] = []
    var searchedData: [Person] = []
    var filterData = [
        Filter(languageName: .python, isSelected: false),
        Filter(languageName: .interiorPainting, isSelected: false),
        Filter(languageName: .electrician, isSelected: false),
        Filter(languageName: .inappropriateClientBehavior, isSelected: false),
        Filter(languageName: .gardener, isSelected: false),
        Filter(languageName: .carpenter, isSelected: false),
        Filter(languageName: .houseCleaning, isSelected: false),
    ]
    
    // MARK: - View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load 1 called")
        searchView.searchBar.delegate = self
        searchView.tableView.dataSource = self
        getData()
    }
    
    // MARK: Actions
    @IBAction func didOpenFilters(_ sender: Any) {
        let filterViewController = FilterViewController.instantiate(from: .main)
        filterViewController.configureFilterData(filterData)
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
    
    func getData() {
        APIClient.shared.getData { person in
            self.searchedData = person
            self.data = self.searchedData
            self.searchView.tableView.reloadData()
        }
    }
}

// MARK: - Extensions For SearchView Controller
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueCell(for: indexPath)
        let personData = searchedData[indexPath.row]
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
        searchedData.removeAll()
        for person in data {
            guard let personName = person.name else{
                return
            }
            if (personName.hasPrefix(searchText.lowercased())){
                searchedData.append(person)
            }
        }
        self.searchView.tableView.reloadData()
    }
}

extension SearchViewController: FilterDelegate{
    
    // MARK: Functions
    func getSelectedFilters(filters: [Filter]) {
        self.filterData = filters
        self.searchedData.removeAll()
        var isFilterApplied :Bool = true
        isFilterApplied = !filters.contains(where: {$0.isSelected})
        
        if isFilterApplied {
            reloadData()
        }else {
            for person in data {
                switch (person.languageUrl) {
                case .python:
                    appendSearchedData(index: 0, person: person, filters: filters)
                case .interiorPainting:
                    appendSearchedData(index: 1, person: person, filters: filters)
                case .electrician:
                    appendSearchedData(index: 2, person: person, filters: filters)
                case .inappropriateClientBehavior:
                    appendSearchedData(index: 3, person: person, filters: filters)
                case .gardener:
                    appendSearchedData(index: 4, person: person, filters: filters)
                case .carpenter:
                    appendSearchedData(index: 5, person: person, filters: filters)
                case .houseCleaning:
                    appendSearchedData(index: 6, person: person, filters: filters)
                }
            }
            self.searchView.tableView.reloadData()
        }
        
        func appendSearchedData(index: Int, person: Person, filters: [Filter]) {
            if filters[index].isSelected {
                searchedData.append(person)
            }
        }
        func reloadData() {
            for person in self.data {
                self.searchedData.append(person)
            }
        }
    }
}
