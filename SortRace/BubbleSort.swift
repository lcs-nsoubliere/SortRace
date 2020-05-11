//
//  BubbleSort.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func bubbleSort(dataSet: inout [Int]) {
    
    // Loop through the entire array "n" times
    // (however many times there are elements in the array)
    var swapOccured = true
    while swapOccured {

        // Starting a new pass, so reset swap flag
        swapOccured = false
        
        // Pass through the array to float the highest number to the end
        for j in 0..<dataSet.count - 1 {
            
            // Compare left value to right value
            if dataSet[j] > dataSet[j + 1] {
                // Swap values when left value is more than right value
                let temporaryValue = dataSet[j] // Set aside the left value
                dataSet[j] = dataSet[j + 1]     // Replace left with right
                dataSet[j + 1] = temporaryValue // Replace right with temporary value
                swapOccured = true
            }
            
        }

//        // DEBUG: Print the array after n passes
//        print("Array after pass \(i + 1):")
//        print(dataSet)
        
    }

//    // DEBUG: Print the sorted array
//    print("array after sort is: \(dataSet)")
    
}
