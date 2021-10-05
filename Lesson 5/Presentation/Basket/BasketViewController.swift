//
//  ViewController.swift
//  Lesson 5
//
//  Created by i.ikhsanov on 05.10.2021.
//

import UIKit

class BasketViewController: UIViewController {

    // Dependency
    let service = BasketService()
    
    // Property
    let names = ["Maks", "Semen"]
    var viewModels: [Product] = []
    
    var closures: [() -> Int] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        var someInt = 0
        for _ in 0..<5 {
            closures.append {
                print(someInt)
                return someInt
            }
            someInt += 1
        }
    }
    
    // MARK: - Private functions
    
    private func configure() {
        guard let basketView = view as? BasketView else { return }
        basketView.tableView.delegate = self
        basketView.tableView.dataSource = self
        viewModels = viewModelFactory()
        viewModels[0].action(3)
    }
    
    private func viewModelFactory() -> [Product] {
        return [
            .init(name: "Макарошки", action: basketFactory),
            .init(name: "Сосиски", action: { outputData in // capture list
                self.service.addToBasket {
                    
                }
                print("Добавил сосиски: \(outputData)")
            }),
            .init(name: "Картошка", action: { _ in
                print("Добавил картошку")
            })
        ]
    }
    
    func basketFactory(count: Int) {
        print("Basket factory")
    }
}

// MARK: - UITableViewDataSource, UITableViewDeletage

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BasketTableViewCell else { return UITableViewCell() }
        cell.configure(product: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
//    func main() {
//        names.forEach { name in
//            nameHello(name)
//        }
//    }
//
//    func configure() {
//        var someInt = 1
//
//        func configureInside() {
//            someInt += 1
//        }
//
//        for _ in 0..<5 {
//            configureInside()
//        }
//        print(someInt)
//    }
}
