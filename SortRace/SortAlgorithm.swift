//
//  SortAlgorithm.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum SortAlgorithm: Int, CustomStringConvertible, CaseIterable, MenuDisplayable {
    
    case bubbleSort = 1
    case selectionSort = 2
    case insertionSort = 3

    // This computed property provides conformance to the CustomStringConvertible protocol
    // Basically, that each option in the enumeration also provides a text-based description of that option
    var description: String {
        switch self {
        case .bubbleSort:
            return "Bubble Sort"
        case .selectionSort:
            return "Selection Sort"
        case .insertionSort:
            return "Insertion Sort"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return "What sort algorithm would you like to test? "
    }

}

class AlgorithmMenu: Menu {
    
    init() {
        
        // Create arrays to store menu options
        var selections: [Int] = []
        var descriptions: [String] = []
        
        // Populate arrays
        for aCase in SortAlgorithm.allCases {
            selections.append(aCase.rawValue)
            descriptions.append(aCase.description)
        }
        
        // Pass populated arrays to super class
        super.init(selections: selections,
                   descriptions: descriptions,
                   prompt: SortAlgorithm.prompt)
    }
    
}
