//
//  BaseViewController.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoading(){
        LoadingView.shared.startLoadingView()
    }
    
    func showLoading(vc:UIViewController){
        LoadingView.shared.startLoadingView(vc: vc)
    }
    
    func dismissLoading(){
        LoadingView.shared.stopLoadingView()
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "okay", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title:String, message:String, okayAction: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "okay", style: .default, handler: { _ in
            okayAction()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
