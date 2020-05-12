//
//  TrialCount.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum TrialCount: Int, CustomStringConvertible, CaseIterable, MenuDisplayable {
    
    case once = 1
    case tenTimes = 2
    case oneHundredTimes = 3
    
    // This computed property provides conformance to the CustomStringConvertible protocol
    // Basically, that each option in the enumeration also provides a text-based description of that option
    var description: String {
        switch self {
        case .once:
            return "1"
        case .tenTimes:
            return "10"
        case .oneHundredTimes:
            return "100"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return """
                Now, how many trials should be performed with these selections?
                Time to sort the array for each individual trial will be reported.
                Average sort time across all trials will also be reported.
                
                Please enter your selection [1-3]:
                """
    }
    
}


class TrialCountMenu: Menu {
    
    init() {
        
        // Create arrays to store menu options
        var selections: [Int] = []
        var descriptions: [String] = []
        
        // Populate arrays
        for aCase in TrialCount.allCases {
            selections.append(aCase.rawValue)
            descriptions.append(aCase.description)
        }
        
        // Pass populated arrays to superclass
        super.init(selections: selections,
                   descriptions: descriptions,
                   prompt: TrialCount.prompt)
    }
    
}
