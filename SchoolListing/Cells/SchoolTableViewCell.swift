//
//  SchoolTableViewCell.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolPhone: UILabel!
    @IBOutlet weak var schoolPin: UILabel!
    @IBOutlet weak var schoolCity: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var schoolEmail: UILabel!
    @IBOutlet weak var schoolWebsite: UILabel!
    @IBOutlet weak var cardView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12.0
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 16.0
        cardView.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
