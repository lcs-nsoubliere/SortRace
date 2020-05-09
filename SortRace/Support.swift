//
//  Support.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-09.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func sortRace() {

    // Get the desired algorithm
    let algorithm = SortAlgorithm(rawValue: determineDesiredSortAlgorithm())

    // Get the type of array data to work with
    let arrayDataType = ArrayCharacteristic(rawValue: determineDesiredArrayType())

    // Get the size of the array data to work with
    let arraySize = ArraySize(rawValue: determineDesiredArraySize())

    
}
