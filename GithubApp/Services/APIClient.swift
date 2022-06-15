//
//  API.swift
//  GithubApp
//
//  Created by BrainX on 07/06/2022.
//

import Foundation
import Alamofire
class APIClient{
    static let shared = APIClient()
    private init(){
        
    }
    // MARK: - Function to get Github Data
    func getData(completionHandler: @escaping (_ person: [Person]) -> Void) {
        _ = Alamofire.request("https://api.github.com/repositories", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            (data) in
            guard let responseData = data.data else {return}
            do{
                let persons = try JSONDecoder().decode([Person].self, from: responseData)
                completionHandler(persons)
            }
            catch{
                print("Error decoding == \(error)")
            }
        }
    }

}
