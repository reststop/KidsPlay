//
//  PlayDateView.swift
//  KidsPlay
//
//  Created by carl on 7/24/16.
//  Copyright © 2016 NarayanProduction. All rights reserved.
//

import UIKit

class PlayDateView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var friendsView : UICollectionView?
    @IBOutlet var activityView : UICollectionView?

    fileprivate let friendsReuseID = "friendsCell"
    fileprivate let activityReuseID = "activityCell"

    fileprivate var friends: Int = 0
    fileprivate var activities: Int = 0
    fileprivate var friendsName : [String] = [
        "Stephanie",
        "Larry",
        "Alice",
        "Billy",
        "Maya",
        "Peter"
        ]
    fileprivate var friendsFileName : [String] = [
        "kid1.png",
        "kid4.png",
        "kid3.png",
        "kid5.png",
        "kid2.png",
        "kid6-yash.png"
    ]
    fileprivate var friendsImage : [UIImage?] = []
    fileprivate let selectedFriendImage = UIImage.init(named: "friend-selected.png")
    fileprivate var friendIsSelected : [Bool] = [false, false, false, false, false, false]

    fileprivate var activityName : [String] = [
        "My House",
        "Movies",
        "Park",
        "Play"]
    fileprivate var activityFileName : [String] = [
        "activity3.png",
        "activity2.png",
        "Kids at Amusement Park.png",
        "activity4.png"]
    fileprivate var activityImage : [UIImage?] = []
    fileprivate let selectedActivityImage = UIImage.init(named: "activity-selected.png")
    fileprivate var activityIsSelected : [Bool] = [false, false, false, false]

    func selectedEntry(_ type: String, index: Int, isSelected: Bool) {
        if type == "friend" {
            if index < friendIsSelected.count {
                friendIsSelected[index] = !isSelected
            }
        }
        if type == "activity" {
            if index < activityIsSelected.count {
               // activityaroIsSelected[index] = !isSelected
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //        self.chooserView!.registerClass(chooserCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.friendsView!.dataSource = self
        self.friendsView!.delegate = self
        for i in 0..<friendsFileName.count {
            friendsImage.append(UIImage.init(named: friendsFileName[i]))
            friendIsSelected[i] = false
        }

        self.activityView!.dataSource = self
        self.activityView!.delegate = self
        for i in 0..<activityFileName.count {
            activityImage.append(UIImage.init(named: activityFileName[i]))
            activityIsSelected[i] = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView == self.friendsView {
            return self.friendsName.count
        }
        if collectionView == self.activityView{
            return self.activityName.count
        }
        return 0

    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row: Int = indexPath.row
        if collectionView == self.friendsView {
            let cell : friendsCell = collectionView.dequeueReusableCell(withReuseIdentifier: friendsReuseID, for: indexPath) as! friendsCell
            cell.index = row
            cell.delegate = self
            cell.imageView.image = friendsImage[row]
            cell.selectedView.image = selectedFriendImage
            cell.selectedView.isHidden = !friendIsSelected[row]
            cell.nameLabel.text = friendsName[row]
            return cell
        }
//        else if collectionView == self.activityView {
            let cell : activityCell = collectionView.dequeueReusableCell(withReuseIdentifier: activityReuseID, for: indexPath) as! activityCell
            cell.index = row
            cell.delegate = self
            cell.imageView.image = activityImage[row]
            cell.selectedView.image = selectedActivityImage
            cell.selectedView.isHidden = !activityIsSelected[row]
            cell.nameLabel.text = activityName[row]
            return cell
//        }
    }

}
