//
//  JobDetailsViewController.swift
//  GitHubJobsApiCourse
//
//  Created by Eugene Berezin on 12/24/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

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
    
    
    let urlButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Visit Company's Website", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.textAlignment = .left
        textView.backgroundColor = .cyan
        textView.text = "asdasdasdasdasdasdasdasdasdasdasdasldkjasjdalksjdalksjdalksjdalskjdalksjdalskjdalskjdalskjdalskjdalskjdsdjjalksdjalskdjalskdjalskdjalskdjaslkdjaslkdjaskljdalksdjalksjdalskjdalksjdaslkdjaskldjalksdjalksdjalksdjalskdjalksjdalksdjalksjdalksjdalkjdalksjd <p><strong>Your Mission, Should You Choose to Accept:</strong></p>\n<p>Join our passionate team of top-notch engineers to solve a real-world problem, and help people spend less time managing expenses and more time pursuing their real goals. As we revolutionize the way people manage their expenses, being part of the Expensify team means building the easiest, fastest, and most efficient platform to automate everything expense-related.</p>\n<p>Even though we work hard at Expensify, we make sure our employees are happy. Our most talked about perk is our <a href=\"https://we.are.expensify.com/explore-the-world\">Offshore</a> where we spend a month abroad working from a remote location as a team. This year we’re going to Spain, do you want to join?</p>\n<p><strong>About You</strong></p>\n<p>Whether you’re building features like calendar integrations, importing credit card transactions, or pulling information from receipts, you’re self-driven and collaborative. You’re an autonomous individual who is passionate about writing beautiful and concise code. You’re willing to work with other engineers, designers, and customer facing teams to turn our dreams into reality.</p>\n<p>As a Web Full Stack Engineer, your responsibilities include:</p>\n<ul>\n<li>\n<p>Squashing bugs: big, small, and hairy!</p>\n</li>\n<li>\n<p>Planning, building, and maintaining cross-stack features like accounting integrations, advanced receipt scanning, and more.</p>\n</li>\n<li>\n<p>Guiding and enabling others in the organization: we'll share our editor tricks, dotfiles and productive workflows. Share yours!</p>\n</li>\n<li>\n<p>Asking questions about things you don’t understand and challenging the status quo.</p>\n</li>\n</ul>\n<p>For the best possible fit, we are looking for someone who:</p>\n<ul>\n<li>\n<p>Has experience writing real-world software to solve real-world problems.</p>\n</li>\n<li>\n<p>Communicates well, both interpersonally and in their code.</p>\n</li>\n<li>\n<p>Is a natural problem solver, knows how to solve problems by automating their solutions.</p>\n</li>\n<li>\n<p>Understands the role and impact that programming can have on the organization as a whole.</p>\n</li>\n<li>\n<p>Wants to develop and grow their skills in programming and leadership within the organization.</p>\n</li>\n</ul>\n<p>We are looking for people who have a strong understanding of algorithms and design patterns that can apply those concepts into a production level codebase. Knowledge and experience with Javascript, PHP, C++, Java, iOS or Android is a plus. This position is the foundation for launching a career with Expensify, with the expectation that you’ll carry these skills into new domains.</p>\n<p><strong>Compensation &amp; Benefits</strong></p>\n<ul>\n<li>\n<p>Full-time, salaried position</p>\n</li>\n<li>\n<p>401k with employer match</p>\n</li>\n<li>\n<p>100% Medical/Dental/Vision contributions</p>\n</li>\n<li>\n<p>Commuter benefits</p>\n</li>\n<li>\n<p>Free lunch</p>\n</li>\n<li>\n<p>Flexible vacation policy</p>\n</li>\n<li>\n<p>Relocation available</p>\n</li>\n<li>\n<p>Work from home when you need to</p>\n</li>\n</ul>\n<p><strong>Next Steps</strong></p>\n<p>Applying is easy, but it takes time. See, while we know you're awesome, it's actually really hard and time consuming to find you in the midst of literally hundreds of other applications we get from everyone else. So this is where we're going to ask our first favor: can you make it really easy and obvious how great you are, so we don't accidentally overlook you? There are probably many ways to do that, but the easiest way to help us out is by answering the following questions:</p>\n<ol>\n<li>What's the URL of your website? If you don't have one, why not?</li>\n<li>What's your coding history? "
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
           return button
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        
        

        
    }
    

    

}
