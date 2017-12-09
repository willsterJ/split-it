//
//  GroupBillViewController.swift
//  Just Split It
//
//  Created by Maria-Belem on 11/20/17.
//

import UIKit


class GroupBillViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var FriendTableView: UITableView!
    @IBOutlet weak var ItemTableView: UITableView!
    
    var model = ModelClass()
    
    var groupBill = GroupBill()
    
    var itemsArray:[Item] = [Item]()
    var friendsArray:[String] = [String]()
    
    var categories = ["Friends"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ItemTableView.delegate = self
        ItemTableView.dataSource = self
        
        FriendTableView.delegate = self
        FriendTableView.dataSource = self
        
        print(groupBill.getBillName())
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (tableView == self.FriendTableView){
            return categories[section]
        }
        else{
            return groupBill.getBillName()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if(tableView == self.ItemTableView) {
             return 1
        }
        else {
            return categories.count;
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         if(tableView == self.ItemTableView) {
             return self.itemsArray.count
            
         }
         else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.ItemTableView) {
            let itemCell:UITableViewCell = self.ItemTableView.dequeueReusableCell(withIdentifier:"itemCell")!
            //get It
            itemCell.textLabel?.text = self.itemsArray[indexPath.row].name
            
            return itemCell
            
        } else {
            let friendCell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! CategoryRow
            return friendCell
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


