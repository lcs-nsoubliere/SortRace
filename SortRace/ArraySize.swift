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
            return "1,000"
        case .tenThousand:
            return "10,000"
        case .oneHundredThousand:
            return "100,000"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return "In the array to be sorted, how many values should there be?"
    }
    
}

func getArraySizeSelection() -> ArraySize {

    // The response to return
    var validResponse = 0

    // Loop until the response is in the expected range
    while validResponse == 0 {

        // Show the prompt
        print("\n\(ArraySize.prompt)\n")
        
        // Show the possible options
        for size in ArraySize.allCases {
            print("\(size.rawValue) - \(size.description)")
        }
        print("\nEnter your selection: ", terminator: "")

        // Get the initial response
        guard let response = readLine() else {

            // If no response given, loop and ask again
            print("\nPlease enter a selection.")
            continue
            
        }

        // Convert to integer
        guard let integerResponse = Int(response) else {

            // If response cannot be made into an integer, ask again
            print("\nPlease enter an integer.")
            continue
            
        }

        // Check that integer is in desired range
        guard integerResponse >= ArraySize.allCases.first!.rawValue, integerResponse <= ArraySize.allCases.last!.rawValue else {

            // If response is not in desired range, ask again
            print("\nPlease enter a valid selection.")
            continue
            
        }

        // If we've made it here, the response is one of the enumeration types
        validResponse = integerResponse

    }

    // Return the response
    return ArraySize(rawValue: validResponse)!

}
