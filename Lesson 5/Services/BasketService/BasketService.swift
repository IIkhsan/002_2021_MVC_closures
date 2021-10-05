//
//  BasketService.swift
//  Lesson 5
//
//  Created by i.ikhsanov on 05.10.2021.
//

import Foundation

final class BasketService {
    
    func addToBasket(completion: @escaping (() -> Void)) {
        sleep(10)
        completion()
    }
    
    func getBasketCount() -> Int {
        return 3
    }
}
