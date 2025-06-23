//
//  Item.swift
//  Nourish
//
//  Created by Cathy Wu on 6/22/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
