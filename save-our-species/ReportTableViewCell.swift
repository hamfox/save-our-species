//
//  ReportTableViewCell.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/3/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionPreviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
