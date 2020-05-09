//
//  ArraySizeSelection.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum ArraySize: Int {
    
    case oneThousand = 1
    case tenThousand = 2
    case oneHundredThousand = 3
    
    static var lowestValue: Int {
        get {
            return 1
        }
    }

    static var highestValue: Int {
        get {
            return 3
        }
    }

}

func provideArraySize(size: ArraySize) -> Int {
    
    switch size {
    case .oneThousand:
        return 1_000
    case .tenThousand:
        return 10_000
    case .oneHundredThousand:
        return 100_000
    default:
        break
    }
    
}

func determineDesiredArraySize() -> Int {
    
    // The response to return
    var validResponse = ArraySize.lowestValue - 1
    
    // Loop until the response is in the expected range
    while validResponse < ArraySize.lowestValue {
        
        // Ask the question
        print("\nWhat array size do you want to test with?\n")
        print("\(ArraySize.oneThousand.rawValue) - \(provideArraySize(size: .oneThousand))")
        print("\(ArraySize.tenThousand.rawValue) - \(provideArraySize(size: .tenThousand))")
        print("\(ArraySize.oneHundredThousand.rawValue) - \(provideArraySize(size: .oneHundredThousand))")
        print("\nEnter your selection: ", terminator: "")
        
        // Get the initial response
        guard let response = readLine() else {
            
            // If no response given, loop and ask again
            print("\nPlease enter a selection.\n")
            continue
        }
        
        // Convert to integer
        guard let integerResponse = Int(response) else {
            
            // If response cannot be made into an integer, ask again
            print("\nPlease enter an integer.\n")
            continue
        }
        
        // Check that integer is in desired range
        guard integerResponse >= SortAlgorithm.lowestValue, integerResponse <= SortAlgorithm.highestValue else {
            
            // If response is not in desired range, ask again
            print("\nPlease enter a valid selection.\n")
            continue
        }
        
        // If we've made it here, the response is 1, 2, or 3
        validResponse = integerResponse

    }
    
    // Return the response
    return validResponse

}
