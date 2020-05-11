//
//  SelectionSort.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func selectionSort(dataSet: inout [Int]) {
    
    // SOURCE: Swift Algorithms Club
    // https://github.com/raywenderlich/swift-algorithm-club/tree/master/Selection%20Sort
    
    guard dataSet.count > 1 else { return }
    
    for x in 0 ..< dataSet.count - 1 {
        
        var lowest = x
        for y in x + 1 ..< dataSet.count {
            if dataSet[y] < dataSet[lowest] {
                lowest = y
            }
        }
        
        if x != lowest {
            dataSet.swapAt(x, lowest)
        }
    }
    
//    // DEBUG: Print the sorted array
//    print("array after sort is: \(dataSet)")
    
}

