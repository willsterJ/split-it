//
//  ViewController.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/8/17.
//
//  GITHUB LINK: https://github.com/Split-it-app/split-it
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var groupBillsTableView: UITableView!
    
    // initialize model (for MVC purposes)
    var model: ModelClass = ModelClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let groupBill1 = GroupBill(name: "Bill 1")
        let groupBill2 = GroupBill(name: "Bill 2")
        let groupBill3 = GroupBill(name: "Bill 3")
        let item1 = Item(name: "milkshake capuccino espresso gonzalalaalalala", price: 2)
        let item2 = Item(name: "coca cola", price: 3)
        let item3 = Item(name: "sprite", price: 4)
        let item4 = Item(name: "hard drugs", price: 5)
        let friend1 = Friend()
        friend1.name = "William"
        let friend2 = Friend()
        friend2.name = "Josh"
        groupBill1.addItem(item: item1)
        groupBill1.addItem(item: item2)
        groupBill1.addItem(item: item3)
        groupBill1.addItem(item: item4)
        groupBill1.addFriend(friend: friend1)
        groupBill1.addFriend(friend: friend2)
        
        //let model:ModelClass = ModelClass()
        //model = ModelClass()
        model.addBill(groupBill: groupBill1)
        model.addBill(groupBill: groupBill2)
        model.addBill(groupBill: groupBill3)
        
        print(groupBill1.getBillName())
        print(model.getCount())
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model.groupBillArray.count)
        return model.groupBillArray.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let billCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "billCell")
        billCell.textLabel?.text = model.groupBillArray[indexPath.row].getBillName()
        return billCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let groupBillVC = GroupBillViewController()
        groupBillVC.model = self.model;
        groupBillVC.groupBill = self.model.groupBillArray[indexPath.row]
        
        self.performSegue(withIdentifier: "VCtoGroupBillVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VCtoGroupBillVC" {
            
            let GroupBillVC = segue.destination
                as! GroupBillViewController
            let myIndexPath = self.groupBillsTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            GroupBillVC.groupBill =  model.groupBillArray[row]
        }
    }
    

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

