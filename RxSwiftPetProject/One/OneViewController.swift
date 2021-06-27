//
//  OneViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import UIKit
import Foundation
import RxCocoa
import RxSwift

class OneViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        loginField.becomeFirstResponder()
        
        loginField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.loginUserPublishSubject).disposed(by: disposeBag)
        passwordField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.passwordUserPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.validData().bind(to: buttonOutlet.rx.isEnabled).disposed(by: disposeBag)
        
        loginViewModel.validData().map{$0 ? 1 : 0}.bind(to: buttonOutlet.rx.alpha).disposed(by: disposeBag)
        
        
        loginViewModel.validData().subscribe { [self] (isValid) in
            message.text = isValid ? "Отправить" : ""
        }
        
        
    }
    
}
