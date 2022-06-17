//
//  FilterViewController.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import UIKit

class FilterViewController: UIViewController {

    // MARK: Instance Properties
    var delegate: FilterDelegate?
    var filterData :[Filter] = []
    let checkedImage = UIImage(named: "check")
    let uncheckedImage = UIImage(named: "uncheck")

    // MARK: Outlets
    @IBOutlet var filterView: FilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load 2 called")
        filterView.filterTableView.delegate = self
        filterView.filterTableView.dataSource = self
    }
    
    // MARK: Functions
    func configureFilterData(_ filterData: [Filter]) {
        self.filterData = filterData
    }

    // MARK: IB Actions
    @IBAction func clearFilter(_ sender: Any) {
        filterData.indices.forEach {
            filterData[$0].isSelected = false
        }
        for index in 0..<filterData.count {
            filterData[index].isSelected = false
        }
        delegate?.getSelectedFilters(filters: filterData)
        dismiss(animated: true)
    }
    
    @IBAction func applyFilter(_ sender: Any) {
        delegate?.getSelectedFilters(filters: filterData)
        dismiss(animated: true)
    }

    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func radioButtonAction(_ sender: UIButton) {
        let tagNo: Int = sender.tag
        if !filterData[tagNo].isSelected {
            sender.setImage(checkedImage, for: UIControl.State.normal)
        } else {
            sender.setImage(uncheckedImage, for: UIControl.State.normal)
        }
        filterData[tagNo].isSelected.toggle()
    }
}

// MARK: Extension FilterViewController
extension FilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FilterViewController: UITableViewDataSource {
    
    // MARK: DataSource Funtions
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return LocalizableKey.sectionLabel.rawValue
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilterTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.languageLabel.text = filterData[indexPath.row].languageName.rawValue
        cell.radioButton.tag = indexPath.row
        if filterData[indexPath.row].isSelected {
            cell.radioButton.setImage(checkedImage, for: UIControl.State.normal)
        } else {
            cell.radioButton.setImage(uncheckedImage, for: UIControl.State.normal)
        }
        return cell
    }
}
