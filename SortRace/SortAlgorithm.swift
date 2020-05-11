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
    case insertionSort = 2
    case selectionSort = 3
    
    // This computed property provides conformance to the CustomStringConvertible protocol
    // Basically, that each option in the enumeration also provides a text-based description of that option
    var description: String {
        switch self {
        case .bubbleSort:
            return "Bubble Sort"
        case .insertionSort:
            return "Insertion Sort"
        case .selectionSort:
            return "Selection Sort"
        }
    }
    
    // This computed property provides conformance to the MenuDisplayable protocol
    static var prompt: String {
        return "What sort algorithm would you like to test? "
    }

}

func getSortAlgorithmSelection() -> SortAlgorithm {

    // The response to return
    var validResponse = 0

    // Loop until the response is in the expected range
    while validResponse == 0 {

        // Show the prompt
        print("\n\(SortAlgorithm.prompt)\n")
        
        // Show the possible options
        for algorithm in SortAlgorithm.allCases {
            print("\(algorithm.rawValue) - \(algorithm.description)")
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
        guard integerResponse >= SortAlgorithm.allCases.first!.rawValue, integerResponse <= SortAlgorithm.allCases.last!.rawValue else {

            // If response is not in desired range, ask again
            print("\nPlease enter a valid selection.")
            continue
            
        }

        // If we've made it here, the response is one of the enumeration types
        validResponse = integerResponse

    }

    // Return the response
    return SortAlgorithm(rawValue: validResponse)!

}
