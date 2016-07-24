//
//  activityCell.swift
//  KidsPlay
//
//  Created by carl on 7/24/16.
//  Copyright © 2016 NarayanProduction. All rights reserved.
//

import UIKit

class activityCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var selectedView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!

    @IBAction func selectedButtonPressed() {
        selectedView.hidden = !selectedView.hidden
    }
}
