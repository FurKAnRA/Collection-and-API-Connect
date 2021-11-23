//
//  Network.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 20.11.2021.
//

import Foundation



struct  Network {
    
    private let baseURL = "http://159.223.0.153/"
    
    static let cartId : Int = 2
    
    func request<T:Decodable>(type : RequestType , completion : @escaping (Result<T,CustomError>) -> Void) {
        
        guard let url = URL(string: baseURL + type.endPoint) else {
            print("Url oluşturulamadı.")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = type.httpMethod.rawValue
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            
            guard let data = data else{
            
                completion(.failure(CustomError(message: "Veri yok")))
                return
                
            }
            
            let decoder = JSONDecoder()
            
            do{
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            }
            catch let error{
                completion(.failure(CustomError(message: error.localizedDescription)))
            }
            
        }
        .resume()
        
        
        
        
        
        
        
        
        
    }
}
