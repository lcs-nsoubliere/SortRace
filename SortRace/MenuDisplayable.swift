//
//  Menu.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-11.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

// Require that a conforming type:
// 1. provide a prompt to show to the user when a menu is displayed
protocol MenuDisplayable {
    
    static var prompt: String { get }
    
}
