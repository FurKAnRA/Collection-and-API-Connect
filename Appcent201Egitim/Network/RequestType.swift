//
//  RequestType.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 20.11.2021.
//

import Foundation

enum RequestType {
    case products
    case productDetails(id : Int)
    case addToCart(productId : Int)
    case Cart
    case removeCart(id : Int)
    case clearCart
    
    var endPoint : String{
        
        switch  self {
        case .products:
            return "products"
            
        case .productDetails(id: let id):
            
            return "products/" + id.toString
            
        case .addToCart(productId: let productId):
            
            return "addtocart/" + Network.cartId.toString + "/" + productId.toString
            
        case .Cart:
            
            return "cart/" + Network.cartId.toString
        case .removeCart(id: let id):
            
            return "removeproduct/" + Network.cartId.toString + "/" + id.toString
        case .clearCart:
            
            return "clearcart/" + Network.cartId.toString
        }
    }
    
    var httpMethod : HttpMethod {
        
        switch self {
       
        case .addToCart :
            return .POST
        
        default :
            return .GET
        
        
        }
      
    }
    
}
