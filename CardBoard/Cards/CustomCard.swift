//
//  CustomCard.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


struct CustomCard: Card {
    private var _properties: [(name: String, property: Property?)] = []
    
    var name: String
    var properties: [(name: String, property: Property?)] { _properties }
    
    init<C: Card>(from card: C, name: String) {
        self.name = name
        self._properties = card.properties
    }
    
    init(name: String) {
        self.name = name
    }
}

extension CustomCard {
    mutating func addPropertySpace<T: Property>(name: String, type: T.Type) {
        _properties.append((name, Optional<T>.none))
    }
    
    mutating func setProperty<T: Property>(name: String, value: Optional<T>) {
        guard let index = _properties
            .firstIndex(where: { $0.name == name }) else { return }
        _properties[index] = (name, value)
    }
}

extension CustomCard: CustomStringConvertible {
    var description: String {
        "CustomCard(\(name), \(properties))"
    }
}
