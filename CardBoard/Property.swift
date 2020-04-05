//
//  Property.swift
//  CardBoard_Test
//
//  Created by Masashi Aso on 2020/04/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import UIKit

// enumにすればCodableにできるけど…

protocol Property/*: Codable*/ {
    var string: String { get }
}

extension String: Property {
    var string: String { self }
}

extension Array: Property where Element: Property {
    var string: String { description }
}

extension Optional: Property where Wrapped: Property {
    var string: String {
        switch self {
        case .some(let v): return v.string
        case .none:        return ""
        }
    }
}

extension UIImage: Property {
    var string: String { "image" }
}
