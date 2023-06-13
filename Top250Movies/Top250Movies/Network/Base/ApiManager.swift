//
//  ApiManager.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import Alamofire

class ApiManager {
    
    static func sendRequest(url: String, completionHandler: @escaping (Data?) -> Void){
        
        AF.request(url).responseData { response in
            
            switch response.result {
            case .success(let data):
                completionHandler(data)
            case .failure(let error):
                completionHandler(nil)
            }
        }
    }
    
}
