//
//  CategoryRow.swift
//  Just Split It
//
//  Created by Banana on 12/8/17.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    let GBVC:GroupBillViewController = GroupBillViewController()
    
    //let model:ModelClass = ModelClass()
    
    var friendArray = [Friend]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // test
        print ("category friend count: " + friendArray.count.description)
        print(friendArray[0].name)
        return friendArray.count
    }
    
    // extension: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let friendCellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCellCollection", for: indexPath) as! friendCollectionViewCell
        
         friendCellCollection.friendName = friendArray[indexPath.row].name
        //let friend = friendArray[indexPath.row];
       // friendCellCollection.friendName = friend.name
        
        return friendCellCollection
    }
    
    // extension: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 4
        let hardCodedPadding: CGFloat = 5
        let itemWidth = (collectionView.bounds.width/itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2*hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
    
    
}
