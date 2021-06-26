//
//  FourViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class FourViewController: UIViewController {
    
    @IBOutlet weak var elements: UILabel!
    @IBOutlet weak var tapScreen: UIButton!
    var countElement = 0
    var bag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elements.text = "\(countElement)"
        
        tapScreen.rx
            .tap
            .subscribe { [weak self] _ in
                self!.countElement += 1
                self!.elements.text = "\(self!.countElement )"
        }
    }
}
