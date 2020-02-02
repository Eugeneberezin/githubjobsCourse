//
//  JobDetailsViewController.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 12/24/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit
import SafariServices

class JobDetailsViewController: UIViewController {
    
    let logoImageview = AspectFitImageView(image: UIImage(named: "JRSTIux (1)"), cornerRadius: 12)
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Awesome company"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .label
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        return label
    }()
    
    let jobTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Full-Time"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Seattle, WA"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        return label
    }()
    
    var companyUrl = "https://www.google.com/"
    var applyUrl = ""
    
    let urlButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Visit Company's Website", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleCompanyURL), for: .touchUpInside)
        return button
    }()
    
    @objc func handleCompanyURL() {
        
        if companyUrl == "" {
            let ac = UIAlertController(title: "Link is not available", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
        guard let url = URL(string: companyUrl) else { return }
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true)
    }
    
    
    @objc func handleApplyURL() {
        
        if applyUrl == "" {
            let ac = UIAlertController(title: "Link is not available to apply for this job", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
        guard let url = URL(string: applyUrl) else { return }
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true)
    }
    
    var htmlText = """
                    <p>PollyEx is a mortgage technology company creating a modern data driven capital markets ecosystem though our loan exchange and pricing engine. Our products deeply integrate with loan origination systems, financial market data providers and other partners throughout the loan sale life cycle; automating capital market functions and optimizing gain on sale execution.</p>\n<p>PollyEx is backed by prominent Silicon Valley venture firms including Meritech, Khosla, NYCA, Fifth Wall and Base10.</p>\n<p><strong>The Role</strong>\nYou will have an impact on the design, architecture and implementation of markets that are often called the engine of US economy.  You will work with both government backed and industry leading companies to create a digital pipeline that facilitates real time trading of loans.  We value drive for excellence, independent thinking, teamwork and curiosity.</p>\n<p><strong>Why you should join PollyEx</strong></p>\n<ul>\n<li>We are attacking a trillion dollar market with gross inefficiencies.</li>\n<li>We have an experienced team that has built large and impactful platforms before.</li>\n<li>Fast and flexible team that ships new features every day.</li>\n<li>Competitive salary, equity, vision/dental/medical benefits.</li>\n<li>Backing of top tier VCs: Meritech, Khosla, NYCA, Fifth Wall and Base10.</li>\n<li>Flexible hours and location.</li>\n<li>Latest technology: Python, Django, Vue.js, AWS</li>\n<li>Ability to work with industry and government leaders.</li>\n</ul>\n<p><strong>Responsibilities</strong></p>\n<ul>\n<li>Build web applications and services using Python, Django, JavaScript, Vue.js, Postgres, AWS and Heroku.</li>\n<li>Diagnose and resolve technical problems; build unit tests and automation to ensure the quality of your features.</li>\n<li>Maintain existing code and write code that is easily maintainable through documentation, good architecture and automated testing.</li>\n<li>Define, discuss and work with the team on the architecture of the platform.</li>\n<li>Actively participate in interviewing and evaluating new team members</li>\n<li>Provide vision and direction for software development best practices &amp; methodologies.</li>\n<li>Mentor junior members of the software engineering team in all aspects of software development across multiple projects with multiple customers.</li>\n<li>Prioritize your work and the work of others with a sense of urgency to ship products in time to have the desired business impact.</li>\n<li>Review code, help drive technical excellence through best practices and latest tools.</li>\n<li>Maintain a working knowledge of advances and trends in programming and technology</li>\n<li>Generate ideas for innovative technological solutions.</li>\n</ul>\n<p><strong>Qualifications</strong></p>\n<ul>\n<li>7+ Years of full stack engineering experience with recent production experience using Python/Django or Ruby on Rails</li>\n<li>5+ Years using SQL with Postgres/MySQL</li>\n<li>Strong computer science fundamentals in data structures, algorithms, and mastery of object-oriented programming</li>\n<li>Understanding of secure coding practices and common vulnerabilities.</li>\n<li>Multiple shipped enterprise SaaS products.</li>\n<li>Bachelor’s Degree in Computer Science.</li>\n<li>Action oriented attitude.</li>\n</ul>\n<p><em>PollyEx is an Equal Opportunity Employer. All qualified applicants will receive consideration for employment without regard to race, age, color, religion, gender, national origin, disability, sexual orientation or veteran status.</em></p>\n
                   
                   """
    
    
    
    func convertHTML(text: String, attributedText: inout NSAttributedString) -> NSAttributedString {
        let data = Data(text.utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html,
                                                                           
             .characterEncoding: String.Encoding.utf8.rawValue]
        
        if let attributedString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil) {
            attributedText = attributedString
            return attributedString
        }
        return attributedText
    }
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.textAlignment = .left
        textView.backgroundColor = UIColor(named: "textView")
        textView.isEditable = false
        textView.layer.cornerRadius = 12
        return textView
    }()
    
    
    let applyButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Apply", for: .normal)
           button.tintColor = .white
           button.backgroundColor = .systemBlue
           button.layer.cornerRadius = 15
           button.addTarget(self, action: #selector(handleApplyURL), for: .touchUpInside)
           return button
       }()
    
    var pinchGesture = UIPinchGestureRecognizer()
    
    @objc func pinchText(sender: UIPinchGestureRecognizer) {
        var pointSize = descriptionTextView.font?.pointSize
        pointSize = ((sender.velocity > 0) ? 1 : -1) * 1 + pointSize!
        descriptionTextView.font = UIFont( name: "arial", size: (pointSize)!)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchText(sender:)))
        descriptionTextView.addGestureRecognizer(pinchGesture)
        view.backgroundColor = UIColor(named: "backgroundCell")
        view.addSubview(logoImageview)
        logoImageview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 80, height: 100))
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, jobTypeLabel, locationLabel, urlButton])
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: logoImageview.leadingAnchor, padding: .init(top: 10, left: 20, bottom: 20, right: 20))
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(descriptionTextView)
        descriptionTextView.anchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 20, right: 20))
        view.addSubview(applyButton)
        applyButton.anchor(top: descriptionTextView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 70, bottom: 30, right: 70))
        descriptionTextView.attributedText = convertHTML(text: htmlText, attributedText: &descriptionTextView.attributedText)
        
        
    }
    

    

}
