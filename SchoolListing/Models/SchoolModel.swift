//
//  SchoolModel.swift
//  SchoolListing
//
//  Created by Swaroop Gs on 6/4/21.
//

import Foundation

struct SchoolModel: Decodable {
    
    var school_name: String?
    var city: String?
    var zip: String?
    var school_email: String?
    var website: String?
    var phone_number: String?
    var overview_paragraph: String?
    var extracurricular_activities: String?
}
