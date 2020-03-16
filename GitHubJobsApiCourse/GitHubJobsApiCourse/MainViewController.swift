//
//  ViewController.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 12/21/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UISearchBarDelegate {
    
    private let cellId = "searchCellID"
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var jobResults = [Results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHubJobs API"
        collectionView.backgroundColor = UIColor(named: "backgroundMain")
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        
        
        Service.shared.getResults(description: "Software Developer", location: "San Francisco") {[weak self] result in
            switch result {
            case .success(let results):
                print(results)
                self?.jobResults = results
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    let citySearchBar = UISearchBar()
    
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.placeholder = "Position"
        searchController.view.addSubview(citySearchBar)
        citySearchBar.frame = CGRect(x: 10, y: searchController.searchBar.frame.height + 50 , width: view.frame.size.width - 30, height: 50)
        citySearchBar.placeholder = "Location"
        citySearchBar.layer.cornerRadius = 12
        citySearchBar.delegate = self
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 10, right: 1.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        
        cell.layer.cornerRadius = 12
        let jobResult = jobResults[indexPath.item]
        cell.jobResult = jobResult
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = JobDetailsViewController()
        detailController.jobResult = jobResults[indexPath.item]
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    
    init() {
           super.init(collectionViewLayout: UICollectionViewFlowLayout())
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       


}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
}

