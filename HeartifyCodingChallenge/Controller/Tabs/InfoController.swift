//
//  InfoTabViewController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit

class InfoController: UIViewController {
    
    //MARK: - Properties
    
    var lastSelectedCardLabel: UILabel = {
        let label = UILabel()
        label.text = "Last selected card here"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .label
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.configureNavBarTitle(with: "Info")
        
        view.addSubview(lastSelectedCardLabel)
        lastSelectedCardLabel.centerX(inView: view)
        lastSelectedCardLabel.centerY(inView: view)
    }
    
    //MARK: - Helpers
}
