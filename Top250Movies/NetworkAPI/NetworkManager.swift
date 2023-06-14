//
//  NetworkManager.swift
//  NetworkAPI
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation
import Alamofire


typealias SuccessBlock = ((Any) -> Void)
typealias FailureBlock = ((String) -> Void)?

class NetworkManager {
    //MARK: Shared Instance
    static let shared = NetworkManager()
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
    }
    
    //MARK: Public request method
    func sendRequestWith(target: NetworkAPIModule, success: @escaping SuccessBlock, failure: FailureBlock) {
        Session.default.request(target.endPoint,
                                method: target.method,
                                parameters: target.parameters,
                                encoding: target.encoding)
            .validate(statusCode: 200..<500)
        .validate(contentType: target.contentType)
        .responseData(completionHandler: { [weak self] (response) in
            //self?.handleGlobalWaitingView(target: target, show: false)
            self?.parseResponse(response: response, target: target, success: success, failure: failure)
        })
    }
    private func parseResponse(response: AFDataResponse<Data>, target: NetworkAPIModule, success: @escaping SuccessBlock, failure: FailureBlock) {
        if let data = response.data {
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                let baseResponse = try JSONDecoder().decode(Top250MoviesResponseModel.self, from: data)
                success(baseResponse)
            } catch {
                self.handleError(target: target, completion: failure)
            }
        } else {
            self.handleError(target: target, completion: failure)
        }
    }
    
    //MARK: Handle errors
    private func handleError(target: NetworkAPIModule?, error: String? = nil, completion: FailureBlock) {
        let defaultErrorMessage = "global_network_error_message"
        completion?(error ?? defaultErrorMessage) //Let closure go.        
    }


    
}

