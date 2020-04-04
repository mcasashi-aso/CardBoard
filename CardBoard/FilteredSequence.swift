//
//  FilteredSequence.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//


@propertyWrapper
struct FilteredSequence<S: Sequence> {
    var stored: S
    var filter: (S.Element) -> Bool
    init(wrappedValue value: S, filter: @escaping (S.Element) -> Bool) {
        self.stored = value
        self.filter = filter
    }
    
    var wrappedValue: S {
        get { stored }
        set { stored = newValue.filter(self.filter) as! S }
    }
}
