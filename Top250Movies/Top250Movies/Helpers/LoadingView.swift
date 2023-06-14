//
//  LoadingView.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import UIKit

class LoadingView: UIView {
    
    static let shared = LoadingView()
    
    private var activityView: UIActivityIndicatorView?
    private var isLoadingViewShowing:Bool = false
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        //for debug validation
        self.backgroundColor = UIColor.gray
                
        if #available(iOS 13.0, *) {
            activityView = UIActivityIndicatorView(style: .large)
        } else {
            activityView = UIActivityIndicatorView(style: .whiteLarge)
        }
        activityView?.center = self.center
        self.addSubview(activityView!)
        activityView?.startAnimating()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func startLoadingView(vc:UIViewController){
        if !isLoadingViewShowing {
            activityView?.startAnimating()
            vc.view.addSubview(self)
            isLoadingViewShowing = true
        }
    }
    
    public func startLoadingView(){
        if !isLoadingViewShowing {
            
            if let window = UIApplication.shared.keyWindow {
                if let rootViewController = window.rootViewController {
                    activityView?.startAnimating()
                    rootViewController.view.addSubview(self)
                }
            }
            isLoadingViewShowing = true
        }
    }
    
    public func stopLoadingView(){
        isLoadingViewShowing=false
        activityView?.stopAnimating()
        self.removeFromSuperview()
    }
    
}
