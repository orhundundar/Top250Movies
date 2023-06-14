//
//  File.swift
//  NetworkAPI
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation
import Alamofire


enum NetworkAPIModule {

    case top250Movies

    var shouldShowGlobalErrorAlert: Bool {
        switch self {
        default: return false
        }
    }
    
    
    private var baseURL: String {
        return "https://imdb-api.com/en/API/"
        
    }
    
    var endPoint: String {
        var endPoint = ""
        switch self {
        case .top250Movies:
            endPoint = "Top250Movies/k_9ayfvyqv"
            
            
            return baseURL + endPoint
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .top250Movies:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .top250Movies:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    var httpHeaders: HTTPHeaders {
        //Create mutable headers dictionary
        let headers: HTTPHeaders = [:]
        return headers
    }
    
    var contentType: [String] {
        switch self {
        default:
            return [ContentTypeEnum.ApplicationJSON.rawValue]
        }
    }
    
    enum ContentTypeEnum: String {
        case ApplicationURL = "application/x-www-form-urlencoded"
        case ApplicationJSON = "application/json"
        case TEXTPLAIN = "text/plain"
    }
}

