//
//  TableView.swift
//  GithubApp
//
//  Created by BrainX on 15/06/2022.
//

import UIKit

// MARK: UITableView extension
extension UITableView {    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell =  dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath)
        return cell as! T
    }
}

