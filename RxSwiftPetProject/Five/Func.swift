//
//  Func.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 27.06.2021.
//

import Foundation
import RxSwift
import UIKit
import RxCocoa



class FuncTest: FiveViewController{
    var sas = FiveViewController()
    class func rxValue(label: UILabel, view: UIView){
        var asf = FiveViewController()
        
        label.text! = "Мы взлетаем"
        view.backgroundColor = .darkGray
        UIView.animate(withDuration: 0.5, animations: {
            view.transform = CGAffineTransform(rotationAngle: .pi*2)
        }, completion: { _ in
            UIView.animate(withDuration: 3, animations: {
                view.frame = view.frame.offsetBy(dx: 280, dy: -250)//-100
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    //                            self!.viewSpace.alpha = 0
                    view.frame = view.frame.offsetBy(dx: -250, dy: 450)
                    label.text = "Ура мы сели"
                })
            })
        })
    }
}
