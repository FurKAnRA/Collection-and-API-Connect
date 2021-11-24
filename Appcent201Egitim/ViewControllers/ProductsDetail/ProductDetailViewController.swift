//
//  ProductDetailViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 23.11.2021.
//

import UIKit
import Kingfisher
import AVFoundation

class ProductDetailViewController: BaseViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productAmountLabel: UILabel!
    @IBOutlet weak var storesButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    private let productId : Int
    let network = Network()

    init (productId : Int){
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails(with: productId)
      
    }
    
    func getDetails(with id : Int){
        
        
        
        network.request(type: .productDetails(id: id)) { (result : Result<BaseResponse<Product>, CustomError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.productImageView.setImage(urlString: response.result?.productImage)
                    self.productAmountLabel.text = response.result?.newPrice?.DoubleToString
                    self.productNameLabel.text = response.result?.productName
                    
                }
                
            case .failure(let failure):
                print(failure.message!)
            }
        }
        
        
    }
    
    
    
    
    @IBAction func actionStore(_ sender: Any) {
        let map = MapViewController()
        self.navigationController?.pushViewController(map, animated: true)
        
    }
    
    @IBAction func actionAddToCart(_ sender: Any) {
        
        network.request(type: .addToCart(productId: productId)) { (result : Result<BaseResponse<CartResponse>,CustomError>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    let popUp = PopUPViewController(labelText: "Sepete Eklediniz", buttonText: "Anasayfaya Git", buttonAction: self.buttonAction)
//                    modelin alert olarak çıkması için yazılan kodlar
                    popUp.modalPresentationStyle = .overCurrentContext
                    popUp.modalTransitionStyle = .crossDissolve
                    self.present(popUp, animated: true, completion: nil)
                }
                
            case .failure(let failure):
                print(failure.message!)
            }
            
           
        }
    }
    
    func buttonAction(){
        self.navigationController?.popViewController(animated: true)
        
    }
    


}
