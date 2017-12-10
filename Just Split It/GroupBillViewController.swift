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
    @IBOutlet weak var priceTableView: UITableView!
    
    var model:ModelClass = ModelClass()
    
    var groupBill = GroupBill() // this is the user-selected group bill is carried over from ViewController
    
    var itemsArray:[Item] = [Item]()
    var friendsArray:[Friend] = [Friend]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(groupBill.getBillName())  // for testing
        
        print(groupBill.getItemArray().count)
        
        itemsArray = groupBill.getItemArray()
        friendsArray = groupBill.getFriendArray()
        
        print(itemsArray.count)
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // if tableView is the top table view (i.e. friend's list)
        if (tableView == self.FriendTableView){
            return "Friends" // only 1 category here
        }
        // if tableView is the bottom table view (i.e. items list)
        else if (tableView == self.ItemTableView){
            return groupBill.getBillName()
        }
        
        else{
            return "Price"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(tableView == self.ItemTableView) {
            return 1
        }
        else if (tableView == self.FriendTableView){
            return 1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // # of rows dependent on array size
         if(tableView == self.ItemTableView) {
             return self.itemsArray.count
         }
         else if (tableView == self.FriendTableView){
            return 1
        }
         else{
            return self.itemsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == self.ItemTableView){
            return 40
        }
        else if (tableView == self.FriendTableView){
            return 90
        }
        else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.ItemTableView) {
            let itemCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "itemCell")
            itemCell.textLabel?.text = itemsArray[indexPath.row].name
            return itemCell
            
        } else if (tableView == self.FriendTableView){
            let friendCell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! CategoryRow
            // transfer friends array to CategoryRow
            let catRow = CategoryRow(friendList: self.friendsArray)
            return friendCell
        }
        else{
            let priceCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "priceCell")
            priceCell.textLabel?.text = itemsArray[indexPath.row].price.description
            return priceCell
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
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


