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
    
    // MARK: - View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.searchBar.delegate = self
        searchView.tableView.dataSource = self
        getData()
    }
    
    // MARK: IB Actions
    @IBAction func didTap(_ sender: Any) {
        let filterViewController = FilterViewController.instantiate(from: .main)
        navigationController?.pushViewController(filterViewController, animated: true)
    }
    
    // MARK: - Functions
    func getData() {
        API.instance.getData { person in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let personData = searchedData[indexPath.row]
        cell.backgroungImage.image = UIImage(named: "R")
        cell.personImage.loadFrom(URLAddress: personData.owner!.avatarUrl)
        cell.nameLabel.text = personData.name
        cell.descriptionLabel.text = personData.description
        return cell
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedData.removeAll()
        for person in data {
            if (person.name!.hasPrefix(searchText.lowercased())){
                searchedData.append(person)
            }
        }
        self.searchView.tableView.reloadData()
    }
}
