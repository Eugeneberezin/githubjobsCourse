//
//  ViewController.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 12/21/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    private let cellId = "searchCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHubJobs API"
        collectionView.backgroundColor = .green
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        
        return cell
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

