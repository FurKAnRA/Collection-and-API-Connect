//
//  Responses.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 20.11.2021.
//

import Foundation


struct  BaseResponse <T : Decodable> : Decodable {
    let status : String?
    let statusCode : Int?
    let message : String?
    let result : T?
}


struct Product : Decodable{
    var id : Int?
    var productName : String?
    var type : String?
    var oldPrice : Double?
    var newPrice : Double?
    var productImage : String?
    var quantity : Int?
    var currentStroe : String?
}

struct CustomError : Error {
    let message : String?
}

struct CartResponse : Decodable {
    let id : Int?
    let token : String?
    let product : [Product]?
    
}
