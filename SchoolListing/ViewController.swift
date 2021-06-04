//
//  ViewController.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var schoolTableView: UITableView!
    
    private var schoolViewModel: SchoolViewModel!
    
    var schoolModel: [SchoolModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        
        apiCall(urlString: urlString)
        
        self.schoolTableView.delegate = self
        self.schoolTableView.dataSource = self
        
        
    }
    
    func apiCall(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let data = data {
                self.schoolModel = try! JSONDecoder().decode([SchoolModel].self, from: data)
                DispatchQueue.main.async {
                    self.schoolTableView.reloadData()
                }
            } else {
                return
            }
        })
        
        task.resume()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.schoolModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as! SchoolTableViewCell
        let schoolDataatRow = self.schoolModel[indexPath.row]
        cell.schoolName.text = schoolDataatRow.school_name
        cell.schoolCity.text = schoolDataatRow.city
        cell.schoolPin.text = schoolDataatRow.city
        cell.schoolWebsite.text = schoolDataatRow.website
        cell.schoolPhone.text = schoolDataatRow.phone_number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolDataatRow = self.schoolModel[indexPath.row]
        let vc = SchoolDetailsViewController()
        vc.schoolOverview = schoolDataatRow.overview_paragraph
        vc.schoolExtraCurriculum = schoolDataatRow.extracurricular_activities
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

