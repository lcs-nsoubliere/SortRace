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

func getArrayCharacteristicSelection() -> ArrayCharacteristic {

    // The response to return
    var validResponse = 0

    // Loop until the response is in the expected range
    while validResponse == 0 {

        // Show the prompt
        print("\n\(ArrayCharacteristic.prompt)\n")
        
        // Show the possible options
        for characteristic in ArrayCharacteristic.allCases {
            print("\(characteristic.rawValue) - \(characteristic.description)")
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
        guard integerResponse >= ArrayCharacteristic.allCases.first!.rawValue, integerResponse <= ArrayCharacteristic.allCases.last!.rawValue else {

            // If response is not in desired range, ask again
            print("\nPlease enter a valid selection.")
            continue
            
        }

        // If we've made it here, the response is one of the enumeration types
        validResponse = integerResponse

    }

    // Return the response
    return ArrayCharacteristic(rawValue: validResponse)!

}
