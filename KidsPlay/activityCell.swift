//
//  activityCell.swift
//  KidsPlay
//
//  Created by carl on 7/24/16.
//  Copyright © 2016 NarayanProduction. All rights reserved.
//

import UIKit

class activityCell: UICollectionViewCell {
    weak var delegate : PlayDateView?
    var index : Int = 0

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var selectedView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!

    @IBAction func selectedButtonPressed() {
        selectedView.hidden = !selectedView.hidden
        if self.delegate != nil {
            self.delegate!.selectedEntry("activity", index: index, isSelected: selectedView.hidden)
        }
    }
}
