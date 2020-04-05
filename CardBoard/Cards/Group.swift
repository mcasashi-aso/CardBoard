//
//  Group.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


struct Group: Card {
    typealias Element = AnyCard
    
    var name: String
    var children: [Element]
    
    var properties: [(name: String, property: Property?)] {
        [(name, children)]
    }
}

extension Group: Collection {
    typealias Index = Int
    typealias Iterator = IndexingIterator<Self>
    
    var startIndex: Int { children.startIndex }
    var endIndex: Int { children.endIndex }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    subscript(position: Index) -> Element {
        _read   {
            yield children[position]
        }
        _modify {
            var element = children[position]
            yield &element
            children[position] = element
        }
    }
}

extension Group {
    init(name: String, children: [Card]) {
        self.name = name
        self.children = children.map { AnyCard($0) }
    }
}

extension Group {
    var description: String {
        "GroupCard(\(self))"
    }
}
