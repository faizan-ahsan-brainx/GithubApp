//
//  ImageViewExtension.swift
//  GithubApp
//
//  Created by BrainX on 08/06/2022.
//

import UIKit
extension UIImageView {
    
    // MARK: - Function To Get Image from URL
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
