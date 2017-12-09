//
//  ViewController.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/8/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var groupBillsArray: NSMutableArray
    //var groupBillsArray:[GroupBill] = [GroupBill]()
    
    let model = ModelClass ()
    
    
    
    @IBOutlet weak var groupBillsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.groupBillsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        groupBillsTableView.delegate = self
        groupBillsTableView.dataSource = self
        
        //groupBillsTableView = UITableView()
       // groupBillsArray = [GroupBill]()
       

        //example
        var groupBill1 = GroupBill(name: "Bill 1")
        let Josh = Friend(name: "Josh")
        let item1 = Item(name: "Apple", price: 2, friend: Josh!)
        groupBill1.addItem(item: item1!)
        //groupBillsArray.append(groupBill1)
        model.groupBillsArray.append(groupBill1)
    
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.model.groupBillsArray.count;
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        //let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell") as! UITableViewCell
        
        // Configure the cell...
        
        return cell
         */

        let billCell:UITableViewCell = self.groupBillsTableView.dequeueReusableCell(withIdentifier:"billCell")!
        //get It
        billCell.textLabel?.text = self.model.groupBillsArray[indexPath.row].getBillName()
        
        return billCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var groupBillVC = GroupBillViewController()
        //groupBillVC = segue.destination as! GroupBillViewController
        
        groupBillVC.model = self.model;
        
        
        
        groupBillVC.groupBill = self.model.groupBillsArray[indexPath.row]
        
        //groupBillVC.index = indexPath.row
        
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if (segue.identifier == "fromViewtoGroupBillVC"){
//            var groupBillVC = GroupBillViewController()
//            groupBillVC = segue.destination as! GroupBillViewController
//
//            groupBillVC.model = self.model;
//
//            groupBillVC.index = IndexPath.row
//
//            //groupBillVC.groupBill = self.model.groupBillsArray [self.groupBillsTableView.indexPathForSelectedRow].row
//        }
//    }


}

