//
//  URLCard.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


struct URLCard: Card {
    var body: String?
    var properties: [(name: String, property: Property?)] {
        [("", self.body)]
    }
    init(string: String?) {
        self.body = string
    }
}


extension URLCard: CustomStringConvertible {
    var description: String {
        "URLCard(\(body ?? ""))"
    }
}
