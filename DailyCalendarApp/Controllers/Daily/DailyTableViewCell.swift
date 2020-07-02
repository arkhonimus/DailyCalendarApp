//
//  DailyTableViewCell.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet weak var dailyName: UILabel!
    @IBOutlet weak var dailyDescription: UILabel!
    @IBOutlet weak var dailyDateStart: UILabel!
    @IBOutlet weak var dailyDateFinish: UILabel!
    
    let DH = DateHandler.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
