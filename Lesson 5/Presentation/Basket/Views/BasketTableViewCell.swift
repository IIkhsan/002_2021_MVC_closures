//
//  BasketTableViewCell.swift
//  Lesson 5
//
//  Created by i.ikhsanov on 05.10.2021.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var tapMeButton: UIButton!
    
    // Private properties
    private var actionClosure: ((Int) -> ())?
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product) {
        textLabel?.text = product.name
        actionClosure = product.action
    }
    
    // Private functions
    @IBAction func didTapTapMeButton(_ sender: Any) {
        actionClosure?(5)
    }
}
