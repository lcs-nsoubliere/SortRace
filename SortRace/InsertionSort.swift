//
//  InsertionSort.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func insertionSort(dataSet: inout [Int]) {
    
    // SOURCE: Swift Algorithms Club
    // https://github.com/raywenderlich/swift-algorithm-club/tree/master/Insertion%20Sort
    for x in 1..<dataSet.count {
        var y = x
        let temp = dataSet[y]
        while y > 0 && temp < dataSet[y - 1] {
            dataSet[y] = dataSet[y - 1]
            y -= 1
        }
        dataSet[y] = temp
    }
    
//    // DEBUG: Print the sorted array
//    print("array after sort is: \(dataSet)")
    
}
