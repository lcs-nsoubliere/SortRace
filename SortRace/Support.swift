//
//  Support.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

enum SortAlgorithm: Int {
    
    case bubbleSort = 1
    case insertionSort = 2
    case selectionSort = 3
    
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

func nameSortAlgorithm(algorithm: SortAlgorithm) -> String {
    
    switch algorithm {
    case .bubbleSort:
        return "Bubble Sort"
    case .insertionSort:
        return "Insertion Sort"
    case .selectionSort:
        return "Selection Sort"
    default:
        break
    }
    
}

func determineDesiredSortAlgorithm() -> Int {
    
    // The response to return
    var validResponse = SortAlgorithm.lowestValue - 1
    
    // Loop until the response is in the expected range
    while validResponse < SortAlgorithm.lowestValue {
        
        // Ask the question
        print("What sort algorithm do you want to test?\n")
        print("\(SortAlgorithm.bubbleSort.rawValue) - \(nameSortAlgorithm(algorithm: SortAlgorithm.bubbleSort))")
        print("\(SortAlgorithm.insertionSort.rawValue) - \(nameSortAlgorithm(algorithm: SortAlgorithm.insertionSort))")
        print("\(SortAlgorithm.selectionSort.rawValue) - \(nameSortAlgorithm(algorithm: SortAlgorithm.selectionSort))")
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

func sortRace() {

    let algorithm = SortAlgorithm(rawValue: determineDesiredSortAlgorithm())
        
}
