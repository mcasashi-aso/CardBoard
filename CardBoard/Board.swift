//
//  Board.swift
//  CardBoard
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import UIKit

class Board: UIDocument, Card {
    
    var properties: [(name: String, property: Property?)] {
        groups.map { card in
            let name = card.properties.first { $0.property is Group }!.name
            return (name, card)
        }
    }

    @FilteredSequence(filter: \.isGroup)
    var groups = [Card]()

    var pool = Group(name: "pool", children: [AnyCard]())
    
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

extension Board {
    convenience init(groups: [Card], pool: [Card]) {
        self._groups = FilteredSequence(wrappedValue: groups, filter: \.isGroup)
        self.pool = Group(name: "pool", children: pool)
    }
}
