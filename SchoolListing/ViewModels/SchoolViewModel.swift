//
//  SchoolViewModel.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import UIKit

protocol SchoolViewModelDelegate: AnyObject {
    func didFetched()
}

class SchoolViewModel: NSObject {
    
    var schoolModel: [SchoolModel] = []
    weak var delegate: SchoolViewModelDelegate?
    
    override init() {
        super.init()
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        apiCall(urlString: urlString)
    }
    
    public func returnSchoolCount() -> Int? {
        return schoolModel.count
    }
    
    public func getDataByRow(row: Int) -> SchoolModel? {
        return schoolModel[row]
    }
        
    func apiCall(urlString: String) {
                
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let data = data, error == nil {
                self.schoolModel = try! JSONDecoder().decode([SchoolModel].self, from: data)
                self.delegate?.didFetched()               
            } else {
                return
            }
        })
        
        task.resume()
    }

}
