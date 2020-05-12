//
//  Support.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func setUpSortRace() {
    
    // Create a menu from the available algorithms
    let algorithmMenu = AlgorithmMenu()

    // Get the desired algorithm
    let algorithm = SortAlgorithm(rawValue: algorithmMenu.displayMenu())!

    // Create a menu to allow user to decide how array should be populated
    let arrayValueCharacteristicsMenu = ArrayCharacteristicMenu()

    // What should array values look like?
    let arrayValueCharacteristics = ArrayCharacteristic(rawValue: arrayValueCharacteristicsMenu.displayMenu())!

    // Create a menu to allow for array size selection
    let arraySizeSelectionMenu = ArraySizeMenu()

    // Get the size of the array data to work with
    let arraySize = ArraySize(rawValue: arraySizeSelectionMenu.displayMenu())!
    
    // Report on selections made
    print("\nYOUR SELECTIONS")
    print("---------------")
    print("Algorithm: \t\t\t\t\(algorithm.description)")
    print("Array values will be: \t\(arrayValueCharacteristics.description)")
    print("Array size will be: \t\(arraySize.description)")

    // Create a menu to allow for selection of how many trials to perform
    let trialCountSelectionMenu = TrialCountMenu()

    // Get the number of trials to perform
    let trials = TrialCount(rawValue: trialCountSelectionMenu.displayMenu())!
    
    // Run the race with selected parameters
    race(algorithm: algorithm,
         valuesProfile: arrayValueCharacteristics,
         size: arraySize,
         trials: trials)

}

func race(algorithm: SortAlgorithm, valuesProfile: ArrayCharacteristic, size: ArraySize, trials: TrialCount) {
    
//    // DEBUG
//    print(values.count)
//    print(values)
    
    // Sort the array the specified number of times
    print("")
    var totalTime: TimeInterval = 0
    for trial in 1...Int(trials.description)! {

        // Create an empty array
        var values: [Int] = []
        
        // Populate the array
        switch valuesProfile {
        case .almostSorted:
            for i in 1...Int(size.description)! - 1 {
                values.append(i * 3)
            }
            values.append(1)
        case .backwards:
            for i in stride(from: Int(size.description)!, through: 1, by: -1) {
                values.append(i * 3)
            }
        case .random:
            for _ in 1...Int(size.description)! {
                values.append(Int.random(in: 1...Int(size.description)!))
            }
        case .alreadySorted:
            for i in 1...Int(size.description)! {
                values.append(i * 3)
            }
        }

        // Report trial start
        print("Trial \(trial) starting...", terminator: "")
        
        // Time in seconds since the epoch
        let startTime = Date().timeIntervalSince1970
        
        // CALL THE NECESSARY SORT FUNCTION
        switch algorithm {
        case .bubbleSort:
            bubbleSort(dataSet: &values)
        case .selectionSort:
            selectionSort(dataSet: &values)
        case .insertionSort:
            insertionSort(dataSet: &values)
        }

        // Time in seconds since the epoch
        let endTime = Date().timeIntervalSince1970
        
        // Get elapsed time
        let elapsedTime = endTime - startTime
        
        // Report time for this sort
        print("ended. Elapsed time in seconds was: \(elapsedTime)")
        
        // Add to total time
        totalTime += elapsedTime

    }
    
    // Report the average time per trial
    let averageTime = totalTime / TimeInterval(trials.description)!
    print("\nAverage time per trial, with \(Int(trials.description)!) trials, was: \(averageTime)\n")
    
}

