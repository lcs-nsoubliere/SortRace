//
//  Race.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

func race(algorithm: SortAlgorithm, valuesProfile: ArrayCharacteristic, size: ArraySize, trials: TrialCount) {
    
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
    
//    // DEBUG
//    print(values.count)
//    print(values)
    
    
}
