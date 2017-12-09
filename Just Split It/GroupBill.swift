//
//  GroupBill.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/20/17.
//

import Foundation

class GroupBill {
    //Properties
    var name: String
    var itemArray: NSMutableArray
    // List of Friends on Bill
    
    /*
     var friendsGroup: Array<Friend>
     
    // Dictionary of Items purchased with friend associated to it
    var itemsBought: Dictionary<Key: Friend, Item>
     
    // List of Individual Bills
    var individualBillsGroup: Array<IndividualBill>
    */
    public init() {
        self.name = " ";
        self.itemArray = NSMutableArray()
    }
    
    public init(name:String) {
        self.itemArray = NSMutableArray()
        self.name = name
    }
    
    func addItem(item: Item){
        self.itemArray.add(item)
    }
    func getBillName() -> String{
        return name
    }
}





