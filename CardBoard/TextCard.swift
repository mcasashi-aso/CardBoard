//
//  TextCard.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


struct TextCard: Card {
    var body: String?
    var properties: [(name: String, property: Property?)] {
        [("", self.body)]
    }
    init(_ text: String?) {
        self.body = text
    }
}


extension TextCard: CustomStringConvertible {
    var description: String {
        "TextCard(\(body ?? ""))"
    }
}
