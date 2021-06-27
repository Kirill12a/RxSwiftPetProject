//
//  FiveV2ViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 27.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

struct Person {
    let name : String
    let age : Int
    
}

class FiveV2ViewController: UIViewController {
    typealias pr = Person
    let personArray = [
        pr(name: "Kirill", age: 17),
        pr(name: "Anton", age: 17),
        pr(name: "Ivan", age: 17),
        pr(name: "Olya", age: 16),
        pr(name: "Oleg", age: 14),
        pr(name: "Nikita", age: 17),
        pr(name: "Nata", age: 43),
        pr(name: "Kolya", age: 50),
        pr(name: "Ira", age: 55),
        pr(name: "Polina", age: 17),
        pr(name: "Vasya", age: 17),
        pr(name: "Vera", age: 67),
        pr(name: "Igor", age: 17),
        pr(name: "Tima", age: 17),
        pr(name: "Sasha", age: 17),
        pr(name: "Maks", age: 17),
        pr(name: "Nastya", age: 15),
        pr(name: "Ruslan", age: 28),
        pr(name: "Oksana", age: 35),
        pr(name: "Vlad", age: 17)
    ]
    
    let disposeBag = DisposeBag()
    var items : Observable<[pr]>!
    
    @IBOutlet weak var mytable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        items = Observable.just(personArray)
        bindData()
    }
    
    @IBAction func prependButtonAction(_ sender: UIButton) {
        let newPersonArray = [
            pr(name: "Ира", age: 17),
            pr(name: "Амир", age: 18)
        ]
        prependData(dataToPrepend: newPersonArray)
        
    }
    
    @IBAction func appendButtonAction(_ sender: UIButton) {
        let newPersonArray = [
            pr(name: "Илья", age: 17),
            pr(name: "Давид", age: 18)
        ]
        appendData(dataToAppend : newPersonArray)
        
        
    }
    
    
    
    private func bindData() {
        mytable.dataSource = nil
        
        
        items.bind(to: mytable.rx.items(cellIdentifier: "cell")){ (row, person, cell) in
            if let cellToUse = cell as? FiveN2TableViewCell {
                cellToUse.label1.text = person.name
                cellToUse.label2.text = "\(person.age)"
            }
        }
    }
    
    private func prependData(dataToPrepend : [pr]) {
        let newObserver = Observable.just(dataToPrepend)
        items = Observable.combineLatest(items, newObserver) {
            $1+$0
        }
        bindData()
    }
    
    
    private func appendData(dataToAppend : [pr]) {
        let oneEle = dataToAppend.randomElement()
        let newObserver = Observable.just(dataToAppend)
        items = Observable.combineLatest(items, newObserver) {
            $0+$1
        }
        bindData()
    }
}
