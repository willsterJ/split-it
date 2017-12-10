//
//  CategoryRow.swift
//  Just Split It
//
//  Created by Banana on 12/8/17.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var friendArray = [Friend]() // holds the friend array from Bill in GroupBillVC
    var nameLabel: UILabel = UILabel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // test
        print ("category friend count: " + friendArray.count.description)
        print(friendArray[0].name)
        return friendArray.count
    }
    
    // extension: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let friendCellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCellCollection", for: indexPath)
        
        self.nameLabel.frame = CGRect(x: 0, y: 0, width: friendCellCollection.frame.width, height: friendCellCollection.frame.height)
        
        friendCellCollection.contentView.addSubview(nameLabel)
        
        for i in 1...self.friendArray.count{
            if (indexPath.row == i){
                self.nameLabel.text = self.friendArray[indexPath.row].name
            }
        }
        

        
        
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
