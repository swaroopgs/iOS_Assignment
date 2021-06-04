//
//  SchoolTableViewCell.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolPhone: UILabel!
    @IBOutlet weak var schoolWebsite: UILabel!
    @IBOutlet weak var schoolPin: UILabel!
    @IBOutlet weak var schoolCity: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
