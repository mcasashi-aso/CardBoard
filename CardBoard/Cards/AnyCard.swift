//
//  AnyCard.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


struct AnyCard: Card {
    var body: Card
    var properties: [(name: String, property: Property?)] {
        self.body.properties
    }
    init<C: Card>(_ card: C) {
        self.body = card
    }
    init(_ card: Card) {
        self.body = card
    }
}


extension AnyCard: CustomStringConvertible {
    var description: String {
        "AnyCard(\(body))"
    }
}
