//
//  BasketView.swift
//  Lesson 5
//
//  Created by i.ikhsanov on 05.10.2021.
//

import UIKit

class BasketView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    func configureView() {
        tableView.backgroundColor = .green
    }
}
