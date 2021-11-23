//
//  UIView+Extension.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 23.11.2021.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius : CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
}
