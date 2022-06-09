//
//  FilterViewController.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet var filterView: FilterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        filterView.filterTableView.delegate = self
        filterView.filterTableView.dataSource = self
    }
    let languagesData = ["Python","Interior Painting","Electrician","Inappropriate client behavior","Gardener","Carpenter","House Cleaning"]
}
extension FilterViewController: UITableViewDelegate {
    
}
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languagesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        cell.languageLabel.text = languagesData[indexPath.row]
        return cell
    }
    
    
}
