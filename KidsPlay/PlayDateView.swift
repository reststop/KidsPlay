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

    private let friendsReuseID = "friendsCell"
    private let activityReuseID = "activityCell"

    private var friends: Int = 0
    private var activities: Int = 0
    private var friendsName : [String] = [
        "Stephanie",
        "Larry",
        "Alice",
        "Billy",
        "Maya",
        "Peter"
        ]
    private var friendsFileName : [String] = [
        "kid1.png",
        "kid4.png",
        "kid3.png",
        "kid5.png",
        "kid2.png",
        "kid6-yash.png"
    ]
    private var friendsImage : [UIImage?] = []
    private let selectedFriendImage = UIImage.init(named: "friend-selected.png")

    private var activityName : [String] = [
        "My House",
        "Movies",
        "Park",
        "Play"]
    private var activityFileName : [String] = [
        "activity3.png",
        "activity2.png",
        "Kids at Amusement Park.png",
        "activity4.png"]
    private var activityImage : [UIImage?] = []
    private let selectedActivityImage = UIImage.init(named: "activity-selected.png")


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
        }

        self.activityView!.dataSource = self
        self.activityView!.delegate = self
        for i in 0..<activityFileName.count {
            activityImage.append(UIImage.init(named: activityFileName[i]))
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView == self.friendsView {
            return self.friendsName.count
        }
        if collectionView == self.activityView{
            return self.activityName.count
        }
        return 0

    }



    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.friendsView {
            let cell : friendsCell = collectionView.dequeueReusableCellWithReuseIdentifier(friendsReuseID, forIndexPath: indexPath) as! friendsCell
            cell.imageView.image = friendsImage[indexPath.row]
            cell.selectedView.image = selectedFriendImage
            cell.selectedView.hidden = true
            cell.nameLabel.text = friendsName[indexPath.row]
            return cell
        }
//        else if collectionView == self.activityView {
            let cell : activityCell = collectionView.dequeueReusableCellWithReuseIdentifier(activityReuseID, forIndexPath: indexPath) as! activityCell
            cell.imageView.image = activityImage[indexPath.row]
            cell.selectedView.image = selectedActivityImage
            cell.selectedView.hidden = true
            cell.nameLabel.text = activityName[indexPath.row]
            return cell
//        }
    }

}
