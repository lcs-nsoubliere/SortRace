//
//  ArrayCharacteristicsSelection.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum ArrayCharacteristic: Int, CustomStringConvertible, CaseIterable, MenuDisplayable {
    
    case almostSorted = 1
    case backwards = 2
    case random = 3
    case alreadySorted = 4
    
    // This computed property provides conformance to the CustomStringConvertible protocol
    // Basically, that each option in the enumeration also provides a text-based description of that option
    var description: String {
        switch self {
        case .almostSorted:
            return "Almost Sorted"
        case .backwards:
            return "Backwards"
        case .random:
            return "Random"
        case .alreadySorted:
            return "Already Sorted"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return "In the array to be sorted, existing values should be?"
    }
    
}

class ArrayCharacteristicMenu: Menu {
    
    init() {
        
        // Create arrays to store menu options
        var selections: [Int] = []
        var descriptions: [String] = []
        
        // Populate arrays
        for aCase in ArrayCharacteristic.allCases {
            selections.append(aCase.rawValue)
            descriptions.append(aCase.description)
        }
        
        // Pass populated arrays to superclass
        super.init(selections: selections,
                   descriptions: descriptions,
                   prompt: ArrayCharacteristic.prompt)
    }
    
}
