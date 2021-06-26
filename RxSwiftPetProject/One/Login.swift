//
//  Login.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class LoginViewModel {
    let loginUserPublishSubject = PublishSubject<String>()
    let passwordUserPublishSubject = PublishSubject<String>()
    
    func validData() ->Observable<Bool>{
        return Observable.combineLatest(loginUserPublishSubject.asObserver().startWith(""), passwordUserPublishSubject.asObserver().startWith("")).map { (username, password) in
            return username.count > 3 && password.count > 3
        }.startWith(false )
    }
}
