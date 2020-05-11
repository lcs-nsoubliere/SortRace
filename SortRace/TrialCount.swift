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

func getTrialCountSelection() -> TrialCount {

    // The response to return
    var validResponse = 0

    // Loop until the response is in the expected range
    while validResponse == 0 {

        // Show the prompt
        print("\n\(TrialCount.prompt)\n")
        
        // Show the possible options
        for trials in TrialCount.allCases {
            print("\(trials.rawValue) - \(trials.description)")
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
        guard integerResponse >= TrialCount.allCases.first!.rawValue, integerResponse <= TrialCount.allCases.last!.rawValue else {

            // If response is not in desired range, ask again
            print("\nPlease enter a valid selection.")
            continue
            
        }

        // If we've made it here, the response is one of the enumeration types
        validResponse = integerResponse

    }

    // Return the response
    return TrialCount(rawValue: validResponse)!

}
