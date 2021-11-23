//
//  ViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 20.11.2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var products : [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        network()
    }
    
    
    
    
    
    
    func network (){
        let network = Network()
        
        
        network.request(type: .products) { (result : Result<BaseResponse<[Product]>,CustomError>) in
            switch result {
            case .failure(let customError):
                print(customError.message!)
            case .success (let response):
                
                self.products = response.result ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }


}


extension ViewController : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
    
        cell.configure(product: products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat = (collectionView.frame.width - 30) / 2
        
        let height : CGFloat = width * 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let productsDetails = ProductDetailViewController(productId: products[indexPath.row].id!)
//        SEGUE OLMADAN GİDİŞ
        self.navigationController?.pushViewController(productsDetails, animated: true)
    }
    
    
}

