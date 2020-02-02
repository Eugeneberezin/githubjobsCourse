//
//  SearchViewCell.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 12/21/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "JRSTIux (1)")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Awesome Company"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Seatlle, WA"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let typeLabel: UILabel = {
           let label = UILabel()
           label.text = "Full-Time"
           label.font = .systemFont(ofSize: 16)
           label.numberOfLines = 0
           label.textColor = .label
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundCell")
        addSubview(logoImageView)
        logoImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 80, height: 100))
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, typeLabel, locationLabel])
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: logoImageView.leadingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        stackView.axis = .vertical
        stackView.spacing = 10
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
