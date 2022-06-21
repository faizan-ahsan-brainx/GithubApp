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
    let filterViewModel = FilterViewModel()

    // MARK: Outlets
    @IBOutlet var filterView: FilterView!
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load 2 called")
        filterView.filterTableView.delegate = self
        filterView.filterTableView.dataSource = self
    }
    
    // MARK: IB Actions
    @IBAction func clearFilter(_ sender: Any) {
        filterViewModel.clearFilter()
        delegate?.getSelectedFilters(filters: filterViewModel.filterData)
        dismiss(animated: true)
    }
    
    @IBAction func applyFilter(_ sender: Any) {
        delegate?.getSelectedFilters(filters: filterViewModel.filterData)
        dismiss(animated: true)
    }

    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func radioButtonAction(_ sender: UIButton) {
        let tagNo: Int = sender.tag
        filterViewModel.changeButtonImage(tagNo: tagNo, sender: sender)
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
        filterViewModel.filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilterTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.languageLabel.text = filterViewModel.filterData[indexPath.row].languageName.rawValue
        cell.radioButton.tag = indexPath.row
        if filterViewModel.filterData[indexPath.row].isSelected {
            cell.radioButton.setImage(filterViewModel.checkedImage, for: UIControl.State.normal)
        } else {
            cell.radioButton.setImage(filterViewModel.uncheckedImage, for: UIControl.State.normal)
        }
        return cell
    }
}
