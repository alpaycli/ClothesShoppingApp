//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published private(set) var items: [Clothe] = []

    @Published private(set) var total: Int = 0

    func addCard(item: Clothe) {
        items.append(item)
        total += Int(item.price)
    }
    
    func removeCard(item: Clothe) {
        items = items.filter { $0.id != item.id }
        total -= Int(item.price)
    }
}
