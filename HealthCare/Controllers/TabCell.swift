//
//  TabCell.swift
//  HealthCare
//
//  Created by KALSI on 5/1/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class TabCell: UITableViewCell {

    @IBOutlet weak var menuText: UILabel!
    @IBOutlet weak var menuImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
