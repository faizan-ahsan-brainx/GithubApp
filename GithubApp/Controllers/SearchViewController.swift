//
//  SearchViewController.swift
//  GithubApp
//
//  Created by BrainX on 08/06/2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var searchView: SearchView!
    
    // MARK: - Instance Properties
    var data: [Person] = []
    
    // MARK: - View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.tableView.dataSource = self
        getData()
    }
    
    // MARK: - Functions
    func getData() {
        API.instance.getData { person in
            self.data = person
            self.searchView.tableView.reloadData()
        }
    }
}

// MARK: - Extensions For SearchView Controller
extension SearchViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let personData = data[indexPath.row]
        cell.backgroungImage.image = UIImage(named: "R")
        cell.personImage.loadFrom(URLAddress: personData.owner!.avatarUrl)
        cell.nameLabel.text = personData.name
        cell.descriptionLabel.text = personData.description
        return cell
    }
}
