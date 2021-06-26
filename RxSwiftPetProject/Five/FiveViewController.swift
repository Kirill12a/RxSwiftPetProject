//
//  FiveViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class FiveViewController: UIViewController {
    
    @IBOutlet weak var imageSpaceX: UIImageView!
    @IBOutlet weak var viewSpace: UIView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var oneTouchOutlet: UIButton!
    @IBOutlet weak var twoTouchOutlet: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        oneTouchOutlet.rx
            .tap
            .subscribe {[weak self] (elements) in
                FuncTest.rxValue(label: self!.labelText, view: self!.viewSpace)
            }
        twoTouchOutlet.rx
            .tap
            .subscribe {[weak self] (elements) in
                FuncTest.rxValue(label: self!.labelText, view: self!.viewSpace)
                
            }
    


    }
    
}
