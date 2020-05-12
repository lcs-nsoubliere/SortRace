//
//  ArraySizeSelection.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum ArraySize: Int, CustomStringConvertible, CaseIterable, MenuDisplayable {
    
    case oneThousand = 1
    case tenThousand = 2
    case oneHundredThousand = 3
    
    // This computed property provides conformance to the CustomStringConvertible protocol
    // Basically, that each option in the enumeration also provides a text-based description of that option
    var description: String {
        switch self {
        case .oneThousand:
            return "1000"
        case .tenThousand:
            return "10000"
        case .oneHundredThousand:
            return "100000"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return "In the array to be sorted, how many values should there be?"
    }
    
}

class ArraySizeMenu: Menu {
    
    init() {
        
        // Create arrays to store menu options
        var selections: [Int] = []
        var descriptions: [String] = []
        
        // Populate arrays
        for aCase in ArraySize.allCases {
            selections.append(aCase.rawValue)
            descriptions.append(aCase.description)
        }
        
        // Pass populated arrays to superclass
        super.init(selections: selections,
                   descriptions: descriptions,
                   prompt: ArraySize.prompt)
    }
    
}
