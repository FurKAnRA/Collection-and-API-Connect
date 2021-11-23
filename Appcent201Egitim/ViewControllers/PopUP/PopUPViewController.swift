//
//  PopUPViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import UIKit

class PopUPViewController: UIViewController {

    @IBOutlet weak var popUpButton: UIButton!
    @IBOutlet weak var popUpLabel: UILabel!
    
    private let labelText : String
    private let buttonText : String
    
    private let buttonAction : () -> Void

    init(labelText : String , buttonText : String , buttonAction : @escaping ()-> Void){
        self.labelText = labelText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpLabel.text = labelText
        popUpButton.setTitle(buttonText, for: .normal)
        
        
    }

    @IBAction func goHomeButton(_ sender: Any) {
        
//        pop up kapatmak için 
        self.dismiss(animated: true, completion: buttonAction)
    }
    
}
