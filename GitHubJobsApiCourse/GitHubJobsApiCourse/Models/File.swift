//
//  File.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 2/13/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

struct Result: Codable {
    
    var type: String?
    var url: String?
    var createdAt: String?
    var company: String
    var companyUrl: String?
    var location: String?
    var title: String
    var description: String?
    var howToApply: String?
    var companyLogo: String?
}
