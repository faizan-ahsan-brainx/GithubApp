//
//  ViewController.swift
//  GithubApp
//
//  Created by BrainX on 07/06/2022.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var serachTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPersons()
    }
    
    func getPersons() {
        API.instance.getData { person in
            print(person.count)
        }
    }
}




