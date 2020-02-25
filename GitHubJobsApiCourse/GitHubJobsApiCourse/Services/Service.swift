//
//  Service.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 2/24/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func getResults(description: String, location: String, completed: @escaping (Result<[Results], ErrorMessage>) -> Void) {
        
        let urlString = "https://jobs.github.com/positions.json?description=\(description.replacingOccurrences(of: " ", with: "+"))&location=\(location.replacingOccurrences(of: " ", with: "+"))"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let deconder = JSONDecoder()
                deconder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try deconder.decode([Results].self, from: data)
                completed(.success(results))
                
                
            } catch {
                completed(.failure(.invalidData))
            }
            
            
        }
        task.resume()
        
        
        
    }
}
