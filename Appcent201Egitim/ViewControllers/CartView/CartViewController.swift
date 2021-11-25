//
//  CartViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import UIKit

class CartViewController: BaseViewController {
    
    private let viewModel = CartViewModel()
 
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        viewModel.delegate = self
        viewModel.getProductInCart()
        
        let nib = UINib(nibName: "CartCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CartCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        navigationItem.rightBarButtonItem = nil
    }

    @IBAction func buyButton(_ sender: Any) {
        viewModel.buyProduct()
    }
    

}

extension CartViewController : CartViewModelDelegate {
    func didRemoveProduct() {
        DispatchQueue.main.async {
            let popUP = PopUPViewController(labelText: "Ürün Sepetten Kaldırıldı", buttonText: "Tamam", buttonAction:{ })
            popUP.modalTransitionStyle = .crossDissolve
            popUP.modalPresentationStyle = .overCurrentContext
            self.present(popUP, animated: true, completion: nil)
        }
       
    }
    
    func didBuyProduct() {
        DispatchQueue.main.async {
            let popUP = PopUPViewController(labelText: "Ürünler Satın Alındı", buttonText: "Tamam", buttonAction:{
                self.navigationController?.popToRootViewController(animated: true)
            })
            popUP.modalTransitionStyle = .crossDissolve
            popUP.modalPresentationStyle = .overCurrentContext
            self.present(popUP, animated: true, completion: nil)
        }
      
    }
    
    
    
    func didFinishCartOperator() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        
    }
}

extension CartViewController : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  viewModel.products.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as? CartCollectionViewCell else{ fatalError("Cell ") }
        cell.delegate = self
        cell.configure(with: viewModel.products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40 , height: 150)
    }
    
   
}


extension CartViewController : CartCollectionViewCellDelegate{
    func actionDeleteButton(product: Product) {
        guard let id = product.id else {
            return
            
        }
            viewModel.removeProduct(with: id)
        
    }
    
    
}
