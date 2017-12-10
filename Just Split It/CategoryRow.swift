//
//  CategoryRow.swift
//  Just Split It
//
//  Created by Banana on 12/8/17.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GroupBillVCDelegate {
    
    var s:String = String()
    
    func passFriendArray(string: String) {
        s = string
        print(string)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        passFriendArray(string: s)
        print("Hello")
        return 10
    }
    
    // extension: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let friendCellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCellCollection", for: indexPath)
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
