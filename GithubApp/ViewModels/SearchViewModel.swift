//
//  SearchViewModel.swift
//  GithubApp
//
//  Created by BrainX on 20/06/2022.
//

import Foundation

protocol SearchViewModelDelegate {
    func getDataOfPersons(persons: [Person])
    func getSearchedData(persons: [Person])
}

class SearchViewModel {
    var delegate: SearchViewModelDelegate?
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
    
    func getDataFromAPIManager() {
        
            APIClient.shared.getData { person in
                self.searchedData = person
                self.data = self.searchedData
                self.delegate?.getDataOfPersons(persons: person)
        }
    }
    
    func getFilterData() -> [Filter] {
        self.filterData
    }
    
    func getData() -> [Person] {
        self.data
    }
    
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
            //self.searchView.tableView.reloadData()
        }
        
        func appendSearchedData(index: Int, person: Person, filters: [Filter]) {
            if filters[index].isSelected {
                self.searchedData.append(person)
            }
        }
        func reloadData() {
            for person in self.data {
                self.searchedData.append(person)
            }
        }

    }
    
    func searchUser(prefix: String) {
        searchedData.removeAll()
        for person in data {
            guard let personName = person.name else{
                return
            }
            if (personName.hasPrefix(prefix.lowercased())){
                searchedData.append(person)
            }
        }
        delegate?.getSearchedData(persons: searchedData)
    }
}


