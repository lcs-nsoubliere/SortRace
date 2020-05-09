//
//  ArrayCharacteristicsSelection.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum ArrayCharacteristic: Int {
    
    case almostSorted = 1
    case backwards = 2
    case random = 3
    case alreadySorted = 4

    static var lowestValue: Int {
        get {
            return 1
        }
    }

    static var highestValue: Int {
        get {
            return 4
        }
    }

}

func nameArrayCharacteristic(arrayType: ArrayCharacteristic) -> String {
    
    switch arrayType {
    case .almostSorted:
        return "Almost Sorted"
    case .backwards:
        return "Backwards"
    case .random:
        return "Random"
    case .alreadySorted:
        return "Already Sorted"
    default:
        break
    }
    
}

func determineDesiredArrayType() -> Int {
    
    // The response to return
    var validResponse = ArrayCharacteristic.lowestValue - 1
    
    // Loop until the response is in the expected range
    while validResponse < ArrayCharacteristic.lowestValue {
        
        // Ask the question
        print("\nWhat type of array data do you want to test with?\n")
        print("\(ArrayCharacteristic.almostSorted.rawValue) - \(nameArrayCharacteristic(arrayType: .almostSorted))")
        print("\(ArrayCharacteristic.backwards.rawValue) - \(nameArrayCharacteristic(arrayType: .backwards))")
        print("\(ArrayCharacteristic.random.rawValue) - \(nameArrayCharacteristic(arrayType: .random))")
        print("\(ArrayCharacteristic.alreadySorted.rawValue) - \(nameArrayCharacteristic(arrayType: .alreadySorted))")
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
