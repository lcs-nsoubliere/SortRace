//
//  Support.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func sortRace() {
    
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
