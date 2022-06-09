//
//  UiViewControllerExtension.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import Foundation
import UIKit

// MARK: - Extensions For UIViewController
extension UIViewController{
    
    static func instantiate(from storyboardName: StoryBoardName) -> Self {
            let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
        }
    
}
enum StoryBoardName: String{
    case main = "Main"
}
