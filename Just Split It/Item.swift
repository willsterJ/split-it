//
//  Item.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/20/17.
//

import Foundation

public class Item {
    //Properties
    
    //Food/drink item name
    var name: String
    //price
    var price: Int
    //friend who bought it
    var friend: Friend //could make its own Friend class
    

    //Initialization
    init?(name: String, price: Int, friend: Friend) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || price < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.price = price
        self.friend = friend
    }
}




