//
//  TwoViewController.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class TwoViewController: UIViewController, UITableViewDataSource  {
    var shownCities = [String]() // Данные для UITableView
    let allCities = ["Kirill","Anton","Dima","Oleg","Vadim","Ilya","Ivan","David","Amir","Misha","Alex","Olya","Sonya","Tanya","Nata","Igor","Sam","Jim","Garoslav","Semen"]// Заменитель источника данных API
    let disposeBag = DisposeBag() // Корзина для использованных переменных (disposables), чтобы освободить (release) занимаемые ими ресурсы, когда представление (view) будет удалено из памяти (deallocated), что защищает от циклов владения (retain cycle)
    
  ///fdfwfwfwe
    @IBOutlet weak var searchValue: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        searchValue
            .rx.text // Наблюдаемое свойство.
        .orEmpty // Make it non-optional
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance) // Wait 1000 for changes.
            .distinctUntilChanged()//Если они не появились, проверить что новое значение идентично старому
        .subscribe(onNext: { [unowned self] query in // Здесь мы подписываемся на каждое новое непустое значение (благодаря фильтру выше)
            self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // Здесь мы выполняем "запрос к API", чтобы найти города
            self.tableView.reloadData() // Перезагружаем данные таблицы
            
        })
            .disposed(by: disposeBag)
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        return cell
    }
    
    
}

