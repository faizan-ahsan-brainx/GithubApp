//
//  SearchViewController.swift
//  GithubApp
//
//  Created by BrainX on 08/06/2022.
//

import UIKit

class SearchViewController: UIViewController{
    
    // MARK: - IBOutlets
    @IBOutlet var searchView: SearchView!
    
    // MARK: - Instance Properties
    var data: [Person] = []
    var searchedData: [Person] = []
    var filterData = [
        Filter(languageName: .Python, isSelected: false),
        Filter(languageName: .InteriorPainting, isSelected: false),
        Filter(languageName: .Electrician, isSelected: false),
        Filter(languageName: .InappropriateClientBehavior, isSelected: false),
        Filter(languageName: .Gardener, isSelected: false),
        Filter(languageName: .Carpenter, isSelected: false),
        Filter(languageName: .HouseCleaning, isSelected: false),
    ]
    // MARK: - View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load 1 called")
        
        searchView.searchBar.delegate = self
        searchView.tableView.dataSource = self
        getData()
        
    }
    
    
    // MARK: IB Actions
    @IBAction func didOpenFilters(_ sender: Any) {
        let filterViewController = FilterViewController.instantiate(from: .main)
        filterViewController.configure(filterData)
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
extension SearchViewController: UITableViewDataSource{
    
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

extension SearchViewController: UISearchBarDelegate{
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
        self.filterData.removeAll()
        self.filterData = filters
        self.searchedData.removeAll()
        var isFilterApplied :Bool = true
        for filter in filters {
            if(filter.isSelected){
                isFilterApplied = false
                break
            }
        }
        
        if isFilterApplied {
            reloadData()
        }else{
            for person in data {
                switch (person.languageUrl.rawValue){
                case languages.Python.rawValue:
                    appendSearchedData(index: 0, person: person, filters: filters)
                case languages.InteriorPainting.rawValue:
                    appendSearchedData(index: 1, person: person, filters: filters)
                case languages.Electrician.rawValue:
                    appendSearchedData(index: 2, person: person, filters: filters)
                case languages.InappropriateClientBehavior.rawValue:
                    appendSearchedData(index: 3, person: person, filters: filters)
                case languages.Gardener.rawValue:
                    appendSearchedData(index: 4, person: person, filters: filters)
                case languages.Carpenter.rawValue:
                    appendSearchedData(index: 5, person: person, filters: filters)
                case languages.HouseCleaning.rawValue:
                    appendSearchedData(index: 6, person: person, filters: filters)
                default:
                    print("No such Item")
                }
            }
        }
        self.searchView.tableView.reloadData()
    }
    
    func appendSearchedData(index: Int, person: Person, filters: [Filter]){
        if(filters[index].isSelected){
            searchedData.append(person)
        }
    }
    func reloadData(){
        for person in self.data {
            self.searchedData.append(person)
        }
    }
}
