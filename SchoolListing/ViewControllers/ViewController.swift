//
//  ViewController.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

class ViewController: UIViewController, SchoolViewModelDelegate {
    
    
    @IBOutlet var schoolTableView: UITableView!
    
    lazy var schoolViewModel: SchoolViewModel = {
        let schoolViewModel = SchoolViewModel()
        return schoolViewModel
    }()
    
    private var schoolModel: SchoolModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "School List"
        self.schoolTableView.delegate = self
        self.schoolTableView.dataSource = self
        schoolViewModel.delegate = self
    }
    
    func didFetched() {
        DispatchQueue.main.async {
            self.schoolTableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = schoolViewModel.returnSchoolCount() {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as! SchoolTableViewCell
        
        if let schoolDataatRow = schoolViewModel.getDataByRow(row: indexPath.row) {
            cell.schoolName.text = schoolDataatRow.school_name
            cell.schoolCity.text = schoolDataatRow.city
            cell.schoolPin.text = schoolDataatRow.city
            cell.schoolWebsite.text = schoolDataatRow.website
            cell.schoolPhone.text = schoolDataatRow.phone_number
            cell.schoolEmail.text = schoolDataatRow.school_email
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let schoolDataatRow = schoolViewModel.getDataByRow(row: indexPath.row) {
            let vc : SchoolDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SchoolDetailsViewController") as! SchoolDetailsViewController
            vc.schoolOverview = schoolDataatRow.overview_paragraph
            vc.schoolExtraCurriculum = schoolDataatRow.extracurricular_activities
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

