//
//  ErrorMessage.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 2/24/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Somthing went wrong, try again"
    case invalidResponse = "Server error. Please modify your search and try again"
}
