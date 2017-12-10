//
//  Item.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/20/17.
//

import Foundation

public class Item:NSObject {
    //Properties
    var name: String
    var price: Float
    
    // initializers
    override init(){
        self.name = ""
        self.price = 0;
    }
    init (name: String, price: Float){
        self.name = name;
        self.price = price;
    }
}




