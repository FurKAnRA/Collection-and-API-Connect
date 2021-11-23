//
//  ImageView+Extensions.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import Foundation
import Kingfisher
import UIKit


extension UIImageView{
    
    func setImage (  urlString : String?) {
        guard let urlString = urlString else{
            self.image = nil
            return
        }
        self.kf.setImage(with: URL(string: urlString))
        
        
    }
}

