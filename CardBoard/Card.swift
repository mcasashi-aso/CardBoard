//
//  Card.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


protocol Card: Property, Codable {
    var properties: [(name: String, property: Property?)] { get }
}

extension Card {
    var string: String {
        properties
            .compactMap(\.property?.string)
            .joined(separator: "\n")
    }
}

extension Card {
    var isGroup: Bool {
        properties.map(\.property).contains(where: { $0 is Group })
    }
}
