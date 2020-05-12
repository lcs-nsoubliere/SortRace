//
//  Menu.swift
//  SortRace
//
//  Created by Russell Gordon on 2020-05-12.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

class Menu {
    
    // Stores the valid selections for this menu
    var validSelections: [Int] = []
    
    // Stores the descriptions of each valid selection for this menu
    var selectionDescriptions: [String] = []
    
    // Stores the prompt used to ask the user to provide input
    var prompt: String = ""
    
    // Initialize the instance
    init(selections: [Int], descriptions: [String], prompt: String) {
        self.validSelections = selections
        self.selectionDescriptions = descriptions
        self.prompt = prompt
    }
    
    // Displays a menu based on the enumeration used to create the Menu instance
    func displayMenu() -> Int {
        
        // The response to return
        var validResponse = 0
        
        // Loop until the response is in the expected range
        while validResponse == 0 {

            // Show the prompt
            print("\n\(prompt)\n")
            
            // Show the possible options
            for i in 0...validSelections.count - 1 {
                print("\(validSelections[i]) - \(selectionDescriptions[i])")
            }
            
            // Ask for the selection
            print("\nPlease enter your selection: ", terminator: "")

            // Get the initial response
            guard let response = readLine() else {

                // If no response given, loop and ask again
                print("\nPlease enter a selection.")
                continue
                
            }

            // Convert to integer
            guard let integerResponse = Int(response) else {

                // If response cannot be made into an integer, ask again
                print("\nPlease enter an integer.")
                continue
                
            }

            // Check that integer is one of the valid options
            guard validSelections.contains(integerResponse) else {

                // If response is not one of the valid options, ask again
                print("\nPlease enter a valid selection.")
                continue
                
            }

            // If we've made it here, the response is one of the enumeration types
            validResponse = integerResponse

        }

        // Return the valid response
        return validResponse
    }
}
