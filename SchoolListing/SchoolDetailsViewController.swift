//
//  SchoolDetailsViewController.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var schoolOverviewLabel: UILabel!
    var schoolOverview: String!
    var schoolExtraCurriculum: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let schoolOverviewText = schoolOverview {
            print(schoolOverviewText)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
