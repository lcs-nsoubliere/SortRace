//
//  BubbleSort.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func bubbleSort(dataSet: inout [Int]) {
    
    // Tracks whether a swap occured on the prior pass through the array
    var swapOccured = true
    
    // Tracks how many values have been floated to the end of the array
    var countOfSortedValues = 0
    
    // Loop through unsorted portion of the array so long as a swap occurred on the prior pass
    while swapOccured {

        // Starting a new pass, so reset swap flag to indicate no swaps so far
        swapOccured = false
        
        // Pass through unsorted portion of the the array to float the highest number to the end of the unsorted portion
        for j in 0..<dataSet.count - countOfSortedValues - 1 {
            
            // Compare left value to right value
            if dataSet[j] > dataSet[j + 1] {
                
                // Swap values when left value is more than right value
                let temporaryValue = dataSet[j] // Set aside the left value
                dataSet[j] = dataSet[j + 1]     // Replace left with right
                dataSet[j + 1] = temporaryValue // Replace right with temporary value
                
                // Track that a swap occurred
                swapOccured = true
            }
            
        }
        
        // Increase count of sorted values, since we just completed another pass through the array
        countOfSortedValues += 1

//        // DEBUG: Print the array after the last pass
//        print("Array after pass \(countOfSortedValues):")
//        print(dataSet)
        
    }

//    // DEBUG: Print the sorted array
//    print("Array after sort complete is: \(dataSet)")
    
}
