//
//  ThreeViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//


import UIKit
import RxCocoa
import RxSwift

struct Preson {
    var name: String
}


class ThreeViewController: UIViewController {

    var personArray = [
        Preson(name: "Kirill"),
        Preson(name: "Anton"),
        Preson(name: "Ivan"),
        Preson(name: "Olya"),
        Preson(name: "Oleg"),
        Preson(name: "Nikita"),
        Preson(name: "Nata"),
        Preson(name: "Kolya"),
        Preson(name: "Ira"),
        Preson(name: "Polina"),
        Preson(name: "Vasya"),
        Preson(name: "Vera"),
        Preson(name: "Igor"),
        Preson(name: "Tima"),
        Preson(name: "Sasha"),
        Preson(name: "Maks"),
        Preson(name: "Nastya"),
        Preson(name: "Ruslan"),
        Preson(name: "Oksana"),
        Preson(name: "Vlad")
    ]
    
    let bug = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let array: Observable<[Preson]> = Observable.just(personArray)
        
        array.bind(to: tableView.rx.items(cellIdentifier: "cell")){_,person, cell in
            if let cellToUse = cell as? CellTableViewCell{
                cellToUse.nameLabel.text = person.name
            }
            
        }.disposed(by: bug)
        
    }
    @IBAction func addPerson(_ sender: Any) {
        personArray.append(Preson(name: "Kiks"))
        print(personArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        }
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


