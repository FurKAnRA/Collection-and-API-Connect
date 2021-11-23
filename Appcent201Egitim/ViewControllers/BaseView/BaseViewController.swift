//
//  BaseViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 20.11.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        
        let cartButton = UIBarButtonItem(image: UIImage(named: "basket"), style: .plain, target: nil, action: nil)
        
        cartButton.tintColor =  UIColor(named: "black")
        navigationItem.rightBarButtonItem = cartButton
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "lightGreen")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
    }
    


}
