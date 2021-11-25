//
//  CartViewModel.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import Foundation
import SwiftUI

protocol CartViewModelDelegate : AnyObject {
    func didFinishCartOperator()
    func didRemoveProduct()
    func didBuyProduct()
}

class CartViewModel{
    
    let network = Network()
    var products : [Product] = []
    var delegate : CartViewModelDelegate?
    
    func getProductInCart(){
        
        network.request(type: .cart) { (result : Result<BaseResponse<CartResponse>, CustomError>) in
            self.didFinishOperations(result: result)
        }
        
    }
    
    func removeProduct(with id : Int){
        
        network.request(type: .removeCart(id: id)) { (result : Result<BaseResponse<CartResponse>,CustomError>) in
            self.didFinishOperations(result: result)
            self.delegate?.didRemoveProduct()
        }
        
        
    }
    
    func buyProduct(){
        
        network.request(type: .clearCart) { (result : Result<BaseResponse<CartResponse>,CustomError>) in
            self.didFinishOperations(result: result)
            self.delegate?.didBuyProduct()
        }
        
        
    }
    
    
    func didFinishOperations(result : Result<BaseResponse<CartResponse>,CustomError>){
        switch result {
        case .success(let response):
            self.products = response.result?.products ?? []
            self.delegate?.didFinishCartOperator()
        case .failure(let failure):
            print(failure.message!)
        }
    }
}


